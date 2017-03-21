package persistent.healthmon.fragments;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.FamilyInfoAdapterPreview;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.PatientPersonalInfoRegistration;
import persistent.healthmon.model.PatientAddressDetail;
import persistent.healthmon.model.PatientFamilyInfo;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.ProgramInfo;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.util.PreferanceManager;

/**
 * Created by khyati_shah on 3/30/2016.
 */
public class PreviewFragment extends Fragment implements PatientPersonalInfoRegistration {

    //RecyclerView lstFMlMembers;
    Button btnRegister;
    RecyclerView recyclerFamily;
    // Basic info txt
    TextView valSalutation, valFullName, valAgeGender, valDateOfBirth, valPlaceOfBirth, valMaritalStatus, valCategory, valBPL, valLanguage, valEducation, valCardType, valCardNumber;
    //Address info txt
    TextView valAddressLine1, valAddressLine2, valDistrict, valTaluka, valVillage, valWard, valPincode, valEmergencyContact, valContact;
    //Program Info
    TextView valProgram, valLMPDate, valEDDDate, valFirstPregnancy, valNotes, valGravida, valParity, valPastAbortons, valPastStillBirths, valLivingChildren, valPreviousDeliveryDate, valNatureofPreviousDelivery;
    ProgramInfo programInfo1;
    PatientPersonalInfo patientPersonalInfo1;
    PatientAddressDetail addressDetail1;
    ArrayList<PatientFamilyInfo> patientFamilyInfos1 = new ArrayList<PatientFamilyInfo>();
    FamilyInfoAdapterPreview familyInfoAdapterPreview;
    LinearLayout llFirstPrag;
    ProgressDialog progress;

