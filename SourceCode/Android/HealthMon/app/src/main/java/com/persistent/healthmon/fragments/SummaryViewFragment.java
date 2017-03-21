package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.FamilyInfoAdapterSummary;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.model.PatientFamilyInfo;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonUtility;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 5/16/2016.
 */
public class SummaryViewFragment extends BaseFragment implements View.OnClickListener {

    View view, optionView;
    TextView txtDemographics, txtFamilyInfo, txtEligibility, txtVitals, txtAllergies, txtDiagnosis, txtMedications, txtImunizations, txtCarePlan, txtProcedures, txtHRA, txtTests;
    RelativeLayout rlTabOptionLayoutContainer;
    String selectedPatientId;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_summary_view, container, false);
        selectedPatientId = getArguments().getString(Constants.SELECTED_PATIENT_ID);
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
                        args.putString(Constants.SELECTED_PATIENT_ID, selectedPatientId);
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

    private void initView(View view) {
        rlTabOptionLayoutContainer = (RelativeLayout) view.findViewById(R.id.rlTabOptionLayoutContainer);
        txtDemographics = (TextView) view.findViewById(R.id.txtDemographics);
        txtFamilyInfo = (TextView) view.findViewById(R.id.txtFamilyInfo);
        txtEligibility = (TextView) view.findViewById(R.id.txtEligibility);
        txtVitals = (TextView) view.findViewById(R.id.txtVitals);
        txtAllergies = (TextView) view.findViewById(R.id.txtAllergies);
        txtDiagnosis = (TextView) view.findViewById(R.id.txtDiagnosis);
        txtMedications = (TextView) view.findViewById(R.id.txtMedications);
        txtImunizations = (TextView) view.findViewById(R.id.txtImunizations);
        txtCarePlan = (TextView) view.findViewById(R.id.txtCarePlan);
        txtProcedures = (TextView) view.findViewById(R.id.txtProcedures);
        txtHRA = (TextView) view.findViewById(R.id.txtHRA);
        txtTests = (TextView) view.findViewById(R.id.txtTests);
        txtDemographics.setOnClickListener(this);
        txtFamilyInfo.setOnClickListener(this);
        txtEligibility.setOnClickListener(this);
        txtVitals.setOnClickListener(this);
        txtAllergies.setOnClickListener(this);
        txtDiagnosis.setOnClickListener(this);
        txtMedications.setOnClickListener(this);
        txtImunizations.setOnClickListener(this);
        txtCarePlan.setOnClickListener(this);
        txtProcedures.setOnClickListener(this);
        txtHRA.setOnClickListener(this);
        txtTests.setOnClickListener(this);

        //loading Demographics as first fragment
        setDemographics();
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.txtDemographics) {
            setDemographics();
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));

        }
        if (v.getId() == R.id.txtFamilyInfo) {
            setFamilyInfo();
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtEligibility) {
            setEligibility();
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtVitals) {
            setVitals();
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtAllergies) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtDiagnosis) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtMedications) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtImunizations) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtCarePlan) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtProcedures) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtHRA) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
        }
        if (v.getId() == R.id.txtTests) {
            txtDemographics.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDemographics.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtEligibility.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtEligibility.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtVitals.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtVitals.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtAllergies.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtAllergies.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtDiagnosis.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtDiagnosis.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtMedications.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtMedications.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtImunizations.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtImunizations.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtCarePlan.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtCarePlan.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtProcedures.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtProcedures.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtHRA.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
            txtHRA.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setTextColor(getActivity().getResources().getColor(R.color.colorBlue));
            txtTests.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
        }
    }


    private void setDemographics() {
        // Basic info txt
        TextView valSalutation, valFullName, valAgeGender, valDateOfBirth, valPlaceOfBirth, valMaritalStatus, valCategory, valBPL, valLanguage, valEducation, valCardType, valCardNumber, valEmergencyContact, valContact;
        //Address info txt
        TextView valAddressLine1, valAddressLine2, valDistrict, valTaluka, valVillage, valWard, valPincode;

        optionView = getActivity().getLayoutInflater().inflate(R.layout.item_demographics, rlTabOptionLayoutContainer, false);
        valSalutation = (TextView) optionView.findViewById(R.id.valSalutation);
        valFullName = (TextView) optionView.findViewById(R.id.valFullName);
        valAgeGender = (TextView) optionView.findViewById(R.id.valAgeGender);
        valDateOfBirth = (TextView) optionView.findViewById(R.id.valDateOfBirth);
        valPlaceOfBirth = (TextView) optionView.findViewById(R.id.valPlaceOfBirth);
        valMaritalStatus = (TextView) optionView.findViewById(R.id.valMaritalStatus);
        valCategory = (TextView) optionView.findViewById(R.id.valCategory);
        valBPL = (TextView) optionView.findViewById(R.id.valBPL);
        valLanguage = (TextView) optionView.findViewById(R.id.valLanguage);
        valEducation = (TextView) optionView.findViewById(R.id.valEducation);
        valCardType = (TextView) optionView.findViewById(R.id.valCardType);
        valCardNumber = (TextView) optionView.findViewById(R.id.valCardNumber);
        valEmergencyContact = (TextView) optionView.findViewById(R.id.valEmergencyContact);
        valContact = (TextView) optionView.findViewById(R.id.valContact);
        valAddressLine1 = (TextView) optionView.findViewById(R.id.valAddressLine1);
        valAddressLine2 = (TextView) optionView.findViewById(R.id.valAddressLine2);
        valDistrict = (TextView) optionView.findViewById(R.id.valDistrict);
        valTaluka = (TextView) optionView.findViewById(R.id.valTaluka);
        valVillage = (TextView) optionView.findViewById(R.id.valVillage);
        valWard = (TextView) optionView.findViewById(R.id.valWard);
        valPincode = (TextView) optionView.findViewById(R.id.valPincode);

        PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(selectedPatientId);
        if (patientPersonalInfo != null) {
            valSalutation.setText(patientPersonalInfo.getSalutation());
            valFullName.setText(patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getMiddleName() + " " + patientPersonalInfo.getLastName());
            //valAgeGender.setText(patientPersonalInfo.getAge() + " / " + patientPersonalInfo.getGender());
            valDateOfBirth.setText(patientPersonalInfo.getDob());
            valPlaceOfBirth.setText(patientPersonalInfo.getPlace_of_birth());
            valMaritalStatus.setText(patientPersonalInfo.getMarrital_status());
            //  valCategory.setText(patientPersonalInfo.getCategory());
            valBPL.setText(((patientPersonalInfo.isBpl()) ? "true" : "False"));
            valLanguage.setText(patientPersonalInfo.getLanguage());
            valEducation.setText(patientPersonalInfo.getEducation());
            //  valCardType.setText(patientPersonalInfo.getIdCardType());
            valCardNumber.setText(patientPersonalInfo.getIdCardNumber());
            valEmergencyContact.setText(patientPersonalInfo.getEm_contact());
            valContact.setText(patientPersonalInfo.getContact());
        } else {
            valSalutation.setText("");
            valFullName.setText("");
            valAgeGender.setText("");
            valDateOfBirth.setText("");
            valPlaceOfBirth.setText("");
            valMaritalStatus.setText("");
            valCategory.setText("");
            valBPL.setText("");
            valLanguage.setText("");
            valEducation.setText("");
            valCardType.setText("");
            valCardNumber.setText("");
            valEmergencyContact.setText("");
            valContact.setText("");
        }

        PatientAddressDetail addressDetail1 = DatabaseHelper.getInstance(getActivity()).getPatientAddress(selectedPatientId);
        if (addressDetail1 != null) {
            valAddressLine1.setText(addressDetail1.getAddr1());
            valAddressLine2.setText(addressDetail1.getAddr2());
           /* valDistrict.setText(addressDetail1.getDistrict());
            valTaluka.setText(addressDetail1.getTal());
            valVillage.setText(addressDetail1.getVillageId());
            valWard.setText(String.valueOf(addressDetail1.getWard()));
            valPincode.setText(addressDetail1.getPin());*/
        } else {
            valAddressLine1.setText("");
            valAddressLine2.setText("");
            valDistrict.setText("");
            valTaluka.setText("");
            valVillage.setText("");
            valWard.setText("");
            valPincode.setText("");

        }
        rlTabOptionLayoutContainer.removeAllViews();
        rlTabOptionLayoutContainer.addView(optionView);
    }

    private void setFamilyInfo() {
        RecyclerView rcyclrFamilyInfo;
        FamilyInfoAdapterSummary familyInfoAdapterPreview;
        optionView = getActivity().getLayoutInflater().inflate(R.layout.item_familyinfo, rlTabOptionLayoutContainer, false);
        rcyclrFamilyInfo = (RecyclerView) optionView.findViewById(R.id.rcyclrFamilyInfo);
        LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity(), LinearLayoutManager.HORIZONTAL, false);
        rcyclrFamilyInfo.setLayoutManager(layoutManager);
        ArrayList<PatientFamilyInfo> patientFamilyInfos = DatabaseHelper.getInstance(getActivity()).getPatientFamilyInfo(selectedPatientId);
        familyInfoAdapterPreview = new FamilyInfoAdapterSummary(patientFamilyInfos);
        rcyclrFamilyInfo.setAdapter(familyInfoAdapterPreview);
        rlTabOptionLayoutContainer.removeAllViews();
        rlTabOptionLayoutContainer.addView(optionView);
    }

    private void setVitals() {

        TextView sNo, date, temperature, weight, bmi, girth, fundalHt, hb, bloodGlucose, bp;
        ArrayList<PatientVitals> patientVitalsList = DatabaseHelper.getInstance(getActivity()).getAllPatientVital(selectedPatientId);
       // optionView = getActivity().getLayoutInflater().inflate(R.layout.item_vitals, rlTabOptionLayoutContainer, false);
        //TableLayout tableLayout = (TableLayout) optionView.findViewById(R.id.vitalsTable);
        TableRow tableRow;
        int i=0;

        if (patientVitalsList != null) {
            for (PatientVitals patientVitals : patientVitalsList) {
                tableRow = new TableRow(getActivity());
                TableLayout.LayoutParams tableRowParams=
                        new TableLayout.LayoutParams(TableLayout.LayoutParams.MATCH_PARENT,TableLayout.LayoutParams.WRAP_CONTENT);
                tableRowParams.setMargins(15,0,15,0);
                tableRow.setLayoutParams(tableRowParams);
                sNo = new TextView(getActivity());
                date = new TextView(getActivity());
                temperature = new TextView(getActivity());
                weight = new TextView(getActivity());
                bmi = new TextView(getActivity());
                girth = new TextView(getActivity());
                fundalHt = new TextView(getActivity());
                hb = new TextView(getActivity());
                bloodGlucose = new TextView(getActivity());
                bp = new TextView(getActivity());

                i += 1;
                sNo.setText(String.valueOf(i));
                sNo.setGravity(Gravity.CENTER);
                sNo.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT));
                date.setText(patientVitals.getDateInsertServer());
                date.setGravity(Gravity.CENTER);
                date.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                temperature.setGravity(Gravity.CENTER);
                temperature.setText(String.valueOf(patientVitals.getTemperature()));
                temperature.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                weight.setGravity(Gravity.CENTER);
                weight.setText(String.valueOf(patientVitals.getWeight()));
                weight.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                bmi.setGravity(Gravity.CENTER);
                bmi.setText(String.valueOf(patientVitals.getBmi()));
                bmi.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                girth.setGravity(Gravity.CENTER);
                girth.setText(String.valueOf(patientVitals.getGirth()));
                girth.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                fundalHt.setGravity(Gravity.CENTER);
                fundalHt.setText(String.valueOf(patientVitals.getFundalHeight()));
                fundalHt.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                hb.setGravity(Gravity.CENTER);
                hb.setText(String.valueOf(patientVitals.getHb()));
                hb.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                bloodGlucose.setGravity(Gravity.CENTER);
                bloodGlucose.setText(String.valueOf(" "));
                bloodGlucose.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));
                bp.setGravity(Gravity.CENTER);
                bp.setText(String.valueOf(" "));
                bp.setLayoutParams(new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT, 1.0f));

                tableRow.addView(sNo);
                tableRow.addView(date);
                tableRow.addView(temperature);
                tableRow.addView(weight);
                tableRow.addView(bmi);
                tableRow.addView(girth);
                tableRow.addView(fundalHt);
                tableRow.addView(hb);
                tableRow.addView(bloodGlucose);
                tableRow.addView(bp);

               // tableLayout.addView(tableRow);

            }
        }

        rlTabOptionLayoutContainer.removeAllViews();
        rlTabOptionLayoutContainer.addView(optionView);

    }

    private void setEligibility() {
        //Program Info
        TextView valProgram, valLMPDate, valEDDDate, valFirstPregnancy, valNotes, valGravida, valParity, valPastAbortons, valPastStillBirths, valLivingChildren, valPreviousDeliveryDate, valNatureofPreviousDelivery;
        LinearLayout llFirstPrag;
        optionView = getActivity().getLayoutInflater().inflate(R.layout.item_eligibility, rlTabOptionLayoutContainer, false);
        valProgram = (TextView) optionView.findViewById(R.id.valProgram);
        valLMPDate = (TextView) optionView.findViewById(R.id.valLMPDate);
        valEDDDate = (TextView) optionView.findViewById(R.id.valEDDDate);
        valFirstPregnancy = (TextView) optionView.findViewById(R.id.valFirstPregnancy);
        valNotes = (TextView) optionView.findViewById(R.id.valNotes);
        valGravida = (TextView) optionView.findViewById(R.id.valGravida);
        valParity = (TextView) optionView.findViewById(R.id.valParity);
        valPastAbortons = (TextView) optionView.findViewById(R.id.valPastAbortons);
        valPastStillBirths = (TextView) optionView.findViewById(R.id.valPastStillBirths);
        valLivingChildren = (TextView) optionView.findViewById(R.id.valLivingChildren);
        valPreviousDeliveryDate = (TextView) optionView.findViewById(R.id.valPreviousDeliveryDate);
        valNatureofPreviousDelivery = (TextView) optionView.findViewById(R.id.valNatureofPreviousDelivery);
        llFirstPrag = (LinearLayout) optionView.findViewById(R.id.llFirstPrag);
        ProgramInfo programInfo1 = DatabaseHelper.getInstance(getActivity()).getPatientProgramInfo(selectedPatientId);
        if (programInfo1 != null) {
            valProgram.setText(programInfo1.getProgram_name());
            valLMPDate.setText(programInfo1.getLMPDate());
            valEDDDate.setText(programInfo1.getEDD());
            valFirstPregnancy.setText(((programInfo1.isFirstPregnancy()) ? "true" : "False"));
            if (!programInfo1.isFirstPregnancy()) {
                llFirstPrag.setVisibility(View.VISIBLE);
                valGravida.setText(programInfo1.getGravida());
                valParity.setText(programInfo1.getParity());
                valPastAbortons.setText(programInfo1.getPastAbortions());
                valPastStillBirths.setText(programInfo1.getPastStillBirths());
                valLivingChildren.setText(programInfo1.getLivingChildren());
                valPreviousDeliveryDate.setText(programInfo1.getPreviousDeliveryDate());
                valNatureofPreviousDelivery.setText(programInfo1.getNatureofPreviousDelivery());
            } else {
                llFirstPrag.setVisibility(View.GONE);
            }
            valNotes.setText(programInfo1.getNotes());
        } else {
            valProgram.setText("");
            valLMPDate.setText("");
            valFirstPregnancy.setText("");
            valNotes.setText("");
            llFirstPrag.setVisibility(View.GONE);
        }
        rlTabOptionLayoutContainer.removeAllViews();
        rlTabOptionLayoutContainer.addView(optionView);
    }
}
