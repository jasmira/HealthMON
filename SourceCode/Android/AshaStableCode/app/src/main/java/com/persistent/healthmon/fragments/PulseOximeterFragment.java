package com.persistent.healthmon.fragments;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.threads.PulseOximeterConnectionThread;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.PulseOXPacketParameter;

public class PulseOximeterFragment extends HealthDeviceBaseFragment {
    private static final String TAG = PulseOximeterFragment.class.getSimpleName();
    private PulseOximeterConnectionThread mPulseOxiMeterThread = null;

    private TextView txtSpO2;
    private TextView txtPI;
    private TextView txtPulseRate;

    private Context mContext;


    public PulseOximeterFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {

        }
        mContext = getActivity();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_pulse_oximeter, container, false);
        mBtnConnectDevice = (ImageView)view.findViewById(R.id.btnConnectAndRead);
        mProgressDeviceReading = (ProgressBar)view.findViewById(R.id.progressDeviceReading);
        mImageViewDeviceStatus = (ImageView)view.findViewById(R.id.imgDeviceAvailability);

        txtSpO2 = (TextView) view.findViewById(R.id.txtspo2);
        txtPI = (TextView) view.findViewById(R.id.txtPI);
        txtPulseRate = (TextView) view.findViewById(R.id.txtPulseRateOximeter);

        mBtnConnectDevice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isRunning)
                    startReadingPulseOxiDevice();
                else
                    stopReading();
            }
        });
        return view;
    }

    private void stopReading(){
        disconnectDevice();
        if(mPulseOxiMeterThread!=null)
            mPulseOxiMeterThread.cancel();
    }

    private Handler mDataHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            HealthMonLog.d(TAG, "mDataHandler: handleMessage()");

            try {
                Bundle bundle = msg.getData();
                if(bundle.containsKey("PulseOXPacketParameter")){
                    String deviceId = bundle.getString(Constants.DEVICE_ID);
                    PulseOXPacketParameter pulseOXPacketParameter= (PulseOXPacketParameter)bundle.getSerializable("PulseOXPacketParameter");

                    int spo2 = pulseOXPacketParameter.getSpO2();
                    int pi = pulseOXPacketParameter.getPerfusionIndex();
                    int pulseRate = pulseOXPacketParameter.getPulseRate();
                    displayPulseOxiMeterReport(spo2, pi, pulseRate);
                }
                showProgressbarDataReading(false);
                /*if(mPulseOxiMeterThread != null)
                    mPulseOxiMeterThread.cancel();*/
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    };

    private void disconnect(){
        if(mPulseOxiMeterThread != null)
            mPulseOxiMeterThread.cancel();
    }

    private void displayPulseOxiMeterReport(int spo2, int pi, int pulseRate){
        txtSpO2.setText(spo2 + "%");
        txtPI.setText(pi + "%");
        txtPulseRate.setText("" + pulseRate);
    }

    public void startReadingPulseOxiDevice(){

        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.PULSE_OXIMETER);
        if(address == null){
            Toast.makeText(mContext, "Device not configured", Toast.LENGTH_SHORT).show();
            return;
        }

        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);
        if(bluetoothDevice == null)
            return;

        HealthMonLog.i(TAG, "startReadingPulseOxiDevice(): Pulse Oxi address=" + bluetoothDevice.getAddress());

        disconnect();

        //Pulse Oximeter device
        mPulseOxiMeterThread = new PulseOximeterConnectionThread(
                bluetoothDevice,
                BluetoothAdapter.getDefaultAdapter(),
                mMessageHandler,
                mDataHandler,
                null);

        mPulseOxiMeterThread.start();
    }

    @Override
    public void onStop() {
        super.onStop();
        stopReading();
    }
}
