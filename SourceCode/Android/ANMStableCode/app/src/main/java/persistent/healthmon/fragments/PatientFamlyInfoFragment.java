package persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Toast;



import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.PatientFamilyInfoAdapter;
import persistent.healthmon.adapter.SpinnerAdapter;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.FamilyInfoAdapterEdit;
import persistent.healthmon.interfaces.PatientRegistrationTabChange;
import persistent.healthmon.model.PatientFamilyInfo;
import persistent.healthmon.model.SpinerIdValue;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.util.PreferanceManager;

/**
 * Created by khyati_shah on 3/16/2016.
 */
public class PatientFamlyInfoFragment extends Fragment implements View.OnClickListener, FamilyInfoAdapterEdit {

    PatientRegistrationTabChange patientRegistrationTabChange;
    Button btnSaveProceed, btnFamilyAdd, btnFamilyClear, btnSkip;
    RadioGroup radioGroupGender, radioEducation;
    RecyclerView lstFamilyMember;
    ArrayList<PatientFamilyInfo> patientFamilyInfos;
    Spinner spinnerRelation, spinnerMarritalStatus, spinnerIdCardType;
    EditText edtFullName, txtDateOfBirth, edtAge, edtIdCardNum, edtContact;
    View view;
    PatientFamilyInfoAdapter familyInfoAdapter;
    RadioButton radioAge, radioDOB;
    private int position;
    PatientFamilyInfo patientFamilyInfoEdit;
    SpinnerAdapter idCardTypeAdapter;
    ArrayList<SpinerIdValue> cardTypes;

