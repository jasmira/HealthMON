package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.database.Cursor;
import android.nfc.Tag;
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
import com.persistent.healthmon.adapter.MyActivityAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 6/7/2016.
 */
public class AllPatientFeedbackFragment extends BaseFragment implements View.OnClickListener  {

    private static String TAG = AllPatientFeedbackFragment.class.getCanonicalName();

    RecyclerView lstFeedback;
    Feedbackadapter feedbackadapter;
    TextView tv_task,btn_view_all,btn_view_all2;
    LinearLayout llFeddbackList;
    Button btn_save,btn_cancel;
    ImageView iv_task;
    String value;
    Boolean isValid = true;
    Boolean isAnswered = true;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    ArrayList<Feedback> mFeedbackList;
    static int queNumber = -1;

    public AllPatientFeedbackFragment() {
    }

    public AllPatientFeedbackFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //ClassicBluetoothManager.getInstance().queryForPairedDevices();
        //ClassicBluetoothManager.getInstance().discoverDevices();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_feedback, container, false);


        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        initView(view);
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
        if (v.getId() == R.id.btn_feedback_save) {
            isValid = true;
            performSave();
        }
        if (v.getId() == R.id.btn_feedback_cancel) {
            vitalCancelDialog(AllPatientFeedbackFragment.this,individualPatientOptionLoad);
        }
    }

    //Might give blank toast
    private void performSave() {
        mFeedbackList = feedbackadapter.getFeedbackList();
        for(Feedback feedback : mFeedbackList){
            if(feedback.isHeader()){
                continue;
            }
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
                    for(Feedback feedback : mFeedbackList){
                        feedback.setPatient_id(value);
                        fbList.add(feedback);

                    }
                        DatabaseHelper.getInstance(getActivity()).addFeedbackResult(fbList);

                    Toast.makeText(getContext(),getString(R.string.txtTaskBPDataInserted),Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientFeedbackFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientFeedbackFragment.this.getTag());
                }
            });
            dialog.show();
        }else{
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
        }
    }


    private void initView(View view) {
        tv_task = (TextView) view.findViewById(R.id.tv_task_header_name);
        iv_task = (ImageView) view.findViewById(R.id.iv_task_header);
        btn_view_all = (TextView) view.findViewById(R.id.btnTaskViewAll);
        btn_view_all2 = (TextView) view.findViewById(R.id.btnTaskViewAll2);
        btn_save = (Button) view.findViewById(R.id.btn_feedback_save);
        llFeddbackList = (LinearLayout) view.findViewById(R.id.llLstFeedback);
        btn_cancel = (Button) view.findViewById(R.id.btn_feedback_cancel);
        tv_task.setText(getString(R.string.txtFeedback));
        iv_task.setImageResource(R.drawable.ic_feedback);
        btn_view_all.setVisibility(View.GONE);
        btn_view_all2.setVisibility(View.GONE);
        btn_save.setOnClickListener(this);
        btn_cancel.setOnClickListener(this);


        lstFeedback = (RecyclerView) view.findViewById(R.id.lstFeedbackQuestions);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstFeedback.setLayoutManager(mLayoutManager);
        //DatabaseHelper.getInstance(getActivity()).insertDummyFeedbackData();
        //Cursor feedBackCursor = DatabaseHelper.getInstance(getActivity()).getFeedbackQuestions();
        ArrayList<Feedback> dummyDBFeedback;// = new ArrayList<>();
        ArrayList<Feedback> dummyFeedback;// = new ArrayList<>();


        dummyDBFeedback = DatabaseHelper.getInstance(getActivity()).getAllFeedbackQuestions(Constants.DbConstants.FEEDBACK_SURVEY_TEMPLATE_ID);
        HealthMonLog.i(TAG, "Feedback Question list => " + dummyDBFeedback.toString());
        dummyFeedback = parseQuestionList(dummyDBFeedback);
        //Answerlist
        ArrayList<Feedback> databasefeedback = new ArrayList<>();
        //giving error as there are two seperate tables for results n questions
        HealthMonLog.i(TAG,"init view PatientID= "+value);
        databasefeedback = DatabaseHelper.getInstance(getActivity()).getFeedbackResults(value);
        HealthMonLog.i(TAG, "Feedback Answer list => " + databasefeedback.toString());


        if(dummyFeedback.isEmpty()) {
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtsyncDatafirst));
            getActivity().getSupportFragmentManager().beginTransaction().remove(this).commit();
            individualPatientOptionLoad.onCurrentFragmentDiscard(this.getTag());
        }else if (databasefeedback.isEmpty()) {
                Collections.sort(dummyFeedback);
                isAnswered = false;
                feedbackadapter = new Feedbackadapter(dummyFeedback,false);
            }else{
                // Collections.sort(databasefeedback);
                for(int i = 0; i< databasefeedback.size(); i++){
                    for(int j = 0; j< dummyFeedback.size(); j++){
                        if(dummyFeedback.get(j).getSurvey_Questionair_id() == databasefeedback.get(i).getSurvey_Questionair_id()){
                            dummyFeedback.get(j).setAnswer(databasefeedback.get(i).getAnswer());
                        }

                    }
                }
                isAnswered = true;
                HealthMonLog.i(TAG, "Feedback list => " + dummyFeedback.toString());
                Collections.sort(dummyFeedback);
                feedbackadapter = new Feedbackadapter(dummyFeedback,true);
            }
        lstFeedback.setAdapter(feedbackadapter);
        if(isAnswered){
            btn_save.setVisibility(View.GONE);
            btn_cancel.setVisibility(View.GONE);
            llFeddbackList.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        }
    }

    private ArrayList<Feedback> parseQuestionList(ArrayList<Feedback> mFeedback) {

        ArrayList<Feedback> mlstParseFeedback = new ArrayList<>();
        for(Feedback tempFeedback : mFeedback) {
            tempFeedback.setState(-1);
            HealthMonLog.i(TAG,"TempFeedback = "+tempFeedback);
            if(tempFeedback.getSurvey_template_id() == Constants.DbConstants.FEEDBACK_SURVEY_TEMPLATE_ID) {
                //Function might not work as per expection as we use .equalsIgnoreCase("null")
                //we are considering null value in database
                if (tempFeedback.getSurvey_Question_Description().equalsIgnoreCase("null")) {
                    tempFeedback.setHeader(true);
                    mlstParseFeedback.add(tempFeedback);
                } else if (tempFeedback.getSurvey_Question_no() != queNumber) {
                    queNumber = tempFeedback.getSurvey_Question_no();
                    tempFeedback.setHeader(false);
                    mlstParseFeedback.add(tempFeedback);
                }
            }
        }
        HealthMonLog.i(TAG,"Parsed Feedback list = "+mlstParseFeedback.toString());
        /*for(Feedback tempFeedback : mFeedback) {
            HealthMonLog.i(TAG,"TempFeedback = "+tempFeedback);
            if (!catName.equals(tempFeedback.getSurvey_Question_Category())) {
                //chck proper set with each object
                Feedback fback = new Feedback();
                fback.setHeader(true);
                fback.setSurvey_Question_Description(tempFeedback.getSurvey_Question_Category());
                catName = tempFeedback.getSurvey_Question_Category();
                mlstParseFeedback.add(fback);
                Feedback fback2 = tempFeedback;
                fback2.setHeader(false);
                mlstParseFeedback.add(fback2);

            }else {
                tempFeedback.setHeader(false);
                mlstParseFeedback.add(tempFeedback);
            }
        }*/
        return mlstParseFeedback;
    }

}
