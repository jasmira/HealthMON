package persistent.healthmon.fragments;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

import com.navdrawer.SimpleSideDrawer;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.AllPatientAdapter;
import persistent.healthmon.adapter.MoListAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.OnMoSelected;
import persistent.healthmon.interfaces.OnPatientSelected;
import persistent.healthmon.interfaces.OnResult;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.ReferalAppoinment;
import persistent.healthmon.model.UserMO;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.IndividualPatientActivity;
import persistent.healthmon.viewcontroller.LandingScreenActivity;

public class AllPatientFragment extends Fragment implements OnPatientSelected, OnResult, OnMoSelected {

    Spinner spinnerSort;
    SearchView searchViewPatient;
    TextView txtHighRiskCount, txtModerateRiskCount, txtNormalCount;
    RecyclerView lstHighRiskPatient, lstModerateRiskPatient, lstNormalPatient;
    AllPatientAdapter highRiskPatientAdapter, moderateRiskPatientAdapter, normalPatientAdapter;
    ArrayList<PatientPersonalInfo> highRiskPatientInfos = new ArrayList<PatientPersonalInfo>();
    ArrayList<PatientPersonalInfo> moderateRiskPatientInfos = new ArrayList<PatientPersonalInfo>();
    ArrayList<PatientPersonalInfo> normalPatientInfos = new ArrayList<PatientPersonalInfo>();
    SimpleSideDrawer slide_me;
    int moPosition = 0;
    View view;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_all_patient, container, false);
        //view = inflater.inflate(R.layout.item_patient_card, container, false);
        slide_me = new SimpleSideDrawer(getActivity());
        //slide_me.setLeftBehindContentView(R.layout.left_menu);
        slide_me.setRightBehindContentView(R.layout.right_menu);
        initView(view);

        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        Intent intent = new Intent(getContext(), LandingScreenActivity.class);
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

        highRiskPatientAdapter = new AllPatientAdapter(highRiskPatientInfos, this);
        moderateRiskPatientAdapter = new AllPatientAdapter(moderateRiskPatientInfos, this);
        normalPatientAdapter = new AllPatientAdapter(normalPatientInfos, this);

        lstHighRiskPatient.setAdapter(highRiskPatientAdapter);
        lstModerateRiskPatient.setAdapter(moderateRiskPatientAdapter);
        lstNormalPatient.setAdapter(normalPatientAdapter);

        setPatientCount();
        WebserviceManager.getAllPatient(getActivity(), this);

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
                                                  /*        case 1:
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
                                                              break;*/
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


        Intent intent = new Intent(getContext(), IndividualPatientActivity.class);
        intent.putExtra(Constants.SELECTED_PATIENT_ID, patientPersonalInfo.getPatient_id());
        PreferanceManager.setStringPreferences(Constants.KEY_PATIENT_SELECTED,patientPersonalInfo.getPatient_id(),getContext());
        startActivity(intent);
     /*   IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
        Bundle args = new Bundle();
        args.putString(Constants.SELECTED_PATIENT_ID, patientPersonalInfo.getPatient_id());
        individualPatientTaskFragment.setArguments(args);
        //HealthMonUtility.addFragment(getActivity(), individualPatientTaskFragment);
        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

    }*/
    }

    @Override
    public void onMarkVisitSelected(final PatientPersonalInfo patientPersonalInfo) {
        slide_me.toggleRightDrawer();
        final ArrayList<UserMO> userMOs = DatabaseHelper.getInstance(getActivity()).getAllMo();
        final Dialog dialog = new Dialog(getActivity());
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_mo_list);
        RecyclerView lstMo = (RecyclerView) dialog.findViewById(R.id.lstMo);
        LinearLayoutManager layoutManager
                = new LinearLayoutManager(getActivity(), LinearLayoutManager.HORIZONTAL, false);
        lstMo.setLayoutManager(layoutManager);
        MoListAdapter moListAdapter = new MoListAdapter(userMOs, patientPersonalInfo, this);
        lstMo.setAdapter(moListAdapter);
        Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ReferalAppoinment referalAppoinment = new ReferalAppoinment();
                referalAppoinment.setMO_Id(userMOs.get(moPosition).getMoId());
                referalAppoinment.setPatientId(patientPersonalInfo.getPatient_id());
                referalAppoinment.setAppoinmentDate(DateUtil.getCurrentTimeStamp());
                referalAppoinment.setReffred("1");
                referalAppoinment.setAppoinmentFlag("1");
                referalAppoinment.setCreatedDate(DateUtil.getCurrentTimeStamp());
                referalAppoinment.setCreatedBy(PreferanceManager.getAshaId(getActivity()));
                referalAppoinment.setAcceptedFlag("0");
                WebserviceManager.addMOAppoinment(getActivity(), referalAppoinment);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    @Override
    public void onError(String message) {

    }

    @Override
    public void onResponse(String message) {
        highRiskPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_HIGH_RISK_PATIENT));
        moderateRiskPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_MODERATE_RISK_PATIENT));
        normalPatientInfos.addAll(DatabaseHelper.getInstance(getActivity()).getAllPatients(Constants.PRIORITY_NORMAL_PATIENT));
        highRiskPatientAdapter.notifyDataSetChanged();
        moderateRiskPatientAdapter.notifyDataSetChanged();
        normalPatientAdapter.notifyDataSetChanged();
    }

    @Override
    public void OnMoSelected(int position) {
        moPosition = position;
    }
}