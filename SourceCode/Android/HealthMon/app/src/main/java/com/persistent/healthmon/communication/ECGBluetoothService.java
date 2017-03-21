package com.persistent.healthmon.communication;

import android.annotation.SuppressLint;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.CountDownTimer;
import android.os.IBinder;
import android.text.format.Time;
import android.util.Log;

import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.ECGAckPacket;
import com.vesag.bt.beans.ECGDataRealtime;

import com.vesag.bt.beans.ECGNonRTSCPDataBean;
import com.vesag.bt.service.ECGAckSender;
import com.vesag.bt.service.ECGNonRealTimeService;
import com.vesag.bt.service.ECGRealTimeService;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.bt_util_Constants;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;

public class ECGBluetoothService extends Service {
	private String TAG = ECGBluetoothService.class.getSimpleName();
	private final BluetoothAdapter mBluetoothAdapter = BluetoothAdapter
			.getDefaultAdapter();
	protected static final UUID serverUUID = UUID
			.fromString("00001101-0000-1000-8000-00805F9B34FB");

	private  BluetoothSocket mmSocket;
	String mECGDeviceName = null, mECGDeviceAddr = null;
	BluetoothDevice mECGDevice = null;
	ConnectThread mConnectThread = null;
	ConnectedThread mReadThread = null;
	private String deviveId;

	@Override
	public IBinder onBind(Intent arg0) {
		HealthMonLog.d(TAG, "onBind");
		Log.d(TAG, "onBind");
		return null;
	}

	@Override
	public void onCreate() {
		HealthMonLog.d(TAG, "onCreate");
		super.onCreate();
	}

	@Override
	public void onDestroy() {
		HealthMonLog.d(TAG, "onDestroy");
		super.onDestroy();
		Log.d(TAG, "onDestroy !!!!!!!!!!!!!!!!!!!!!!!");
		try {
			// mBluetoothAdapter.disable();
			if (mConnectThread != null) {
				mConnectThread.cancel();
				if(mmSocket!=null)
				mmSocket.close();
			}if (mReadThread != null)
				mReadThread.cancel(null, null, null);
		} catch (Exception e) {
			Log.d(TAG, "Exception in onDestroy() " + e.getMessage());
			e.printStackTrace();
		} finally {
			sendBroadcast(new Intent(Constants.ACTION_ECG_WAVE_SERVICE_DESTROYED));
		}

	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		HealthMonLog.d(TAG, "onStartCommand");
		if (intent != null) {
			mECGDeviceName = intent.getStringExtra("ECG device Name");
			mECGDeviceAddr = intent.getStringExtra("ECG device Addr");
			mECGDevice = intent.getParcelableExtra("ECG device id");
			deviveId = intent.getStringExtra(Constants.DEVICE_ID);
			startBTServer(mECGDevice);
		}
		return START_STICKY;
	}

	// Start first BT server Thread // host; ie; tablet/mobile is server; ECG
	// device is client
	private void startBTServer(BluetoothDevice device) {
		// int deviceState=device.getBondState();

		// if(deviceState==device.ACTION_ACL_CONNECTED)
		// Always cancel device discovery - this slows BT down if it is on
		if (mBluetoothAdapter.isDiscovering()) {
			mBluetoothAdapter.cancelDiscovery();
		}
		// So that server socket is visible
		setDeviceToDiscoverable();
		mConnectThread = new ConnectThread(device);
		mConnectThread.start();
		Log.d(TAG, "Connect thread started device = " + device);

	}

	private void setDeviceToDiscoverable() {
		// Ensure device is discoverable so ECG can see its service.
		int scan = mBluetoothAdapter.getScanMode();
		if (scan != BluetoothAdapter.SCAN_MODE_CONNECTABLE_DISCOVERABLE) {
			Intent discoverableIntent = new Intent(
					BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE);
			discoverableIntent.putExtra(
					BluetoothAdapter.EXTRA_DISCOVERABLE_DURATION, 300);
			discoverableIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
			startActivity(discoverableIntent);
		}
	}

	@SuppressLint("NewApi")
	private class ConnectThread extends Thread {
		//private final BluetoothSocket mmSocket;

		public ConnectThread(BluetoothDevice device) {
			// Use a temporary object that is later assigned to mmSocket,
			// because mmSocket is final
			BluetoothSocket tmp = null;
			// Get a BluetoothSocket to connect with the given BluetoothDevice
			try {
				// MY_UUID is the app's UUID string, also used by the server
				// code
				tmp = device.createRfcommSocketToServiceRecord(serverUUID);
			} catch (IOException e) {
				Log.d(TAG, "exception after createRFComm " + e.getMessage());
				e.printStackTrace();
			} catch (Exception e) {
				Log.d(TAG, "exception after createRFComm " + e.getMessage());
				e.printStackTrace();
			}
			mmSocket = tmp;
		}

