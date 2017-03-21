package com.persistent.healthmon.placeholder;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetManager;
import android.graphics.drawable.BitmapDrawable;
import android.os.Handler;
import android.support.v7.view.ContextThemeWrapper;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SwitchCompat;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.Switch;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.AvailableDevicesAdapter;
import com.persistent.healthmon.adapter.PairedDevicesAdapter;
import com.persistent.healthmon.listners.RecyclerItemClickListener;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.viewcontroller.AppManager;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by pushkar_bhadle on 5/12/2016.
 */
public class BlConnectionSettingPopUp extends android.widget.PopupWindow{

    Context ctx;
    View popupView;
    //Constants
    private static final String TAG = BlConnectionSettingPopUp.class.getSimpleName();

    public static final int REQUEST_CODE_ENABLE_BLUETOOTH = 1;

    //Recycler
    private RecyclerView mRecyclerViewPairedDevices;
    private RecyclerView mRecyclerViewAvailableDevices;

    //Adapters for paired and available devices
    private PairedDevicesAdapter mAdapterPairedDevices;
    private AvailableDevicesAdapter mAdapterAvailableDevices;
    private Button mScan;
    private boolean mIsBluetoothEnabled = false;

    private android.support.v7.widget.SwitchCompat mBluetoothSwitch;

    private ProgressBar mDeviceScanningProgressBar;

    public BlConnectionSettingPopUp(Context context)
    {
        super(context);

        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.activity_health_device_settings, null);
        setContentView(popupView);

        setHeight(500);
        setWidth(400);


        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        setBackgroundDrawable(new BitmapDrawable());



        //Refer static views
        mRecyclerViewPairedDevices = (RecyclerView)popupView.findViewById(R.id.recycler_view_paired_devices);
        mRecyclerViewAvailableDevices = (RecyclerView)popupView.findViewById(R.id.recycler_view_available_devices);
        mBluetoothSwitch = (SwitchCompat) popupView.findViewById(R.id.switch_bluetooth_state);
        mDeviceScanningProgressBar = (ProgressBar)popupView.findViewById(R.id.deviceScanningProgressbar);
        mScan = (Button) popupView.findViewById(R.id.btnScan);

        //Enable Bluetooth
        //ClassicBluetoothManager.getInstance().enableBluetooth(this, false);
        if(ClassicBluetoothManager.getInstance().isBluetoothEnabled()){
            mBluetoothSwitch.setChecked(true);
                setPairedDeviceList();

                //discover available devices
                discoverDevices();
        }

/*        if(ClassicBluetoothManager.getInstance().isBluetoothEnabled()){
            //ClassicBluetoothManager.getInstance().enableBluetooth(this, false);
            //Set Paired device list

        }*/

        //Register broadcast receiver for Bluetooth device found
        IntentFilter intentFilter = new IntentFilter(BluetoothDevice.ACTION_FOUND);
        intentFilter.addAction(BluetoothAdapter.ACTION_SCAN_MODE_CHANGED);
        intentFilter.addAction(BluetoothDevice.ACTION_BOND_STATE_CHANGED);
        ctx.registerReceiver(mBluetoothReceiver, intentFilter);

        //Register broadcast receiver for Bluetooth state changed
        ClassicBluetoothManager.getInstance().registerBroadcastReceiver(ctx, mBluetoothStateChangeReceiver, BluetoothAdapter.ACTION_STATE_CHANGED);

