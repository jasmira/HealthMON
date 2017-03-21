package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.interfaces.OnlineTrainingsTabChange;
import com.persistent.healthmon.util.HealthMonUtility;

import java.util.List;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class OnlineTrainingsFragment extends BaseFragment implements View.OnClickListener, OnlineTrainingsTabChange {

    Button btnInternalTrns, btnExternalTrns;
    Integer[] btnIds = {R.id.btnPatientInfo, R.id.btnAddress};
    View view;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_online_trainings, container, false);

        btnInternalTrns = (Button) view.findViewById(R.id.btnInternalTrns);
        btnExternalTrns = (Button) view.findViewById(R.id.btnExternalTrns);

        HealthMonUtility.replaceFragment(getActivity(), new InternalTrainingsFragment(this), R.id.onlineTrainingsContainer);
        btnInternalTrns.setOnClickListener(this);
        btnExternalTrns.setOnClickListener(this);
      /*view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {

                        getFragmentManager().popBackStack();
                        final EducationFragment fragment = new EducationFragment();
                        final FragmentTransaction transaction = getFragmentManager().beginTransaction();
                        transaction.replace(R.id.onlineTrainingsContainer, fragment);
                        //transaction.addToBackStack("OnlineTrainingsFragment");
                        transaction.commit();
                        //HealthMonUtility.replaceFragment(getActivity(), new EducationFragment(), R.id.onlineTrainingsContainer);

                        return true;
                    }
                }
                return false;
            }
        }); */
        return view;
    }

    @Override
    public void onPause() {
        super.onPause();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnInternalTrns) {
            HealthMonUtility.replaceFragment(getActivity(), new InternalTrainingsFragment(OnlineTrainingsFragment.this), R.id.onlineTrainingsContainer);
            FragmentManager fragmentManager = ((FragmentActivity) getActivity()).getSupportFragmentManager();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            fragmentTransaction.replace(R.id.onlineTrainingsContainer, new InternalTrainingsFragment(OnlineTrainingsFragment.this));
            btnInternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnInternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

            btnExternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnExternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));


        }
        if (v.getId() == R.id.btnExternalTrns) {
            HealthMonUtility.replaceFragment(getActivity(), new ExternalTrainingsFragment(OnlineTrainingsFragment.this), R.id.onlineTrainingsContainer);

            btnInternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnInternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnExternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnExternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));
        }

     }

    @Override
    public void onTabChange(String fragmentName) {
        if (fragmentName.equalsIgnoreCase(ExternalTrainingsFragment.class.toString())) {
            btnInternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.white));
            btnInternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));

            btnExternalTrns.setBackgroundColor(getActivity().getResources().getColor(R.color.colorBlue));
            btnExternalTrns.setTextColor(getActivity().getResources().getColor(R.color.colorWhite));

        }
    }
}

