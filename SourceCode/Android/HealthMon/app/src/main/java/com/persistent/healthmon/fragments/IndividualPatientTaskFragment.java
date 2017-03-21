package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ScaleDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Base64;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientStatus;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.ImageResizer;
import com.persistent.healthmon.util.PreferanceManager;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

/**
 * Created by khyati_shah on 5/10/2016.
 */
public class IndividualPatientTaskFragment extends BaseFragment implements View.OnClickListener, IndividualPatientOptionLoad, OnResult {

    AllPatientTaskTabChange allPatientTaskTabChange;
    private static String TAG = IndividualPatientTaskFragment.class.getCanonicalName();
    View view, llTasks, llReferToDoc;
    Button btnSummaryView, btnEditProfile, btnTask, btnReferToDoc;
    TextView btnBack, txtPatientName, txtPID, txtAgeGender, txtProgramName, txtLMPDate, txtEDDDate, txtBMI, txtBP, txtHB, txtWeeksCount, txtStatus, txtContact, btnCall, txtPriority;
    TextView statusHRA, statusVitals, statusHB, statusBP, statusGlucose, statusPulse, statusUrine, statusECG, statusFetal, statusImmunization, statusMedication, statusFeedback;
    ImageView imgPatient, imgExlamation, tickHRA, tickVitals, tickHB, tickBP, tickGlucose, tickPluse, tickUrine, tickECG, tickFetalMonitor, tickImmunization, tickMedication, tickFeedback;
    String selectedPatientId;
    PatientPersonalInfo patientPersonalInfo;
    ProgramInfo programInfo;
    LinearLayout btnTasksVitals, btnTasksBP, btnTaskOxi, btnTaskECG, llBtnsOptionsContainer;
    LinearLayout btnTasksHB, btnImmunization, btnMadication, btnfeedback, btnHRA;
    RelativeLayout rlTabContainer, rlTabOptionContainer;
    String value;
    private Context mContext;
    TextView valLastRefered, txtTestResults;
    Spinner spinnerHealthCenterLab, spinnerLocation, spinnerReason;
    EditText edtComment;
    Button btnRefer, btnClear;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mContext = getActivity();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_individual_patient_task, container, false);
        selectedPatientId = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        //Toast.makeText(getActivity(), selectedPatientId, Toast.LENGTH_SHORT).show();
        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        WebserviceManager.getCarePlan(getActivity(), value);
        initView(view);
     /*   view.setFocusableInTouchMode(true);
        view.requestFocus();
        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {

                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    Fragment currentFragment = getActivity().getSupportFragmentManager().findFragmentById(R.id.rlTabOptionContainer);
                    if (currentFragment == null) {
                        // getActivity().getSupportFragmentManager().beginTransaction().remove(IndividualPatientTaskFragment.this).commit();
                        AllPatientFragment allPatientsFragment = new AllPatientFragment();
                        //HealthMonUtility.addFragment(getActivity(), individualPatientTaskFragment);
                        HealthMonUtility.replaceFragment(getActivity(), allPatientsFragment);
                    } else {
                        //getActivity().getSupportFragmentManager().beginTransaction().remove(currentFragment).commit();
                        AllPatientFragment allPatientsFragment = new AllPatientFragment();
                        HealthMonUtility.replaceFragment(getActivity(), allPatientsFragment);

                        onCurrentFragmentDiscard(currentFragment.getClass().toString());
                    }
                    return true;
                }
                return false;
            }
        });*/
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        AllPatientFragment allPatientsFragment = new AllPatientFragment();
                        HealthMonUtility.replaceFragment(getActivity(), allPatientsFragment);
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    private void initView(View view) {
        DatabaseHelper.getInstance(getActivity()).getPatientStatus(selectedPatientId);
        llTasks = (View) view.findViewById(com.persistent.healthmon.R.id.llTasks);
        llReferToDoc = (View) view.findViewById(com.persistent.healthmon.R.id.llReferToDoc);
        imgExlamation = (ImageView) view.findViewById(R.id.imgExlamation);
        btnSummaryView = (Button) view.findViewById(R.id.btnSummaryView);
        btnEditProfile = (Button) view.findViewById(R.id.btnEditProfile);
        btnTasksVitals = (LinearLayout) view.findViewById(R.id.ltpatientvitals);
        btnTasksBP = (LinearLayout) view.findViewById(R.id.ltpatientbp);
        btnTaskOxi = (LinearLayout) view.findViewById(R.id.ltpatientoxi);
        btnTaskECG = (LinearLayout) view.findViewById(R.id.ltpatientecg);
        btnTasksHB = (LinearLayout) view.findViewById(R.id.ltpatienthb);
        btnImmunization = (LinearLayout) view.findViewById(R.id.ltpatientimmunization);
        btnMadication = (LinearLayout) view.findViewById(R.id.ltpatientmedication);
        btnfeedback = (LinearLayout) view.findViewById(R.id.ltpatientfeedback);
        btnHRA = (LinearLayout) view.findViewById(R.id.ltpatienthra);
        rlTabContainer = (RelativeLayout) view.findViewById(R.id.rlTabContainer);
        rlTabOptionContainer = (RelativeLayout) view.findViewById(R.id.rlTabOptionContainer);
        btnTask = (Button) view.findViewById(R.id.btnTask);
        btnReferToDoc = (Button) view.findViewById(R.id.btnReferToDoc);
        btnBack = (TextView) view.findViewById(R.id.btnBack);
        imgPatient = (ImageView) view.findViewById(R.id.imgPatient);
        txtPatientName = (TextView) view.findViewById(R.id.txtPatientName);
        txtPID = (TextView) view.findViewById(R.id.txtPID);
        txtAgeGender = (TextView) view.findViewById(R.id.txtAgeGender);
        txtProgramName = (TextView) view.findViewById(R.id.txtProgramName);
        txtLMPDate = (TextView) view.findViewById(R.id.txtLMPDate);
        txtEDDDate = (TextView) view.findViewById(R.id.txtEDDDate);
        txtBMI = (TextView) view.findViewById(R.id.txtBMI);
        txtBP = (TextView) view.findViewById(R.id.txtBP);
        txtHB = (TextView) view.findViewById(R.id.txtHB);
        txtWeeksCount = (TextView) view.findViewById(R.id.txtWeeksCount);
        txtStatus = (TextView) view.findViewById(R.id.txtStatus);
        txtContact = (TextView) view.findViewById(R.id.txtContact);
        btnCall = (TextView) view.findViewById(R.id.btnCall);
        llBtnsOptionsContainer = (LinearLayout) view.findViewById(R.id.llBtnsOptionsContainer);
        tickHRA = (ImageView) view.findViewById(R.id.tickHRA);
        tickVitals = (ImageView) view.findViewById(R.id.tickVitals);
        tickHB = (ImageView) view.findViewById(R.id.tickHB);
        tickBP = (ImageView) view.findViewById(R.id.tickBP);
        tickGlucose = (ImageView) view.findViewById(R.id.tickGlucose);
        tickPluse = (ImageView) view.findViewById(R.id.tickPluse);
        tickUrine = (ImageView) view.findViewById(R.id.tickUrine);
        tickECG = (ImageView) view.findViewById(R.id.tickECG);
        tickFetalMonitor = (ImageView) view.findViewById(R.id.tickFetalMonitor);
        tickImmunization = (ImageView) view.findViewById(R.id.tickImmunization);
        tickMedication = (ImageView) view.findViewById(R.id.tickMedication);
        tickFeedback = (ImageView) view.findViewById(R.id.tickFeedback);
        statusHRA = (TextView) view.findViewById(R.id.statusHRA);
        statusVitals = (TextView) view.findViewById(R.id.statusVitals);
        statusHB = (TextView) view.findViewById(R.id.statusHB);
        statusBP = (TextView) view.findViewById(R.id.statusBP);
        statusGlucose = (TextView) view.findViewById(R.id.statusGlucose);
        statusPulse = (TextView) view.findViewById(R.id.statusPulse);
        statusUrine = (TextView) view.findViewById(R.id.statusUrine);
        statusECG = (TextView) view.findViewById(R.id.statusECG);
        statusFetal = (TextView) view.findViewById(R.id.statusFetal);
        statusImmunization = (TextView) view.findViewById(R.id.statusImmunization);
        statusMedication = (TextView) view.findViewById(R.id.statusMedication);
        statusFeedback = (TextView) view.findViewById(R.id.statusFeedback);
        txtPriority = (TextView) view.findViewById(R.id.txtPriority);
        //refer to doc fields
        valLastRefered = (TextView) view.findViewById(R.id.valLastRefered);
        txtTestResults = (TextView) view.findViewById(R.id.txtTestResults);
        spinnerHealthCenterLab = (Spinner) view.findViewById(R.id.spinnerHealthCenterLab);
        spinnerLocation = (Spinner) view.findViewById(R.id.spinnerLocation);
        spinnerReason = (Spinner) view.findViewById(R.id.spinnerReason);
        edtComment = (EditText) view.findViewById(R.id.edtComment);
        btnRefer = (Button) view.findViewById(R.id.btnRefer);
        btnClear = (Button) view.findViewById(R.id.btnClear);
        btnRefer.setOnClickListener(this);
        btnClear.setOnClickListener(this);
        //llBtnsOptionsContainer = (LinearLayout) btnTask.getParent();
        btnCall.setOnClickListener(this);
        btnTask.setOnClickListener(this);
        btnReferToDoc.setOnClickListener(this);
        btnBack.setOnClickListener(this);
        btnTasksBP.setOnClickListener(this);
        btnTasksVitals.setOnClickListener(this);
        btnTaskOxi.setOnClickListener(this);
        btnTaskECG.setOnClickListener(this);
        btnTasksHB.setOnClickListener(this);
        btnImmunization.setOnClickListener(this);
        btnMadication.setOnClickListener(this);
        btnfeedback.setOnClickListener(this);
        btnHRA.setOnClickListener(this);
        btnSummaryView.setOnClickListener(this);
        //imgExlamation.bringToFront();

        //setting refer to doctor drawable
       /* Drawable drawable = getResources().getDrawable(R.drawable.ic_exclamation_sign);
        drawable.setBounds(0, 0, (int) (drawable.getIntrinsicWidth() * 0.5),
                (int) (drawable.getIntrinsicHeight() * 0.5));
        ScaleDrawable sd = new ScaleDrawable(drawable, 0, 25, 25);
        btnReferToDoc.setCompoundDrawables(null, null, sd.getDrawable(), null);*/

        //setting summary view drawable
        Drawable drawable = getResources().getDrawable(R.drawable.ic_summary_view);
        drawable.setBounds(0, 0, (int) (drawable.getIntrinsicWidth() * 0.5),
                (int) (drawable.getIntrinsicHeight() * 0.5));
        ScaleDrawable sd = new ScaleDrawable(drawable, 0, 25, 25);
        btnSummaryView.setCompoundDrawables(sd.getDrawable(), null, null, null);
        patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(selectedPatientId);
      //  programInfo = DatabaseHelper.getInstance(getActivity()).getPatientProgramInfo(selectedPatientId);
        if (patientPersonalInfo != null) {
            txtPatientName.setText(patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getLastName());
            txtPID.setText(patientPersonalInfo.getPatient_id());
            //  txtAgeGender.setText(patientPersonalInfo.getAge() + " / " + patientPersonalInfo.getGender());
            txtContact.setText(patientPersonalInfo.getContact());
            if (patientPersonalInfo.getPatient_image_string() != null && !patientPersonalInfo.getPatient_image_string().equalsIgnoreCase("")) {
                byte[] b = Base64.decode(patientPersonalInfo.getPatient_image_string(), Base64.DEFAULT);
                //Bitmap patientImg = BitmapFactory.decodeByteArray(b, 0, b.length);
                Bitmap patientImg = ImageResizer.getBitmapThumbnail(getActivity(), patientPersonalInfo.getPatient_image_string());

                imgPatient.setImageBitmap(patientImg);
            } else {
                imgPatient.setImageResource(R.drawable.user_default_blue);
            }
          //  txtProgramName.setText(programInfo.getProgram_name());
            //Log.e("txtLMPDate.setText",patientPersonalInfo.toString());
            txtLMPDate.setText(DateUtil.dateConvert(patientPersonalInfo.getLMPDate(), "yyyy-MM-dd", "dd-MM-yyyy"));
            txtEDDDate.setText(DateUtil.dateConvert(patientPersonalInfo.getEDD(), "yyyy-MM-dd", "dd-MM-yyyy"));
            txtBMI.setText("");
            txtBP.setText(patientPersonalInfo.getBp());
            txtHB.setText(patientPersonalInfo.getHb());
            //txtWeeksCount.setText(String.valueOf(DateUtil.getPragnancyWeeks(programInfo.getLMPDate(), "yyyy-MM-dd")));
            txtStatus.setText("");
        }
       /* if (programInfo != null) {
            txtProgramName.setText(programInfo.getProgram_name());
            Log.e("txtLMPDate.setText",patientPersonalInfo.toString());
            txtLMPDate.setText(DateUtil.dateConvert(patientPersonalInfo.getLMPDate(), "yyyy-MM-dd", "dd-MM-yyyy"));
            txtEDDDate.setText(DateUtil.dateConvert(patientPersonalInfo.getEDD(), "yyyy-MM-dd", "dd-MM-yyyy"));
            txtBMI.setText("");
            txtBP.setText(patientPersonalInfo.getBp());
            txtHB.setText(patientPersonalInfo.getHb());
            //txtWeeksCount.setText(String.valueOf(DateUtil.getPragnancyWeeks(programInfo.getLMPDate(), "yyyy-MM-dd")));
            txtStatus.setText("");
        }*/
        setDataOnCard();

    }

    @Override
    public void onClick(View v) {

        if (v.getId() == R.id.btnRefer) {
            referToDoc();
        }
        if (v.getId() == R.id.btnClear) {
            clearReferToDocData();
        }
        if (v.getId() == R.id.btnTask) {
            llTasks.setVisibility(View.VISIBLE);
            llReferToDoc.setVisibility(View.GONE);
            btnReferToDoc.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            btnReferToDoc.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnTask.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnTask.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

        }
        if (v.getId() == R.id.btnReferToDoc) {
            llTasks.setVisibility(View.GONE);
            llReferToDoc.setVisibility(View.VISIBLE);
            rlTabOptionContainer.setVisibility(View.GONE);
            rlTabContainer.setVisibility(View.VISIBLE);
            btnTask.setBackgroundColor(getActivity().getResources().getColor(R.color.colorWhite));
            btnTask.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnReferToDoc.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnReferToDoc.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

        }
        if (v.getId() == R.id.btnBack) {
            Fragment currentFragment = getActivity().getSupportFragmentManager().findFragmentById(R.id.rlTabOptionContainer);
            if (currentFragment == null) {
                // getActivity().getSupportFragmentManager().beginTransaction().remove(IndividualPatientTaskFragment.this).commit();
                AllPatientFragment allPatientsFragment = new AllPatientFragment();
                //HealthMonUtility.addFragment(getActivity(), individualPatientTaskFragment);
                HealthMonUtility.replaceFragment(getActivity(), allPatientsFragment);
            } else {
                //getActivity().getSupportFragmentManager().beginTransaction().remove(currentFragment).commit();
                AllPatientFragment allPatientsFragment = new AllPatientFragment();
                HealthMonUtility.replaceFragment(getActivity(), allPatientsFragment);

                onCurrentFragmentDiscard(currentFragment.getClass().toString());
            }

        }
        if (v.getId() == R.id.btnCall) {
            if (HealthMonUtility.isCallFunAvailable(getActivity())) {
                Intent callIntent = new Intent(Intent.ACTION_CALL);
                callIntent.setData(Uri.parse(patientPersonalInfo.getContact()));
                startActivity(callIntent);
            } else {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.msgCallFunctionalityNotAvailableOnDevice));
            }
        }
        if (v.getId() == R.id.ltpatientbp) {
            HealthMonLog.i(TAG, "btnTaskBP id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientBPFragment allPatientBPFragment = new AllPatientBPFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientBPFragment.setArguments(args);
            //HealthMonUtility.reloadFragment(getActivity(), new AllPatientBPFragment(this.allPatientTaskTabChange), R.id.rlTabOptionContainer);
            HealthMonUtility.replaceFragment(getActivity(), allPatientBPFragment, R.id.rlTabOptionContainer);
            //allPatientTaskTabChange.onTabChange(AllPatientVitalFragment.class.toString());
        }
        if (v.getId() == R.id.ltpatientvitals) {
            HealthMonLog.i(TAG, "btnTaskBP id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientVitalFragment allPatientVitalFragment = new AllPatientVitalFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            //args.putInt(Constants.SELECTED_PATIENT_ID, rlTabContainer);
            allPatientVitalFragment.setArguments(args);
            //HealthMonUtility.reloadFragment(getActivity(), new AllPatientBPFragment(this.allPatientTaskTabChange), R.id.rlTabOptionContainer);
            HealthMonUtility.replaceFragment(getActivity(), allPatientVitalFragment, R.id.rlTabOptionContainer);
            //allPatientTaskTabChange.onTabChange(AllPatientVitalFragment.class.toString());
        }
        if (v.getId() == R.id.btnSummaryView) {
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            llBtnsOptionsContainer.setVisibility(View.GONE);
            SummaryViewFragment summaryViewFragment = new SummaryViewFragment();
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            summaryViewFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), summaryViewFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatientoxi) {
            HealthMonLog.i(TAG, "btnTaskBP id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientOxiFragment allPatientOxiFragment = new AllPatientOxiFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientOxiFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientOxiFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatientecg) {
            HealthMonLog.i(TAG, "btnTaskBP id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientECGFragment allPatientECGFragment = new AllPatientECGFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientECGFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientECGFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatienthb) {
            HealthMonLog.i(TAG, "btnTaskHB id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientHBFragment allPatientHBFragment = new AllPatientHBFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientHBFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientHBFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatientimmunization) {
            HealthMonLog.i(TAG, "btnImmunization id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientImmunizationFragment allPatientImmunizationFragment = new AllPatientImmunizationFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientImmunizationFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientImmunizationFragment, R.id.rlTabOptionContainer);

        }
        if (v.getId() == R.id.ltpatientmedication) {
            HealthMonLog.i(TAG, "btnMedication id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientMedicationFragment allPatientMedicationFragment = new AllPatientMedicationFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientMedicationFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientMedicationFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatientfeedback) {
            HealthMonLog.i(TAG, "btnMedication id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientFeedbackFragment allPatientFeedbackFragment = new AllPatientFeedbackFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientFeedbackFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientFeedbackFragment, R.id.rlTabOptionContainer);
        }
        if (v.getId() == R.id.ltpatienthra) {
            HealthMonLog.i(TAG, "btnMedication id = " + v.getId());
            rlTabContainer.setVisibility(View.GONE);
            rlTabOptionContainer.setVisibility(View.VISIBLE);
            AllPatientHRAFragment allPatientHRAFragment = new AllPatientHRAFragment(IndividualPatientTaskFragment.this);
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            allPatientHRAFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), allPatientHRAFragment, R.id.rlTabOptionContainer);
        }
    }


    @Override
    public void onCurrentFragmentDiscard(String fragmentClassName) {
        rlTabContainer.setVisibility(View.VISIBLE);
        rlTabOptionContainer.setVisibility(View.GONE);
        if (fragmentClassName.equalsIgnoreCase(SummaryViewFragment.class.toString())) {
            llBtnsOptionsContainer.setVisibility(View.VISIBLE);
        }
        setDataOnCard();
    }

    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    private void setDataOnCard() {
        /*ArrayList<PatientVitals> patientBP = DatabaseHelper.getInstance(getActivity()).getAllPatientBP(selectedPatientId);
        Collections.sort(patientBP);*/
       // ArrayList<PatientVitals> patientVitalses = DatabaseHelper.getInstance(getActivity()).getAllPatientVital(selectedPatientId);
        //Collections.sort(patientVitalses);
       // ArrayList<PatientVitals> patientHB = DatabaseHelper.getInstance(getActivity()).getAllPatientHB(selectedPatientId);
       // Collections.sort(patientHB);
        ArrayList<PatientVitals> patientECG = DatabaseHelper.getInstance(getActivity()).getAllPatientECG(selectedPatientId);
        //Collections.sort(patientECG);
        ArrayList<PatientVitals> patientPulseOxi = DatabaseHelper.getInstance(getActivity()).getAllPatientOXI(selectedPatientId);
      /*  if (patientBP.size() > 0) {
            tickBP.setVisibility(View.VISIBLE);
            statusBP.setText("");
            txtBP.setText(patientBP.get(0).getHM_systolic() + "/" + patientBP.get(0).getHM_diastolic() + " mmHg");
        }*/
       /* if (patientVitalses.size() > 0) {
            tickVitals.setVisibility(View.VISIBLE);
            statusVitals.setText("");
            HealthMonLog.i(TAG, "BMI patient card = " + patientVitalses.get(0).getBmi() + " All data  = " + patientVitalses.toString());
            txtBMI.setText("" + patientVitalses.get(0).getBmi());
        }*/
      /*  if (patientHB.size() > 0) {
            tickHB.setVisibility(View.VISIBLE);
            statusHB.setText("");
            HealthMonLog.i(TAG, "All data  = " + patientHB.toString());
            txtHB.setText("" + patientHB.get(0).getHb());
        }*/
        if (patientECG.size() > 0) {
            tickECG.setVisibility(View.VISIBLE);
            statusECG.setText("");
        }
        if (patientPulseOxi.size() > 0) {
            tickPluse.setVisibility(View.VISIBLE);
            statusPulse.setText("");
        }
        //set data for patient status
        PatientStatus patientStatus = DatabaseHelper.getInstance(getActivity()).getPatientStatus(selectedPatientId);
        if (patientStatus != null) {
            txtStatus.setText(patientStatus.getStatusMsg());
            switch (patientStatus.getOverallFlag()) {
                case Constants.PRIORITY_HIGH_RISK_PATIENT:
                    txtStatus.setTextColor(getActivity().getResources().getColor(R.color.colorred));
                    txtPriority.setBackgroundColor(getActivity().getResources().getColor(R.color.colorred));
                    break;
                case Constants.PRIORITY_NORMAL_PATIENT:
                    txtStatus.setTextColor(getActivity().getResources().getColor(R.color.colorGreenButtonDark));
                    txtPriority.setBackgroundColor(getActivity().getResources().getColor(R.color.colorGreenButtonDark));
                    break;
                case Constants.PRIORITY_MODERATE_RISK_PATIENT:
                    txtStatus.setTextColor(getActivity().getResources().getColor(R.color.coloryellow));
                    txtPriority.setBackgroundColor(getActivity().getResources().getColor(R.color.coloryellow));
                    break;
            }
        }
        //set data to refer to doc
        ArrayList<Referal> referals = DatabaseHelper.getInstance(getActivity()).getAllReferalForPatient(selectedPatientId);
        if (referals.size() > 0) {
            //fetching last reffered date for refer to doc
            Date dtLstRefferedDt = null;
            for (int i = 0; i < referals.size(); i++) {
                String date = referals.get(i).getRefDate();
                Date dtRefDt = DateUtil.toDate(date, "dd-MM-yyyy HH:mm:ss");
                if (dtLstRefferedDt != null) {
                    if (dtLstRefferedDt.before(dtRefDt)) {
                        dtLstRefferedDt = dtRefDt;
                    }
                } else {
                    dtLstRefferedDt = dtRefDt;
                }
            }
            DateFormat dtFormat = new SimpleDateFormat("dd-MM-yyyy");
            String strLstRefDt = dtFormat.format(dtLstRefferedDt);
            valLastRefered.setText(strLstRefDt);
        }
    }

    private void referToDoc() {
        Referal referal = new Referal();
        String refId = PreferanceManager.getAshaId(getActivity()) + "_ref_" + +HealthMonUtility.getReferalNoFromFile(getActivity());
        referal.setRefId(refId);
        referal.setUserId(PreferanceManager.getAshaId(getActivity()));
        referal.setPatientId(selectedPatientId);
        PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(selectedPatientId);
        referal.setPatientName(patientPersonalInfo.getFirstName()+" "+patientPersonalInfo.getMiddleName()+" "+patientPersonalInfo.getLastName());
        referal.setPHC_id("1");
        referal.setVillageId("1");
        //referal.setReferalNotes(edtComment.getText().toString());
        referal.setReferalNotes("1");
        referal.setReferalReason(spinnerReason.getSelectedItem().toString());
        referal.setRefDate(DateUtil.getCurrentTimeStamp());
        referal.setCreatedBy(PreferanceManager.getAshaId(getActivity()));
        referal.setCreatedDate(DateUtil.getCurrentTimeStamp());
        ArrayList<Referal> referals = new ArrayList<Referal>();
        referals.add(referal);
        //DB call
        DatabaseHelper.getInstance(getActivity()).insertReferal(referal);
        //web service call
        WebserviceManager.insertReferal(getActivity(), referals, this);
    }

    @Override
    public void onError(String message) {

    }

    @Override
    public void onResponse(String message) {
        showReferSuccessfulDialog();
    }

    private void clearReferToDocData() {
        spinnerHealthCenterLab.setSelection(0);
        spinnerLocation.setSelection(0);
        spinnerReason.setSelection(0);
        edtComment.setText("");
    }

    private void showReferSuccessfulDialog() {
        TextView txtHealthCenterDetail;
        Button btnOk;
        final Dialog dialog = new Dialog(getActivity());
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_refer_successfully);
        txtHealthCenterDetail = (TextView) dialog.findViewById(R.id.txtHealthCenterDetail);
        txtHealthCenterDetail.setText(spinnerHealthCenterLab.getSelectedItem() + " , " + spinnerLocation.getSelectedItem());
        btnOk = (Button) dialog.findViewById(R.id.btnOk);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                clearReferToDocData();
            }
        });
        dialog.show();
    }
}
