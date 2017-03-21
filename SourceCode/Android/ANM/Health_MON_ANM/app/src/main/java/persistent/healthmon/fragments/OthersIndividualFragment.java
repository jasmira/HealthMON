package persistent.healthmon.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.Toast;

import persistent.healthmon.R;
import persistent.healthmon.adapter.DashboardHelpGuideGridAdapter;
import persistent.healthmon.interfaces.OnPatientTaskSelect;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.CarePlanActivity;
import persistent.healthmon.viewcontroller.PatientFeedbackActivity;


/**
 * Created by harshal_patil on 7/11/2016.
 */
public class OthersIndividualFragment extends Fragment implements OnPatientTaskSelect{
    GridView gridView;

    public int[] prgmNameList = {R.string.txtFeedback,R.string.txtCarePlan};
    public int[] prgmImages = {R.drawable.ic_patientfeedback,R.drawable.ic_careplan};

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    private DashboardHelpGuideGridAdapter adapter;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_others_individual,container,false);
        gridView = (GridView) view.findViewById(R.id.dashboard_help_gridview);
        adapter = new DashboardHelpGuideGridAdapter(getActivity(),this,prgmNameList,prgmImages);
        gridView.setAdapter(adapter);
        return view;
    }

    @Override
    public void onTaskClick(int position) {
       // Toast.makeText(getContext(), "clicked on "+ position, Toast.LENGTH_SHORT).show();
        if(position == 0){
            Intent feedBackActivityIntent = new Intent(getContext(),PatientFeedbackActivity.class);
            //todo get SELECTED patient id
            feedBackActivityIntent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",getContext()));
            startActivity(feedBackActivityIntent);
        }
        else if(position == 1){
            Intent careplanActivity = new Intent(getContext(), CarePlanActivity.class);
            startActivity(careplanActivity);
        }
    }
}
