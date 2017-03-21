package com.persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonUtility;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by khyati_shah on 3/28/2016.
 */
public class ReportsFragment extends BaseFragment {

    RelativeLayout rlReportContainer;
    Button btnGenerate;
    Spinner spinnerReportType, spinnerPatientList;
    EditText txtFromDate, txtTODate;
    LinearLayout containerPatient, llVitalsContainer;
    ArrayList<PatientPersonalInfo> patientPersonalInfos;
    ArrayList<String> patientName = new ArrayList<String>();
    CheckBox chkBP, chkHB, chkBldGlucose;
    ArrayAdapter<String> patientList;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_reports, container, false);
        initView(view);
       /* view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {

                        getFragmentManager().popBackStack();

                        //Toast.makeText(getActivity(), "Reports", Toast.LENGTH_SHORT).show();
                        return true;
                    }
                }
                return false;
            }
        }); */
        return view;
    }

    private void initView(View view) {
        patientPersonalInfos = DatabaseHelper.getInstance(getActivity()).getAllPatientsList();
        for (int i = 0; i < patientPersonalInfos.size(); i++) {
            patientName.add(patientPersonalInfos.get(i).getFirstName() + " " + patientPersonalInfos.get(i).getLastName());
        }
        rlReportContainer = (RelativeLayout) view.findViewById(R.id.rlReportContainer);
        btnGenerate = (Button) view.findViewById(R.id.btnGenerate);
        spinnerReportType = (Spinner) view.findViewById(R.id.spinnerReportType);
        spinnerPatientList = (Spinner) view.findViewById(R.id.spinnerPatientList);
        chkBP = (CheckBox) view.findViewById(R.id.chkBP);
        chkHB = (CheckBox) view.findViewById(R.id.chkHB);
        chkBldGlucose = (CheckBox) view.findViewById(R.id.chkBldGlucose);

        patientList = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, patientName);
        spinnerPatientList.setAdapter(patientList);

        txtFromDate = (EditText) view.findViewById(R.id.txtFromDate);
        txtTODate = (EditText) view.findViewById(R.id.txtTODate);
        containerPatient = (LinearLayout) view.findViewById(R.id.containerPatient);
        llVitalsContainer = (LinearLayout) view.findViewById(R.id.llVitalsContainer);

        txtTODate.addTextChangedListener(textWatcher);
        txtFromDate.addTextChangedListener(textWatcher);
        txtFromDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HealthMonUtility.showDatePicker(getActivity(), fromDateListener);
            }
        });

        txtTODate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HealthMonUtility.showDatePicker(getActivity(), toDateListener);
            }
        });

        spinnerReportType.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                rlReportContainer.setVisibility(View.GONE);
                String selectedReport = spinnerReportType.getSelectedItem().toString();
                if (selectedReport.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtHealthStatusTerned))) {
                    containerPatient.setVisibility(View.VISIBLE);
                    llVitalsContainer.setVisibility(View.VISIBLE);
                } else {
                    containerPatient.setVisibility(View.GONE);
                    llVitalsContainer.setVisibility(View.GONE);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
                // your code here
            }

        });
        btnGenerate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String selectedReport = spinnerReportType.getSelectedItem().toString();
                dateCheck();
                if (selectedReport.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtSelectReportType))) {
                    HealthMonUtility.showErrorDialog(getActivity(), "Select Report Type");
                    return;
                }
                if (selectedReport.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtANCRegister))) {
                    ANCRegisterReportFragment ancRegisterReportFragment = new ANCRegisterReportFragment();
                    Bundle args = new Bundle();
                    args.putString(Constants.REPORT_TO_DATE, txtTODate.getText().toString());
                    args.putString(Constants.REPORT_FROM_DATE, txtFromDate.getText().toString());
                    ancRegisterReportFragment.setArguments(args);
                    HealthMonUtility.replaceFragment(getActivity(), ancRegisterReportFragment, R.id.rlReportContainer);
                }

                if (selectedReport.equalsIgnoreCase(getActivity().getResources().getString(R.string.txtHealthStatusTerned))) {
                    if (!chkBP.isChecked() && !chkBldGlucose.isChecked() && !chkHB.isChecked()) {
                        HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtSelectatleastoneparameter));
                        return;
                    }
                    if (patientPersonalInfos == null || patientPersonalInfos.size() == 0) {
                        HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtNoPatientDataAvailable));
                        return;
                    }
                    HealthStatusTrendReportFragment healthStatusTrendReportFragment = new HealthStatusTrendReportFragment();
                    Bundle args = new Bundle();
                    args.putString(Constants.REPORT_TO_DATE, txtTODate.getText().toString());
                    args.putString(Constants.REPORT_FROM_DATE, txtFromDate.getText().toString());
                    String patient = patientPersonalInfos.get(spinnerPatientList.getSelectedItemPosition()).getPatient_id();
                    args.putString(Constants.REPORT_SELECTED_PATIENT, patient);
                    args.putBoolean(Constants.REPORT_BP_SELECTED_FLAG, chkBP.isChecked());
                    args.putBoolean(Constants.REPORT_HP_SELECTED_FLAG, chkHB.isChecked());
                    args.putBoolean(Constants.REPORT_GLUCO_SELECTED_FLAG, chkBldGlucose.isChecked());
                    healthStatusTrendReportFragment.setArguments(args);
                    HealthMonUtility.replaceFragment(getActivity(), healthStatusTrendReportFragment, R.id.rlReportContainer);
                }
                rlReportContainer.setVisibility(View.VISIBLE);
            }
        });
    }

    private void dateCheck() {
        if (txtFromDate.getText() != null && !txtFromDate.getText().toString().equals("")) {
            if (txtTODate.getText() == null || txtTODate.getText().toString().equals("")) {
                txtTODate.setError(getActivity().getResources().getString(R.string.txtEnterValue));
                txtTODate.requestFocus();
                return;
            }
            Date dtFromDt = DateUtil.toDate(txtFromDate.getText().toString(), "dd-MM-yyyy");
            Date dtToDt = DateUtil.toDate(txtTODate.getText().toString(), "dd-MM-yyyy");
            if (dtFromDt.after(dtToDt)) {
                txtFromDate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                txtFromDate.requestFocus();
                return;
            }
        }

        if (txtTODate.getText() != null && !txtTODate.getText().toString().equals("")) {
            if (txtFromDate.getText() == null || txtFromDate.getText().toString().equals("")) {
                txtFromDate.setError(getActivity().getResources().getString(R.string.txtEnterValue));
                txtFromDate.requestFocus();
                return;
            }
            Date dtFromDt = DateUtil.toDate(txtFromDate.getText().toString(), "dd-MM-yyyy");
            Date dtToDt = DateUtil.toDate(txtTODate.getText().toString(), "dd-MM-yyyy");
            if (dtToDt.before(dtFromDt)) {
                txtTODate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                txtTODate.requestFocus();
                return;
            }
        }
    }

    TextWatcher textWatcher = new TextWatcher() {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {

        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            txtFromDate.setError(null);
            txtTODate.setError(null);
        }

        @Override
        public void afterTextChanged(Editable s) {

        }
    };
    private DatePickerDialog.OnDateSetListener fromDateListener = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            txtFromDate.setText(arg3 + "-" + arg2 + "-" + arg1);
        }
    };

    private DatePickerDialog.OnDateSetListener toDateListener = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            txtTODate.setText(arg3 + "-" + arg2 + "-" + arg1);
        }
    };
}
