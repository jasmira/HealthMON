package com.persistent.healthmon.fragments;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.communication.ECGBluetoothService;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.ECGDataRealtime;
import com.vesag.bt.util.UtilClass;
import com.vesag.bt.util.bt_util_Constants;

import java.util.ArrayList;

public class EcgFragment extends HealthDeviceBaseFragment {
    private static final String TAG = BpmFragment.class.getSimpleName();
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    private OnFragmentInteractionListener mListener;

    private Context mContext;

    public EcgFragment() {
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
        View view = inflater.inflate(R.layout.fragment_ecg_wave, container, false);
        mBtnConnectDevice = (ImageView)view.findViewById(R.id.btnConnectAndRead);
        mProgressDeviceReading = (ProgressBar)view.findViewById(R.id.progressDeviceReading);
        mImageViewDeviceStatus = (ImageView)view.findViewById(R.id.imgDeviceAvailability);

        mBtnConnectDevice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isRunning)
                    startReadingECGDevice();
                else
                    stopReading();
            }
        });
        return view;
    }

    private void stopReading(){
        disconnectDevice();
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                ECGBluetoothService.class);
        mContext.stopService(pOxiWvFormBluetoothIntent);
    }

    public void startReadingECGDevice(){
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.ECG_DEVICE);
        if(address == null){
            Toast.makeText(mContext, "ECG device has not configured", Toast.LENGTH_SHORT).show();
            return;
        }
        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);

        HealthMonLog.i(TAG, "startReadingECGDevice()");
        showProgressbarDataReading(true);
        Intent ecgBluetoothIntent = new Intent(mContext,
                ECGBluetoothService.class);
        ecgBluetoothIntent.putExtra("ECG device Name",
                bluetoothDevice.getName());
        ecgBluetoothIntent.putExtra("ECG device addr",
                bluetoothDevice.getAddress());
        ecgBluetoothIntent.putExtra("ECG device id",
                bluetoothDevice);

        ecgBluetoothIntent.putExtra(Constants.DEVICE_ID, "122");
        Constants.setECG_DEVICE_ID(Integer.parseInt("122"));
        mContext.startService(ecgBluetoothIntent);
    }

    @Override
    public void onAttach(Context activity) {
        super.onAttach(activity);
        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }


    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        public void onFragmentInteraction(Uri uri);
    }

    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, final Intent intent) {
            String action = intent.getAction();

            // When discovery finds a device
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {

                // When discovery is finished, change the Activity title
            } else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED
                    .equals(action)) {


            }
            else if (Constants.ACTION_ECG_WAVE_SERVICE_DESTROYED.equals(action)) {

                showProgressbarDataReading(false);

            }
            else if (bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM
                    .equalsIgnoreCase(action)) {

                final String transmissionType = intent
                        .getStringExtra(bt_util_Constants.TRANSMISSION_TYPE);

                if (transmissionType
                        .equalsIgnoreCase(bt_util_Constants.NONREALTIME_TYPE)) {
                    ArrayList<Integer> wavepoints = intent
                            .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS);
                    if (wavepoints != null && wavepoints.size() > 0) {
                        Thread dbThread = new Thread(new Runnable() {
                            @Override
                            public void run() {
                                nonRealTimeECGdataCollection(intent);
                            }
                        });
                        dbThread.start();
                    } else {
                        Toast.makeText(mContext,
                                "In NON real time data collection",//getString(R.string.reset_blutooth),
                                Toast.LENGTH_LONG).show();
                    }

                } else if (transmissionType
                        .equalsIgnoreCase(bt_util_Constants.REALTIME_TYPE)) {
                    ArrayList<ECGDataRealtime> realTimePackets = (ArrayList<ECGDataRealtime>) intent
                            .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
                    if (realTimePackets != null && realTimePackets.size() > 0) {
                        Thread dbThread = new Thread(new Runnable() {

                            @Override
                            public void run() {
                                realTimeECGdataCollection(intent);
                            }
                        });
                        dbThread.start();
                    } else {
                        Toast.makeText(mContext,
                                "In real time data collection",//getString(R.string.reset_blutooth),
                                Toast.LENGTH_LONG).show();
                    }

                }


            }
        }
        private void nonRealTimeECGdataCollection(Intent intent) {
            final ArrayList<Integer> wavepoints = intent
                    .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS);
            Log.v(TAG, "NONREALTIME_TYPE" + wavepoints.toString());
            String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
            Log.v(TAG, "On Recive DEVICE_ID:" + deviceId);

            if (wavepoints != null && wavepoints.size() > 0) {

            } else {
                Toast.makeText(mContext,
                        getString(R.string.reset_blutooth), Toast.LENGTH_LONG)
                        .show();
            }
            Intent waveFormIntent = new Intent(mContext,
                    ECGWaveFormActivity.class);
            waveFormIntent.putExtra(bt_util_Constants.ECG_WAVEPOINTS, intent
                    .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS));
            waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(waveFormIntent);
        }

        private void realTimeECGdataCollection(Intent intent) {
            final ArrayList<ECGDataRealtime> realTimePackets = (ArrayList<ECGDataRealtime>) intent
                    .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
            String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
            Log.v(TAG, "REALTIME_TYPE On Recive DEVICE_ID:" + deviceId);
            Intent waveFormIntent = new Intent(mContext,
                    ECGWaveFormActivity.class);

            ArrayList<ECGDataRealtime> realTimePackets1 = (ArrayList<ECGDataRealtime>) intent
                    .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
            waveFormIntent.putExtra(bt_util_Constants.ECG_WAVEPOINTS,
                    UtilClass.getWavePointsFromAllPackets(realTimePackets1));
            waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(waveFormIntent);
        }
    };

    @Override
    public void onStart() {
        super.onStart();
        registerReceiver();
    }

    @Override
    public void onStop() {
        super.onStop();
        mContext.unregisterReceiver(mReceiver);
    }

    private void registerReceiver(){
        IntentFilter intentFilter = new IntentFilter(Constants.ACTION_ECG_WAVE_SERVICE_DESTROYED);
        intentFilter.addAction(bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM);
        mContext.registerReceiver(mReceiver, intentFilter);
    }
}
