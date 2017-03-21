package persistent.healthmon.viewcontroller;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.IndividualPatientOptionLoad;
import persistent.healthmon.adapter.MedicationAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.AshaDetails;
import persistent.healthmon.model.Medication;
import persistent.healthmon.placeholder.MedicationViewAll;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.HealthMonLog;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.util.PreferanceManager;

public class MedicationActivity extends AppCompatActivity  implements View.OnClickListener{

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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_medication);
        tv_task = (TextView)findViewById(R.id.tv_task_header_name);
        ifa_given = (TextView) findViewById(R.id.tvIFAGiventext);
        ca_given = (TextView) findViewById(R.id.tvCalciumGiventext);
        iv_task = (ImageView) findViewById(R.id.iv_task_header);
        btn_view_all = (TextView) findViewById(R.id.btnViewAll);
        btn_view_all.setOnClickListener(this);

        //tv_task.setText(getString(R.string.txtMedication));
        //iv_task.setImageResource(R.drawable.ic_medication);

        mOtherLst = (RecyclerView) findViewById(R.id.lstMedicationOther);
        tv_IFAGivenBy = (TextView) findViewById(R.id.tvIFAgivenBy);
        tv_IFA_Role = (TextView) findViewById(R.id.tvIFARole);
        tv_IFA_location = (TextView) findViewById(R.id.tvIFALocation);
        tv_IFA_Due_date = (TextView) findViewById(R.id.tvIFADueDate);
        tv_CAGivenBy = (TextView) findViewById(R.id.tvCAGivenBy);
        tv_CA_Role = (TextView) findViewById(R.id.tvCARole);
        tv_CA_location = (TextView) findViewById(R.id.tvCALocation);
        tv_CA_Due_date = (TextView) findViewById(R.id.tvCADueDate);
        tv_OtherGivenBy = (TextView) findViewById(R.id.tvAddOtherGivenBy);
        tv_Other_Role = (TextView) findViewById(R.id.tvAddOtherRole);
        tv_Other_location = (TextView)findViewById(R.id.tvAddOtherLocation);

        //spinnerIFADrugName = (Spinner)findViewById(R.id.spinnerIFAType);
        spinnerIFAQnty = (Spinner) findViewById(R.id.spinnerIFAQntyType);
       // spinnerCADrugName = (Spinner) findViewById(R.id.spinnerCAType);
        spinnerCAQnty = (Spinner) findViewById(R.id.spinnerCAQntymType);
        spinnerOtherDrugName = (Spinner) findViewById(R.id.spinnerOtherType);
        spinnerOtherQnty = (Spinner) findViewById(R.id.spinnerOtherQntymType);

        btn_Add_Other = (TextView) findViewById(R.id.btnMOtherAdd);
        btn_Save = (Button) findViewById(R.id.btn_medication_save);
        btn_Add_Other.setOnClickListener(this);
        btn_Save.setOnClickListener(this);
        //btn_cancel = (Button) findViewById(R.id.btn_medication_cancel);

        //Insert Medication ans call
        ArrayList<Medication> medicationRslt = new ArrayList<>();
        medicationRslt = DatabaseHelper.getInstance(this).getMedicationDetails("-1");
        WebserviceManager.insertPatientMedication(MedicationActivity.this, medicationRslt);

        tv_IFAGivenBy.setText(""+ PreferanceManager.getAshaId(this));
        tv_CAGivenBy.setText(""+PreferanceManager.getAshaId(this));
        tv_OtherGivenBy.setText(""+PreferanceManager.getAshaId(this));


        tv_IFA_Role.setText(""+getString(R.string.txtAsha));
        tv_CA_Role.setText(""+getString(R.string.txtAsha));
        tv_Other_Role.setText(""+getString(R.string.txtAsha));


        //location  = DatabaseHelper.getInstance(getContext()).getVillage(patientAddressDetail.getVillageId());
        AshaDetails ashaDetails = DatabaseHelper.getInstance(this).getAshaDetails(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",this));
//        location  = ashaDetails.getAddress();
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


        mDrugsNameWithID = DatabaseHelper.getInstance(this).getDrugNameWithID();

        List<String> lstIFADrugNames = DatabaseHelper.getInstance(this).getDrugNameList(Constants.MEDICATION_DRUG_IFA);
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, lstIFADrugNames);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
//        spinnerIFADrugName.setAdapter(dataAdapter);

        List<String> lstCADrugNames = DatabaseHelper.getInstance(this).getDrugNameList(Constants.MEDICATION_DRUG_CA);
        ArrayAdapter<String> dataAdapter2 = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, lstCADrugNames);
        dataAdapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
