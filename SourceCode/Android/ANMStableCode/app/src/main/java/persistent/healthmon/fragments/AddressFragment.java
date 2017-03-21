package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;


import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.SpinnerAdapter;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.PatientRegistrationTabChange;
import persistent.healthmon.model.PatientAddressDetail;
import persistent.healthmon.model.SpinerIdValue;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.util.PreferanceManager;

/**
 * Created by khyati_shah on 3/30/2016.
 */
public class AddressFragment extends Fragment implements View.OnClickListener {

    PatientRegistrationTabChange patientRegistrationTabChange;
    ArrayList<SpinerIdValue> districtLst = new ArrayList<SpinerIdValue>();
    ArrayList<SpinerIdValue> talukaLst = new ArrayList<SpinerIdValue>();
    ArrayList<SpinerIdValue> villageLst = new ArrayList<SpinerIdValue>();
    ArrayList<SpinerIdValue> pinLst = new ArrayList<SpinerIdValue>();
    SpinnerAdapter districtAdapter, talukaAdapter, villageApapter, pincodeAdapter;
    Button saveProceed;
    EditText edtAddLine1, edtAddLine2, edtWard;
    Spinner spinnerDistrict, spinnerTaluka, spinnerVillage, spinnerPincode;


    public AddressFragment(PatientRegistrationTabChange patientRegistrationTabChange) {
        this.patientRegistrationTabChange = patientRegistrationTabChange;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_address, null);
        initView(view);
        return view;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.saveProceed) {
            performSaveProceed();

        }
    }

    private void performSaveProceed() {

        PatientAddressDetail addressDetail = new PatientAddressDetail();
        if (edtAddLine1.getText() != null && !edtAddLine1.getText().toString().equalsIgnoreCase("")) {
            if (edtAddLine1.getText().toString().trim().length() < 10) {
                edtAddLine1.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtAddLine1.requestFocus();
                return;
            }
            addressDetail.setAddr1(edtAddLine1.getText().toString());
        } else {
            edtAddLine1.setError(getActivity().getString(R.string.txtEnterValue));
            edtAddLine1.requestFocus();
            return;
        }

        if (edtAddLine2.getText() != null && !edtAddLine2.getText().toString().equalsIgnoreCase("")) {
            if (edtAddLine2.getText().toString().trim().length() < 10) {
                edtAddLine2.setError(getActivity().getString(R.string.txtEnterCorrectValue));
                edtAddLine2.requestFocus();
                return;
            }
            addressDetail.setAddr2(edtAddLine2.getText().toString());
        } else {
            addressDetail.setAddr2("");
            /*edtAddLine2.setError(getActivity().getString(R.string.txtEnterValue));
            edtAddLine2.requestFocus();
            return;*/
        }

        if (edtWard.getText() != null && !edtWard.getText().toString().equalsIgnoreCase("")) {
            addressDetail.setWard(edtWard.getText().toString());
        } else {
            /*edtWard.setError(getActivity().getString(R.string.txtEnterValue));
            edtWard.requestFocus();
            return;*/
        }
        int selectedId = spinnerDistrict.getSelectedItemPosition();
        addressDetail.setDistrictId(districtLst.get(selectedId).getId());
        selectedId = spinnerTaluka.getSelectedItemPosition();
        addressDetail.setTalId(talukaLst.get(selectedId).getId());
        selectedId = spinnerVillage.getSelectedItemPosition();
        addressDetail.setVillageId(villageLst.get(selectedId).getId());
        selectedId = spinnerPincode.getSelectedItemPosition();
        addressDetail.setPin(pinLst.get(selectedId).getValue());
        addressDetail.setIs_Submitted(false);
        addressDetail.setIs_Uploaded(false);

        PreferanceManager.setPatientAddressInfo(getActivity(), addressDetail);
        PatientAddressDetail addressDetail1 = PreferanceManager.getPatientAddressInfo(getActivity());

        HealthMonUtility.reloadFragment(getActivity(), new ProgramInformationFragment(this.patientRegistrationTabChange)
                , R.id.patientRegistrationContiner);
        patientRegistrationTabChange.onTabChange(ProgramInformationFragment.class.toString());
    }

    private void initView(View view) {

        districtAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, districtLst);
        talukaAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, talukaLst);
        villageApapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, villageLst);
        pincodeAdapter = new SpinnerAdapter(getActivity(), R.layout.spinner_item, pinLst);

        districtLst.addAll(DatabaseHelper.getInstance(getActivity()).getDistrictForSpinner());
        districtAdapter.notifyDataSetChanged();
        if (districtLst.size() > 0) {
            talukaLst.clear();
            talukaLst.addAll(DatabaseHelper.getInstance(getActivity()).getCityForSpinner(districtLst.get(0).getId()));
        }
        if (talukaLst.size() > 0) {
            villageLst.clear();
            villageLst.addAll(DatabaseHelper.getInstance(getActivity()).getVillageForSpinner(talukaLst.get(0).getId()));
        }
        if (talukaLst.size() > 0) {
            pinLst.clear();
            pinLst.addAll(DatabaseHelper.getInstance(getActivity()).getPinForSpinner(talukaLst.get(0).getId()));
        }


        edtAddLine1 = (EditText) view.findViewById(R.id.edtAddLine1);
        edtAddLine2 = (EditText) view.findViewById(R.id.edtAddLine2);
        edtWard = (EditText) view.findViewById(R.id.edtWard);
        spinnerDistrict = (Spinner) view.findViewById(R.id.spinnerDistrict);
        spinnerDistrict.setAdapter(districtAdapter);
        spinnerDistrict.setOnItemSelectedListener(onItemSelectedListener);

        spinnerTaluka = (Spinner) view.findViewById(R.id.spinnerTaluka);
        spinnerTaluka.setAdapter(talukaAdapter);
        spinnerTaluka.setOnItemSelectedListener(onItemSelectedListener);

        spinnerVillage = (Spinner) view.findViewById(R.id.spinnerVillage);
        spinnerVillage.setAdapter(villageApapter);
        spinnerVillage.setOnItemSelectedListener(onItemSelectedListener);

        spinnerPincode = (Spinner) view.findViewById(R.id.spinnerPincode);
        spinnerPincode.setAdapter(pincodeAdapter);
        spinnerPincode.setOnItemSelectedListener(onItemSelectedListener);

        saveProceed = (Button) view.findViewById(R.id.saveProceed);
        saveProceed.setOnClickListener(this);
        if (PreferanceManager.getIsRegistrationSessionStored(getActivity())) {
            PatientAddressDetail patientAddressDetail = PreferanceManager.getPatientAddressInfo(getActivity());
            if (patientAddressDetail != null) {
                edtAddLine1.setText(patientAddressDetail.getAddr1());
                edtAddLine2.setText(patientAddressDetail.getAddr2());
                edtWard.setText(patientAddressDetail.getWard());
                spinnerDistrict.setSelection(HealthMonUtility.getSelectedPositionSpinner(districtLst, patientAddressDetail.getDistrictId()));
                spinnerTaluka.setSelection(HealthMonUtility.getSelectedPositionSpinner(talukaLst, patientAddressDetail.getTalId()));
                spinnerVillage.setSelection(HealthMonUtility.getSelectedPositionSpinner(villageLst, patientAddressDetail.getVillageId()));
                spinnerPincode.setSelection(HealthMonUtility.getSelectedPositionSpinner(spinnerPincode, patientAddressDetail.getPin()));
            }
        }
    }

    AdapterView.OnItemSelectedListener onItemSelectedListener = new AdapterView.OnItemSelectedListener() {
        @Override
        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
            if (parent.getId() == R.id.spinnerDistrict) {
                talukaLst.clear();
                villageLst.clear();
                pinLst.clear();
                if (districtLst.size() > 0) {
                    talukaLst.addAll(DatabaseHelper.getInstance(getActivity()).getCityForSpinner(districtLst.get(position).getId()));
                }
                talukaAdapter.notifyDataSetChanged();
                villageApapter.notifyDataSetChanged();
                pincodeAdapter.notifyDataSetChanged();
            }
            if (parent.getId() == R.id.spinnerTaluka) {
                villageLst.clear();
                pinLst.clear();

                if (talukaLst.size() > 0) {
                    villageLst.addAll(DatabaseHelper.getInstance(getActivity()).getVillageForSpinner(talukaLst.get(position).getId()));
                }
                if (talukaLst.size() > 0) {
                    pinLst.addAll(DatabaseHelper.getInstance(getActivity()).getPinForSpinner(talukaLst.get(position).getId()));
                }
                villageApapter.notifyDataSetChanged();
                pincodeAdapter.notifyDataSetChanged();
            }
            if (parent.getId() == R.id.spinnerVillage) {

            }
            if (parent.getId() == R.id.spinnerPincode) {

            }
        }


        @Override
        public void onNothingSelected(AdapterView<?> parent) {

        }
    };
}
