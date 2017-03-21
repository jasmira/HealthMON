package com.persistent.healthmon.fragments;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.threads.BPMConnectionThread;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.vesag.bt.beans.BPMRealTimeData;

public class BpmFragment extends HealthDeviceBaseFragment {
    private static final String TAG = BpmFragment.class.getSimpleName();
    private BPMConnectionThread mBpmConnectionThread = null;

    private TextView txtSystolic;
    private TextView txtDiastolic;
    private TextView txtPulseRate;

    private Context mContext;

    public BpmFragment() {
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
        View view = inflater.inflate(R.layout.fragment_bpm, container, false);
        mBtnConnectDevice = (ImageView)view.findViewById(R.id.btnConnectAndRead);
        mProgressDeviceReading = (ProgressBar)view.findViewById(R.id.progressDeviceReading);
        mImageViewDeviceStatus = (ImageView)view.findViewById(R.id.imgDeviceAvailability);

        txtSystolic = (TextView) view.findViewById(R.id.txtSystolicReport);
        txtDiastolic = (TextView) view.findViewById(R.id.txtDiastolicReport);
        txtPulseRate = (TextView) view.findViewById(R.id.txtPulseRateReport);

        ClassicBluetoothManager.getInstance().queryForPairedDevices();
        ClassicBluetoothManager.getInstance().discoverDevices();
        mBtnConnectDevice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!isRunning)
                    startReadingBPMDevice();
                else
                    stopReading();

            }
        });
        return view;
    }

    private void stopReading(){
        disconnectDevice();
        mBpmConnectionThread.cancel();
    }

    private void startReadingBPMDevice(){
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.BPM_DEVICE);
        if(address == null){
            Toast.makeText(getActivity(), "BPM device has not configured", Toast.LENGTH_SHORT).show();
            return;
        }
        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);
        mBpmConnectionThread = new BPMConnectionThread(
                bluetoothDevice,
                BluetoothAdapter.getDefaultAdapter(),
                mMessageHandler,
                mDataHandler,
                null);

        mBpmConnectionThread.start();
    }

    private Handler mDataHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            try {
                Bundle bundle = msg.getData();
                if(bundle.containsKey("BPMRealTimeData")){
                    BPMRealTimeData bpmData = null;
                    bpmData = (BPMRealTimeData) bundle.getSerializable("BPMRealTimeData");
                    if(bpmData != null){
                        int systolic = bpmData.getSystolic();
                        int diastolic = bpmData.getDiastolic();
                        int pulse = bpmData.getPulse();
                        String dateTime = bpmData.getDateTime();

                        Log.i(TAG, "Data: " + systolic + ", " + diastolic + ", " + pulse + ", " + dateTime);

                        displayBpmReport(systolic, diastolic, pulse);
                    }
                }

                showProgressbarDataReading(false);
                if(mBpmConnectionThread != null)
                    mBpmConnectionThread.cancel();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    };

    private void displayBpmReport(int systolic, int diastolic, int pulseRate){


        int normalColor = ContextCompat.getColor(mContext, R.color.bp_normal);
        int prehypertension = ContextCompat.getColor(mContext, R.color.bp_prehypertension);
        int stage1Color = ContextCompat.getColor(mContext, R.color.bp_hight_stage1);
        int stage2Color = ContextCompat.getColor(mContext, R.color.bp_hight_stage2);
        int crisisColor= ContextCompat.getColor(mContext, R.color.bp_crisis_emergency);

        //Systolic reading
        int color;
        if(systolic > 180)
            color = crisisColor;
        else if(systolic >= 160)
            color = stage2Color;
        else if(systolic >= 140)
            color = stage1Color;
        else if(systolic >= 120)
            color = prehypertension;
        else
            color = normalColor;

        txtSystolic.setText(""+systolic);
        txtSystolic.setTextColor(color);

        //Diastolic reading
        if(diastolic > 110)
            color = crisisColor;
        else if(diastolic >= 100)
            color = stage2Color;
        else if(diastolic >= 90)
            color = stage1Color;
        else if(diastolic >= 80)
            color = prehypertension;
        else
            color = normalColor;

        txtDiastolic.setText(""+diastolic);
        txtDiastolic.setTextColor(color);


        //Pulse reading
        if(pulseRate > 100)
            color = crisisColor;
        else
            color = normalColor;
        txtPulseRate.setText(""+pulseRate);
        txtPulseRate.setTextColor(color);
    }
}