    @Override

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onHiddenChanged(boolean hidden) {
        super.onHiddenChanged(hidden);
        //Toast.makeText(getActivity(), "Hidden called", Toast.LENGTH_LONG).show();
        if (!hidden) {
            setPersonlInfo();
            setProgramInfo();
            serAddInfo();
            setFamilyInfo();
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_preview, null);
        initView(view);
        btnRegister = (Button) view.findViewById(R.id.btnRegister);

        //lstFMlMembers = (RecyclerView) view.findViewById(R.id.lstFmlMembers);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        // lstFMlMembers.setLayoutManager(mLayoutManager);

        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (patientPersonalInfo1 == null) {
                    Toast.makeText(getActivity(), "Please fill all mandatory Data", Toast.LENGTH_LONG).show();
                    return;
                }
                if (addressDetail1 == null) {
                    Toast.makeText(getActivity(), "Please fill all mandatory Data", Toast.LENGTH_LONG).show();
                    return;
                }
                if (programInfo1 == null) {
                    Toast.makeText(getActivity(), "Please fill all mandatory Data", Toast.LENGTH_LONG).show();
                    return;
                }
                //Toast.makeText(getActivity(), "Patient Registered Successfully", Toast.LENGTH_LONG).show();
                progress = new ProgressDialog(getActivity());
                progress.setMessage(getActivity().getResources().getString(R.string.txtRegistreringPatient));
                progress.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                progress.setIndeterminate(true);
                progress.show();
                btnRegister.setEnabled(false);
                //DB calls insertion
                //Adding current time-stamp while registering patient
                patientPersonalInfo1.setTimeStamp(DateUtil.getCurrentTimeStamp());
                //setting priority of patient as normal [For first time registered patient, its always normal]
                DatabaseHelper.getInstance(getActivity()).updateOverallStatus(patientPersonalInfo1.getPatient_id());

                DatabaseHelper.getInstance(getActivity()).insertPatientPersonalInfo(patientPersonalInfo1, addressDetail1);
                for (int i = 0; i < patientFamilyInfos1.size(); i++) {
                    patientFamilyInfos1.get(i).setCategoryId(patientPersonalInfo1.getCategoryId());
                    patientFamilyInfos1.get(i).setTimestamp(DateUtil.getCurrentTimeStamp());
                    patientFamilyInfos1.get(i).setAshaId(patientPersonalInfo1.getAsha_id());
                    DatabaseHelper.getInstance(getActivity()).insertPatientFamilyInfo(patientFamilyInfos1.get(i));
                }
                programInfo1.setAshaId(patientPersonalInfo1.getAsha_id());
                programInfo1.setTimeStamp(DateUtil.getCurrentTimeStamp());
                DatabaseHelper.getInstance(getActivity()).insertPatientProgramInfo(programInfo1);
                //DB retrievals
                PatientPersonalInfo patientPersonalInfoTest = DatabaseHelper.getInstance(getActivity()).getPatient(patientPersonalInfo1.getPatient_id());
                PatientAddressDetail patientAddressDetail1 = DatabaseHelper.getInstance(getActivity()).getPatientAddress(patientPersonalInfo1.getPatient_id());
                ArrayList<PatientFamilyInfo> patientFamilyInfos1 = DatabaseHelper.getInstance(getActivity()).getPatientFamilyInfo(patientPersonalInfo1.getPatient_id());
                ProgramInfo programInfo1 = DatabaseHelper.getInstance(getActivity()).getPatientProgramInfo(patientPersonalInfo1.getPatient_id());

                //webservice calls
                ArrayList<PatientPersonalInfo> patientPersonalInfos = new ArrayList<PatientPersonalInfo>();
                patientPersonalInfos.add(patientPersonalInfo1);

                ArrayList<PatientAddressDetail> patientAddressDetails = new ArrayList<PatientAddressDetail>();
                patientAddressDetails.add(addressDetail1);

               WebserviceManager.insertPersonalInfo(getActivity(), patientPersonalInfos, patientAddressDetails, PreviewFragment.this);

            }
        });
        return view;
    }

    private void initView(View view) {
        valSalutation = (TextView) view.findViewById(R.id.valSalutation);
        valFullName = (TextView) view.findViewById(R.id.valFullName);
        valAgeGender = (TextView) view.findViewById(R.id.valAgeGender);
        valDateOfBirth = (TextView) view.findViewById(R.id.valDateOfBirth);
        valPlaceOfBirth = (TextView) view.findViewById(R.id.valPlaceOfBirth);
        valMaritalStatus = (TextView) view.findViewById(R.id.valMaritalStatus);
        valCategory = (TextView) view.findViewById(R.id.valCategory);
        valBPL = (TextView) view.findViewById(R.id.valBPL);
        valLanguage = (TextView) view.findViewById(R.id.valLanguage);
        valEducation = (TextView) view.findViewById(R.id.valEducation);
        valCardType = (TextView) view.findViewById(R.id.valCardType);
        valCardNumber = (TextView) view.findViewById(R.id.valCardNumber);
        valEmergencyContact = (TextView) view.findViewById(R.id.valEmergencyContact);
        valContact = (TextView) view.findViewById(R.id.valContact);
        setPersonlInfo();

        valAddressLine1 = (TextView) view.findViewById(R.id.valAddressLine1);
        valAddressLine2 = (TextView) view.findViewById(R.id.valAddressLine2);
        valDistrict = (TextView) view.findViewById(R.id.valDistrict);
        valTaluka = (TextView) view.findViewById(R.id.valTaluka);
        valVillage = (TextView) view.findViewById(R.id.valVillage);
        valWard = (TextView) view.findViewById(R.id.valWard);
        valPincode = (TextView) view.findViewById(R.id.valPincode);
        serAddInfo();

        valProgram = (TextView) view.findViewById(R.id.valProgram);
        valLMPDate = (TextView) view.findViewById(R.id.valLMPDate);
        valEDDDate = (TextView) view.findViewById(R.id.valEDDDate);
        valFirstPregnancy = (TextView) view.findViewById(R.id.valFirstPregnancy);
        valNotes = (TextView) view.findViewById(R.id.valNotes);
        llFirstPrag = (LinearLayout) view.findViewById(R.id.llFirstPrag);
        valGravida = (TextView) view.findViewById(R.id.valGravida);
        valParity = (TextView) view.findViewById(R.id.valParity);
        valPastAbortons = (TextView) view.findViewById(R.id.valPastAbortons);
        valPastStillBirths = (TextView) view.findViewById(R.id.valPastStillBirths);
        valLivingChildren = (TextView) view.findViewById(R.id.valLivingChildren);
        valPreviousDeliveryDate = (TextView) view.findViewById(R.id.valPreviousDeliveryDate);
        valNatureofPreviousDelivery = (TextView) view.findViewById(R.id.valNatureofPreviousDelivery);
        setProgramInfo();

        recyclerFamily = (RecyclerView) view.findViewById(R.id.recyclerFamily);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        recyclerFamily.setLayoutManager(mLayoutManager);
        setFamilyInfo();

    }

    private void setFamilyInfo() {
        //patientFamilyInfos1 = PreferanceManager.getPatientFamilyInfo(getActivity());
        patientFamilyInfos1.clear();
        patientFamilyInfos1.addAll(PreferanceManager.getPatientFamilyInfo(getActivity()));
        if (patientPersonalInfo1 != null) {
            for (int i = 0; i < patientFamilyInfos1.size(); i++) {
                patientFamilyInfos1.get(i).setPatient_id(patientPersonalInfo1.getPatient_id());
            }
        }
        if (familyInfoAdapterPreview == null) {
            familyInfoAdapterPreview = new FamilyInfoAdapterPreview(patientFamilyInfos1);
            recyclerFamily.setAdapter(familyInfoAdapterPreview);
        } else {
            familyInfoAdapterPreview.notifyDataSetChanged();
        }

    }

    private void setProgramInfo() {
        programInfo1 = PreferanceManager.getPatientProgramInfo(getActivity());
        if (programInfo1 != null) {
            if (patientPersonalInfo1 != null) {
                programInfo1.setPatientId(patientPersonalInfo1.getPatient_id());
            }
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
            valEDDDate.setText("");
            valFirstPregnancy.setText("");
            valNotes.setText("");
            llFirstPrag.setVisibility(View.GONE);
        }
    }

    private void setPersonlInfo() {
        patientPersonalInfo1 = PreferanceManager.getPatientPersonalInfo(getActivity());
        if (patientPersonalInfo1 != null) {
            valSalutation.setText(patientPersonalInfo1.getSalutation());
            valFullName.setText(patientPersonalInfo1.getFirstName() + " " + patientPersonalInfo1.getMiddleName() + " " + patientPersonalInfo1.getLastName());
            String gender = "";
            if (patientPersonalInfo1.getGenderId() == 1) {
                gender = getActivity().getResources().getString(R.string.txtFemale);
            } else {
                gender = getActivity().getResources().getString(R.string.txtMale);
            }
            valAgeGender.setText(patientPersonalInfo1.getAge() + " / " + gender);
            valDateOfBirth.setText(patientPersonalInfo1.getDob());
            valPlaceOfBirth.setText(patientPersonalInfo1.getPlace_of_birth());
            valMaritalStatus.setText(patientPersonalInfo1.getMarrital_status());
            valCategory.setText(DatabaseHelper.getInstance(getActivity()).getCastCategory(patientPersonalInfo1.getCategoryId()));
            valBPL.setText(((patientPersonalInfo1.isBpl()) ? "true" : "False"));
            valLanguage.setText(patientPersonalInfo1.getLanguage());
            valEducation.setText(patientPersonalInfo1.getEducation());
            valCardType.setText(DatabaseHelper.getInstance(getActivity()).getCardType(patientPersonalInfo1.getIdCardTypeId()));
            valCardNumber.setText(patientPersonalInfo1.getIdCardNumber());
            valEmergencyContact.setText(patientPersonalInfo1.getEm_contact());
            valContact.setText(patientPersonalInfo1.getContact());
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

    }

    private void serAddInfo() {
        addressDetail1 = PreferanceManager.getPatientAddressInfo(getActivity());
        if (addressDetail1 != null) {
            valAddressLine1.setText(addressDetail1.getAddr1());
            valAddressLine2.setText(addressDetail1.getAddr2());
            valDistrict.setText(DatabaseHelper.getInstance(getActivity()).getDistrict(addressDetail1.getDistrictId()));
            valTaluka.setText(DatabaseHelper.getInstance(getActivity()).getVillage(addressDetail1.getTalId()));
            valVillage.setText(DatabaseHelper.getInstance(getActivity()).getVillage(addressDetail1.getVillageId()));
            valWard.setText(String.valueOf(addressDetail1.getWard()));
            valPincode.setText(addressDetail1.getPin());
        } else {
            valAddressLine1.setText("");
            valAddressLine2.setText("");
            valDistrict.setText("");
            valTaluka.setText("");
            valVillage.setText("");
            valWard.setText("");
            valPincode.setText("");
        }
    }

    @Override
    public void onPatientPersonlInfoRegister() {
        ArrayList<ProgramInfo> programInfos = new ArrayList<ProgramInfo>();
        programInfos.add(programInfo1);
        WebserviceManager.insertPatientFamilyInfo(getActivity(), patientFamilyInfos1);
        WebserviceManager.insertProgramlInfo(getActivity(), programInfos);
        PreferanceManager.clearPatientRegistrationPreferances(getActivity());
        //Toast.makeText(getActivity(), "Patient Registered Successfully", Toast.LENGTH_LONG).show();
        showRegistrationSuccessfulDialog();
        progress.dismiss();
        btnRegister.setEnabled(true);
        clearAllChildFragments();
        HealthMonUtility.replaceFragment(getActivity(), new PatientRegistrationFragment());
    }

    private void clearAllChildFragments() {
        try {
            FragmentManager fragmentManager = getActivity().getSupportFragmentManager();
            List<Fragment> al = fragmentManager.getFragments();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            for (Fragment frag : al) {
                if (frag != null) {
                    fragmentTransaction.remove(frag);
                }
            }
            fragmentTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showRegistrationSuccessfulDialog() {
        TextView txtPatientId, txtPatientName;
        Button btnOk;
        final Dialog dialog = new Dialog(getActivity());
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_patient_successfuly_registered);
        txtPatientId = (TextView) dialog.findViewById(R.id.txtPatientId);
        txtPatientName = (TextView) dialog.findViewById(R.id.txtPatientName);
        txtPatientId.setText("PID: " + patientPersonalInfo1.getPatient_id());
        txtPatientName.setText(patientPersonalInfo1.getFirstName() + " " + patientPersonalInfo1.getLastName());
        btnOk = (Button) dialog.findViewById(R.id.btnOk);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.show();
    }
}
