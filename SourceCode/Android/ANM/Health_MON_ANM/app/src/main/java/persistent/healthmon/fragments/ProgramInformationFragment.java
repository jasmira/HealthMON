package persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ExpandableListView;
import android.widget.Spinner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.adapter.ProgramInfoListAdapter;
import persistent.healthmon.interfaces.OnProgramInfoSave;
import persistent.healthmon.interfaces.PatientRegistrationTabChange;
import persistent.healthmon.util.HealthMonUtility;


/**
 * Created by khyati_shah on 3/30/2016.
 */
public class ProgramInformationFragment extends Fragment implements View.OnClickListener, OnProgramInfoSave {

    PatientRegistrationTabChange patientRegistrationTabChange;
    Button btnSaveProceed;
    ExpandableListView lstProgTamplate;
    List<String> prog_list = new ArrayList<>();
    Button btnAdd;
    ProgramInfoListAdapter programInfoListAdapter;
    View view;
    Spinner multispinnerProgram;

    public ProgramInformationFragment(PatientRegistrationTabChange patientRegistrationTabChange) {
        this.patientRegistrationTabChange = patientRegistrationTabChange;
    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_program_information, container, false);
        initView(view);
        return view;
    }

    @Override
    public void onHiddenChanged(boolean hidden) {
        super.onHiddenChanged(hidden);
        if (!hidden) {
            int count = programInfoListAdapter.getGroupCount();
            for (int i = 0; i < count; i++)
                lstProgTamplate.collapseGroup(i);
        }
    }

    private void initView(View view) {
        lstProgTamplate = (ExpandableListView) view.findViewById(R.id.lstProgTamplate);
        btnAdd = (Button) view.findViewById(R.id.btnAdd);
        btnSaveProceed = (Button) view.findViewById(R.id.btnSaveProceed);
        multispinnerProgram = (Spinner) view.findViewById(R.id.multispinnerProgram);
        programInfoListAdapter = new ProgramInfoListAdapter(getActivity(), prog_list, this);
        lstProgTamplate.setAdapter(programInfoListAdapter);

        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String selectedProg = multispinnerProgram.getSelectedItem().toString();
                if (selectedProg.equalsIgnoreCase("")) {
                    HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtSelectProgram));
                } else {
                    prog_list.clear();
                    prog_list.addAll(Arrays.asList(selectedProg.split(",")));
                    programInfoListAdapter.notifyDataSetChanged();
                    //prog_list.add(getActivity().getResources().getString(R.string.txtAnteNatalCare));
                    //prog_list.add(getActivity().getResources().getString(R.string.txtTobaccoCessation));
                }

            }
        });
        btnSaveProceed.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                performSaveProceed();

            }
        });

    }


    private void performSaveProceed() {

        if (prog_list.size() == 0) {
            HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtSelectProgram));
            return;
        }
        HealthMonUtility.reloadFragment(getActivity(), new PatientFamlyInfoFragment(this.patientRegistrationTabChange), R.id.patientRegistrationContiner);
        patientRegistrationTabChange.onTabChange(PatientFamlyInfoFragment.class.toString());
    }

    @Override
    public void onClick(View v) {

    }


    @Override
    public void onProgramInfoSave(int position) {

    }

    public void performANCProgSave() {

    }
}
