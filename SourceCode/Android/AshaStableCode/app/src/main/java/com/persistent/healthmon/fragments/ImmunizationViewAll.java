package com.persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SwitchCompat;
import android.view.Display;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TimePicker;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.ImmunizationsAdapter;
import com.persistent.healthmon.adapter.MyActivityAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.model.MyImmunizations;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.util.ArrayList;

/**
 * Created by harshal_patil on 6/17/2016.
 */
public class ImmunizationViewAll extends DialogFragment  {

    RecyclerView lstImmunization;
    String value;
    ArrayList<MyImmunizations> myImmunizations;
    ImmunizationsAdapter myImmunizationsAdapter;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_immunization_view_all, null);
        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);

        initView(view);

        return view;
    }

    private void initView(View view) {
        myImmunizations = DatabaseHelper.getInstance(getActivity()).getImmunizations(value);

        lstImmunization = (RecyclerView) view.findViewById(R.id.lstImmunization);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstImmunization.setLayoutManager(mLayoutManager);
        myImmunizationsAdapter = new ImmunizationsAdapter(myImmunizations);
        lstImmunization.setAdapter(myImmunizationsAdapter);

        MyImmunizations myimmunizations = new MyImmunizations();


        myImmunizations.add(myimmunizations);
        myImmunizationsAdapter.notifyDataSetChanged();
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        AllPatientImmunizationFragment allPatientImmunizationFragment = new AllPatientImmunizationFragment();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
                        allPatientImmunizationFragment.setArguments(args);
                        //HealthMonUtility.replaceFragment(getActivity(), allPatientImmunizationFragment);
                        HealthMonUtility.replaceFragment(getActivity(), allPatientImmunizationFragment, R.id.rlTabOptionContainer);

                        return true;
                    }

                }
                return false;
            }
        });
        //DB insertion
        //DatabaseHelper.getInstance(getActivity()).insertImmunization(myimmunizations);

        //web service call

    }

}