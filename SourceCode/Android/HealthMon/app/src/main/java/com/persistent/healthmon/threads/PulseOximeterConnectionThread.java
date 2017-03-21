package com.persistent.healthmon.threads;

import android.annotation.SuppressLint;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.PulseOximeterCommand;
import com.vesag.bt.service.PulseOXPacketParameterList;
import com.vesag.bt.service.PulseOxCommandSender;
import com.vesag.bt.service.PulseOximeterParameterService;
import com.vesag.bt.util.ApplicationException;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class PulseOximeterConnectionThread extends Thread {
	private final BluetoothSocket mmSocket;
	private final BluetoothDevice mmDevice;
	private BluetoothAdapter mBluetoothAdapter;
	private Handler mHandler;
	private Handler mDataHandler;
	private String mDeviceId;

	private ConnectedPulseOximeterThread mConnectedPulseOximeterThread;

	private static UUID PULSE_OXIMETE_UUID = UUID
			.fromString("00001101-0000-1000-8000-00805F9B34FB");

	@SuppressLint("NewApi")
	public PulseOximeterConnectionThread(BluetoothDevice device,
			BluetoothAdapter bluetoothAdapter, Handler handler,
			Handler dataHandler, String deviceId) {
		// Use a temporary object that is later assigned to mmSocket,
		// because mmSocket is final
		BluetoothSocket tmp = null;
		mmDevice = device;
		mBluetoothAdapter = bluetoothAdapter;
		mHandler = handler;
		mDataHandler = dataHandler;
		mDeviceId = deviceId;
		// Get a BluetoothSocket to connect with the given BluetoothDevice
		try {
			// MY_UUID is the app's UUID string, also used by the server code
			//tmp = device.createRfcommSocketToServiceRecord(PULSE_OXIMETE_UUID);
			tmp = device.createInsecureRfcommSocketToServiceRecord(PULSE_OXIMETE_UUID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mmSocket = tmp;
	}

	@SuppressLint("NewApi")
	public void run() {
		// Cancel discovery because it will slow down the connection
		mBluetoothAdapter.cancelDiscovery();
		try {
			mHandler.sendEmptyMessage(Constants.CONNECTING);
			// Connect the device through the socket. This will block
			// until it succeeds or throws an exception
			/*try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			if (!mmSocket.isConnected()) {
				mmSocket.connect();
			}
			mHandler.sendEmptyMessage(Constants.CONNECTED);
			mConnectedPulseOximeterThread = new ConnectedPulseOximeterThread(
					mmSocket, mHandler, mDataHandler, mDeviceId);
			mConnectedPulseOximeterThread.start();
			byte[] getData = createPulseOximaterQuery();
			mConnectedPulseOximeterThread.write(getData);
		} catch (Exception ex) {
			// Unable to connect; close the socket and get out
			try {
				mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
				mmSocket.close();
				ex.printStackTrace();
			} catch (Exception closeException) {
				closeException.printStackTrace();
			}
			return;
		}
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

	/** Will cancel an in-progress connection, and close the socket */
	public void cancel() {
		try {

			if (mConnectedPulseOximeterThread != null) {
				mConnectedPulseOximeterThread.stopRunning();
			}

			mmSocket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean isConnected() {
		if (mmSocket != null) {
			mmSocket.isConnected();
		}
		return false;
	}

	public BluetoothDevice getBluetoothDevice() {
		return mmDevice;
	}

	public BluetoothSocket getBluetoothSocket() {
		return mmSocket;
	}

}

class ConnectedPulseOximeterThread extends Thread {

	private final BluetoothSocket mmSocket;
	private final InputStream mmInStream;
	private final OutputStream mmOutStream;

	private boolean mRestartServiceOnConnectionLost = true;
	private boolean isRunning = false;
	private boolean isQueryParameterSent = false;
	private Handler mHandler;
	private Handler mDataHandler;
	private String mDeviceId;

	private final String TAG = "ConnectedPulseOximeterThread";

	public ConnectedPulseOximeterThread(BluetoothSocket socket,
			Handler handler, Handler dataHandler, String deviceId) {
		mmSocket = socket;
		mHandler = handler;
		mDataHandler = dataHandler;
		mDeviceId = deviceId;

		InputStream tmpIn = null;
		OutputStream tmpOut = null;

		// Get the BluetoothSocket input and output streams
		try {
			tmpIn = socket.getInputStream();
			tmpOut = socket.getOutputStream();
			isRunning = true;
		} catch (IOException e) {
			/*Log.e(TAG, "temp sockets not created", e);*/
		}

		mmInStream = tmpIn;
		mmOutStream = tmpOut;
	}

	private byte[] createPulseOximaterParameterQuery() {
		byte[] quesryData = null;
		try {
			PulseOximeterCommand pulseOximeterCommand = PulseOxCommandSender
					.getCommand("Parameter");
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

	public void run() {
	///mCountDownTimer.start();
		/*Log.i(TAG, "BEGIN mConnectedThread");*/
		byte[] buffer = new byte[1024];
		int bytes;

		try {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			byte[] getData = createPulseOximaterParameterQuery();
			write(getData);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			isQueryParameterSent = true;
			
			PulseOximeterParameterService parameterService = new PulseOximeterParameterService();

			//TODO Pulse oxi multiple readings
			//for(int i=0;i<10&&isRunning;i++){
				PulseOXPacketParameterList pulseOXPacketParameterList = (PulseOXPacketParameterList) parameterService
						.parseData(new DataInputStream(mmInStream));
				if (pulseOXPacketParameterList != null
						&& pulseOXPacketParameterList
						.getPulseOXPacketParameterSize() > 0) {
					Message msg = new Message();
					Bundle bundle = new Bundle();
					bundle.putSerializable(
							"PulseOXPacketParameter",
							pulseOXPacketParameterList
									.getPulseOXPacketParametersList()
									.get(pulseOXPacketParameterList
											.getPulseOXPacketParameterSize() - 1));
					bundle.putString(Constants.DEVICE_ID, mDeviceId);
					msg.setData(bundle);
					mDataHandler.sendMessage(msg);
				} else {
					HealthMonLog.e(TAG, "Packet Parameter is null");
					//It is commented because its not real exception
					//mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
					//break;
				}
				Thread.sleep(1000);
			//}
			
		} catch (Exception e) {
			isRunning = false;
		}
	}

	/**
	 * Write to the connected OutStream.
	 * 
	 * @param buffer
	 *            The bytes to write
	 */
	public void write(byte[] buffer) {
		try {
			mmOutStream.write(buffer);
		} catch (IOException e) {
			/*Log.e(TAG, "Exception during write", e);*/
		}
	}

	public void stopRunning() {
		isRunning = false;
	}

	public boolean isRunning() {
		return isRunning;
	}
	private static boolean mCountDownFinish = false;

}
