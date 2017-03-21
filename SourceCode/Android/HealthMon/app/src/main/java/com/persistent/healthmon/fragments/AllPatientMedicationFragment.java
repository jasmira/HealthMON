package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.HRAAdapter;
import com.persistent.healthmon.adapter.MedicationAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.AshaDetails;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.placeholder.BlConnectionSettingPopUp;
import com.persistent.healthmon.placeholder.MedicationViewAll;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by pushkar_bhadle on 6/7/2016.
 */
public class AllPatientMedicationFragment  extends BaseFragment implements View.OnClickListener  {
    private static String TAG = AllPatientMedicationFragment.class.getCanonicalName();

    AllPatientTaskTabChange allPatientTaskTabChange;
    String value;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    TextView tv_task,btn_view_all,ifa_given, ca_given;
    TextView tv_IFAGivenBy,tv_IFA_Role,tv_IFA_location,tv_IFA_Due_date;
    TextView tv_CAGivenBy,tv_CA_Role,tv_CA_location,tv_CA_Due_date;
    TextView tv_OtherGivenBy,tv_Other_Role,tv_Other_location;
    TextView btn_Save_IFA,btn_Save_Calcium,btn_Add_Other;
    TextView btn_Edit_IFA,btn_Edit_Calcium,btn_Delete_Other;
    ArrayList<Medication> mOtherDrugs = new ArrayList<>();
    ArrayList<Medication> mDrugsNameWithID = new ArrayList<>();
    Button btn_Save, btn_cancel;
    Spinner spinnerIFADrugName, spinnerIFAQnty, spinnerCADrugName, spinnerCAQnty, spinnerOtherQnty, spinnerOtherDrugName;
    ImageView iv_task;
    RecyclerView mOtherLst;
    MedicationAdapter medicationAdapter;
    int cnt = 0;
    String location;

    public AllPatientMedicationFragment() {
    }

