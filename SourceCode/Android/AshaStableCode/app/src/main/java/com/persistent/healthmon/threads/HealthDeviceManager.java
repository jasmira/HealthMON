package com.persistent.healthmon.threads;

import com.persistent.healthmon.app.HealthMonApp;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.PreferanceManager;


/**
 * Created by pushkar_bhadle on 1/18/2016.
 */
public class HealthDeviceManager {
    private static final String TAG = HealthDeviceManager.class.getSimpleName();
    private static HealthDeviceManager mInstance= null;

    public static final int PULSE_OXIMETER_DEVICE_ID = 1;
    public static final int BPM_DEVICE_ID = 2;
    public static final int ECG_DEVICE_ID = 3;

    public static final String KEY_PULSE_OXIMETER_DEVICE_ADDRESS = "com.psl.bluetoothdemo.pulse_oximeter_device_id";
    public static final String KEY_BPM_DEVICE_ADDRESS = "com.psl.bluetoothdemo.bpm_device_id";
    public static final String KEY_ECG_DEVICE_ADDRESS = "com.psl.bluetoothdemo.ecg_device_id";

    private HealthDeviceManager(){}

    public static HealthDeviceManager getInstance(){
        if(mInstance == null)
            mInstance = new HealthDeviceManager();

        return mInstance;
    }

    public String getHealthDeviceAddress(HealthDevice device) {
        String keyDeviceAddress = null;
        switch (device){
            case PULSE_OXIMETER:
                keyDeviceAddress = KEY_PULSE_OXIMETER_DEVICE_ADDRESS;
                break;
            case BPM_DEVICE:
                keyDeviceAddress = KEY_BPM_DEVICE_ADDRESS;
                break;
            case ECG_DEVICE:
                keyDeviceAddress = KEY_ECG_DEVICE_ADDRESS;
                break;
        }

        String address = null;
        if(keyDeviceAddress != null){
            address = PreferanceManager.getStringPreferences(keyDeviceAddress, null , HealthMonApp.getContext());
        }else {
            HealthMonLog.d(TAG, "Address not found = "+ keyDeviceAddress );
        }

        return address;
    }

    public void setHealthDeviceAddress(HealthDevice deviceType, String address) {

        String keyDeviceAddress = null;
        switch (deviceType){
            case PULSE_OXIMETER:
                keyDeviceAddress = KEY_PULSE_OXIMETER_DEVICE_ADDRESS;
                break;
            case BPM_DEVICE:
                keyDeviceAddress = KEY_BPM_DEVICE_ADDRESS;
                break;
            case ECG_DEVICE:
                keyDeviceAddress = KEY_ECG_DEVICE_ADDRESS;
                break;
        }
        //Store address of ecg device
        PreferanceManager.setStringPreferences(keyDeviceAddress,
                address,
                HealthMonApp.getContext());
    }
}
