package persistent.healthmon.viewcontroller;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.navdrawer.SimpleSideDrawer;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.fragments.AllPatientFragment;
import persistent.healthmon.fragments.DashboardFragment;
import persistent.healthmon.fragments.PatientRegistrationFragment;
import persistent.healthmon.model.Feedback;
import persistent.healthmon.util.HealthMonUtility;


public class LandingScreenActivity extends AppCompatActivity {

    Toolbar toolbar;
    LinearLayout llDashboard, llPatientRegistration, llAllPatient, llReports, llEducation, llCollaboration, llMyActivities, llInventory;
    TextView txtDashboard, txtRegistration, txtAllPatient, txtReports, txtEducation, txtCollaboration, txtMyActivities, txtInventory;
    ImageView imgDashboard, imgPatientRegistration, imgAllPatient, imgReports, imgEducation, imgCollaboration, imgMyActivities, imgInventory;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_landing_screen);
        SimpleSideDrawer slide_me;
        toolbar = (Toolbar) findViewById(R.id.toolbar_dashboard);
        initView();
        //todo remove this and paste into sync data
        //FEEDBACK get question call
        WebserviceManager.getFeedbackQuestions(this);
        WebserviceManager.getHRAQuestions(this);
        /*
        //Insert Feedback ans call
        ArrayList<Feedback> feedbacksRslt = new ArrayList<>();
        feedbacksRslt = DatabaseHelper.getInstance(this).getFeedbackResults("-1");
        WebserviceManager.insertPatientFeedbackResult(this, feedbacksRslt);*/
    }

    private void initView() {
        HealthMonUtility.replaceFragment(LandingScreenActivity.this, new DashboardFragment());
        llDashboard = (LinearLayout) findViewById(R.id.llDashboard);
        llPatientRegistration = (LinearLayout) findViewById(R.id.llPatientRegistration);
        llAllPatient = (LinearLayout) findViewById(R.id.llAllPatient);
        llReports = (LinearLayout) findViewById(R.id.llReports);
        llEducation = (LinearLayout) findViewById(R.id.llEducation);
        llCollaboration = (LinearLayout) findViewById(R.id.llCollaboration);
        llMyActivities = (LinearLayout) findViewById(R.id.llMyActivities);
        llInventory = (LinearLayout) findViewById(R.id.llInventory);

        txtDashboard = (TextView) findViewById(R.id.txtDashboard);
        txtRegistration = (TextView) findViewById(R.id.txtRegistration);
        txtAllPatient = (TextView) findViewById(R.id.txtAllPatient);
        txtReports = (TextView) findViewById(R.id.txtReports);
        txtEducation = (TextView) findViewById(R.id.txtEducation);
        txtCollaboration = (TextView) findViewById(R.id.txtCollaboration);
        txtMyActivities = (TextView) findViewById(R.id.txtMyActivities);
        txtInventory = (TextView) findViewById(R.id.txtInventory);

        imgDashboard = (ImageView) findViewById(R.id.imgDashboard);
        imgPatientRegistration = (ImageView) findViewById(R.id.imgPatientRegistration);
        imgAllPatient = (ImageView) findViewById(R.id.imgAllPatient);
        imgReports = (ImageView) findViewById(R.id.imgReports);
        imgEducation = (ImageView) findViewById(R.id.imgEducation);
        imgCollaboration = (ImageView) findViewById(R.id.imgCollaboration);
        imgMyActivities = (ImageView) findViewById(R.id.imgMyActivities);
        imgInventory = (ImageView) findViewById(R.id.imgInventory);

        llDashboard.setOnClickListener(panelClickListener);
        llPatientRegistration.setOnClickListener(panelClickListener);
        llAllPatient.setOnClickListener(panelClickListener);
        llReports.setOnClickListener(panelClickListener);
        llEducation.setOnClickListener(panelClickListener);
        llCollaboration.setOnClickListener(panelClickListener);
        llMyActivities.setOnClickListener(panelClickListener);
        llInventory.setOnClickListener(panelClickListener);
    }

    View.OnClickListener panelClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            llDashboard.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llPatientRegistration.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llAllPatient.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llReports.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llEducation.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llCollaboration.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llMyActivities.setBackgroundColor(getResources().getColor(R.color.colorBlue));
            llInventory.setBackgroundColor(getResources().getColor(R.color.colorBlue));

            txtDashboard.setTextColor(getResources().getColor(R.color.colorWhite));
            txtRegistration.setTextColor(getResources().getColor(R.color.colorWhite));
            txtAllPatient.setTextColor(getResources().getColor(R.color.colorWhite));
            txtReports.setTextColor(getResources().getColor(R.color.colorWhite));
            txtEducation.setTextColor(getResources().getColor(R.color.colorWhite));
            txtCollaboration.setTextColor(getResources().getColor(R.color.colorWhite));
            txtMyActivities.setTextColor(getResources().getColor(R.color.colorWhite));
            txtInventory.setTextColor(getResources().getColor(R.color.colorWhite));

            imgDashboard.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_dashboard_normal));
            imgPatientRegistration.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_register_patient_normal));
            imgAllPatient.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_all_patients_normal));
            imgReports.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_reports_normal));
            imgEducation.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_education_normal));
            imgCollaboration.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_collaboration_normal));
            imgMyActivities.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_my_activities_normal));
            imgInventory.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_inventory_normal));

            if (v.getId() == R.id.llDashboard) {
                llDashboard.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtDashboard.setTextColor(getResources().getColor(R.color.colorBlue));
                imgDashboard.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_dashboard_active));
                HealthMonUtility.replaceFragment(LandingScreenActivity.this, new DashboardFragment());
            }
            if (v.getId() == R.id.llPatientRegistration) {
                llPatientRegistration.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtRegistration.setTextColor(getResources().getColor(R.color.colorBlue));
                imgPatientRegistration.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_register_patient_active));
                HealthMonUtility.replaceFragment(LandingScreenActivity.this, new PatientRegistrationFragment());
            }
            if (v.getId() == R.id.llAllPatient) {
                llAllPatient.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtAllPatient.setTextColor(getResources().getColor(R.color.colorBlue));
                imgAllPatient.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_all_patients_active));
                HealthMonUtility.replaceFragment(LandingScreenActivity.this, new AllPatientFragment());
            }
            if (v.getId() == R.id.llReports) {
                llReports.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtReports.setTextColor(getResources().getColor(R.color.colorBlue));
                imgReports.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_reports_active));
            }
            if (v.getId() == R.id.llEducation) {
                llEducation.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtEducation.setTextColor(getResources().getColor(R.color.colorBlue));
                imgEducation.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_education_active));
            }
            if (v.getId() == R.id.llCollaboration) {
                llCollaboration.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtCollaboration.setTextColor(getResources().getColor(R.color.colorBlue));
                imgCollaboration.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_collaboration_active));
            }
            if (v.getId() == R.id.llMyActivities) {
                llMyActivities.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtMyActivities.setTextColor(getResources().getColor(R.color.colorBlue));
                imgMyActivities.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_my_activities_active));
            }
            if (v.getId() == R.id.llInventory) {
                llInventory.setBackgroundColor(getResources().getColor(R.color.colorWhite));
                txtInventory.setTextColor(getResources().getColor(R.color.colorBlue));
                imgInventory.setImageDrawable(getResources().getDrawable(R.drawable.ic_menu_inventory_active));
            }
        }
    };
}