    public AllPatientMedicationFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_medication, container, false);
        initView(view);

        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
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


        ArrayList<Medication> dbLstMedication = DatabaseHelper.getInstance(getActivity()).getMedicationDetails(value);
        Collections.sort(dbLstMedication,Medication.medicationDATE);
        HealthMonLog.i(TAG, "Sorted Medication list => " + dbLstMedication.toString());
        for (Medication patientVitals1 : dbLstMedication) {
            HealthMonLog.i(TAG, "Sorted patient => " + patientVitals1.toString());
        }
        if (dbLstMedication.size() > 0) {
            int cntIFA = 0, cntCA = 0;
            for(Medication medn: dbLstMedication){
                if(medn.getDrug_type().equalsIgnoreCase(Constants.MEDICATION_DRUG_IFA)) {
                    cntIFA = cntIFA + Integer.parseInt(medn.getMedicine_qty());
                }
                if(medn.getDrug_type().equalsIgnoreCase(Constants.MEDICATION_DRUG_CA)) {
                    cntCA = cntCA + Integer.parseInt(medn.getMedicine_qty());
                }
            }
            if(cntIFA != 0){
                ifa_given.setText(""+cntIFA);
            }
            if(cntCA != 0){
                ca_given.setText(""+cntCA);
            }
        }
        return view;
    }

    @Override
    public void onClick(View v) {
        if(v.getId() == R.id.btnTaskViewAll){
            //Toast.makeText(getContext(),"View all",Toast.LENGTH_SHORT).show();
            final MedicationViewAll popupWindow = new MedicationViewAll(getContext(),value);
            popupWindow.show(v, 0, 0);
            //layout_MainMenu.getForeground().setAlpha(150);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getContext().getSystemService(Context.WINDOW_SERVICE);
            //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(v.getId() == R.id.btnMOtherAdd){
            String drugName  = (String) spinnerOtherDrugName.getSelectedItem();
            String drugQty  = (String) spinnerOtherQnty.getSelectedItem();
            Medication mOther = new Medication();
            if(!(drugQty.equalsIgnoreCase("0"))) {
                mOther.setPatient_id(value);
                mOther.setDrug_name(drugName);
                mOther.setMedicine_qty(drugQty);
                for(Medication medication:mDrugsNameWithID ){
                    if(medication.getDrug_name().equalsIgnoreCase(drugName)){
                        mOther.setDrug_id(medication.getDrug_id());
                    }
                }
                mOther.setGiven_by(PreferanceManager.getAshaId(getContext()));
                mOther.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",getContext() ));
                mOther.setRole("Asha");
                mOther.setLocation(location);
                mOther.setDrug_type(Constants.MEDICATION_DRUG_OTHER);
                mOtherDrugs.add(mOther);
            }
            if(drugQty.equalsIgnoreCase("0")){
                HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
            }else if(cnt == 0) {
                medicationAdapter = new MedicationAdapter(mOtherDrugs);
                RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
                mOtherLst.setLayoutManager(mLayoutManager);
                mOtherLst.setAdapter(medicationAdapter);
                cnt++;
            }else{
                medicationAdapter.notifyDataSetChanged();
            }
        }
        if(v.getId() == R.id.btn_medication_save){
            performSave();
        }
        if(v.getId() == R.id.btn_medication_cancel){
            vitalCancelDialog(AllPatientMedicationFragment.this,individualPatientOptionLoad);
        }

    }

    private void performSave() {
        ArrayList<Medication> saveLstMedication = new ArrayList<>();
        try {
            saveLstMedication = medicationAdapter.getMedicationList();
        }catch (Exception e){
            e.printStackTrace();
        }
        String ifaQty = (String) spinnerIFAQnty.getSelectedItem();
        String caQty = (String) spinnerCAQnty.getSelectedItem();
        if(!(ifaQty.equalsIgnoreCase("0"))){
            String ifaDrug = (String) spinnerIFADrugName.getSelectedItem();
            Medication medIFA = new Medication();
            medIFA.setPatient_id(value);
            medIFA.setDrug_name(ifaDrug);
            for(Medication medication:mDrugsNameWithID ){
               if(medication.getDrug_name().equalsIgnoreCase(ifaDrug)){
                   medIFA.setDrug_id(medication.getDrug_id());
               }
            }
            medIFA.setMedicine_qty(ifaQty);
            medIFA.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",getContext() ));
            medIFA.setGiven_by(PreferanceManager.getAshaId(getContext()));
            medIFA.setRole("Asha");
            medIFA.setLocation(location);
            medIFA.setDrug_type(Constants.MEDICATION_DRUG_IFA);
            saveLstMedication.add(medIFA);
        }
        if(!(caQty.equalsIgnoreCase("0"))){
            String caDrug = (String) spinnerCADrugName.getSelectedItem();
            Medication caIFA = new Medication();
            caIFA.setPatient_id(value);
            caIFA.setDrug_name(caDrug);
            caIFA.setMedicine_qty(caQty);
            for(Medication medication:mDrugsNameWithID ){
                if(medication.getDrug_name().equalsIgnoreCase(caDrug)){
                    caIFA.setDrug_id(medication.getDrug_id());
                }
            }
            caIFA.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",getContext() ));
            caIFA.setGiven_by(PreferanceManager.getAshaId(getContext()));
            caIFA.setRole("Asha");
            caIFA.setLocation(location);
            caIFA.setDrug_type(Constants.MEDICATION_DRUG_CA);
            saveLstMedication.add(caIFA);
        }

        if (!saveLstMedication.isEmpty()) {
            final Dialog dialog = new Dialog(getContext());
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
            final ArrayList<Medication> finalSaveLstMedication = saveLstMedication;
            btnOk.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int flagBp = Constants.PRIORITY_NORMAL_PATIENT;
                    int flagPulse = Constants.PRIORITY_NORMAL_PATIENT;
                    dialog.dismiss();
                    HealthMonLog.i(TAG,"DB list = "+finalSaveLstMedication.toString());
                    DatabaseHelper.getInstance(getActivity()).addMedicationDetails(finalSaveLstMedication);
                    Toast.makeText(getContext(), getString(R.string.txtTaskBPDataInserted), Toast.LENGTH_SHORT).show();
                    getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientMedicationFragment.this).commit();
                    individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientMedicationFragment.this.getTag());

                }
            });
            dialog.show();

            //HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataInserted));

            //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientBPFragment.this).commit();
            //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
        } else {
            HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataNotValid));
        }

    }

    @Override
    public void onDestroy() {
        super.onDestroy();

    }

    private void initView(View view) {
        tv_task = (TextView) view.findViewById(R.id.tv_task_header_name);
        ifa_given = (TextView) view.findViewById(R.id.tvIFAGiventext);
        ca_given = (TextView) view.findViewById(R.id.tvCalciumGiventext);
        iv_task = (ImageView) view.findViewById(R.id.iv_task_header);
        btn_view_all = (TextView) view.findViewById(R.id.btnTaskViewAll);
        tv_task.setText(getString(R.string.txtMedication));
        iv_task.setImageResource(R.drawable.ic_medication);

        mOtherLst = (RecyclerView) view.findViewById(R.id.lstMedicationOther);
        tv_IFAGivenBy = (TextView) view.findViewById(R.id.tvIFAgivenBy);
        tv_IFA_Role = (TextView) view.findViewById(R.id.tvIFARole);
        tv_IFA_location = (TextView) view.findViewById(R.id.tvIFALocation);
        tv_IFA_Due_date = (TextView) view.findViewById(R.id.tvIFADueDate);
        tv_CAGivenBy = (TextView) view.findViewById(R.id.tvCAGivenBy);
        tv_CA_Role = (TextView) view.findViewById(R.id.tvCARole);
        tv_CA_location = (TextView) view.findViewById(R.id.tvCALocation);
        tv_CA_Due_date = (TextView) view.findViewById(R.id.tvCADueDate);
        tv_OtherGivenBy = (TextView) view.findViewById(R.id.tvAddOtherGivenBy);
        tv_Other_Role = (TextView) view.findViewById(R.id.tvAddOtherRole);
        tv_Other_location = (TextView) view.findViewById(R.id.tvAddOtherLocation);

        spinnerIFADrugName = (Spinner) view.findViewById(R.id.spinnerIFAType);
        spinnerIFAQnty = (Spinner) view.findViewById(R.id.spinnerIFAQntyType);
        spinnerCADrugName = (Spinner) view.findViewById(R.id.spinnerCAType);
        spinnerCAQnty = (Spinner) view.findViewById(R.id.spinnerCAQntymType);
        spinnerOtherDrugName = (Spinner) view.findViewById(R.id.spinnerOtherType);
        spinnerOtherQnty = (Spinner) view.findViewById(R.id.spinnerOtherQntymType);

/*        btn_Save_IFA = (TextView) view.findViewById(R.id.btnMIFASave);
        btn_Edit_IFA = (TextView) view.findViewById(R.id.btnMIFAEdit);
        btn_Save_Calcium = (TextView) view.findViewById(R.id.btnMCalciumSave);
        btn_Edit_Calcium = (TextView) view.findViewById(R.id.btnMCalciumEdit);*/
        btn_Add_Other = (TextView) view.findViewById(R.id.btnMOtherAdd);
        btn_Save = (Button) view.findViewById(R.id.btn_medication_save);
        btn_cancel = (Button) view.findViewById(R.id.btn_medication_cancel);
        btn_view_all.setOnClickListener(this);
        btn_Add_Other.setOnClickListener(this);
        btn_Save.setOnClickListener(this);
        btn_cancel.setOnClickListener(this);


        tv_IFAGivenBy.setText(""+PreferanceManager.getAshaId(getContext()));
        tv_CAGivenBy.setText(""+PreferanceManager.getAshaId(getContext()));
        tv_OtherGivenBy.setText(""+PreferanceManager.getAshaId(getContext()));


        tv_IFA_Role.setText(""+getString(R.string.txtAsha));
        tv_CA_Role.setText(""+getString(R.string.txtAsha));
        tv_Other_Role.setText(""+getString(R.string.txtAsha));


                //location  = DatabaseHelper.getInstance(getContext()).getVillageId(patientAddressDetail.getVillageId());
                AshaDetails ashaDetails = DatabaseHelper.getInstance(getContext()).getAshaDetails(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext()));
                location  = ashaDetails.getAddress();
                HealthMonLog.i(TAG,"Location = "+location);
                tv_IFA_location.setText("" + location);
                tv_CA_location.setText("" + location);
                tv_Other_location.setText("" + location);

        //Dummy Data
        ArrayList<Medication> medicationList = new ArrayList<>();
        Medication medication = new Medication();
        Medication medication1 = new Medication();
        Medication medication2 = new Medication();
        Medication medication3 = new Medication();
        Medication medication4 = new Medication();
        Medication medication5 = new Medication();
        Medication medication6 = new Medication();
        Medication medication7 = new Medication();
        Medication medication8 = new Medication();
        Medication medication9 = new Medication();

        medication.setDrug_type(Constants.MEDICATION_DRUG_IFA);
        medication1.setDrug_type(Constants.MEDICATION_DRUG_IFA);
        medication2.setDrug_type(Constants.MEDICATION_DRUG_IFA);
        medication3.setDrug_type(Constants.MEDICATION_DRUG_IFA);

        medication.setSpinner_drug_name("IFA 100");
        medication1.setSpinner_drug_name("IFA 200");
        medication2.setSpinner_drug_name("IFA 300");
        medication3.setSpinner_drug_name("IFA 400");

        medication4.setDrug_type(Constants.MEDICATION_DRUG_CA);
        medication5.setDrug_type(Constants.MEDICATION_DRUG_CA);
        medication6.setDrug_type(Constants.MEDICATION_DRUG_OTHER);
        medication7.setDrug_type(Constants.MEDICATION_DRUG_OTHER);
        medication8.setDrug_type(Constants.MEDICATION_DRUG_OTHER);
        medication9.setDrug_type(Constants.MEDICATION_DRUG_OTHER);

        medication4.setSpinner_drug_name("CA 100");
        medication5.setSpinner_drug_name("CA 200");
        medication6.setSpinner_drug_name("Other 300");
        medication7.setSpinner_drug_name("Other 400");
        medication8.setSpinner_drug_name("Other 500");
        medication9.setSpinner_drug_name("Other 600");

        medicationList.add(medication);
        medicationList.add(medication1);
        medicationList.add(medication2);
        medicationList.add(medication3);
        medicationList.add(medication4);
        medicationList.add(medication5);
        medicationList.add(medication6);
        medicationList.add(medication7);
        medicationList.add(medication8);
        medicationList.add(medication9);

        //DatabaseHelper.getInstance(getActivity()).addDrugNameList(medicationList);

        mDrugsNameWithID = DatabaseHelper.getInstance(getActivity()).getDrugNameWithID();

        List<String> lstIFADrugNames = DatabaseHelper.getInstance(getActivity()).getDrugNameList(Constants.MEDICATION_DRUG_IFA);
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_spinner_item, lstIFADrugNames);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerIFADrugName.setAdapter(dataAdapter);

        List<String> lstCADrugNames = DatabaseHelper.getInstance(getActivity()).getDrugNameList(Constants.MEDICATION_DRUG_CA);
        ArrayAdapter<String> dataAdapter2 = new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_spinner_item, lstCADrugNames);
        dataAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerCADrugName.setAdapter(dataAdapter2);

        List<String> lstOtherDrugNames = DatabaseHelper.getInstance(getActivity()).getDrugNameList(Constants.MEDICATION_DRUG_OTHER);
        ArrayAdapter<String> dataAdapter3 = new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_spinner_item, lstOtherDrugNames);
        dataAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerOtherDrugName.setAdapter(dataAdapter3);

        List<String> lstQuantity = new ArrayList<>();
        for(int i=0; i<=500; ){

            lstQuantity.add(""+i);
            i = i + 10;
        }
        ArrayAdapter<String> dataAdapter4 = new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_spinner_item, lstQuantity);
        dataAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerIFAQnty.setAdapter(dataAdapter4);
        spinnerCAQnty.setAdapter(dataAdapter4);
        spinnerOtherQnty.setAdapter(dataAdapter4);
    }


}