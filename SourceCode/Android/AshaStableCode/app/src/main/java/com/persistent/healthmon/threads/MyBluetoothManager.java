package com.persistent.healthmon.threads;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Handler;

import com.persistent.healthmon.app.HealthMonApp;
import com.persistent.healthmon.util.HealthMonLog;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by pushkar_bhadle on 1/20/2016.
 */
public class MyBluetoothManager {
    private static final String TAG = MyBluetoothManager.class.getSimpleName();
    protected static MyBluetoothManager mInstance = null;

    protected BluetoothAdapter mBluetoothAdapter;

    private boolean mBluetoothSupported = true;

    //Paired devices
    private Set<BluetoothDevice> mPairedDeviceSet;
    private List<BluetoothDevice> mPairedDeviceList = new ArrayList<>();

    //Available devices
    private List<BluetoothDevice> mAvailableDeviceList = new ArrayList<>();

    private static final int REQUEST_CODE_ENABLE_BLUETOOTH = 1;

    private Context mAppContext;

    protected boolean mScanning;

    protected Handler mScanHandler;

    // Stops scanning after 10 seconds.
    protected static final long SCAN_PERIOD = 10000;

    protected MyBluetoothManager(){
        mAppContext = HealthMonApp.getContext();
        mScanHandler = new Handler();
    }

    private static MyBluetoothManager getInstance(){
        if(mInstance == null){
            if(isBleSupported(HealthMonApp.getContext()))
                mInstance = null ; //ClassicBluetoothManager.getInstance();
            else
                mInstance = BleManager.getInstance();
        }
        return mInstance;
    }

    protected static boolean isBleSupported(Context context){
        if(context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE)){
            HealthMonLog.i(TAG, "Support BLE devices");
            return true;
        }else{
            HealthMonLog.i(TAG, "Does not support BLE devices");
        }
        return false;
    }

    public void enableBluetooth(Context context, boolean showBluetoothEnableDialog){
        if(showBluetoothEnableDialog && !mBluetoothAdapter.isEnabled()){
            Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            ((Activity)context).startActivityForResult(intent, REQUEST_CODE_ENABLE_BLUETOOTH);
        }else if(mBluetoothAdapter.isEnabled())
            mBluetoothAdapter.enable();
    }

    public void disableBluetooth(){
        mBluetoothAdapter.disable();
    }



    public void clearAvailableDeviceList(){
        mAvailableDeviceList.clear();
    }

    public void addAvailableDevice(BluetoothDevice... devices){
        for(BluetoothDevice device: devices) {
            mAvailableDeviceList.add(device);
        }
    }

    public void registerBroadcastReceiver(Context context, BroadcastReceiver receiver, String... actions){
        IntentFilter intentFilter = new IntentFilter();
        for(String action: actions)
            intentFilter.addAction(action);
        context.registerReceiver(receiver, intentFilter);
    }

    public void unregisterBroadcastReceiver(Context context, BroadcastReceiver receiver){
        context.unregisterReceiver(receiver);
    }

    public List<BluetoothDevice> getAvailableDeviceList(){
        return mAvailableDeviceList;
    }

    public List<BluetoothDevice> getPairedDeviceList(){
        return mPairedDeviceList;
    }


}
