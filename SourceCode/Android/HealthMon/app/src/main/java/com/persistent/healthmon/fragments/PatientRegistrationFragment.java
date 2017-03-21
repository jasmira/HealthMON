package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.persistent.healthmon.R;
import com.persistent.healthmon.interfaces.PatientRegistrationTabChange;
import com.persistent.healthmon.util.HealthMonUtility;

import java.util.List;

/**
 * Created by khyati_shah on 3/14/2016.
 */
public class PatientRegistrationFragment extends BaseFragment implements View.OnClickListener, PatientRegistrationTabChange {

    Button btnPatientInfo, btnAddress, btnProgramInfo, btnFamilyInfo, btnPreview;
    Integer[] btnIds = {R.id.btnPatientInfo, R.id.btnAddress, R.id.btnProgramInfo, R.id.btnFamilyInfo, R.id.btnPreview};
    View view;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_patient_registration, null);
       /* if(view.getParent()!=null){
            ((ViewGroup)view.getParent()).removeView(view);
        }*/
        btnPatientInfo = (Button) view.findViewById(R.id.btnPatientInfo);
        btnAddress = (Button) view.findViewById(R.id.btnAddress);
        btnProgramInfo = (Button) view.findViewById(R.id.btnProgramInfo);
        btnFamilyInfo = (Button) view.findViewById(R.id.btnFamilyInfo);
        btnPreview = (Button) view.findViewById(R.id.btnPreview);
        //adding first fragment [patient personal info]
        //HealthMonUtility.addFragment(getActivity(), new PatientPersonalInfoFragment(), R.id.patientRegistrationContiner);
        HealthMonUtility.reloadFragment(getActivity(), new PatientPersonalInfoFragment(this), R.id.patientRegistrationContiner);
        //HealthMonUtility.reloadFragment(getActivity(), new PatientPersonalInfoFragment(), R.id.patientRegistrationContiner);
        btnPatientInfo.setOnClickListener(this);
        btnAddress.setOnClickListener(this);
        btnProgramInfo.setOnClickListener(this);
        btnFamilyInfo.setOnClickListener(this);
        btnPreview.setOnClickListener(this);

        return view;
    }

    @Override
    public void onPause() {
        super.onPause();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        //   Toast.makeText(getActivity(), "on Destroy called", Toast.LENGTH_LONG).show();
        clearAllChildFragments();
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnPatientInfo) {
            //HealthMonUtility.reloadFragment(getActivity(), new PatientPersonalInfoFragment(), R.id.patientRegistrationContiner);

            HealthMonUtility.reloadFragment(getActivity(), new PatientPersonalInfoFragment(PatientRegistrationFragment.this), R.id.patientRegistrationContiner);
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

        }
        if (v.getId() == R.id.btnAddress) {
            HealthMonUtility.reloadFragment(getActivity(), new AddressFragment(PatientRegistrationFragment.this), R.id.patientRegistrationContiner);
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }
        if (v.getId() == R.id.btnProgramInfo) {
            HealthMonUtility.reloadFragment(getActivity(), new ProgramInformationFragment(PatientRegistrationFragment.this), R.id.patientRegistrationContiner);
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }
        if (v.getId() == R.id.btnFamilyInfo) {
            HealthMonUtility.reloadFragment(getActivity(), new PatientFamlyInfoFragment(PatientRegistrationFragment.this), R.id.patientRegistrationContiner);
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }
        if (v.getId() == R.id.btnPreview) {
            HealthMonUtility.reloadFragment(getActivity(), new PreviewFragment(), R.id.patientRegistrationContiner);
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
        }
    }


    private void clearAllChildFragments() {
        try {
            FragmentManager fragmentManager = getActivity().getSupportFragmentManager();
            List<Fragment> al = fragmentManager.getFragments();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            for (Fragment frag : al) {
                if (frag != null) {
                    if (!(frag instanceof PatientRegistrationFragment))
                        fragmentTransaction.remove(frag);
                }
            }
            fragmentTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onTabChange(String fragmentName) {
        if (fragmentName.equalsIgnoreCase(AddressFragment.class.toString())) {
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }

        if (fragmentName.equalsIgnoreCase(ProgramInformationFragment.class.toString())) {
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }
        if (fragmentName.equalsIgnoreCase(PatientFamlyInfoFragment.class.toString())) {
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
        }
        if (fragmentName.equalsIgnoreCase(PreviewFragment.class.toString())) {
            btnPatientInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnPatientInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnAddress.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnAddress.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnProgramInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnProgramInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnFamilyInfo.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnFamilyInfo.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnPreview.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnPreview.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
        }
    }
}