        mScan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(ClassicBluetoothManager.getInstance().isBluetoothEnabled()){
                    //Discover other devices
                    try {
                        discoverDevices();
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }else {
                    Toast.makeText(ctx, "Bluetooth is Disabled", Toast.LENGTH_SHORT).show();
                }
            }
        });

        mBluetoothSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (isChecked) {
                    ClassicBluetoothManager.getInstance().enableBluetooth(ctx, true);
                    if(!ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                        mBluetoothSwitch.setChecked(false);
                    }
                } else
                    ClassicBluetoothManager.getInstance().disableBluetooth();
            }
        });

        mRecyclerViewPairedDevices.addOnItemTouchListener(new RecyclerItemClickListener(
                ctx,
                mRecyclerViewPairedDevices,
                new RecyclerItemClickListener.OnItemClickListener() {

                    @Override
                    public void onItemClick(View view, int position) {
                        //UnPair Device
                        //ClassicBluetoothManager.getInstance().unPairDevice(mAdapterPairedDevices.getItem(position));
                    }

                    @Override
                    public void onItemLongClick(View view, int position) {
                        //HealthMonUtility.showDeviceSettingDialog(HealthDeviceSettingsActivity.this, mAdapterAvailableDevices.getItem(position).getAddress(), mAdapterAvailableDevices.getItem(position).getName());
                        HealthMonUtility.showMenuDialog(ctx, false, true, mAdapterPairedDevices.getItem(position));
                    }
                }));

        mRecyclerViewAvailableDevices.addOnItemTouchListener(new RecyclerItemClickListener(
                ctx,
                mRecyclerViewAvailableDevices,
                new RecyclerItemClickListener.OnItemClickListener() {

                    @Override
                    public void onItemClick(View view, int position) {
                        //Pair Device
                        //ClassicBluetoothManager.getInstance().pairDevice(mAdapterAvailableDevices.getItem(position));
                    }

                    @Override
                    public void onItemLongClick(View view, int position) {
                        //HealthMonUtility.showDeviceSettingDialog(HealthDeviceSettingsActivity.this, mAdapterAvailableDevices.getItem(position).getAddress(), mAdapterAvailableDevices.getItem(position).getName());
                        HealthMonUtility.showMenuDialog(ctx, true, false, mAdapterAvailableDevices.getItem(position));
                    }
                }));


    }

    // Attaches the view to its parent anchor-view at position x and y
    public void show(View anchor, int x, int y){
        showAtLocation(anchor, Gravity.CENTER, x, y);
    }

    private void setPairedDeviceList(){
        try {
        HealthMonLog.d(TAG, "setPairedDeviceList()");

        //Get Paired devices
        List<BluetoothDevice> devices = ClassicBluetoothManager.getInstance().queryForPairedDevices();
        HealthMonLog.d(TAG, "setPairedDeviceList(): no. of devices= " + devices.size());

        //Display Paired devices
        mAdapterPairedDevices = new PairedDevicesAdapter(devices);
        LinearLayoutManager layoutManager = new LinearLayoutManager(AppManager.getInstance());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerViewPairedDevices.setLayoutManager(layoutManager);
        mRecyclerViewPairedDevices.setAdapter(mAdapterPairedDevices);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void discoverDevices(){
        try {
            if (!ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                Toast.makeText(ctx, "Bluetooth is not enabled", Toast.LENGTH_SHORT).show();
                return;
            }

            //create instance of adapter and set it
            mAdapterAvailableDevices = new AvailableDevicesAdapter(new ArrayList<BluetoothDevice>());
            LinearLayoutManager layoutManager = new LinearLayoutManager(ctx);
            layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            mRecyclerViewAvailableDevices.setLayoutManager(layoutManager);
            mRecyclerViewAvailableDevices.setAdapter(mAdapterAvailableDevices);

            //Start discovering devices
            ClassicBluetoothManager.getInstance().discoverDevices();

            mDeviceScanningProgressBar.setVisibility(View.VISIBLE);

            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    mDeviceScanningProgressBar.setVisibility(View.INVISIBLE);
                }
            }, 20000);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void dismiss() {
        super.dismiss();
        try {
            //unregister receivers
            ctx.unregisterReceiver(mBluetoothStateChangeReceiver);
            ctx.unregisterReceiver(mBluetoothReceiver);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //Create a Broadcast receiver for Bluetooth State change
    private final BroadcastReceiver mBluetoothStateChangeReceiver = new BroadcastReceiver(){

        @Override
        public void onReceive(Context context, Intent intent) {
            int previousState = intent.getIntExtra(BluetoothAdapter.EXTRA_PREVIOUS_STATE, BluetoothAdapter.STATE_OFF);
            int newState = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, BluetoothAdapter.STATE_OFF);

            if(newState == BluetoothAdapter.STATE_ON || newState == BluetoothAdapter.STATE_CONNECTING){
                mIsBluetoothEnabled = true;
                mBluetoothSwitch.setChecked(true);
                //Set Paired device list
                setPairedDeviceList();
            }else{
                mIsBluetoothEnabled = false;
                mBluetoothSwitch.setChecked(false);
            }
            HealthMonLog.i(TAG, ".onReceive(): Previous State="+ previousState);
            HealthMonLog.i(TAG, ".onReceive(): New State="+ newState);
        }
    };

    //To discover device and scan mode change
    private final BroadcastReceiver mBluetoothReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            try {
            HealthMonLog.d(TAG, "onReceive()");
            String action = intent.getAction();

            // When discovery finds a device
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                // Get the BluetoothDevice object from the Intent
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                HealthMonLog.d(TAG, "onReceive(): Device Found: "+device.getName());
                // Add the name and address to an array adapter to show in a ListView

                    mAdapterAvailableDevices.addDevice(device);
                    ClassicBluetoothManager.getInstance().addAvailableDevice(device);
            }
            else if(BluetoothAdapter.ACTION_DISCOVERY_FINISHED.equals(action)){
                mDeviceScanningProgressBar.setVisibility(View.INVISIBLE);
            }

            // When discoverable mode has changed
            if (BluetoothAdapter.ACTION_SCAN_MODE_CHANGED.equals(action)) {
                int previousState = intent.getIntExtra(BluetoothAdapter.EXTRA_PREVIOUS_SCAN_MODE, BluetoothAdapter.SCAN_MODE_NONE);
                int newState = intent.getIntExtra(BluetoothAdapter.EXTRA_SCAN_MODE, BluetoothAdapter.SCAN_MODE_NONE);

                Log.i(TAG, ".onReceive(): SCAN MODE CHANGED new state = " + newState);
                if(newState == BluetoothAdapter.SCAN_MODE_NONE){
                    mDeviceScanningProgressBar.setVisibility(View.INVISIBLE);
                }else if(newState == BluetoothAdapter.SCAN_MODE_CONNECTABLE){
                    mDeviceScanningProgressBar.setVisibility(View.VISIBLE);
                }else if(newState == BluetoothAdapter.SCAN_MODE_CONNECTABLE_DISCOVERABLE){
                    mDeviceScanningProgressBar.setVisibility(View.VISIBLE);
                }
            }

            if (BluetoothDevice.ACTION_BOND_STATE_CHANGED.equals(action)) {
                final int state = intent.getIntExtra(BluetoothDevice.EXTRA_BOND_STATE, BluetoothDevice.ERROR);
                final int prevState = intent.getIntExtra(BluetoothDevice.EXTRA_PREVIOUS_BOND_STATE, BluetoothDevice.ERROR);

                if (state == BluetoothDevice.BOND_BONDED && prevState == BluetoothDevice.BOND_BONDING) {
                    setPairedDeviceList();
                } else if (state == BluetoothDevice.BOND_NONE && prevState == BluetoothDevice.BOND_BONDED){
                    setPairedDeviceList();
                }

            }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    };
}
