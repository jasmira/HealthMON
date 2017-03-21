package persistent.healthmon.viewcontroller;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.FeedbackAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.Feedback;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.HealthMonLog;
import persistent.healthmon.util.HealthMonUtility;

public class PatientFeedbackActivity extends AppCompatActivity implements View.OnClickListener {

    private static String TAG = PatientFeedbackActivity.class.getCanonicalName();

    private RecyclerView lstFeedback;
    private FeedbackAdapter feedbackadapter;
    private TextView tv_task,btn_view_all;
    private LinearLayout llFeddbackList;
    private Button btn_save,btn_cancel;
    private ImageView iv_task;
    private String value;
    private Boolean isValid = true;
    private Boolean isAnswered = true;
    private List<Feedback> mFeedbackList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_patient_feedback);
        Bundle bundle = getIntent().getExtras();
        value = bundle.getString(Constants.SELECTED_PATIENT_ID);
        initView();
    }

    private void initView() {
        tv_task = (TextView) findViewById(R.id.tv_task_header_name);
        iv_task = (ImageView) findViewById(R.id.iv_task_header);
        btn_view_all = (TextView) findViewById(R.id.btnTaskViewAll);
        btn_save = (Button) findViewById(R.id.btn_feedback_save);
        llFeddbackList = (LinearLayout) findViewById(R.id.llLstFeedback);
        btn_cancel = (Button) findViewById(R.id.btn_feedback_cancel);
        tv_task.setText(getString(R.string.txtFeedback));
        iv_task.setImageResource(R.drawable.ic_patientfeedback);
        btn_view_all.setVisibility(View.GONE);
        btn_save.setOnClickListener(this);
        btn_cancel.setOnClickListener(this);

        lstFeedback = (RecyclerView) findViewById(R.id.lstFeedbackQuestions);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this);
        lstFeedback.setLayoutManager(mLayoutManager);

        ArrayList<Feedback> dummyFeedback ;
        dummyFeedback = DatabaseHelper.getInstance(this).getAllFeedbackQuestions(Constants.DbConstants.FEEDBACK_SURVEY_TEMPLATE_ID);

        ArrayList<Feedback> databasefeedback;
        HealthMonLog.e(TAG,"Selected patient ID > "+value);
        databasefeedback = DatabaseHelper.getInstance(this).getFeedbackResults(value);

        if(dummyFeedback.isEmpty()) {
            Toast.makeText(PatientFeedbackActivity.this, "No feedback", Toast.LENGTH_SHORT).show();
        }else if (databasefeedback.isEmpty()) {
            Collections.sort(dummyFeedback);
            isAnswered = false;
            feedbackadapter = new FeedbackAdapter(dummyFeedback,false);
        }else{
            for(int i = 0; i< databasefeedback.size(); i++){
                for(int j = 0; j< dummyFeedback.size(); j++){
                    if(dummyFeedback.get(j).getSurvey_Questionair_id() == databasefeedback.get(i).getSurvey_Questionair_id()){
                        dummyFeedback.get(j).setAnswer(databasefeedback.get(i).getAnswer());
                    }

                }
            }
            isAnswered = true;

            Collections.sort(dummyFeedback);
            feedbackadapter = new FeedbackAdapter(dummyFeedback,true);
        }
        lstFeedback.setAdapter(feedbackadapter);
        if(isAnswered){
            btn_save.setVisibility(View.GONE);
            btn_cancel.setVisibility(View.GONE);
            llFeddbackList.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        }
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btn_feedback_save) {
            isValid = true;
            performSave();
        }
        if (v.getId() == R.id.btn_feedback_cancel) {

            final Dialog dialog = new Dialog(PatientFeedbackActivity.this);
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

                    Intent intent = new Intent(PatientFeedbackActivity.this, IndividualPatientActivity.class);
                    startActivity(intent);
                    dialog.dismiss();
                }
            });
            dialog.show();


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
                    Toast.makeText(PatientFeedbackActivity.this,""+feedback.getSurvey_Question_Description() ,Toast.LENGTH_SHORT).show();
                }
            }catch (Exception e){
                HealthMonLog.e(TAG,"In feedback answer catch");
                isValid = false;
                e.printStackTrace();
            }

        }
        if(isValid){
            final Dialog dialog = new Dialog(PatientFeedbackActivity.this);
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
                    DatabaseHelper.getInstance(PatientFeedbackActivity.this).addFeedbackResult(fbList);
                    WebserviceManager.insertPatientFeedbackResult(PatientFeedbackActivity.this, fbList);
                    Toast.makeText(PatientFeedbackActivity.this,getString(R.string.txtTaskBPDataInserted),Toast.LENGTH_SHORT).show();

                    Intent intent = new Intent(PatientFeedbackActivity.this, IndividualPatientActivity.class);
                    startActivity(intent);
                    //PatientFeedbackActivity.this.getSupportFragmentManager().beginTransaction().remove(AllPatientFeedbackFragment.this).commit();
                    //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientFeedbackFragment.this.getTag());
                }
            });
            dialog.show();
        }else{
            HealthMonUtility.showErrorDialog(PatientFeedbackActivity.this, getString(R.string.txtTaskBPDataNotValid));
        }
    }
}
