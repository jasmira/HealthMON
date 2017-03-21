package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.adapter.DashboardAlertsAdapter;
import persistent.healthmon.adapter.DashboardUpcomingTaskAdapter;
import persistent.healthmon.adapter.DocPatientListPagerAdapter;
import persistent.healthmon.model.DocPatientInfo;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.Tasks;
import persistent.healthmon.util.Constants;

/**
 * Created by khyati_shah on 6/14/2016.
 */
public class DashboardFragment extends Fragment {

    ArrayList<DocPatientInfo> docPatientInfos = new ArrayList<DocPatientInfo>();
    ArrayList<PatientPersonalInfo> patientPersonalInfos = new ArrayList<PatientPersonalInfo>();
    TextView txtPatientCount, txtAlertsCount, txtLogDate, txtUpcomingTaskCount;
    RecyclerView lstAlerts, lstUpcommingTask;
    ViewPager vpPager;
    TabLayout tabLayout;
    SearchView searchViewPatient;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dashboard, null);
        initView(view);
        return view;
    }

    private void initView(View view) {

        txtPatientCount = (TextView) view.findViewById(R.id.txtPatientCount);
        txtAlertsCount = (TextView) view.findViewById(R.id.txtAlertsCount);
        txtLogDate = (TextView) view.findViewById(R.id.txtLogDate);
        txtUpcomingTaskCount = (TextView) view.findViewById(R.id.txtUpcomingTaskCount);
        lstAlerts = (RecyclerView) view.findViewById(R.id.lstAlerts);
        lstUpcommingTask = (RecyclerView) view.findViewById(R.id.lstUpcommingTask);
        vpPager = (ViewPager) view.findViewById(R.id.vpDocPatientList);
        searchViewPatient = (SearchView) view.findViewById(R.id.searchViewPatient);

        PatientPersonalInfo patientPersonalInfo1 = new PatientPersonalInfo();
        patientPersonalInfo1.setPatient_id("Asha1234");
        patientPersonalInfo1.setFirstName("Radha");
        patientPersonalInfo1.setLastName("Jadhav");
        patientPersonalInfo1.setPriority(Constants.PRIORITY_HIGH_RISK_PATIENT);
        patientPersonalInfos.add(patientPersonalInfo1);

        PatientPersonalInfo patientPersonalInfo3 = new PatientPersonalInfo();
        patientPersonalInfo3.setPatient_id("Asha1234");
        patientPersonalInfo3.setFirstName("Radha");
        patientPersonalInfo3.setLastName("Jadhav");
        patientPersonalInfo3.setPriority(Constants.PRIORITY_MODERATE_RISK_PATIENT);
        patientPersonalInfos.add(patientPersonalInfo3);

        PatientPersonalInfo patientPersonalInfo2 = new PatientPersonalInfo();
        patientPersonalInfo2.setPatient_id("Asha1234");
        patientPersonalInfo2.setFirstName("Radha gfgggggsg sgg");
        patientPersonalInfo2.setLastName("Jadhav");
        patientPersonalInfo2.setPriority(Constants.PRIORITY_NORMAL_PATIENT);
        patientPersonalInfos.add(patientPersonalInfo2);

        DocPatientInfo docPatientInfo1 = new DocPatientInfo();
        docPatientInfo1.setDocName("Patient List");
        docPatientInfo1.setPatientPersonalInfos(patientPersonalInfos);
        docPatientInfos.add(docPatientInfo1);

        DocPatientInfo docPatientInfo2 = new DocPatientInfo();
        docPatientInfo2.setDocName("Dr Mahesh");
        docPatientInfo2.setPatientPersonalInfos(patientPersonalInfos);
        docPatientInfos.add(docPatientInfo2);

        DocPatientInfo docPatientInfo3 = new DocPatientInfo();
        docPatientInfo3.setDocName("Dr Nisha");
        docPatientInfo3.setPatientPersonalInfos(patientPersonalInfos);
        docPatientInfos.add(docPatientInfo3);

        DocPatientListPagerAdapter adapterViewPager = new DocPatientListPagerAdapter(getActivity().getSupportFragmentManager(), docPatientInfos);
        vpPager.setAdapter(adapterViewPager);

        // Give the TabLayout the ViewPager
        tabLayout = (TabLayout) view.findViewById(R.id.sliding_tabs);
        tabLayout.setupWithViewPager(vpPager);
        if (docPatientInfos.size() > 0)
            txtPatientCount.setText("(" + docPatientInfos.get(0).getPatientPersonalInfos().size() + ")");
        else
            txtPatientCount.setText("(" + 0 + ")");

        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstAlerts.setLayoutManager(mLayoutManager);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(getActivity());
        lstUpcommingTask.setLayoutManager(layoutManager);

        ArrayList<Tasks> tasks = new ArrayList<Tasks>();
        Tasks tasks1 = new Tasks();
        tasks1.setUser_Task_Name("Create Care Plan for Pooja Shreevastava");
        tasks1.setHM_Patient_id("Ashah1234");
        tasks1.setDate("11.00 AM, 20/04/2016");
        tasks.add(tasks1);
        Tasks tasks2 = new Tasks();
        tasks2.setUser_Task_Name("Radha Jadhav is Identified as High Risk");
        tasks2.setHM_Patient_id("Ashah12224");
        tasks2.setDate("11.00 AM, 20/04/2016");
        tasks.add(tasks2);
        Tasks tasks3 = new Tasks();
        tasks3.setUser_Task_Name("Anushka singh is identified severely Anemic");
        tasks3.setHM_Patient_id("Ash1234");
        tasks3.setDate("11.00 AM, 20/04/2016");
        tasks.add(tasks3);
        DashboardAlertsAdapter dashboardAlertsAdapter = new DashboardAlertsAdapter(tasks);
        lstAlerts.setAdapter(dashboardAlertsAdapter);

        if (tasks.size() > 0)
            txtAlertsCount.setText("(" + tasks.size() + ")");
        else
            txtAlertsCount.setText("(" + 0 + ")");

        ArrayList<Tasks> upcommingTasks = new ArrayList<Tasks>();
        Tasks upCommingTasks1 = new Tasks();
        upCommingTasks1.setUser_Task_Name("Create Care Plan for Pooja Shreevastava");
        upCommingTasks1.setPatient_full_name("Radha Jadhav");
        upCommingTasks1.setHM_Patient_id("Ashah1234");
        upCommingTasks1.setUser_Task_Severity(Constants.PRIORITY_HIGH_RISK_PATIENT);
        upCommingTasks1.setDate("11.00 AM, 20/04/2016");
        upcommingTasks.add(upCommingTasks1);
        Tasks upcommingTasks2 = new Tasks();
        upcommingTasks2.setPatient_full_name("Anusha Singh");
        upcommingTasks2.setUser_Task_Name("Radha Jadhav is Identified as High Risk");
        upcommingTasks2.setHM_Patient_id("Ashah12224");
        upcommingTasks2.setUser_Task_Severity(Constants.PRIORITY_NORMAL_PATIENT);
        upcommingTasks2.setDate("11.00 AM, 20/04/2016");
        upcommingTasks.add(upcommingTasks2);
        Tasks upCommingTasks3 = new Tasks();
        upCommingTasks3.setPatient_full_name("Pallavi Joshi");
        upCommingTasks3.setUser_Task_Severity(Constants.PRIORITY_MODERATE_RISK_PATIENT);
        upCommingTasks3.setUser_Task_Name("Anushka singh is identified severely Anemic");
        upCommingTasks3.setHM_Patient_id("Ash1234");
        upCommingTasks3.setDate("11.00 AM, 20/04/2016");
        upcommingTasks.add(upCommingTasks3);
        DashboardUpcomingTaskAdapter upcomingTaskAdapter = new DashboardUpcomingTaskAdapter(upcommingTasks);
        lstUpcommingTask.setAdapter(upcomingTaskAdapter);
        if (upcommingTasks.size() > 0)
            txtUpcomingTaskCount.setText("(" + upcommingTasks.size() + ")");
        else
            txtUpcomingTaskCount.setText("(" + 0 + ")");

        searchViewPatient.setOnQueryTextListener(new SearchView.OnQueryTextListener() {

            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                // TODO Auto-generated method stub
               /* highRiskPatientAdapter.filter(newText);
                moderateRiskPatientAdapter.filter(newText);
                normalPatientAdapter.filter(newText);
                setPatientCount();*/
                return false;
            }
        });

    }
}
