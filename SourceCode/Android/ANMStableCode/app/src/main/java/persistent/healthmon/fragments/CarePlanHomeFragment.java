package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.CarePlanDisplayAdapter;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.CarePlanRow;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.CarePlanActivity;

/**
 * Created by gaurav_polekar on 7/19/2016.
 */
public class CarePlanHomeFragment extends Fragment implements View.OnClickListener {

    private Button btnCreateCarePlan,btnSendToApproval;
    private View view;
    private RecyclerView recyclerView;
    private List<CarePlanRow> carePlanList;
    private ImageView imageToolbar,imgBack;
    private TextView txtToolbarTitle,txtToolbarStatus;

    private Fragment createCareplanFragment = new CreateCarePlanFragment();

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view =  inflater.inflate(R.layout.fragment_careplan_home, container,false);
        btnCreateCarePlan = (Button) view.findViewById(R.id.btn_createcareplan);
        btnCreateCarePlan.setOnClickListener(this);
        btnSendToApproval = (Button) view.findViewById(R.id.buttonSendToApproval);
        btnSendToApproval.setOnClickListener(this);
        imageToolbar = (ImageView) view.findViewById(R.id.imgImmunization);
        txtToolbarTitle = (TextView) view.findViewById(R.id.txtImmunization);
        txtToolbarStatus = (TextView) view.findViewById(R.id.textViewStatus);

        txtToolbarTitle.setText(R.string.txtCarePlan);
        imageToolbar.setImageResource(R.drawable.ic_careplan);

        imgBack = (ImageView) view.findViewById(R.id.imgLeft);
        imgBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getActivity().onBackPressed();
            }
        });
        txtToolbarStatus.setVisibility(View.VISIBLE);
        recyclerView = (RecyclerView) view.findViewById(R.id.recyclerCareplanSet);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getContext());
        recyclerView.setLayoutManager(mLayoutManager);
        displayCarePlan();

        return view;
    }

    private void displayCarePlan() {
        carePlanList = DatabaseHelper.getInstance(getContext()).getCarePlanDetails(PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",getContext()));
        if(carePlanList != null){
            txtToolbarStatus.setText("care plan added");
            Collections.sort(carePlanList);
            carePlanList.add(0, new CarePlanRow(0, carePlanList.get(0).getTemplateName()));
            recyclerView.setAdapter(new CarePlanDisplayAdapter(carePlanList,false));
        }else{
            txtToolbarStatus.setText("care plan not set");
        }

    }

    @Override
    public void onClick(View v) {
        if(v.getId() == R.id.btn_createcareplan){
            CarePlanActivity carePlanActivity = (CarePlanActivity) getActivity();
            carePlanActivity.changeFragment(createCareplanFragment);
        }else if(v.getId() == R.id.buttonSendToApproval){

            if(carePlanList != null){
                List<CarePlanRow> temp = new ArrayList<CarePlanRow>();
                temp.addAll(carePlanList);
                temp.remove(0); // header removed
                WebserviceManager.sendCarePlanForApproval(getContext(), PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",getContext()),temp);
                txtToolbarStatus.setText("Care Plan sent for approval");
            }
        }
    }
}
