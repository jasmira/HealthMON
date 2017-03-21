package persistent.healthmon.viewcontroller;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import persistent.healthmon.R;
import persistent.healthmon.adapter.HRAAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.fragments.CreateCarePlanFragment;
import persistent.healthmon.model.Feedback;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.HealthMonLog;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.viewcontroller.CarePlanActivity;

/**
 * Created by pushkar_bhadle on 7/26/2016.
 */
public class TasksHRAFragment extends AppCompatActivity implements View.OnClickListener {

    private static String TAG = TasksHRAFragment.class.getCanonicalName();

    private Button btnHRASave;
    private View view;

    private ImageView imageToolbar;
    private TextView txtToolbarTitle,txtToolbarStatus,txtLastRecorded;
    RecyclerView lstHRA;
    HRAAdapter hraAdapter;
    Boolean isValid = true;
    String value;
    ArrayList<Feedback> mhralist = new ArrayList<>();


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fragment_task_hra);
      //  view =  inflater.inflate(R.layout.fragment_task_hra, container,false);

        Bundle bundle = getIntent().getExtras();
        value = bundle.getString(Constants.SELECTED_PATIENT_ID);
        btnHRASave = (Button) findViewById(R.id.btn_hra_save);
        btnHRASave.setOnClickListener(this);
        imageToolbar = (ImageView) findViewById(R.id.imgImmunization);
        txtToolbarTitle = (TextView) findViewById(R.id.txtImmunization);
        txtToolbarStatus = (TextView) findViewById(R.id.textViewStatus);
        txtLastRecorded = (TextView) findViewById(R.id.tvLastRecordedHra);
        lstHRA = (RecyclerView) findViewById(R.id.lstHRAQuestion);


        ArrayList<Feedback> dbHRAlst = new ArrayList<>();
        dbHRAlst = DatabaseHelper.getInstance(TasksHRAFragment.this).getHRAResults(value);
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
                txtLastRecorded.setText(strFinalDate);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(TasksHRAFragment.this);
        lstHRA.setLayoutManager(mLayoutManager);

        ArrayList<Feedback> hraDatabaseLst;// = new ArrayList<>();


        hraDatabaseLst = DatabaseHelper.getInstance(TasksHRAFragment.this).getAllFeedbackQuestions(Constants.DbConstants.HRA_SURVEY_TEMPLATE_ID);
        HealthMonLog.i(TAG,"HRA data => "+hraDatabaseLst.toString());
        hraAdapter = new HRAAdapter(hraDatabaseLst,true);
        lstHRA.setAdapter(hraAdapter);

        txtToolbarTitle.setText(R.string.txtHRA);
        imageToolbar.setImageResource(R.drawable.ic_hra);

        txtToolbarStatus.setVisibility(View.GONE);
        //return view;
    }

    @Override
    public void onClick(View v) {
        if(v.getId() == R.id.btn_hra_save){
            performSave();
        }
    }

    //Might give blank toast
    private void performSave() {
        mhralist = hraAdapter.getFeedbackList();
        for(Feedback feedback : mhralist){
            try {
                if(feedback.getAnswer().isEmpty()){
                    Toast.makeText(TasksHRAFragment.this,""+feedback.getSurvey_Question_Description() ,Toast.LENGTH_SHORT).show();
                }
            }catch (Exception e){
                HealthMonLog.e(TAG,"In feedback answer catch");
                isValid = false;
                e.printStackTrace();
            }

        }
        if(isValid){
            final Dialog dialog = new Dialog(TasksHRAFragment.this);
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
                    DatabaseHelper.getInstance(TasksHRAFragment.this).addHRAResult(fbList);
                    WebserviceManager.insertPatientFeedbackResult(TasksHRAFragment.this, fbList);
                    Toast.makeText(TasksHRAFragment.this,getString(R.string.txtTaskBPDataInserted),Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(TasksHRAFragment.this, IndividualPatientActivity.class);
                    startActivity(intent);
                    //TasksHRAFragment.this.getSupportFragmentManager().beginTransaction().remove(AllPatientHRAFragment.this).commit();
                    //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientHRAFragment.this.getTag());
                }
            });
            dialog.show();
        }else{
            HealthMonUtility.showErrorDialog(TasksHRAFragment.this, getString(R.string.txtTaskBPDataNotValid));
        }
    }

}
