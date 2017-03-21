package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import persistent.healthmon.R;
import persistent.healthmon.adapter.PatientListAdapter;
import persistent.healthmon.model.DocPatientInfo;

/**
 * Created by khyati_shah on 6/15/2016.
 */
public class DashboardPatientListFragment extends Fragment {

    DocPatientInfo docPatientInfo;
    View view;
    RecyclerView lstPatientList;

    public DashboardPatientListFragment(DocPatientInfo docPatientInfo) {
        this.docPatientInfo = docPatientInfo;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_dashboard_patientlist, container, false);
        initView(view);
        return view;
    }

    private void initView(View view) {
        lstPatientList = (RecyclerView) view.findViewById(R.id.lstPatientList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstPatientList.setLayoutManager(mLayoutManager);
        PatientListAdapter patientListAdapter = new PatientListAdapter(docPatientInfo);
        lstPatientList.setAdapter(patientListAdapter);
    }
}
