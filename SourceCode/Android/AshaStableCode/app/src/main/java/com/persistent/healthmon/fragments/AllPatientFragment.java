package com.persistent.healthmon.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.Comparators.PatientAgeComparator;
import com.persistent.healthmon.Comparators.PatientEDDComparator;
import com.persistent.healthmon.Comparators.PatientLocalityComparator;
import com.persistent.healthmon.Comparators.PatientRecentlyAddedComparator;
import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.AllPatientAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.OnPatientSelected;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.viewcontroller.HealthMonMainActivity;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by khyati_shah on 3/28/2016.
 */
public class AllPatientFragment extends BaseFragment implements OnPatientSelected {

    Spinner spinnerSort;
    SearchView searchViewPatient;
    TextView txtHighRiskCount, txtModerateRiskCount, txtNormalCount;
    RecyclerView lstHighRiskPatient, lstModerateRiskPatient, lstNormalPatient;
    AllPatientAdapter highRiskPatientAdapter, moderateRiskPatientAdapter, normalPatientAdapter;
    ArrayList<PatientPersonalInfo> highRiskPatientInfos = new ArrayList<PatientPersonalInfo>();
    ArrayList<PatientPersonalInfo> moderateRiskPatientInfos = new ArrayList<PatientPersonalInfo>();
    ArrayList<PatientPersonalInfo> normalPatientInfos = new ArrayList<PatientPersonalInfo>();
    View view;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_all_patient, container, false);
        initView(view);
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        Intent intent = new Intent(getContext(), HealthMonMainActivity.class);
                        startActivity(intent);
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    private void initView(View view) {
        spinnerSort = (Spinner) view.findViewById(R.id.spinnerSort);
        searchViewPatient = (SearchView) view.findViewById(R.id.searchViewPatient);
        lstHighRiskPatient = (RecyclerView) view.findViewById(R.id.lstHighRiskPatient);
        lstModerateRiskPatient = (RecyclerView) view.findViewById(R.id.lstModerateRiskPatient);
        lstNormalPatient = (RecyclerView) view.findViewById(R.id.lstNormalPatient);
        txtHighRiskCount = (TextView) view.findViewById(R.id.txtHighRiskCount);
        txtModerateRiskCount = (TextView) view.findViewById(R.id.txtModerateRiskCount);
        txtNormalCount = (TextView) view.findViewById(R.id.txtNormalCount);

        lstHighRiskPatient.setLayoutManager(new GridLayoutManager(getActivity(), 3));
        lstModerateRiskPatient.setLayoutManager(new GridLayoutManager(getActivity(), 3));
        lstNormalPatient.setLayoutManager(new GridLayoutManager(getActivity(), 3));

        highRiskPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_HIGH_RISK_PATIENT));
        moderateRiskPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_MODERATE_RISK_PATIENT));
        normalPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_NORMAL_PATIENT));

        highRiskPatientAdapter = new AllPatientAdapter(highRiskPatientInfos, this);
        moderateRiskPatientAdapter = new AllPatientAdapter(moderateRiskPatientInfos, this);
        normalPatientAdapter = new AllPatientAdapter(normalPatientInfos, this);

        lstHighRiskPatient.setAdapter(highRiskPatientAdapter);
        lstModerateRiskPatient.setAdapter(moderateRiskPatientAdapter);
        lstNormalPatient.setAdapter(normalPatientAdapter);

        setPatientCount();


        searchViewPatient.setOnQueryTextListener(new SearchView.OnQueryTextListener() {

            @Override
            public boolean onQueryTextSubmit(String query) {
                // TODO Auto-generated method stub

                /*Toast.makeText(getActivity(), query,
                        Toast.LENGTH_SHORT).show();*/

                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                // TODO Auto-generated method stub
                highRiskPatientAdapter.filter(newText);
                moderateRiskPatientAdapter.filter(newText);
                normalPatientAdapter.filter(newText);
                setPatientCount();
                return false;
            }
        });


        spinnerSort.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()

                                              {
                                                  @Override
                                                  public void onItemSelected(AdapterView<?> parentView, View selectedItemView,
                                                                             int position, long id) {
                                                      switch (position) {
                                                          case 0:
                                                              break;
                                                          case 1:
                                                              Collections.sort(highRiskPatientInfos, new PatientRecentlyAddedComparator());
                                                              Collections.sort(moderateRiskPatientInfos, new PatientRecentlyAddedComparator());
                                                              Collections.sort(normalPatientInfos, new PatientRecentlyAddedComparator());
                                                              break;
                                                          case 2:
                                                              Collections.sort(highRiskPatientInfos, new PatientEDDComparator());
                                                              Collections.sort(moderateRiskPatientInfos, new PatientEDDComparator());
                                                              Collections.sort(normalPatientInfos, new PatientEDDComparator());
                                                              break;
                                                          case 3:
                                                              Collections.sort(highRiskPatientInfos, new PatientLocalityComparator());
                                                              Collections.sort(moderateRiskPatientInfos, new PatientLocalityComparator());
                                                              Collections.sort(normalPatientInfos, new PatientLocalityComparator());
                                                              break;
                                                          case 4:
                                                              Collections.sort(highRiskPatientInfos, new PatientAgeComparator());
                                                              Collections.sort(moderateRiskPatientInfos, new PatientAgeComparator());
                                                              Collections.sort(normalPatientInfos, new PatientAgeComparator());
                                                              break;
                                                          case 5:
                                                              Toast.makeText(getActivity(), "Coming soon", Toast.LENGTH_LONG).show();
                                                              break;
                                                      }
                                                      highRiskPatientAdapter.notifyDataSetChanged();
                                                      moderateRiskPatientAdapter.notifyDataSetChanged();
                                                      normalPatientAdapter.notifyDataSetChanged();
                                                  }

                                                  @Override
                                                  public void onNothingSelected(AdapterView<?> parentView) {

                                                  }

                                              }

        );

    }

    private void setPatientCount() {
        txtHighRiskCount.setText("(" + highRiskPatientInfos.size() + ")");
        txtModerateRiskCount.setText("(" + moderateRiskPatientInfos.size() + ")");
        txtNormalCount.setText("(" + normalPatientInfos.size() + ")");
    }

    @Override
    public void onPatientSelected(PatientPersonalInfo patientPersonalInfo) {
        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
        Bundle args = new Bundle();
        args.putString(Constants.SELECTED_PATIENT_ID, patientPersonalInfo.getPatient_id());
        individualPatientTaskFragment.setArguments(args);
        //HealthMonUtility.addFragment(getActivity(), individualPatientTaskFragment);
        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);
        //FragmentManager fragmentManager = ((FragmentActivity) getActivity()).getSupportFragmentManager();
        //FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        //fragmentTransaction.replace(R.id.allPatients,individualPatientTaskFragment );//.addToBackStack("ExternalTrainingsFragment");
        //fragmentTransaction.addToBackStack(null);
        //fragmentTransaction.commit();
    }

    private void referToDoc() {

    }

}
