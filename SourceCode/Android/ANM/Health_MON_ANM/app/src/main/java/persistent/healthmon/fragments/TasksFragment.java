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
import persistent.healthmon.adapter.IndividualPatientTasksAdapter;
import persistent.healthmon.interfaces.OnPatientTaskSelect;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.CarePlanActivity;
import persistent.healthmon.viewcontroller.TasksHRAFragment;

/**
 * Created by harshal_patil on 7/11/2016.
 */
public class TasksFragment extends Fragment implements OnPatientTaskSelect {
    GridView gridView;

    public int[] prgmNameList = {R.string.txtHRA,R.string.txtVitals,R.string.txtImmunization,R.string.txtCapture,R.string.txtDiag,R.string.txtMedication};
    public static int[] prgmImages = {R.drawable.ic_hra,R.drawable.ic_vitals,R.drawable.ic_immunization, R.drawable.ic_capturetest,
    R.drawable.ic_diagnosisandtreatment, R.drawable.ic_medication};

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_tasks,container,false);
        gridView = (GridView) view.findViewById(R.id.dashboard_tasks_gridview);
        gridView.setAdapter(new IndividualPatientTasksAdapter(getActivity(),prgmNameList,prgmImages));

        return view;
    }

    @Override
    public void onTaskClick(int position) {
        Toast.makeText(getContext(), "clicked on "+ position, Toast.LENGTH_SHORT).show();
        if(position == 0){
            Intent hraintent = new Intent(getContext(),TasksHRAFragment.class);
            //todo get SELECTED patient id
            hraintent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",getContext()));
            startActivity(hraintent);
        }
        else if(position == 1){
            Intent careplanActivity = new Intent(getContext(), CarePlanActivity.class);
            startActivity(careplanActivity);
        }
    }

}
