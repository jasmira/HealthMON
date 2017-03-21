package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.GridView;

import persistent.healthmon.R;
import persistent.healthmon.adapter.DashboardHelpGuideGridAdapter;
import persistent.healthmon.adapter.IndividualPatientLogAdapter;


/**
 * Created by harshal_patil on 7/11/2016.
 */
public class HealthLogFragment extends Fragment {
    GridView gridView;

    public int[] prgmNameList = {R.string.txtSummary};
    public static int[] prgmImages = {R.drawable.ic_patientsummary};

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_health_log,container,false);
        gridView = (GridView) view.findViewById(R.id.dashboard_help_gridview);
        gridView.setAdapter(new IndividualPatientLogAdapter(getActivity(),prgmNameList,prgmImages));

        return view;
    }

}
