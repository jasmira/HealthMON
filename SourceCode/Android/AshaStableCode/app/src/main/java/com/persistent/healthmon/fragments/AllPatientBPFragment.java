package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.placeholder.HelpGuidePopupWindow;
import com.persistent.healthmon.threads.BPMConnectionThread;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;
import com.vesag.bt.beans.BPMRealTimeData;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 5/12/2016.
 */
public class AllPatientBPFragment extends BaseFragment implements View.OnClickListener, OnResult {
    private static String TAG = AllPatientBPFragment.class.getCanonicalName();

    AllPatientTaskTabChange allPatientTaskTabChange;

    Button btnCaputre, btnSave, btnCancel;
    private BPMConnectionThread mBpmConnectionThread = null;

    private EditText edtSystolic, edtDiastolic, edtPulseRate;
    private Context mContext;
    String value;
    int systolic;
    int diastolic;
    int pulse;
    private static boolean isManual = false;
    IndividualPatientOptionLoad individualPatientOptionLoad;

    public AllPatientBPFragment() {
    }

    public AllPatientBPFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ClassicBluetoothManager.getInstance().queryForPairedDevices();
        ClassicBluetoothManager.getInstance().discoverDevices();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_bp, container, false);
        initView(view);

        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        ArrayList<PatientVitals> patientVitals = new ArrayList<>();
        patientVitals = DatabaseHelper.getInstance(getActivity()).getAllPatientBP(value);
        Collections.sort(patientVitals);
        HealthMonLog.i(TAG, "Sorted patient list => " + patientVitals.toString());
        if (patientVitals.size() > 0) {
            Date date = patientVitals.get(0).getHM_timestamp_in_DATE();
            if (date != null) {
                String strDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
                tv_ltRecorded.setText(strDate);
            }
            String strLastData = patientVitals.get(0).getHM_systolic() + "/" + patientVitals.get(0).getHM_diastolic();
            if (!strLastData.equals(null)) {
                tv_ltData.setText(strLastData);
            }
        }
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
                        individualPatientTaskFragment.setArguments(args);
                        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

                        //HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment, R.id.rlTabOptionContainer);;
                        //getFragmentManager().popBackStack();
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnHelp) {
            final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getContext());
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
        if (v.getId() == R.id.btn_bp_capture) {
            if (ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                //Discover other devices
                if (!isRunning)
                    startReadingBPMDevice();
                else
                    stopReading();
            } else {
                Toast.makeText(getContext(), "Bluetooth is Disabled", Toast.LENGTH_SHORT).show();
            }

        }
        if (v.getId() == R.id.btn_bp_save) {
            performSave();
        }
        if (v.getId() == R.id.btn_bp_cancel) {
            vitalCancelDialog(AllPatientBPFragment.this, individualPatientOptionLoad);
        }
        if (v.getId() == R.id.tv_connection) {
            showConnectionSetting(v);
        }
    }

    private void performSave() {
        final PatientVitals patientVitals = new PatientVitals();
        boolean valid = true;
        boolean isHighBP = false, isLowBP = false;
        String strsys = edtSystolic.getText().toString();
        String strdia = edtDiastolic.getText().toString();
        String strpulse = edtPulseRate.getText().toString();
        if (!strsys.matches("[0-9]*") || strsys.equals("")) {
            valid = false;
        } else if (!strdia.matches("[0-9]*") || strdia.equals("")) {
            valid = false;
        } else if (!strpulse.matches("[0-9]*") || strpulse.equals("")) {
            valid = false;
        } else {
            int sys = Integer.parseInt(String.valueOf(edtSystolic.getText()));
            int dia = Integer.parseInt(String.valueOf(edtDiastolic.getText()));
            int pul = Integer.parseInt(String.valueOf(edtPulseRate.getText()));
            if (sys < 10 || sys > 255 || dia < 10 || dia > 255 || pul < 10 || pul > 255) {
                valid = false;
            } else {
                if (sys > 140 && dia > 90) {
                    //Toast.makeText(getContext(),"High BP",Toast.LENGTH_SHORT).show();
                    isHighBP = true;
                } else if (sys < 100 && dia < 70) {
                    //Toast.makeText(getContext(),"Low BP",Toast.LENGTH_SHORT).show();
                    isLowBP = true;
                }
                patientVitals.setHM_systolic(sys);
                patientVitals.setHM_diastolic(dia);
                patientVitals.setHM_pulseRate(pul);
                patientVitals.setPatient_id(value);
                patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                patientVitals.setHM_timestamp_in_DATE(new Date());
                patientVitals.setHM_userId(PreferanceManager.getAshaId(getContext()));

                HealthMonLog.i(TAG, "Vitals BP  = " + patientVitals.toString());
            }

        }
        if (valid) {
            final Dialog dialog = new Dialog(getContext());
            dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
            Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
            Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
            TextView tvErrMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
            tvErrMsg.setText(getString(R.string.txtSaveData));
            btnCancel.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    return;
                }
            });
            final boolean finalIsHighBP = isHighBP;
            final boolean finalIsLowBP = isLowBP;
            btnOk.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int flagBp = Constants.PRIORITY_NORMAL_PATIENT;
                    int flagPulse = Constants.PRIORITY_NORMAL_PATIENT;
                    dialog.dismiss();
                    DatabaseHelper.getInstance(getActivity()).addPatientBP(patientVitals);
                    if (finalIsHighBP) {
                        flagBp = Constants.PRIORITY_HIGH_RISK_PATIENT;
                        referToDoc("1",getActivity().getResources().getString(R.string.txtPatientAutoReferHighBP));
                        //HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, getActivity().getResources().getString(R.string.txtPatientHightBp));
                        //Toast.makeText(getContext(),getString(R.string.txtPatientHightBp),Toast.LENGTH_SHORT).show();
                    } else if (finalIsLowBP) {
                        flagBp = Constants.PRIORITY_HIGH_RISK_PATIENT;
                        referToDoc("3",getActivity().getResources().getString(R.string.txtPatientAutoReferLowBP));
                        //HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, getActivity().getResources().getString(R.string.txtPatientLowBP));
                        //Toast.makeText(getContext(),getString(R.string.txtPatientLowBP),Toast.LENGTH_SHORT).show();
                    }
                    if (patientVitals.getHM_pulseRate() > 70 || patientVitals.getOxiPulse() < 60) {
                        flagPulse = Constants.PRIORITY_HIGH_RISK_PATIENT;
                    }
                    Toast.makeText(getContext(), getString(R.string.txtTaskBPDataInserted), Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientBPFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientBPFragment.this.getTag());
                    //setting severity flag
                    //for Systolic Bp
                    DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagBp, Constants.DbConstants.COLUMN_BP_FLAG, patientVitals.getHM_systolic(), Constants.DbConstants.COLUMN_BP_SYS_VALUE);
                    //for Diastolic Bp
                    DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagBp, Constants.DbConstants.COLUMN_BP_FLAG, patientVitals.getHM_diastolic(), Constants.DbConstants.COLUMN_BP_DIA_VALUE);
                    //Pulse
                    DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagPulse, Constants.DbConstants.COLUMN_BP_PULSE_FLAG, patientVitals.getHM_pulseRate(), Constants.DbConstants.COLUMN_BP_PULSE_VALUE);

                }
            });
            dialog.show();

            //HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataInserted));

            //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientBPFragment.this).commit();
            //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
        } else {
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
        }
    }

    private void referToDoc(String id, String msg) {
        Referal referal = new Referal();
        String refId = PreferanceManager.getAshaId(getActivity()) + "_ref_" + +HealthMonUtility.getReferalNoFromFile(getActivity());
        referal.setRefId(refId);
        referal.setUserId(PreferanceManager.getAshaId(getActivity()));
        referal.setPatientId(value);
        //PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(value);
        //referal.setPatientName(patientPersonalInfo.getFirstName()+" "+patientPersonalInfo.getMiddleName()+" "+patientPersonalInfo.getLastName());
        referal.setPHC_id("1");
        referal.setVillageId("1");
        referal.setReferalNotes(id);
        if(msg.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtPatientAutoReferLowBP))) {
            referal.setReferalReason("Low BP");
        }else {
            referal.setReferalReason("High BP");
        }
        referal.setRefDate(DateUtil.getCurrentTimeStamp());
        referal.setCreatedBy(PreferanceManager.getAshaId(getActivity()));
        referal.setCreatedDate(DateUtil.getCurrentTimeStamp());
        ArrayList<Referal> referals = new ArrayList<Referal>();
        referals.add(referal);
        //DB call
        DatabaseHelper.getInstance(getActivity()).insertReferal(referal);
        //web service call
        WebserviceManager.insertReferal(getActivity(), referals, this);
        HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, msg);
    }


    private void initView(View view) {

        //Base initializaion
        initCaptureTestView(view);
        btn_ModeSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (isChecked) {
                    edtSystolic.setEnabled(true);
                    edtDiastolic.setEnabled(true);
                    edtPulseRate.setEnabled(true);
                    tv_deviceMode.setText(getString(R.string.txtTaskManualMode));
                    tv_BLConn.setVisibility(View.GONE);
                    iv_bl_setting.setVisibility(View.GONE);
                    Toast.makeText(getContext(), getString(R.string.txtTaskManualMode), Toast.LENGTH_SHORT).show();
                    btnCaputre.setVisibility(View.GONE);
                } else {
                    edtSystolic.setEnabled(false);
                    edtDiastolic.setEnabled(false);
                    edtPulseRate.setEnabled(false);
                    edtSystolic.setText("");
                    edtDiastolic.setText("");
                    edtPulseRate.setText("");
                    tv_deviceMode.setText(getString(R.string.txtTaskDeviceMode));
                    tv_BLConn.setVisibility(View.VISIBLE);
                    iv_bl_setting.setVisibility(View.VISIBLE);
                    Toast.makeText(getContext(), getString(R.string.txtTaskDeviceMode), Toast.LENGTH_SHORT).show();
                    btnCaputre.setVisibility(View.VISIBLE);
                }
            }
        });
        btn_helpGuide.setOnClickListener(this);
        tv_BLConn.setOnClickListener(this);
        tv_test.setText(getString(R.string.txtBloodPressure));
        iv_test.setImageResource(R.drawable.ic_landing_bloodpressure);

        btnCaputre = (Button) view.findViewById(R.id.btn_bp_capture);
        btnCancel = (Button) view.findViewById(R.id.btn_bp_cancel);
        btnSave = (Button) view.findViewById(R.id.btn_bp_save);
        btnCaputre.setOnClickListener(this);
        btnSave.setOnClickListener(this);
        btnCancel.setOnClickListener(this);
        edtSystolic = (EditText) view.findViewById(R.id.edtBpSys);
        edtDiastolic = (EditText) view.findViewById(R.id.edBpDia);
        edtPulseRate = (EditText) view.findViewById(R.id.edtBpPulse);
        edtSystolic.setEnabled(false);
        edtDiastolic.setEnabled(false);
        edtPulseRate.setEnabled(false);
    }

    private void stopReading() {
        disconnectDevice();
        mBpmConnectionThread.cancel();
    }


    private void startReadingBPMDevice() {
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.BPM_DEVICE);
        if (address == null) {
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
        showProgressbarDataReading(true,Constants.BPM_DEVICE);
        mBpmConnectionThread.start();
    }

    private Handler mDataHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            try {
                Bundle bundle = msg.getData();
                if (bundle.containsKey("BPMRealTimeData")) {
                    BPMRealTimeData bpmData = null;
                    bpmData = (BPMRealTimeData) bundle.getSerializable("BPMRealTimeData");
                    if (bpmData != null) {
                        systolic = bpmData.getSystolic();
                        diastolic = bpmData.getDiastolic();
                        pulse = bpmData.getPulse();
                        // String dateTime = bpmData.getDateTime();

                        HealthMonLog.i(TAG, "Data: " + systolic + ", " + diastolic + ", " + pulse);

/*                        PatientVitals patientVitals = new PatientVitals();
                        patientVitals.setHM_systolic(systolic);
                        patientVitals.setHM_diastolic(diastolic);
                        patientVitals.setHM_pulseRate(pulse);
                        patientVitals.setHM_timestamp(dateTime);*/

                        //Might give error as ID is in string
                        //patientVitals.setPatient_id(value);
                        //boolean result = DatabaseHelper.getInstance(getActivity()).addPatientBP(patientVitals);

                        showProgressbarDataReading(false,Constants.BPM_DEVICE);
                        displayBpmReport(systolic, diastolic, pulse);
                    }
                }

                //showProgressbarDataReading(false);
                if (mBpmConnectionThread != null)
                    mBpmConnectionThread.cancel();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    };

    private void displayBpmReport(int systolic, int diastolic, int pulseRate) {


        //for text color
/*
        int normalColor = getResources().getColor(R.color.colorBlack);//ContextCompat.getColor(mContext, R.color.bp_normal);
        int prehypertension = getResources().getColor(R.color.bp_prehypertension);//ContextCompat.getColor(mContext, R.color.bp_prehypertension);
        int stage1Color = getResources().getColor(R.color.bp_hight_stage1);//ContextCompat.getColor(mContext, R.color.bp_hight_stage1);
        int stage2Color = getResources().getColor(R.color.bp_hight_stage2);//ContextCompat.getColor(mContext, R.color.bp_hight_stage2);
        int crisisColor = getResources().getColor(R.color.bp_crisis_emergency);//ContextCompat.getColor(mContext, R.color.bp_crisis_emergency);

        //Systolic reading
        int sys_color;
        if (systolic > 180)
            sys_color = crisisColor;
        else if (systolic >= 160)
            sys_color = stage2Color;
        else if (systolic >= 140)
            sys_color = stage1Color;
        else if (systolic >= 120)
            sys_color = prehypertension;
        else
            sys_color = normalColor;

        //Diastolic reading
        int dis_color;
        if (diastolic > 110)
            dis_color = crisisColor;
        else if (diastolic >= 100)
            dis_color = stage2Color;
        else if (diastolic >= 90)
            dis_color = stage1Color;
        else if (diastolic >= 80)
            dis_color = prehypertension;
        else
            dis_color = normalColor;

        //Pulse reading
        int pulse_color;
        if (pulseRate > 100)
            pulse_color = crisisColor;
        else
            pulse_color = normalColor;

        edtSystolic.setTextColor(sys_color);
        edtPulseRate.setTextColor(pulse_color);
        edtDiastolic.setTextColor(dis_color);*/

        edtSystolic.setText("" + systolic);
        edtDiastolic.setText("" + diastolic);
        edtPulseRate.setText("" + pulseRate);

        edtSystolic.setEnabled(false);
        edtDiastolic.setEnabled(false);
        edtPulseRate.setEnabled(false);
    }

    @Override
    public void onError(String message) {

    }

    @Override
    public void onResponse(String message) {

    }
}
