package com.persistent.healthmon.threads;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import com.persistent.healthmon.util.HealthMonLog;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by pushkar_bhadle on 1/15/2016.
 */
public class ClassicBluetoothManager{
    private static final String TAG = ClassicBluetoothManager.class.getSimpleName();
    public static final int DISCOVERABLE_ALWAYS = 0;
    public static final int DISCOVERABLE_DISABLE = 1;

    private static ClassicBluetoothManager mInstance = null;

    //Member variables
    private BluetoothAdapter mBluetoothAdapter;
    private boolean mBluetoothSupported = true;

    //Paired devices
    private Set<BluetoothDevice> mPairedDeviceSet;
    private List<BluetoothDevice> mPairedDeviceList = new ArrayList<>();

    //Available devices
    private List<BluetoothDevice> mAvailableDeviceList = new ArrayList<>();

    public static final int REQUEST_CODE_ENABLE_BLUETOOTH = 1;

    public ClassicBluetoothManager(){
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        //Check whether this device bluetooth
        if(mBluetoothAdapter == null)
            mBluetoothSupported = false;
        else
            mBluetoothSupported = true;
    }

    public static ClassicBluetoothManager getInstance(){
        if(mInstance == null)
            mInstance = new ClassicBluetoothManager();

        return mInstance;
    }

    //Check whether this device bluetooth
    public boolean isBluetoothSupported(){
        return mBluetoothSupported;
    }

    public void enableBluetooth(Context context, boolean showBluetoothEnableDialog){
        if(showBluetoothEnableDialog && !mBluetoothAdapter.isEnabled()){
            Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            ((Activity)context).startActivityForResult(intent, REQUEST_CODE_ENABLE_BLUETOOTH);
        }else if(!mBluetoothAdapter.isEnabled())
            mBluetoothAdapter.enable();
    }

    public void disableBluetooth(){
        mBluetoothAdapter.disable();
    }

    public boolean discoverDevices(){
        boolean isDiscoveryStarted;

        if(mBluetoothAdapter.isDiscovering())
            mBluetoothAdapter.cancelDiscovery();

        //Start discovery of devices
        //It scans for 12 seconds, followed by a page scan of each found device to retrieve its Bluetooth name.
        boolean discoverStarted = mBluetoothAdapter.startDiscovery(); //require permission BLUETOOTH_ADMIN

        if(discoverStarted) {
            isDiscoveryStarted = true;
            clearAvailableDeviceList();
        }else {  //if not started
            isDiscoveryStarted = false;
        }
        return isDiscoveryStarted;
    }

    public void clearAvailableDeviceList(){
        mAvailableDeviceList.clear();
    }

    public void addAvailableDevice(BluetoothDevice... devices){
        for(BluetoothDevice device: devices) {
            mAvailableDeviceList.add(device);
        }
    }

    public List<BluetoothDevice> queryForPairedDevices(){
        mPairedDeviceSet = mBluetoothAdapter.getBondedDevices();
        mPairedDeviceList.clear();
        // If there are paired devices
        if (mPairedDeviceSet.size() > 0) {
            // Add the name and address to an array adapter to show in a ListView
            //mArrayAdapter.add(device.getName() + "\n" + device.getAddress());
            for(BluetoothDevice device:mPairedDeviceSet){
                mPairedDeviceList.add(device);
            }
        }
        return mPairedDeviceList;
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

    public List<BluetoothDevice> getAllDeviceList(){
        // Write code, which will create list of device. and device should not get repeated

        return null;
    }

    public boolean isBluetoothEnabled(){
        return mBluetoothAdapter.isEnabled();
    }

    public BluetoothDevice getBluetoothDevice(String address){
        if(mPairedDeviceList == null)
            return null;

        //Check whether it is available in Paired device list
        for(BluetoothDevice device: mPairedDeviceList){
            if(address.equals(device.getAddress())){
                return device;
            }
        }

        if(mAvailableDeviceList == null)
            return null;
        //Check whether it is in Available device list
        for(BluetoothDevice device: mAvailableDeviceList){
            if(address.equals(device.getAddress())){
                return device;
            }
        }
        HealthMonLog.i(TAG, "Device not found: "+address);
        return null;
    }

    public boolean isDeviceAvailable(String address){
        if(mAvailableDeviceList == null)
            return false;

        //Check whether it is in Available device list
        for(BluetoothDevice device: mAvailableDeviceList){
            if(address.equals(device.getAddress())){
                return true;
            }
        }

        return false;
    }

    //To make this device discoverable for other devices
    public void setDiscoverable(Context activityContext, int seconds){
        Intent discoverableIntent = new
                Intent(BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE);
        discoverableIntent.putExtra(BluetoothAdapter.EXTRA_DISCOVERABLE_DURATION, seconds); //300 seconds
        //0 for always discoverable, max 3600, by default 120

        activityContext.startActivity(discoverableIntent);

    }

    public void pairDevice(BluetoothDevice device){
       try{
           Method m = device.getClass().getMethod("createBond", (Class[]) null);
           m.invoke(device, (Object[]) null);

       }catch (Exception e){
           e.printStackTrace();
       }
    }

    public void unPairDevice(BluetoothDevice device){
        try {
            Method method = device.getClass().getMethod("removeBond", (Class[]) null);
            method.invoke(device, (Object[]) null);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