//        spinnerCADrugName.setAdapter(dataAdapter2);

        List<String> lstOtherDrugNames = DatabaseHelper.getInstance(this).getDrugNameList(Constants.MEDICATION_DRUG_OTHER);
        ArrayAdapter<String> dataAdapter3 = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, lstOtherDrugNames);
        dataAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerOtherDrugName.setAdapter(dataAdapter3);

        List<String> lstQuantity = new ArrayList<>();
        for(int i=0; i<=500; ){

            lstQuantity.add(""+i);
            i = i + 10;
        }
        ArrayAdapter<String> dataAdapter4 = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, lstQuantity);
        dataAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerIFAQnty.setAdapter(dataAdapter4);
        spinnerCAQnty.setAdapter(dataAdapter4);
        spinnerOtherQnty.setAdapter(dataAdapter4);


        ArrayList<Medication> dbLstMedication = DatabaseHelper.getInstance(this).getMedicationDetails("");
        Collections.sort(dbLstMedication,Medication.medicationDATE);
        for (Medication patientVitals1 : dbLstMedication) {
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
    }
    @Override
    public void onClick(View v) {
        {
            if(v.getId() == R.id.btnViewAll){
                final MedicationViewAll popupWindow = new MedicationViewAll(this,value);
                popupWindow.show(v, 0, 0);
                //layout_MainMenu.getForeground().setAlpha(150);
                View container = (View) popupWindow.getContentView().getParent();
                WindowManager wm = (WindowManager) this.getSystemService(Context.WINDOW_SERVICE);
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
                    mOther.setPatient_id("asha1494");
                    mOther.setDrug_name(drugName);
                    mOther.setMedicine_qty(drugQty);
                    for(Medication medication:mDrugsNameWithID ){
                        if(medication.getDrug_name().equalsIgnoreCase(drugName)){
                            mOther.setDrug_id(medication.getDrug_id());
                        }
                    }
                    mOther.setGiven_by(PreferanceManager.getAshaId(this));
                    mOther.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",this ));
                    mOther.setRole("ANM");
                    mOther.setLocation("Pune");
                    mOther.setDrug_type(Constants.MEDICATION_DRUG_OTHER);
                    mOtherDrugs.add(mOther);
                }
                if(drugQty.equalsIgnoreCase("0")){
                    HealthMonUtility.showErrorDialog(this, getString(R.string.txtTaskBPDataNotValid));
                }else if(cnt == 0) {
                    medicationAdapter = new MedicationAdapter(mOtherDrugs);
                    RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(this);
                    mOtherLst.setLayoutManager(mLayoutManager);
                    mOtherLst.setAdapter(medicationAdapter);
                    cnt++;
                }else{
                    medicationAdapter.notifyDataSetChanged();
                }
            }
            if(v.getId() == R.id.btn_medication_save){
                Log.d("Drug name ","123");

                performSave();
            }


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
        Log.d("Drug name ",ifaQty + "dswdw " + caQty);

        if(!(ifaQty.equalsIgnoreCase("0"))){
            String ifaDrug = "IFA";
            Medication medIFA = new Medication();
            medIFA.setPatient_id("asha1494");
            medIFA.setDrug_name(ifaDrug);
            for(Medication medication:mDrugsNameWithID ){
                if(medication.getDrug_name().equalsIgnoreCase(ifaDrug)){
                    medIFA.setDrug_id(medication.getDrug_id());
               }
            }
            medIFA.setMedicine_qty(ifaQty);
            medIFA.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",this ));
            medIFA.setGiven_by(PreferanceManager.getAshaId(this));
            medIFA.setRole("ANM");
            medIFA.setLocation(location);
            medIFA.setDrug_type(Constants.MEDICATION_DRUG_IFA);
            saveLstMedication.add(medIFA);
        }
        if(!(caQty.equalsIgnoreCase("0"))){
            String caDrug = "Calcium";
            Medication caIFA = new Medication();
            caIFA.setPatient_id("asha1494");
            caIFA.setDrug_name(caDrug);
            caIFA.setMedicine_qty(caQty);
            for(Medication medication:mDrugsNameWithID ){
                if(medication.getDrug_name().equalsIgnoreCase(caDrug)){
                    caIFA.setDrug_id(medication.getDrug_id());
                }
           }
            caIFA.setUser_ID(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "",this ));
            caIFA.setGiven_by(PreferanceManager.getAshaId(this));
            caIFA.setRole("ANM");
            caIFA.setLocation(location);
            caIFA.setDrug_type(Constants.MEDICATION_DRUG_CA);
            saveLstMedication.add(caIFA);
        }

        if (!saveLstMedication.isEmpty()) {
            final Dialog dialog = new Dialog(this);
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
                    DatabaseHelper.getInstance(MedicationActivity.this).addMedicationDetails(finalSaveLstMedication);


                }
            });
            dialog.show();

            //HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataInserted));

            //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientBPFragment.this).commit();
            //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
        } else {
            HealthMonUtility.showErrorDialog(this, getString(R.string.txtTaskBPDataNotValid));
        }

    }

}

