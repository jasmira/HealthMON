package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.CarePlanDisplayAdapter;
import persistent.healthmon.adapter.MultiSelectSpinnerAdapter;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.CarePlanRow;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.CarePlanActivity;

/**
 * Created by gaurav_polekar on 7/19/2016.
 */
public class CreateCarePlanFragment extends Fragment implements View.OnClickListener {

    private RecyclerView recyclerView;
    private View view;
    private List<CarePlanRow> rows;
    private List<CarePlanRow> rowsToDisplay,rowsForRecycler;
    private Button btnPreview,btnAddCarePlan;
    private Spinner spinnerTemplates;
    private List<String> templateNames;
    private ImageView imageToolbar,imgBack;
    private TextView txtToolbarTitle,txtToolbarStatus;
    private MultiSelectSpinnerAdapter spinnerArrayAdapter;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_create_careplan, container,false);
        recyclerView = (RecyclerView) view.findViewById(R.id.recycler_careplan);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        btnPreview = (Button) view.findViewById(R.id.btnPreview);
        spinnerTemplates = (Spinner) view.findViewById(R.id.spinnerCarePlanTemplates);
        btnPreview.setOnClickListener(this);
        btnAddCarePlan = (Button) view.findViewById(R.id.buttonAddCarePlan);
        btnAddCarePlan.setOnClickListener(this);

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

        loadTemplateNames();
        return view;
    }

    private void loadTemplateNames() {
        templateNames = new ArrayList<String>();
        rows = DatabaseHelper.getInstance(getContext()).getCarePlanTemplates();
        for (CarePlanRow row : rows){
            if(!templateNames.contains(row.getTemplateName()))
                templateNames.add(row.getTemplateName());
        }
        //ArrayAdapter<String> spinnerArrayAdapter = new ArrayAdapter<String>(getContext(),android.R.layout.simple_spinner_item,templateNames);
        //spinnerArrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerArrayAdapter = new MultiSelectSpinnerAdapter(getContext(),R.id.checkbox,templateNames);
        spinnerTemplates.setAdapter(spinnerArrayAdapter);

    }

    @Override
    public void onClick(View v) {
        if(v.getId() == R.id.btnPreview) {
            rowsForRecycler = new ArrayList<CarePlanRow>();
            for (int i = 0; i < spinnerArrayAdapter.getSelectedItems().size(); i++) {
                rowsToDisplay = new ArrayList<CarePlanRow>();
                for (CarePlanRow row : rows) {
                    if (row.getTemplateName().equals(spinnerArrayAdapter.getSelectedItems().get(i)))
                        rowsToDisplay.add(row);
                }
                Collections.sort(rowsToDisplay);
                rowsToDisplay.add(0, new CarePlanRow(0, rowsToDisplay.get(0).getTemplateName()));
                rowsForRecycler.addAll(rowsToDisplay);
            }
            recyclerView.setAdapter(new CarePlanDisplayAdapter(rowsForRecycler,true));
        }else if(v.getId() == R.id.buttonAddCarePlan){
            //insert care plan for patient
            if(rowsForRecycler != null) {
                List<CarePlanRow> list = new ArrayList<CarePlanRow>();
                for(CarePlanRow row: rowsForRecycler){
                    if(row.getType() != 0)
                        list.add(row);
                }
                DatabaseHelper.getInstance(getContext()).insertCarePlanDetails(PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",getContext()), list);
                Toast.makeText(getContext(), "Care plan added", Toast.LENGTH_SHORT).show();
                CarePlanActivity activity = (CarePlanActivity) getActivity();
                activity.changeFragment(new CarePlanHomeFragment());
            }
        }
    }

}
