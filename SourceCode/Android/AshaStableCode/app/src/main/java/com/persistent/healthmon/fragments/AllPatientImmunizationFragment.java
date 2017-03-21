package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.AllPatientTaskTabChange;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.MyImmunizations;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.viewcontroller.HealthMonMainActivity;

import java.util.ArrayList;

/**
 * Created by pushkar_bhadle on 6/7/2016.
 */
public class AllPatientImmunizationFragment extends BaseFragment implements View.OnClickListener {


    private static String TAG = AllPatientImmunizationFragment.class.getCanonicalName();
    ArrayList<MyImmunizations> myImmunizations;

    AllPatientTaskTabChange allPatientTaskTabChange;
    String value;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    TextView tv_task,btn_view_all, tv_im1, tv_im2, tv_date1, tv_date2;
    Button btnBack;
    ImageView iv_task;
    LinearLayout txtOthers;

    public AllPatientImmunizationFragment() {
    }

    public AllPatientImmunizationFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        //View view = inflater.inflate(R.layout.all_patient_task_bp, null);
        View view = inflater.inflate(R.layout.all_patient_task_immunization, container, false);
        //WebserviceManager.getCarePlan(getActivity(), "Rupali169");

        initView(view);

        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);


        myImmunizations = DatabaseHelper.getInstance(getActivity()).getImmunizations(value);
        for(int i=0; i<myImmunizations.size();i++) {

            tv_im1.setText( myImmunizations.get(0).getImmunizationName());
//            tv_im2.setText( myImmunizations.get(1).getImmunizationName());
            //Once, Daily, Weekly, Monthly
            String frequency = myImmunizations.get(0).getFreqDesc();
            //Toast.makeText(getActivity(),frequency,Toast.LENGTH_SHORT).show();
            if(frequency.equals("Once")){
                int count = 0;
            } else if(frequency.equals("Daily")){
                int count = 1;
            }if(frequency.equals("Weekly")){
                int count = 8;
            }if(frequency.equals("Monthly")){
                int count = 30;
            }
            String Dt1 = DateUtil.dateConvert(myImmunizations.get(0).getDoneDate(), "yyyy-MM-dd", "dd-MM-yyyy");
            String dueDate1 = DateUtil.getDueDate(Dt1, 0);
   //            String Dt2 = DateUtil.dateConvert(myImmunizations.get(1).getDoneDate(), "yyyy-MM-dd", "dd-MM-yyyy");
  //          String dueDate2 = DateUtil.getDueDate(Dt2, 0);
            tv_date1.setText(dueDate1);
    //        tv_date2.setText(dueDate2);

        }

        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
                        individualPatientTaskFragment.setArguments(args);
                        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

                        //HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment, R.id.rlTabOptionContainer);;
                        //getFragmentManager().popBackStack();
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnTaskViewAll) {

            final ImmunizationViewAll fragment = new ImmunizationViewAll();
            final FragmentTransaction transaction = getFragmentManager().beginTransaction();
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            fragment.setArguments(args);
            transaction.replace(R.id.rlTabOptionContainer, fragment);
            transaction.addToBackStack(null);
            transaction.commit();
        }

        if (v.getId() == R.id.txtOthers) {

            final ImmunizationViewAll fragment = new ImmunizationViewAll();
            final FragmentTransaction transaction = getFragmentManager().beginTransaction();
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            fragment.setArguments(args);
            transaction.replace(R.id.rlTabOptionContainer, fragment);
            transaction.addToBackStack(null);
            transaction.commit();
        }

        if (v.getId() == R.id.btnBack) {
            IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
            Bundle args = new Bundle();
            args.putString(Constants.SELECTED_PATIENT_ID, value);
            individualPatientTaskFragment.setArguments(args);
            HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

        }
    }

    private void initView(View view) {
        tv_task = (TextView) view.findViewById(R.id.tv_task_header_name);
        iv_task = (ImageView) view.findViewById(R.id.iv_task_header);
        tv_im1 = (TextView) view.findViewById(R.id.txtIm1);
        tv_im2 = (TextView) view.findViewById(R.id.txtIm2);
        tv_date1 = (TextView) view.findViewById(R.id.txtDate1);
        tv_date2 = (TextView) view.findViewById(R.id.txtDate2);
        btn_view_all = (TextView) view.findViewById(R.id.btnTaskViewAll);
        tv_task.setText(getString(R.string.txtimmunization));
        iv_task.setImageResource(R.drawable.ic_landing_immunization);
        btn_view_all.setOnClickListener(this);
        txtOthers = (LinearLayout) view.findViewById(R.id.txtOthers);
        txtOthers.setOnClickListener(this);
        btnBack = (Button) view.findViewById(R.id.btnBack);
        btnBack.setOnClickListener(this);
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        //Toast.makeText(getContext(), "sdfs", Toast.LENGTH_SHORT).show();
                        Bundle args = new Bundle();
                        args.putString(Constants.SELECTED_PATIENT_ID, value);
                        //HealthMonUtility.replaceFragment(getActivity(),new IndividualPatientTaskFragment());
                       // HealthMonUtility.replaceFragment(getActivity(), new IndividualPatientTaskFragment(), R.id.immunizationContainer);;
                        //getFragmentManager().popBackStack();
                        return true;
                    }

                }
                return false;
            }
        });
    }

}
