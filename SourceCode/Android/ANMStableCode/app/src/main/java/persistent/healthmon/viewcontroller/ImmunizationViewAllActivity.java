package persistent.healthmon.viewcontroller;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.ImmunizationsAdapter;
import persistent.healthmon.adapter.ImmunizationsViewAllAdapter;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.MyImmunizations;
import persistent.healthmon.util.Constants;


public class ImmunizationViewAllActivity extends AppCompatActivity {

    Toolbar toolbar;

    RecyclerView lstImmunization;
    String value;
    ArrayList<MyImmunizations> myImmunizations;
    ImmunizationsViewAllAdapter myImmunizationsAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_immunization_view_all);
        toolbar = (Toolbar) findViewById(R.id.toolbar_dashboard);
        Bundle bundle = getIntent().getExtras();
        value = bundle.getString(Constants.SELECTED_PATIENT_ID);
        myImmunizations = DatabaseHelper.getInstance(this).getImmunizations(value);

        lstImmunization = (RecyclerView) findViewById(R.id.lstImmunization1);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this);
        lstImmunization.setLayoutManager(mLayoutManager);
        myImmunizationsAdapter = new ImmunizationsViewAllAdapter(myImmunizations);
        lstImmunization.setAdapter(myImmunizationsAdapter);

        MyImmunizations myimmunizations = new MyImmunizations();

        myImmunizations.add(myimmunizations);
        myImmunizationsAdapter.notifyDataSetChanged();

    }


}
