package com.persistent.healthmon.fragments;


import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.communication.PulseOxiWvFormBluetoothService;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.vesag.bt.beans.PulseOXPacketWaveform;
import com.vesag.bt.util.UtilClass;
import com.vesag.bt.util.bt_util_Constants;

import java.util.ArrayList;

public class PulseWaveFragment extends HealthDeviceBaseFragment {
    private static final String TAG = PulseWaveFragment.class.getSimpleName();
    private Context mContext;
    public PulseWaveFragment() {
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
        View view = inflater.inflate(R.layout.fragment_pulse_wave, container, false);
        mBtnConnectDevice = (ImageView)view.findViewById(R.id.btnConnectAndRead);
        mProgressDeviceReading = (ProgressBar)view.findViewById(R.id.progressDeviceReading);
        mImageViewDeviceStatus = (ImageView)view.findViewById(R.id.imgDeviceAvailability);

        mBtnConnectDevice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isRunning)
                    startReadingPulseOximeterForWaveform();
                else
                    stopReading();

            }
        });
        return view;
    }

    private void stopReading(){
        disconnectDevice();
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                PulseOxiWvFormBluetoothService.class);
        mContext.stopService(pOxiWvFormBluetoothIntent);
    }

    public void startReadingPulseOximeterForWaveform(){
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.PULSE_OXIMETER);
        if(address == null){
            Toast.makeText(mContext, "Pulse Oximeter device has not been set", Toast.LENGTH_SHORT).show();
            return;
        }
        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);

        HealthMonLog.d(TAG, "PULSE_OXIMETER_WAVEFORM_DEVICE device selected");
        showProgressbarDataReading(true);
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                PulseOxiWvFormBluetoothService.class);

        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device Name",
                bluetoothDevice.getName());
        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device addr",
                bluetoothDevice.getAddress());
        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device id",
                bluetoothDevice);

        pOxiWvFormBluetoothIntent.putExtra(Constants.DEVICE_ID, "123");
        Constants.setPULSE_OXI_DEVICE_ID(Integer.parseInt("123"));
        mContext.startService(pOxiWvFormBluetoothIntent);
    }

    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, final Intent intent) {
            String action = intent.getAction();

            // When discovery finds a device
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {

            // When discovery is finished, change the Activity title
            }
            else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED
                    .equals(action)) {
            }
            else if (Constants.ACTION_PULSE_WAVE_SERVICE_DESTROYED.equals(action)) {
                showProgressbarDataReading(false);
            }
            else if (bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM
                    .equalsIgnoreCase(action)) {
                ArrayList<PulseOXPacketWaveform> pulseOxiWvFormPackets = (ArrayList<PulseOXPacketWaveform>) intent
                        .getSerializableExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS);
                String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
                final ArrayList<Integer> wavepointsToStore = UtilClass
                        .getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets);
                final ArrayList<Integer> pulseBeatsToStore = UtilClass
                        .getPulseBeatFromAllPacketsForPulseOxi(pulseOxiWvFormPackets);
                byte[] byteArray = UtilClass
                        .convertIntArrayListToByteArray(wavepointsToStore);
                byte[] pulseBeatsByteArray = UtilClass
                        .convertIntArrayListToByteArray(pulseBeatsToStore);

                showProgressbarDataReading(false);

                if (pulseOxiWvFormPackets != null
                        && pulseOxiWvFormPackets.size() > 0) {
                    Intent waveFormIntent = new Intent(
                            mContext,
                            PulseOxiWaveformActivity.class);
                    waveFormIntent
                            .putExtra(
                                    bt_util_Constants.PULSE_OXI_WAVEPOINTS,
                                    UtilClass
                                            .getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets));
                    waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(waveFormIntent);
                } else {
                    Toast.makeText(mContext,
                            getString(R.string.reset_blutooth),
                            Toast.LENGTH_LONG).show();
                }
            }
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
        IntentFilter intentFilter = new IntentFilter(Constants.ACTION_PULSE_WAVE_SERVICE_DESTROYED);
        intentFilter.addAction(bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM);
       mContext.registerReceiver(mReceiver, intentFilter);

    }
}
