package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 6/2/2016.
 */
public class AllPatientHBFragment extends BaseFragment implements View.OnClickListener, OnResult {

    private static String TAG = AllPatientHBFragment.class.getCanonicalName();

    AllPatientTaskTabChange allPatientTaskTabChange;

    Button btnCaputre, btnSave, btnCancel;

    private EditText edtHb;
    private Context mContext;
    String value;
    int hb;
    IndividualPatientOptionLoad individualPatientOptionLoad;

    public AllPatientHBFragment() {
    }

    public AllPatientHBFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // ClassicBluetoothManager.getInstance().queryForPairedDevices();
        // ClassicBluetoothManager.getInstance().discoverDevices();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_hb, container, false);
        initView(view);

        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        ArrayList<PatientVitals> patientVitals = new ArrayList<>();
        patientVitals = DatabaseHelper.getInstance(getActivity()).getAllPatientHB(value);
        Collections.sort(patientVitals);
        HealthMonLog.i(TAG, "Sorted patient list => " + patientVitals.toString());
        for (PatientVitals patientVitals1 : patientVitals) {
            HealthMonLog.i(TAG, "Sorted patient => " + patientVitals1.toStringHB());
            HealthMonLog.i(TAG, "Sorted patient => " + patientVitals1.toString());
        }
        if (patientVitals.size() > 0) {
            Date date = patientVitals.get(0).getHM_timestamp_in_DATE();
            if (date != null) {
                String strDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
                tv_ltRecorded.setText(strDate);
            }
            String strLastData = String.valueOf(patientVitals.get(0).getHb());
            if (!strLastData.equals(null)) {
                tv_ltData.setText(strLastData);
            }
        }

/*        edtHb.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = edtHb.getText().toString();
                if(!strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 15 || Double.parseDouble(s.toString()) <=7) {
                        edtHb.setTextColor(getResources().getColor(R.color.colorred));
                    }else{
                        edtHb.setTextColor(getResources().getColor(R.color.colorBlack));
                    }
                }
            }
        });*/
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
            Toast.makeText(getContext(), getString(R.string.txtComingSoon), Toast.LENGTH_SHORT).show();
        }
        if (v.getId() == R.id.btn_hb_cancel) {
            vitalCancelDialog(AllPatientHBFragment.this, individualPatientOptionLoad);
        }
        if (v.getId() == R.id.tv_connection) {
            //showConnectionSetting(v);
            Toast.makeText(getContext(), getString(R.string.txtComingSoon), Toast.LENGTH_SHORT).show();
        }
        if (v.getId() == R.id.btn_hb_save) {
            performSave();
        }
        if (v.getId() == R.id.btn_hb_capture) {
            Toast.makeText(getContext(), getString(R.string.txtComingSoon), Toast.LENGTH_SHORT).show();
        }
    }

    private void performSave() {
        final PatientVitals patientVitals = new PatientVitals();
        boolean valid = true;
        String strsys = edtHb.getText().toString();
        if (!strsys.matches("[0-9.]*") || strsys.equals("")) {
            valid = false;
        } else {
            Double hb = Double.parseDouble(String.valueOf(edtHb.getText()));
            if (hb < 1 || hb > 25) {
                valid = false;
            } else {
                patientVitals.setHb(hb);
                patientVitals.setPatient_id(value);
                patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                patientVitals.setHM_timestamp_in_DATE(new Date());
                patientVitals.setHM_userId(PreferanceManager.getAshaId(getContext()));

                HealthMonLog.i(TAG, "Vitals HB  = " + patientVitals.toString());

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
            btnOk.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int flag = Constants.PRIORITY_NORMAL_PATIENT;
                    dialog.dismiss();
                    DatabaseHelper.getInstance(getActivity()).addPatientHB(patientVitals);
                    //logic for calculating flag
                    if (patientVitals.getHb() >= 11 && patientVitals.getHb() <= 15) {
                        flag = Constants.PRIORITY_NORMAL_PATIENT;
                    } else if (patientVitals.getHb() < 11 && patientVitals.getHb() >= 8) {
                        flag = Constants.PRIORITY_MODERATE_RISK_PATIENT;
                        referToDoc();
                    } else {
                        flag = Constants.PRIORITY_HIGH_RISK_PATIENT;
                        referToDoc();
                    }
                    DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flag, Constants.DbConstants.COLUMN_HB_FLAG, patientVitals.getHb(), Constants.DbConstants.COLUMN_HB_VALUE);
                    // DatabaseHelper.getInstance(getActivity()).updateOverallStatus(value);
                    Toast.makeText(getContext(), getString(R.string.txtTaskBPDataInserted), Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientHBFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientHBFragment.this.getTag());
                }
            });
            dialog.show();

            //DatabaseHelper.getInstance(getActivity()).addPatientHB(patientVitals);
            //HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataInserted));
            //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientHBFragment.this).commit();
            //onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
        } else {
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
        }
    }

    private void referToDoc() {
        Referal referal = new Referal();
        String refId = PreferanceManager.getAshaId(getActivity()) + "_ref_" + +HealthMonUtility.getReferalNoFromFile(getActivity());
        referal.setRefId(refId);
        referal.setUserId(PreferanceManager.getAshaId(getActivity()));
        referal.setPatientId(value);
        //PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(value);
        //referal.setPatientName(patientPersonalInfo.getFirstName()+" "+patientPersonalInfo.getMiddleName()+" "+patientPersonalInfo.getLastName());
        referal.setPHC_id("1");
        referal.setVillageId("1");
        referal.setReferalNotes("2");
        referal.setReferalReason("Low HB");
        referal.setRefDate(DateUtil.getCurrentTimeStamp());
        referal.setCreatedBy(PreferanceManager.getAshaId(getActivity()));
        referal.setCreatedDate(DateUtil.getCurrentTimeStamp());
        ArrayList<Referal> referals = new ArrayList<Referal>();
        referals.add(referal);
        //DB call
        DatabaseHelper.getInstance(getActivity()).insertReferal(referal);
        //web service call
        WebserviceManager.insertReferal(getActivity(), referals, this);
        HealthMonUtility.showPatientRiskDialog(getActivity(), R.drawable.ic_smiley_red, getActivity().getResources().getString(R.string.txtPatientAutoReferHB));
    }

    public void initView(View view) {
        //Base initializaion
        initCaptureTestView(view);
        btn_ModeSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (isChecked) {
                    edtHb.setEnabled(true);
                    tv_deviceMode.setText(getString(R.string.txtTaskManualMode));
                    Toast.makeText(getContext(), getString(R.string.txtTaskManualMode), Toast.LENGTH_SHORT).show();
                    btnCaputre.setVisibility(View.GONE);
                    tv_BLConn.setVisibility(View.GONE);
                    iv_bl_setting.setVisibility(View.GONE);
                } else {
                    edtHb.setEnabled(false);
                    edtHb.setText("");
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
        tv_test.setText(getString(R.string.txtHaemoglobin));
        iv_test.setImageResource(R.drawable.ic_landing_haemoglobin);

        btnCaputre = (Button) view.findViewById(R.id.btn_hb_capture);
        btnCancel = (Button) view.findViewById(R.id.btn_hb_cancel);
        btnSave = (Button) view.findViewById(R.id.btn_hb_save);
        btnCaputre.setOnClickListener(this);
        btnSave.setOnClickListener(this);
        btnCancel.setOnClickListener(this);
        edtHb = (EditText) view.findViewById(R.id.edthbSys);
        edtHb.setEnabled(false);
    }

    @Override
    public void onError(String message) {

    }

    @Override
    public void onResponse(String message) {
        HealthMonLog.i(TAG,"Response AutoRefer: "+message);
       // showReferSuccessfulDialog();

    }

}