    public PatientFamlyInfoFragment(PatientRegistrationTabChange patientRegistrationTabChange) {
        this.patientRegistrationTabChange = patientRegistrationTabChange;
    }


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_patient_family_info, null);
        patientFamilyInfos = new ArrayList<PatientFamilyInfo>();
        initView(view);

        familyInfoAdapter = new PatientFamilyInfoAdapter(patientFamilyInfos, PatientFamlyInfoFragment.this);
        lstFamilyMember.setAdapter(familyInfoAdapter);

        return view;
    }

    private void initView(View view) {
        btnSaveProceed = (Button) view.findViewById(R.id.btnSaveProceed);
        btnFamilyClear = (Button) view.findViewById(R.id.btnFamilyClear);
        btnFamilyAdd = (Button) view.findViewById(R.id.btnFamilyAdd);
        btnSkip = (Button) view.findViewById(R.id.btnSkip);
        btnSkip.setOnClickListener(this);
        btnFamilyAdd.setOnClickListener(this);
        btnFamilyClear.setOnClickListener(this);
        edtFullName = (EditText) view.findViewById(R.id.edtFullName);
        lstFamilyMember = (RecyclerView) view.findViewById(R.id.lstFamilyMember);
        radioGroupGender = (RadioGroup) view.findViewById(R.id.radioGroupGender);
        radioEducation = (RadioGroup) view.findViewById(R.id.radioEducation);
        txtDateOfBirth = (EditText) view.findViewById(R.id.txtDateOfBirth);
        txtDateOfBirth.setOnClickListener(this);
        txtDateOfBirth.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                txtDateOfBirth.setError(null);
            }
        });
        btnSaveProceed.setOnClickListener(this);
        edtAge = (EditText) view.findViewById(R.id.edtAge);
        edtIdCardNum = (EditText) view.findViewById(R.id.edtIdCardNum);
        edtContact = (EditText) view.findViewById(R.id.edtContact);
        spinnerRelation = (Spinner) view.findViewById(R.id.spinnerRelation);
        spinnerMarritalStatus = (Spinner) view.findViewById(R.id.spinnerMarritalStatus);
        spinnerIdCardType = (Spinner) view.findViewById(R.id.spinnerIdCardType);
        cardTypes = DatabaseHelper.getInstance(getActivity()).getCardTypeForSpinner();
        idCardTypeAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, cardTypes);
        spinnerIdCardType.setAdapter(idCardTypeAdapter);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstFamilyMember.setLayoutManager(mLayoutManager);
        lstFamilyMember.addOnItemTouchListener(new RecyclerView.OnItemTouchListener() {
            @Override
            public boolean onInterceptTouchEvent(RecyclerView rv, MotionEvent e) {
                int action = e.getAction();
                switch (action) {
                    case MotionEvent.ACTION_MOVE:
                        rv.getParent().requestDisallowInterceptTouchEvent(true);
                        break;
                }
                return false;
            }

            @Override
            public void onTouchEvent(RecyclerView rv, MotionEvent e) {
                Toast.makeText(getActivity(), "touch", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {
                Toast.makeText(getActivity(), "disallow", Toast.LENGTH_SHORT).show();

            }
        });
        lstFamilyMember.setNestedScrollingEnabled(true);
        radioAge = (RadioButton) view.findViewById(R.id.radioAge);
        radioDOB = (RadioButton) view.findViewById(R.id.radioDOB);

        radioAge.setOnClickListener(radioDOBClickListener);
        radioDOB.setOnClickListener(radioDOBClickListener);
        radioAge.setChecked(false);
        edtAge.setEnabled(false);
        edtAge.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

        edtAge.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (radioAge.isChecked()) {
                    if (s != null && !s.toString().equalsIgnoreCase("")) {
                        String strDOB = DateUtil.getDateOfBirth(Integer.parseInt(s.toString()));
                        txtDateOfBirth.setText(strDOB);
                    }
                }
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });
        //check for shared preferances data
        if (PreferanceManager.getIsRegistrationSessionStored(getActivity())) {
            patientFamilyInfos = PreferanceManager.getPatientFamilyInfo(getActivity());
        }

    }

    View.OnClickListener radioDOBClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (v.getId() == R.id.radioAge) {
                if (radioAge.isChecked()) {
                    radioAge.setChecked(true);
                    radioDOB.setChecked(false);
                    edtAge.setEnabled(true);
                    edtAge.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                    txtDateOfBirth.setEnabled(false);
                    txtDateOfBirth.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                }
            }
            if (v.getId() == R.id.radioDOB) {
                if (radioDOB.isChecked()) {
                    radioDOB.setChecked(true);
                    radioAge.setChecked(false);
                    edtAge.setEnabled(false);
                    edtAge.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                    txtDateOfBirth.setEnabled(true);
                    txtDateOfBirth.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                }
            }
        }
    };

    private void saveAndProceed() {

        PreferanceManager.setPatientFamilyInfo(getActivity(), patientFamilyInfos);
        ArrayList<PatientFamilyInfo> patientFamilyInfos1 = PreferanceManager.getPatientFamilyInfo(getActivity());

        if (patientFamilyInfos.size() > 0) {
            HealthMonUtility.reloadFragment(getActivity(), new PreviewFragment(), R.id.patientRegistrationContiner);
            patientRegistrationTabChange.onTabChange(PreviewFragment.class.toString());
        } else {
            HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtErrAddMember));
        }
        //Webservice call
        //   WebserviceManager.insertPatientFamilyInfo(getActivity(), patientFamilyInfos);
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnSaveProceed) {
            saveAndProceed();
        }
        if (v.getId() == R.id.btnFamilyClear) {
            if (btnFamilyClear.getText().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtCancel))) {
                btnFamilyClear.setText(getActivity().getResources().getString(R.string.txtClear));
                btnFamilyAdd.setText(getActivity().getResources().getString(R.string.txtAdd));
            }
            clearData();
        }
        if (v.getId() == R.id.btnFamilyAdd) {
            if (btnFamilyAdd.getText().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtSave))) {
                addFamilyMember(true);
            } else {
                addFamilyMember(false);
            }

        }
        if (v.getId() == R.id.txtDateOfBirth) {
            HealthMonUtility.showDatePicker(getActivity(), myDateListener);
        }
        if (v.getId() == R.id.btnSkip) {
            HealthMonUtility.reloadFragment(getActivity(), new PreviewFragment(), R.id.patientRegistrationContiner);
            patientRegistrationTabChange.onTabChange(PreviewFragment.class.toString());
        }

    }

    private void clearData() {
        edtFullName.setText("");
        txtDateOfBirth.setText("");
        edtAge.setText("");
        edtIdCardNum.setText("");
        edtContact.setText("");
        spinnerIdCardType.setSelection(0);
        spinnerRelation.setSelection(0);
        spinnerMarritalStatus.setSelection(0);
    }

    private void addFamilyMember(boolean isEdit) {
        int id;
        RadioButton radioBtnSelected;
        PatientFamilyInfo patientFamilyInfo = new PatientFamilyInfo();
        if (isEdit) {
            patientFamilyInfo.setFamily_member_id(String.valueOf(patientFamilyInfos.size() + 1));
        } else {
            patientFamilyInfo.setFamily_member_id(String.valueOf(patientFamilyInfos.size() + 1));
        }
        if (edtFullName.getText() != null && !edtFullName.getText().toString().equalsIgnoreCase("")) {
            if (edtFullName.getText().toString().trim().length() < 10) {
                edtFullName.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtFullName.requestFocus();
                return;
            }
            patientFamilyInfo.setName(edtFullName.getText().toString());
        } else {
            edtFullName.setError(getActivity().getString(R.string.txtEnterValue));
            edtFullName.requestFocus();
            return;
        }

        id = radioGroupGender.getCheckedRadioButtonId();
        radioBtnSelected = (RadioButton) view.findViewById(id);
        if (radioBtnSelected.getText().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtFemale))) {
            patientFamilyInfo.setGenderId(1);
        } else {
            patientFamilyInfo.setGenderId(2);
        }
        if (txtDateOfBirth.getText() != null && !txtDateOfBirth.getText().toString().equalsIgnoreCase("")) {
            patientFamilyInfo.setDob(DateUtil.dateConvert(txtDateOfBirth.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd"));
        } else {
            txtDateOfBirth.setError(getActivity().getString(R.string.txtEnterValue));
            txtDateOfBirth.requestFocus();
            return;
        }

        if (edtAge.getText() != null && !edtAge.getText().toString().equalsIgnoreCase("")) {
            if (Integer.valueOf(edtAge.getText().toString()) < 0) {
                edtAge.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtAge.requestFocus();
                return;
            }
            patientFamilyInfo.setAge(Integer.parseInt(edtAge.getText().toString()));
        } else {
            edtAge.setError(getActivity().getString(R.string.txtEnterValue));
            edtAge.requestFocus();
            return;
        }
        patientFamilyInfo.setRelation_to_patient(spinnerRelation.getSelectedItem().toString());
        patientFamilyInfo.setMarrital_status(spinnerMarritalStatus.getSelectedItem().toString());
        id = radioEducation.getCheckedRadioButtonId();
        radioBtnSelected = (RadioButton) view.findViewById(id);
        patientFamilyInfo.setEducation(radioBtnSelected.getText().toString());
        int selectedId = spinnerIdCardType.getSelectedItemPosition();
        patientFamilyInfo.setIdCardTypeId(cardTypes.get(selectedId).getId());

        if (edtIdCardNum.getText() != null && !edtIdCardNum.getText().toString().equalsIgnoreCase("")) {
            //check for minumum value
            if (edtIdCardNum.getText().toString().trim().length() < 10) {
                edtIdCardNum.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtIdCardNum.requestFocus();
                return;
            }
            //check for maximum - maximum value fro Adhar card
            if (cardTypes.get(selectedId).getId() == 1) {
                if (edtIdCardNum.getText().toString().trim().length() < 12 || edtIdCardNum.getText().toString().trim().length() > 12) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtAadharCardShouldbeof12Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }

            //check for maximum - maximum value fro Ration Card
            if (spinnerIdCardType.getSelectedItem().toString().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtRationCard))) {
                if (edtIdCardNum.getText().toString().trim().length() < 12 || edtIdCardNum.getText().toString().trim().length() > 12) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtRationCardShouldbeof12Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }

            //check for maximum - maximum value fro Ration Card
            if (cardTypes.get(selectedId).getId() == 2) {
                if (edtIdCardNum.getText().toString().trim().length() < 10 || edtIdCardNum.getText().toString().trim().length() > 20) {
                    edtIdCardNum.setError(getActivity().getString(R.string.txtPanCardShouldbeof10to20Digits));
                    edtIdCardNum.requestFocus();
                    return;
                }
            }


            patientFamilyInfo.setIdCardNumber(edtIdCardNum.getText().toString());

        } else {
            edtIdCardNum.setError(getActivity().getString(R.string.txtEnterValue));
            edtIdCardNum.requestFocus();
            return;
        }
        if (edtContact.getText() != null && !edtContact.getText().toString().equalsIgnoreCase("")) {
            if (edtContact.getText().toString().length() < 10) {
                edtContact.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtContact.requestFocus();
                return;
            }
            patientFamilyInfo.setContact(edtContact.getText().toString());
        } else {
            edtContact.setError(getActivity().getString(R.string.txtEnterValue));
            edtContact.requestFocus();
            return;
        }
        for (int i = 0; i < patientFamilyInfos.size(); i++) {
            if (edtIdCardNum.getText().toString().equals(patientFamilyInfos.get(i).getIdCardNumber())) {
                if (isEdit && position == i) {

                } else {
                    if (spinnerIdCardType.getSelectedItem().toString().equals(getActivity().getResources().getString(R.string.txtRationCard))) {
                        if (edtFullName.getText().toString().equalsIgnoreCase(patientFamilyInfos.get(i).getName())) {
                            HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtFamilyMemberAlreadyExsist));
                            return;
                        }
                    } else {
                        HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtFamilyMemberAlreadyExsist));
                        return;
                    }
                }
            }
        }
        patientFamilyInfo.setIs_Submitted(false);
        patientFamilyInfo.setIs_Uploaded(false);
        if (isEdit) {
            btnFamilyClear.setText(getActivity().getResources().getString(R.string.txtClear));
            btnFamilyAdd.setText(getActivity().getResources().getString(R.string.txtAdd));
            patientFamilyInfos.remove(position);
            patientFamilyInfos.add(position, patientFamilyInfo);
        } else {
            patientFamilyInfos.add(patientFamilyInfo);
        }
        familyInfoAdapter.notifyDataSetChanged();
        clearData();
    }

    private DatePickerDialog.OnDateSetListener myDateListener = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            int age = DateUtil.getAge(arg3 + "-" + arg2 + "-" + arg1);
            if (age < 0) {
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtIncorrectDateOfBirth));
                txtDateOfBirth.requestFocus();
                return;
            }
            txtDateOfBirth.setText(arg3 + "-" + arg2 + "-" + arg1);
            edtAge.setText(String.valueOf(age));
        }
    };

    @Override
    public void onEdit(int position) {
        this.position = position;
        btnFamilyAdd.setText(getActivity().getResources().getString(R.string.txtSave));
        btnFamilyClear.setText(getActivity().getResources().getString(R.string.txtCancel));
        patientFamilyInfoEdit = patientFamilyInfos.get(position);
        edtFullName.setText(patientFamilyInfoEdit.getName());
        if (patientFamilyInfoEdit.getGenderId() == 1) {
            radioGroupGender.check(R.id.radioFemale);
        } else {
            radioGroupGender.check(R.id.radioMale);
        }
        txtDateOfBirth.setText(DateUtil.dateConvert(patientFamilyInfoEdit.getDob(), "yyyy-MM-dd", "dd-MM-yyyy"));
        edtAge.setText(String.valueOf(patientFamilyInfoEdit.getAge()));
        spinnerRelation.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerRelation, patientFamilyInfoEdit.getRelation_to_patient()));
        spinnerMarritalStatus.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerMarritalStatus, patientFamilyInfoEdit.getMarrital_status()));
        spinnerIdCardType.setSelection(HealthMonUtility.getSelectedPositionSpinner(cardTypes, patientFamilyInfoEdit.getIdCardTypeId()));
        if (patientFamilyInfoEdit.getEducation().equalsIgnoreCase(getActivity().getResources().getString(R.string.txtLiterate))) {
            radioEducation.check(R.id.radioLiterate);
        } else {
            radioEducation.check(R.id.radioIlliterate);
        }
        edtIdCardNum.setText(patientFamilyInfoEdit.getIdCardNumber());
        edtContact.setText(patientFamilyInfoEdit.getContact());
    }
}
