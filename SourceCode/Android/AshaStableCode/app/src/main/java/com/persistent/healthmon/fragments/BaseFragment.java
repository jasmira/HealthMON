package com.persistent.healthmon.fragments;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.Fragment;
import android.support.v7.widget.SwitchCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.ECGBluetoothService;
import com.persistent.healthmon.communication.PulseOxiWvFormBluetoothService;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.placeholder.BlConnectionSettingPopUp;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

/**
 * Created by khyati_shah on 3/14/2016.
 */
public class BaseFragment extends Fragment {
    private static final String TAG = HealthDeviceBaseFragment.class.getSimpleName();
    protected ImageView mBtnConnectDevice;
    protected ProgressBar mProgressDeviceReading;
    protected ImageView mImageViewDeviceStatus;

    protected Button btn_helpGuide;
    protected SwitchCompat btn_ModeSwitch;
    protected TextView tv_due,tv_ltRecorded,tv_ltData,tv_BLConn,tv_test,tv_deviceMode;
    protected ImageView iv_test, iv_bl_setting;
    protected LinearLayout llSwitchMode, llLastData;
    protected static String deviceRunning = "";


    protected boolean isRunning = false;
    Dialog dialog = null;

    protected void setDeviceAvailable(boolean status){
        if(status){
            mImageViewDeviceStatus.setImageResource(R.drawable.device_available);
        }else {
            mImageViewDeviceStatus.setImageResource(R.drawable.device_not_available);
        }
    }

    protected void initCaptureTestView(View view){
        btn_helpGuide = (Button) view.findViewById(R.id.btnHelp);
        btn_ModeSwitch = (SwitchCompat) view.findViewById(R.id.btnManual);

        tv_due = (TextView) view.findViewById(R.id.tvDue);
        tv_ltRecorded = (TextView) view.findViewById(R.id.tvLastRecorded);
        tv_ltData = (TextView) view.findViewById(R.id.tvLastData);
        tv_BLConn = (TextView) view.findViewById(R.id.tv_connection);
        tv_deviceMode = (TextView) view.findViewById(R.id.tvChangeMode);
        tv_test = (TextView) view.findViewById(R.id.tv_test_header_name);
        iv_test = (ImageView) view.findViewById(R.id.iv_test_header);
        iv_bl_setting = (ImageView) view.findViewById(R.id.iv_BLSetting);
        llSwitchMode = (LinearLayout) view.findViewById(R.id.llSwitchMode);
        llLastData = (LinearLayout) view.findViewById(R.id.llLastdata);
    }

    protected void showConnectionSetting(View v){
        final BlConnectionSettingPopUp popupWindow = new BlConnectionSettingPopUp(getContext());
        popupWindow.show(v, 0, 0);
        //layout_MainMenu.getForeground().setAlpha(150);
        View container = (View) popupWindow.getContentView().getParent();
        WindowManager wm = (WindowManager) getContext().getSystemService(Context.WINDOW_SERVICE);
        //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.4f;
        wm.updateViewLayout(container, p);
    }



    protected void showProgressbarDataReading(boolean status,String device){
        //dialog = new Dialog(getContext());
        if(status){
            isRunning = true;
            HealthMonLog.i(TAG,"Progress Bar(true) status = "+status);
            showCapturingDataDialog(device);
          //  Toast.makeText(getContext(),"Device Running",Toast.LENGTH_SHORT).show();
           // mProgressDeviceReading.setVisibility(View.VISIBLE);
           // mBtnConnectDevice.setImageResource(R.drawable.ic_stop_white);
        }else {
            isRunning = false;
            HealthMonLog.i(TAG,"Progress Bar(false) status = "+status);
            dismissCapturingData();
          //  Toast.makeText(getContext(),"Device NOT Running",Toast.LENGTH_SHORT).show();
          //  mProgressDeviceReading.setVisibility(View.GONE);
          //  mBtnConnectDevice.setImageResource(R.drawable.ic_refresh_white_48dp);
        }
    }


    protected void showCapturingDataDialog(final String device){
        // Create custom dialog object
        if(dialog==null) {
            dialog = new Dialog(getContext());
            dialog.setCancelable(false);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(R.layout.all_patient_capturing_data);
            Button stop = (Button) dialog.findViewById(R.id.btnStop);
            stop.setVisibility(View.GONE);
            dialog.show();
/*            stop.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    dialog = null;
                    if(device.equals(Constants.ECG_DEVICE)){
                        updateDeviceRunning(Constants.ECG_DEVICE);

                    }else if(device.equals(Constants.BPM_DEVICE)){

                    }else if(device.equals(Constants.PULSE_OXI)){

                    }else if(device.equals(Constants.PULSE_OXI_GRAPH)){
*//*                        Intent pOxiWvFormBluetoothIntent = new Intent(getActivity(),
                                PulseOxiWvFormBluetoothService.class);
                        getActivity().stopService(pOxiWvFormBluetoothIntent);*//*
                    }

                }
            });*/
        }
    }

    protected void updateDeviceRunning(String str){
        deviceRunning = str;
    }

    public static String getDeviceRunning() {
        return deviceRunning;
    }

    protected void dismissCapturingData(){
        if(dialog !=null) {
            dialog.dismiss();
            dialog = null;
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
        showProgressbarDataReading(false,Constants.NO_DEVICE);
        Toast.makeText(getActivity(), "Connection lost", Toast.LENGTH_SHORT).show();
        HealthMonLog.i(TAG, "Connection Lost");
    }

    private void deviceConnected(){
        showProgressbarDataReading(true,Constants.NO_DEVICE);
        Toast.makeText(getActivity(), "Device Connected", Toast.LENGTH_SHORT).show();
        HealthMonLog.i(TAG, "Device Connected");
    }

    private void deviceConnecting(){
        showProgressbarDataReading(true,Constants.NO_DEVICE);
        HealthMonLog.i(TAG, "Device Connecting");
    }

    protected void disconnectDevice(){
        showProgressbarDataReading(false,Constants.NO_DEVICE);
    }

    protected void getDeviceAddress(HealthDevice device){

    }

    public void vitalCancelDialog(final Fragment fragment, final IndividualPatientOptionLoad individualPatientOptionLoad){
        final Dialog dialog = new Dialog(getContext());
        dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
        Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
        Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                return;
            }
        });
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                getActivity().getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                individualPatientOptionLoad.onCurrentFragmentDiscard(fragment.getTag());
            }
        });
        dialog.show();
    }

    public void vitalSaveDialog(final Fragment fragment, final IndividualPatientOptionLoad individualPatientOptionLoad){
        final Dialog dialog = new Dialog(getContext());
        dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
        Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
        Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                return;
            }
        });
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                getActivity().getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                individualPatientOptionLoad.onCurrentFragmentDiscard(fragment.getTag());
            }
        });
        dialog.show();
    }
    protected void saveOkClick(){}
    protected void saveCancelClick(){}

    @Override
    public void onDestroy() {
        super.onDestroy();

    }
}
