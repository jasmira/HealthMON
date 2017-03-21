package persistent.healthmon.viewcontroller;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.navdrawer.SimpleSideDrawer;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.MyImmunizations;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.PatientStatus;
import persistent.healthmon.model.ReferalAppoinment;
import persistent.healthmon.model.UserMO;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.PreferanceManager;


public class IndividualPatientActivity extends AppCompatActivity {

    Toolbar toolbar;
    LinearLayout llReffredContainer;
    String selectedPatientId = "";
    PatientPersonalInfo patientPersonalInfo;
    PatientStatus status;
    ArrayList<MyImmunizations> myImmunizations;
    //patient card view
    TextView txtPriority, txtPatientName, txtPID, txtContactVal;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_individual_patient);
        SimpleSideDrawer slide_me;
        toolbar = (Toolbar) findViewById(R.id.toolbar_dashboard);
        //WebserviceManager.getCarePlan(this, "asha141");
        Bundle b = getIntent().getExtras();
        if (b != null)
            selectedPatientId = b.getString(Constants.SELECTED_PATIENT_ID);

        patientPersonalInfo = DatabaseHelper.getInstance(this).getPatient(selectedPatientId);
        status = DatabaseHelper.getInstance(this).getPatientStatus(selectedPatientId);
        myImmunizations = DatabaseHelper.getInstance(this).getImmunizations(selectedPatientId);
        initView();
    }


    private void initView() {
        txtPriority = (TextView) findViewById(R.id.txtPriority);
        txtPatientName = (TextView) findViewById(R.id.txtPatientName);
        txtPID = (TextView) findViewById(R.id.txtPID);
        txtContactVal = (TextView) findViewById(R.id.txtContactVal);
        llReffredContainer = (LinearLayout) findViewById(R.id.llReffredContainer);
        switch (status.getOverallFlag()) {
            case Constants.PRIORITY_HIGH_RISK_PATIENT:
                txtPriority.setBackgroundColor(this.getResources().getColor(R.color.colorred));
                break;
            case Constants.PRIORITY_MODERATE_RISK_PATIENT:
                txtPriority.setBackgroundColor(this.getResources().getColor(R.color.coloryellow));
                break;
            case Constants.PRIORITY_NORMAL_PATIENT:
                txtPriority.setBackgroundColor(this.getResources().getColor(R.color.colorGreenButtonDark));
                break;
            default:
                txtPriority.setBackgroundColor(this.getResources().getColor(R.color.colorGreenButtonDark));
                break;
        }

        txtPatientName.setText(patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getLastName());
        txtContactVal.setText(patientPersonalInfo.getContact());
        txtPID.setText(patientPersonalInfo.getPatient_id());

        llReffredContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TextView txtDate, txtRefereedBy, txLocation, txtReason, txtComments;
                Button btnOk;

                final Dialog dialog = new Dialog(IndividualPatientActivity.this);
                dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog.setContentView(R.layout.dialog_reffred);
                txtDate = (TextView) dialog.findViewById(R.id.txtDate);
                txtRefereedBy = (TextView) dialog.findViewById(R.id.txtRefereedBy);
                txLocation = (TextView) dialog.findViewById(R.id.txLocation);
                txtReason = (TextView) dialog.findViewById(R.id.txtReason);
                txtComments = (TextView) dialog.findViewById(R.id.txtComments);
                btnOk = (Button) dialog.findViewById(R.id.btnOk);
                btnOk.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                        dialog.dismiss();


                    }
                });
                dialog.show();

            }
        });
        //HealthMonUtility.replaceFragment(IndividualPatientActivity.this, new TasksFragment());
        /*llDashboard = (LinearLayout) findViewById(R.id.llDashboard);
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
        imgInventory = (ImageView) findViewById(R.id.imgInventory);*/

    }
}