		public void run() {
			// Cancel discovery because it will slow down the connection
			mBluetoothAdapter.cancelDiscovery();

			try {
				mmSocket.connect();
			} catch (IOException connectException) {
				Log.d(TAG, " exception while connecting socket "
						+ connectException.getMessage());

				interrupt();
				Intent intent = new Intent(
						bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM);
				intent.putExtra(bt_util_Constants.ECG_WAVEPOINTS,
						new ArrayList<Integer>());
				intent.putExtra(bt_util_Constants.TRANSMISSION_TYPE,
						bt_util_Constants.NONREALTIME_TYPE);
				intent.putExtra(Constants.DEVICE_ID, deviveId);
				sendBroadcast(intent);

				// Unable to connect; close the socket and get out
				try {
					Log.d(TAG, " closing socket ");
					mmSocket.close();
				} catch (IOException closeException) {
					Log.d(TAG, " exception while closing socket "
							+ closeException.getMessage());
					closeException.printStackTrace();
				}
				return;
			} catch (Exception e) {
				Log.d(TAG,
						" Excpetion in run() of ConnectThread "
								+ e.getMessage());
				e.printStackTrace();
			}

			// Do work to manage the connection (in a separate thread)
			manageConnectedSocket(mmSocket);
		}

		/** Will cancel an in-progress connection, and close the socket */
		public void cancel() {
			try {
				mmSocket.close();
			} catch (IOException e) {
				Log.d(TAG, " exception while closing socket " + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	public void manageConnectedSocket(BluetoothSocket socket) {
		// TODO Auto-generated method stub
		// Do work to manage the connection (in a separate thread for reading)
		Log.d(TAG, "manage Connected Socket");
		mReadThread = new ConnectedThread(socket);
		mReadThread.start();
	}

	private class ConnectedThread extends Thread {
		private final BluetoothSocket mmSocket;
		private final InputStream mmInStream;
		private final OutputStream mmOutStream;

		public ConnectedThread(BluetoothSocket socket) {
			mmSocket = socket;
			InputStream tmpIn = null;
			OutputStream tmpOut = null;

			// Get the input and output streams, using temp objects because
			// member streams are final
			try {
				tmpIn = socket.getInputStream();
				tmpOut = socket.getOutputStream();
				Log.d(TAG, "get i/o streams");

				// Log.d(TAG, "tmpIns" + tmpIn.toString());
				// Log.d(TAG, "tmpOut" + tmpOut.toString());

			} catch (IOException e) {
				Log.d(TAG, "Exception in get i/o streams " + e.getMessage());
				e.printStackTrace();
			}
			mmInStream = tmpIn;
			mmOutStream = tmpOut;

		}

		public void run() {
			byte[] buffer = new byte[1024]; // buffer store for the stream
			int bytes; // bytes returned from read()

			try {

				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// Configuration packet code
				ECGRealTimeService ecgService = new ECGRealTimeService();
				ECGDataRealtime ecgconfigPacket = (ECGDataRealtime) ecgService.parseData(new DataInputStream(mmInStream));
				Log.d(TAG, " onfig ECG Packet " + ecgconfigPacket);
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (ecgconfigPacket == null) {
					byte[] nakArray = createECGAckPacket("NotAcknowledge");
					Log.d(TAG, "writing to op stream");
					write(nakArray);

					cancel(null, null, bt_util_Constants.NONREALTIME_TYPE);

				} else {
					byte[] ackArray = createECGAckPacket("Acknowledge");
					write(ackArray);
					if (ecgconfigPacket.getPacketType().equalsIgnoreCase(
							"Real time")) {
						try {
							ArrayList<ECGDataRealtime> ecgPacketList = new ArrayList<ECGDataRealtime>();
							// remove while true, need to make it 30seconds
							mCountDownFinish = false;
							mCountDownTimer.start();
							while (!mCountDownFinish) {
								try {
									Thread.sleep(200);
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								ECGDataRealtime ecgPacket = (ECGDataRealtime) ecgService
										.parseData(new DataInputStream(
												mmInStream));
								if (!ecgPacket.getType().equalsIgnoreCase(
										"config")) {
									if (ecgPacket != null
											&& ecgPacket.getType()
													.equalsIgnoreCase("Data")) {
										Time today = new Time(
												Time.getCurrentTimezone());
										today.setToNow();

										ecgPacket.setTimeStamp(today
												.format("%Y-%m-%d %H:%M:%S"));
										ecgPacketList.add(ecgPacket);
										write(ackArray);
									} else {

										byte[] nakArray = createECGAckDataPacket(
												"NotAcknowledge",
												Integer.parseInt(ecgPacket
														.getContentList()
														.get(0), 16));
										write(nakArray);
									}
								}
							}
							cancel(null, ecgPacketList,
									bt_util_Constants.REALTIME_TYPE);
						} catch (ApplicationException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					} else {
						readNonRealtimeECGData(mmInStream);
					}
				}
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void readNonRealtimeECGData(InputStream mmInStream) {
			// mCountDownTimer1.start();
			ECGNonRealTimeService ecgService = new ECGNonRealTimeService();
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(mmInStream!=null) {
			ECGNonRTSCPDataBean ecgBean;
			try {

				ecgBean = (ECGNonRTSCPDataBean) ecgService
							.parseData(new DataInputStream(mmInStream));
				if (ecgBean == null) {
					
				}
				ArrayList<Integer> ecgSignalList = (ArrayList<Integer>) ecgBean
						.getScpSec6bean().getEcgsignal();
				byte[] ackArray = createECGAckPacket("Acknowledge");
				write(ackArray);
				cancel(ecgSignalList, null, bt_util_Constants.NONREALTIME_TYPE);
			} catch (ApplicationException e) {
				// Display message to user since CRC is wrong
				e.printStackTrace();
				cancel(new ArrayList<Integer>(), null,
						bt_util_Constants.NONREALTIME_TYPE);
			}}
			else{
				HealthMonLog.d(TAG, "Canceling");
				cancel(new ArrayList<Integer>(), null,
						bt_util_Constants.NONREALTIME_TYPE);
			}
		}

		/* Call this from the main activity to send data to the remote device */
		public void write(byte[] bytes) {
			try {
				mmOutStream.write(bytes);
				mmOutStream.flush();
			} catch (IOException e) {
			}
		}

		/* Call this from the main activity to shutdown the connection */
		public void cancel(ArrayList<Integer> ecgSignalList,
				ArrayList<ECGDataRealtime> ecgPacketList,
				String transmissionType) {
			try {
				mmSocket.close();
				mmInStream.close();
				mmOutStream.close();

				if (bt_util_Constants.NONREALTIME_TYPE.equals(transmissionType)) {
					Intent intent = new Intent(
							bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM);
					intent.putExtra(bt_util_Constants.ECG_WAVEPOINTS,
							ecgSignalList);
					intent.putExtra(bt_util_Constants.TRANSMISSION_TYPE,
							transmissionType);
					intent.putExtra(Constants.DEVICE_ID, deviveId);
					Log.d(TAG, " sending broadcast for NRT " + transmissionType
							+ " list " + ecgSignalList);
					sendBroadcast(intent);
				} else if (bt_util_Constants.REALTIME_TYPE
						.equals(transmissionType)) {
					Intent intent = new Intent(
							bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM);
					intent.putExtra(bt_util_Constants.REAL_TIME_PACKETS,
							ecgPacketList);
					intent.putExtra(bt_util_Constants.TRANSMISSION_TYPE,
							transmissionType);
					intent.putExtra(Constants.DEVICE_ID, deviveId);
					sendBroadcast(intent);
				}
				stopSelf();
			} catch (IOException e) {
				Log.d(TAG,
						"Exception in cancel() of ConnectedThread "
								+ e.getMessage());
				e.printStackTrace();
			}
		}

	}

	private static boolean mCountDownFinish = false;
	private CountDownTimer mCountDownTimer = new CountDownTimer(40000, 1000) {
		public void onTick(long millisUntilFinished) {
		}

		public void onFinish() {
			mCountDownFinish = true;
		}
	};
	protected boolean mCountDownFinish1;

	private static boolean receivedConfig = false;

	private byte[] createECGAckPacket(String type) {
		byte[] ackData = null;
		try {
			ECGAckPacket ackPacket = new ECGAckPacket();

			if (type.equalsIgnoreCase("Acknowledge")) {
				ackPacket = ECGAckSender.getAckPacket("Acknowledge");
			} else if (type.equalsIgnoreCase("NotAcknowledge")) {
				ackPacket = ECGAckSender.getAckPacket("NotAcknowledge");
			} else if (type.equalsIgnoreCase("Reject")) {
				ackPacket = ECGAckSender.getAckPacket("Reject");
			}
			ackData = new byte[5];
			ackData[0] = ackPacket.getHead();
			ackData[1] = ackPacket.getToken();
			ackData[2] = ackPacket.getLength();
			ackData[3] = ackPacket.getData();
			ackData[4] = ackPacket.getCrc();

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
		return ackData;

	}

	private byte[] createECGAckDataPacket(String type, int sequenceNo) {
		byte[] ackData = null;
		try {
			ECGAckPacket ackPacket = new ECGAckPacket();

			if (type.equalsIgnoreCase("Acknowledge")) {
				ackPacket = ECGAckSender.getAckPacket("Acknowledge");
			} else if (type.equalsIgnoreCase("NotAcknowledge")) {
				ackPacket = ECGAckSender.getAckPacket("NotAcknowledge");
			} else if (type.equalsIgnoreCase("Reject")) {
				ackPacket = ECGAckSender.getAckPacket("Reject");
			}
			ackData = new byte[6];
			ackData[0] = ackPacket.getHead();
			ackData[1] = ackPacket.getToken();
			ackData[2] = (byte) 0x02;
			ackData[3] = (byte) sequenceNo;
			ackData[4] = ackPacket.getData();
			ackData[5] = ackPacket.getCrc();

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
		return ackData;

	}

	public static String byteToHex(byte[] bytes, int count) {
		StringBuffer sb = new StringBuffer();
		{
			for (int i = 0; i < count; i++) {
				String hex = Integer.toHexString(bytes[i] & 0xFF);
				if (hex.length() == 1) {
					hex = '0' + hex;
				}
				sb.append(hex).append(" ");
			}
		}
		return sb.toString();
	}

}
