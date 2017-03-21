package com.persistent.healthmon.fragments;

import android.app.Fragment;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

/**
 * Created by sunil_muttepawar on 2/3/2016.
 */
public class HealthDeviceBaseFragment extends Fragment {
    private static final String TAG = HealthDeviceBaseFragment.class.getSimpleName();
    protected ImageView mBtnConnectDevice;
    protected ProgressBar mProgressDeviceReading;
    protected ImageView mImageViewDeviceStatus;

    protected boolean isRunning = false;

    protected void setDeviceAvailable(boolean status){
        if(status){
            mImageViewDeviceStatus.setImageResource(R.drawable.device_available);
        }else {
            mImageViewDeviceStatus.setImageResource(R.drawable.device_not_available);
        }
    }

    protected void showProgressbarDataReading(boolean status){
        if(status){
            isRunning = true;
            mProgressDeviceReading.setVisibility(View.VISIBLE);
            mBtnConnectDevice.setImageResource(R.drawable.ic_stop_white);
        }else {
            isRunning = false;
            mProgressDeviceReading.setVisibility(View.GONE);
            mBtnConnectDevice.setImageResource(R.drawable.ic_refresh_white_48dp);
        }
    }

    protected Handler mMessageHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case Constants.SHOW_DEVICES:
                    //showBTDevicesList();
                    break;
                case Constants.CONNECTION_LOST:
                    connectionLost();
                    break;
                case Constants.CONNECTED:
                    deviceConnected();
                    break;
                case Constants.CONNECTING:
                    deviceConnecting();
                    break;
            }
        }
    };

    protected void connectionLost(){
        showProgressbarDataReading(false);
        Toast.makeText(getActivity(), "Connection lost", Toast.LENGTH_SHORT).show();
        HealthMonLog.i(TAG, "Connection Lost");
    }

    private void deviceConnected(){
        showProgressbarDataReading(true);
        Toast.makeText(getActivity(), "Device Connected", Toast.LENGTH_SHORT).show();
        HealthMonLog.i(TAG, "Device Connected");
    }

    private void deviceConnecting(){
        showProgressbarDataReading(true);
        HealthMonLog.i(TAG, "Device Connecting");
    }

    protected void disconnectDevice(){
        showProgressbarDataReading(false);
    }

    protected void getDeviceAddress(HealthDevice device){

    }

    @Override
    public void onDestroy() {
        super.onDestroy();

    }
}
