package com.persistent.healthmon.communication;

import android.annotation.SuppressLint;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.content.Intent;
import android.os.CountDownTimer;
import android.os.IBinder;
import android.text.format.Time;
import android.util.Log;

import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.PulseOXPacketWaveform;
import com.vesag.bt.beans.PulseOximeterCommand;
import com.vesag.bt.service.PulseOxCommandSender;
import com.vesag.bt.service.PulseOximeterWaveformService;
import com.vesag.bt.util.ApplicationException;
import com.vesag.bt.util.bt_util_Constants;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;

public class PulseOxiWvFormBluetoothService extends Service {
	private String TAG = "PulseOxiWvFormBluetoothService";
	private boolean isQuerywaveformSent = false;
	private final BluetoothAdapter mBluetoothAdapter = BluetoothAdapter
			.getDefaultAdapter();
	protected static final UUID serverUUID = UUID
			.fromString("00001101-0000-1000-8000-00805F9B34FB");

	String mPulseOxiWvFormDeviceName = null, mPulseOxiWvFormDeviceAddr = null;
	BluetoothDevice mPOxiWvFormDevice = null;
	ConnectThread mConnectThread = null;
	ConnectedThread mReadThread = null;
	public String deviceID;
	Context mContex;

	@Override
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub
		Log.d(TAG, "onBind");
		return null;
	}

	@Override
	public void onCreate() {
		// TODO Auto-generated method stub
		super.onCreate();
		Log.d(TAG, "onCreate");

	}

	@Override
	public void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		Log.d(TAG, "onDestroy !!!!!!!!!!!!!!!!!!!!!!!");
		try {
			// mBluetoothAdapter.disable();
			if (mConnectThread != null)
				mConnectThread.cancel();
			if (mReadThread != null)
				mReadThread.cancel(null);
		} catch (Exception e) {
			Log.d(TAG, "Exception in onDestroy() " + e.getMessage());
			e.printStackTrace();
		}finally {
			sendBroadcast(new Intent(Constants.ACTION_PULSE_WAVE_SERVICE_DESTROYED));
		}
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO Auto-generated method stub
		Log.d(TAG, "onStartCommand");
		if (intent != null) {
			mPulseOxiWvFormDeviceName = intent
					.getStringExtra("POxiWvForm device Name");
			mPulseOxiWvFormDeviceAddr = intent
					.getStringExtra("POxiWvForm device Addr");
			mPOxiWvFormDevice = intent
					.getParcelableExtra("POxiWvForm device id");
			deviceID = intent.getStringExtra(Constants.DEVICE_ID);
			startBTServer(mPOxiWvFormDevice);

		} else {
			Log.d(TAG, "device is offline");
		}
		return START_STICKY;
	}

	// Start first BT server Thread // host; ie; tablet/mobile is server; ECG
	// device is client
	private void startBTServer(BluetoothDevice device) {
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
		private final BluetoothSocket mmSocket;

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
						bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM);
				intent.putExtra(Constants.DEVICE_ID, deviceID);
				intent.putExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS,
						new ArrayList<Integer>());
				Log.d(TAG, " sending broadcast for PulseOxiWvForm ");
				sendBroadcast(intent);

				// Unable to connect; close the socket and get out
				try {
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
			ArrayList<PulseOXPacketWaveform> pulseOXPacketWaveformList = new ArrayList<PulseOXPacketWaveform>();
			try {

				byte[] getData = createPulseOximaterQuery();
				write(getData);

				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				byte[] getwaveformData = createPulseOximaterWaveformQuery();
				write(getwaveformData);
				try {
					Thread.sleep(500);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				isQuerywaveformSent = true;
				// ArrayList<PulseOXPacketWaveform> pulseOXPacketWaveformList =
				// new ArrayList<PulseOXPacketWaveform>();
				// new HeartBeatWriteThread(mmOutStream).start();
				PulseOximeterWaveformService parameterService = new PulseOximeterWaveformService();
				PulseOXPacketWaveform pulseOXPacketWaveform = null;
				mCountDownFinish = false;
				mCountDownTimer.start();
				while (!mCountDownFinish) {
					byte[] getheartbeatData = createHeartBeatQuery();
					mmOutStream.write(getheartbeatData);
					pulseOXPacketWaveform = (PulseOXPacketWaveform) parameterService
							.parseData(new DataInputStream(mmInStream));
					if (pulseOXPacketWaveform != null) {
						Time today = new Time(Time.getCurrentTimezone());
						today.setToNow();
						pulseOXPacketWaveform.setTimeStamp(today
								.format("%Y-%m-%d %H:%M:%S"));
						pulseOXPacketWaveformList.add(pulseOXPacketWaveform);
					}
				}
				cancel(pulseOXPacketWaveformList);
				Log.d(TAG, "size of list :" + pulseOXPacketWaveformList.size());

			} catch (Exception e) {
				e.printStackTrace();
				// Toast.makeText(getApplicationContext(), "Connection lost",
				// Toast.LENGTH_LONG)
				// .show();
				cancel(pulseOXPacketWaveformList);
			}
		}

		/* Call this from the main activity to send data to the remote device */
		public void write(byte[] bytes) {
			try {
				Log.d(TAG, "writing query to device " + bytes.toString());
				mmOutStream.write(bytes);
				mmOutStream.flush();
			} catch (IOException e) {
				e.printStackTrace();

				// device is disconnected
				// CommonMethods.showAlert(PulseOximeterWaveformService.this,
				// "Check Blutooth", "Check Blutooth");
				// Toast.makeText(getApplicationContext(), "",
				// Toast.LENGTH_LONG)
				// .show();
				Log.v("writing query to device", "In Exeption");
			}
		}

		/* Call this from the main activity to shutdown the connection */
		private void cancel(
				ArrayList<PulseOXPacketWaveform> pulseOXPacketWaveformList) {
			HealthMonLog.d(TAG, "cancel " + pulseOXPacketWaveformList);

			try {
				mmSocket.close();
				mmInStream.close();
				mmOutStream.close();
				if (pulseOXPacketWaveformList != null) {
					Intent intent = new Intent(
							bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM);
					intent.putExtra(Constants.DEVICE_ID, deviceID);
					intent.putExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS,
							pulseOXPacketWaveformList);
					Log.d(TAG, " sending broadcast for PulseOxiWvForm ");
					sendBroadcast(intent);
				} else {
					Log.d(TAG, "pulseOXPacketWaveformList is null ");

				}
				stopSelf();
			} catch (IOException e) {
				Log.d(TAG,
						"Exception in cancel() of ConnectedThread "
								+ e.getMessage());
				e.printStackTrace();
			}
		}

		private byte[] createHeartBeatQuery() {
			byte[] quesryData = null;
			try {
				PulseOximeterCommand pulseOximeterCommand = PulseOxCommandSender
						.getCommand("Heartbeat");
				quesryData = new byte[pulseOximeterCommand.getCommand().length + 6];
				quesryData[0] = pulseOximeterCommand.getHead1();
				quesryData[1] = pulseOximeterCommand.getHead2();
				quesryData[2] = pulseOximeterCommand.getToken();
				quesryData[3] = pulseOximeterCommand.getLength();
				quesryData[4] = pulseOximeterCommand.getCommand()[0];
				quesryData[5] = pulseOximeterCommand.getCommand()[1];
				quesryData[6] = pulseOximeterCommand.getCrc();
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return quesryData;
		}

		private byte[] createPulseOximaterQuery() {
			byte[] quesryData = null;
			try {
				PulseOximeterCommand pulseOximeterCommand = PulseOxCommandSender
						.getCommand("Query");
				quesryData = new byte[pulseOximeterCommand.getCommand().length + 5];
				quesryData[0] = pulseOximeterCommand.getHead1();
				quesryData[1] = pulseOximeterCommand.getHead2();
				quesryData[2] = pulseOximeterCommand.getToken();
				quesryData[3] = pulseOximeterCommand.getLength();
				quesryData[4] = pulseOximeterCommand.getCommand()[0];
				quesryData[5] = pulseOximeterCommand.getCrc();
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return quesryData;
		}

		private byte[] createPulseOximaterWaveformQuery() {
			byte[] quesryData = null;
			try {
				PulseOximeterCommand pulseOximeterCommand = PulseOxCommandSender
						.getCommand("Waveform");
				quesryData = new byte[pulseOximeterCommand.getCommand().length + 6];
				quesryData[0] = pulseOximeterCommand.getHead1();
				quesryData[1] = pulseOximeterCommand.getHead2();
				quesryData[2] = pulseOximeterCommand.getToken();
				quesryData[3] = pulseOximeterCommand.getLength();
				quesryData[4] = pulseOximeterCommand.getCommand()[0];
				quesryData[5] = pulseOximeterCommand.getCommand()[1];
				quesryData[6] = pulseOximeterCommand.getCrc();

			} catch (ApplicationException e) {
				e.printStackTrace();
			}
			return quesryData;

		}
	}

	private static boolean mCountDownFinish = false;
	private CountDownTimer mCountDownTimer = new CountDownTimer(40000, 1000) {
		public void onTick(long millisUntilFinished) {
		}

		public void onFinish() {
			mCountDownFinish = true;
			Log.d(TAG, "timeup**********************************************"
					+ mCountDownTimer);
		}
	};

}
