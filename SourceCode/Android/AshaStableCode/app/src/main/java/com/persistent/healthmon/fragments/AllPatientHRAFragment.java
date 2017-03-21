package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.Feedbackadapter;
import com.persistent.healthmon.adapter.HRAAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 6/8/2016.
 */
public class AllPatientHRAFragment  extends BaseFragment implements View.OnClickListener  {

    private static String TAG = AllPatientHRAFragment.class.getCanonicalName();

    RecyclerView lstHRA;
    HRAAdapter hraAdapter;
    TextView tv_due,tv_last_record;
    Button btn_save,btn_cancel;
    ImageView iv_task;
    String value;
    Boolean isValid = true;
    Boolean isAnswered = true;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    ArrayList<Feedback> mhralist = new ArrayList<>();

    public AllPatientHRAFragment() {
    }

    public AllPatientHRAFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_hra, container, false);
        initView(view);

        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
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

        ArrayList<Feedback> dbHRAlst = new ArrayList<>();
        dbHRAlst = DatabaseHelper.getInstance(getActivity()).getHRAResults(value);
        Collections.sort(dbHRAlst, Feedback.hraDATE);
        HealthMonLog.i(TAG, "Sorted hra list => " + dbHRAlst.toString());
        for (Feedback patientVitals1 : dbHRAlst) {
            HealthMonLog.i(TAG, "Sorted patient => " + patientVitals1.toString());
        }
        if (dbHRAlst.size() > 0) {
            String strDate = dbHRAlst.get(0).getTimeStampInString();
            try {
                Date date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                String strFinalDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
                tv_last_record.setText(strFinalDate);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return view;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btn_hra_save) {
            isValid = true;
            performSave();
        }
        if (v.getId() == R.id.btn_hra_cancel) {
            vitalCancelDialog(AllPatientHRAFragment.this,individualPatientOptionLoad);
        }
    }

    //Might give blank toast
    private void performSave() {
        mhralist = hraAdapter.getFeedbackList();
        for(Feedback feedback : mhralist){
            try {
                if(feedback.getAnswer().isEmpty()){
                    Toast.makeText(getContext(),""+feedback.getSurvey_Question_Description() ,Toast.LENGTH_SHORT).show();
                }
            }catch (Exception e){
                HealthMonLog.e(TAG,"In feedback answer catch");
                isValid = false;
                e.printStackTrace();
            }

        }
        if(isValid){
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
                    dialog.dismiss();
                    ArrayList<Feedback> fbList = new ArrayList<Feedback>();
                    for(Feedback feedback : mhralist){
                        feedback.setPatient_id(value);
                        fbList.add(feedback);

                    }
                    DatabaseHelper.getInstance(getActivity()).addHRAResult(fbList);

                    Toast.makeText(getContext(),getString(R.string.txtTaskBPDataInserted),Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientHRAFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientHRAFragment.this.getTag());
                }
            });
            dialog.show();
        }else{
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
        }
    }

    private void initView(View view) {
        lstHRA = (RecyclerView) view.findViewById(R.id.lstHRAQuestion);
        btn_save = (Button) view.findViewById(R.id.btn_hra_save);
        btn_cancel = (Button) view.findViewById(R.id.btn_hra_cancel);
        tv_due = (TextView) view.findViewById(R.id.tvDueHra);
        tv_last_record = (TextView) view.findViewById(R.id.tvLastRecordedHra);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstHRA.setLayoutManager(mLayoutManager);
        ArrayList<Feedback> hraDatabaseLst;// = new ArrayList<>();


        hraDatabaseLst = DatabaseHelper.getInstance(getActivity()).getAllFeedbackQuestions(Constants.DbConstants.HRA_SURVEY_TEMPLATE_ID);
        HealthMonLog.i(TAG,"HRA data => "+hraDatabaseLst.toString());
        hraAdapter = new HRAAdapter(hraDatabaseLst,true);
/*        if(hraDatabaseLst.isEmpty()) {
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtsyncDatafirst));
            getActivity().getSupportFragmentManager().beginTransaction().remove(this).commit();
            individualPatientOptionLoad.onCurrentFragmentDiscard(this.getTag());
        }*/
        lstHRA.setAdapter(hraAdapter);

        btn_save.setOnClickListener(this);
        btn_cancel.setOnClickListener(this);
    }

}
