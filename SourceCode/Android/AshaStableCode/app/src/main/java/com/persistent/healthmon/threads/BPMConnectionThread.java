package com.persistent.healthmon.threads;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import com.persistent.healthmon.util.Constants;
import com.vesag.bt.beans.BPMRealTimeData;
import com.vesag.bt.beans.ClinicalMonitorDeviceData;
import com.vesag.bt.service.ParserClass;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class BPMConnectionThread extends Thread {
	private final BluetoothSocket mSocket;
	public final BluetoothDevice mDevice;
	private BluetoothAdapter mBluetoothAdapter;
	private Handler mHandler;
	private Handler mDataHandler;
	private ConnectedBPMThread mcConnectedBPMThread;
	private String mDeviceId;

	private static UUID BPM_UUID = UUID
			.fromString("00001101-0000-1000-8000-00805F9B34FB");

	public BPMConnectionThread(BluetoothDevice device,
			BluetoothAdapter bluetoothAdapter, Handler handler,
			Handler dataHandler, String deviceId) {
		// Use a temporary object that is later assigned to mmSocket,
		// because mmSocket is final
		BluetoothSocket tmp = null;
		mDevice = device;
		mDeviceId = deviceId;

		// Get a BluetoothSocket to connect with the given BluetoothDevice
		try {
			// MY_UUID is the app's UUID string, also used by the server code
			tmp = device.createRfcommSocketToServiceRecord(BPM_UUID);

		} catch (IOException e) {
			e.printStackTrace();
		}
		mSocket = tmp;

		mBluetoothAdapter = bluetoothAdapter;
		mHandler = handler;
		mDataHandler = dataHandler;
	}

	public void run() {
		// Cancel discovery because it will slow down the connection
		mBluetoothAdapter.cancelDiscovery();

		try {
			mHandler.sendEmptyMessage(Constants.CONNECTING);
			// Connect the device through the socket. This will block
			// until it succeeds or throws an exception
			if (!mSocket.isConnected()) {
				mSocket.connect();
			}
			mcConnectedBPMThread = new ConnectedBPMThread(mSocket, mHandler,
					mDataHandler, mDeviceId);
			mcConnectedBPMThread.start();
			mHandler.sendEmptyMessage(Constants.CONNECTED);
		} catch (Exception ex) {
			// Unable to connect; close the socket and get out
			try {
				mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
				mSocket.close();
				ex.printStackTrace();
			} catch (Exception closeException) {
				closeException.printStackTrace();
			}
			return;
		}
	}

	/** Will cancel an in-progress connection, and close the socket */
	public void cancel() {
		try {
			mSocket.close();

			if (mcConnectedBPMThread != null) {
				mcConnectedBPMThread.stopRunning();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean isConnected() {
		if (mSocket != null) {
			mSocket.isConnected();
		}
		return false;
	}

	public BluetoothDevice getBluetoothDevice() {
		return mDevice;
	}

	public BluetoothSocket getBluetoothSocket() {
		return mSocket;
	}
}

class ConnectedBPMThread extends Thread {
	private final BluetoothSocket mmSocket;
	private final InputStream mmInStream;
	private boolean mRestartServiceOnConnectionLost = true;
	private boolean isRunning = false;
	private Handler mHandler;
	private Handler mDataHandler;
	private String mDeviceId;
	private final String TAG = "ConnectedBPMThread";

	private final OutputStream mmOutStream;

	public ConnectedBPMThread(BluetoothSocket socket, Handler handler,
			Handler dataHandler, String deviceId) {
		Log.i(TAG, "create ConnectedThread");
		mmSocket = socket;
		InputStream tmpIn = null;
		OutputStream tmpOut = null;
		mDeviceId = deviceId;

		// Get the BluetoothSocket input and output streams
		try {
			/*try {
				this.sleep(20000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			tmpIn = socket.getInputStream();
			tmpOut = socket.getOutputStream();
			if (tmpIn == null) {
				Log.e(TAG, "InputStream = null");
			}

			if (tmpOut == null) {
				Log.e(TAG, "OutputStream = null");
			}
		} catch (IOException e) {
			Log.e(TAG, "temp sockets not created", e);
		}

		mmInStream = tmpIn;
		mmOutStream = tmpOut;
		mHandler = handler;
		mDataHandler = dataHandler;

		if(mmSocket.isConnected() && mmInStream!=null && mmOutStream!=null)
			isRunning = true;
		else {
			cancel();
		}
	}

	public void run() {
		Log.i(TAG, "BEGIN mConnectedThread");
		byte[] buffer = new byte[1024];
		int bytes;

		//Send instruction to start machine to read data
		if(isRunning)
			instructToStartMachine();

		// Keep listening to the InputStream while connected
		while (isRunning) {
			try {
				// Read from the InputStream
				ClinicalMonitorDeviceData data = ParserClass.startParsing(
						"BPM", "RealTime", new DataInputStream(mmInStream));

				if (data != null) {
					if (data instanceof BPMRealTimeData) {
						Message msg = new Message();
						Bundle bundle = new Bundle();
						bundle.putSerializable("BPMRealTimeData", data);
						bundle.putString(Constants.DEVICE_ID, mDeviceId);
						msg.setData(bundle);
						mDataHandler.sendMessage(msg);
						isRunning=false;
					}

				} else {
					// Bundle bundle = new Bundle();
					// bundle.putSerializable("BPMRealTimeData", data);
					mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
				}

			} catch (Exception e) {
				Log.e(TAG, "disconnected", e);
				mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
				isRunning = false;
				break;
			}
		}
	}

	public void stopRunning() {
		isRunning = false;
	}

	public void instructToStartMachine(){
		byte[] sysConfigInstruction = new byte[]{ -91, 1, 48, 57, 48, 57, 1, 1, 5, 2, 5, 3, 4, 11, 6, 1, 10, 9, 10, 11, 12, 13, 14, 15, 0 };
		byte[] detectInstruction = new byte[]{ -91, 1, 48, 57, 48, 57, 1, 2, 4, 0, 0 };
		byte[] machineStartInstruction = { 77, 89, 84, 69, 67, 72, 32 };


		try{
			mmOutStream.write(sysConfigInstruction);
			mmOutStream.flush();

			mmOutStream.write(detectInstruction);
			mmOutStream.flush();

			mmOutStream.write(machineStartInstruction);
			mmOutStream.flush();

		}catch (IOException e){
			e.printStackTrace();

			mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);
			isRunning = false;
		}

	}

	public boolean isRunning() {
		return isRunning;
	}

	public void cancel() {
		try {
			if(mmSocket!=null)
				mmSocket.close();

			if(mmInStream!=null)
				mmInStream.close();

			if(mmOutStream != null)
				mmOutStream.close();

			isRunning = false;

			mHandler.sendEmptyMessage(Constants.CONNECTION_LOST);

		} catch (IOException e) { }
	}

}