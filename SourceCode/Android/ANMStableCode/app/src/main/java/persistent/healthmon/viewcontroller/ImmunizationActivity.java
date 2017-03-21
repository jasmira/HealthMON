package persistent.healthmon.viewcontroller;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.ImmunizationsAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.OnAdapterNotify;
import persistent.healthmon.model.MyImmunizations;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.PreferanceManager;


public class ImmunizationActivity extends AppCompatActivity implements  View.OnClickListener, OnAdapterNotify {

    Toolbar toolbar;

    RecyclerView lstImmunization;
    String value;
    ArrayList<MyImmunizations> myImmunizations;
    ImmunizationsAdapter myImmunizationsAdapter;
    TextView btn_view_all;
    ImageView btnBack;
    PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_immunization);
        toolbar = (Toolbar) findViewById(R.id.toolbar_dashboard);
        Bundle bundle = getIntent().getExtras();
        value = bundle.getString(Constants.SELECTED_PATIENT_ID);
        Bundle b = getIntent().getExtras();
 /*     if (b != null)
        {
            String selectedPatientId = b.getString(Constants.SELECTED_PATIENT_ID);
            Log.d("Selected Patient ",selectedPatientId);
            myImmunizations = DatabaseHelper.getInstance(this).getImmunizations(selectedPatientId);
        }*/
        myImmunizations = DatabaseHelper.getInstance(this).getImmunizations(value);
        lstImmunization = (RecyclerView) findViewById(R.id.lstImmunization);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this);
        lstImmunization.setLayoutManager(mLayoutManager);
        myImmunizationsAdapter = new ImmunizationsAdapter(myImmunizations, this);
        lstImmunization.setAdapter(myImmunizationsAdapter);

        MyImmunizations myimmunizations = new MyImmunizations();
        myImmunizations.add(myimmunizations);
        myImmunizationsAdapter.notifyDataSetChanged();
        btn_view_all = (TextView) findViewById(R.id.btnViewAll);
        btn_view_all.setOnClickListener(this);
        btnBack = (ImageView) findViewById(R.id.imgLeft);
        btnBack.setOnClickListener(this);

    }
    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnViewAll) {
            Intent intent = new Intent(getApplicationContext(), ImmunizationViewAllActivity.class);
            intent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",this));
            startActivity(intent);        }
        if (v.getId() == R.id.imgLeft) {
            Intent intent = new Intent(getApplicationContext(), IndividualPatientActivity.class);
            startActivity(intent);
        }
    }
    @Override
    public void onNotify() {
        if (myImmunizations.size() == 0) {
            //lblNoData.setVisibility(View.VISIBLE);
        } else {

            //lblNoData.setVisibility(View.GONE);
        }
    }

}
