package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.MyActivityAdapterViewAll;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonUtility;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 6/3/2016.
 */
public class MyActivityViewAll extends BaseFragment {

    RecyclerView lstAllActivities;
    MyActivityAdapterViewAll myActivityAdapter;
    ArrayList<MyActivity> myActivities;
    LinearLayout viewAllContainer;
    TextView lblNoData;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_myactivity_view_all, null);
        initView(view);
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {

                        HealthMonUtility.replaceFragment(getActivity(), new MyActivitiesFragment());
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    private void initView(View view) {
        myActivities = DatabaseHelper.getInstance(getActivity()).getAllMyActivityForStatus(Constants.ACTIVITY_STATUS_DONE);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        viewAllContainer = (LinearLayout) view.findViewById(R.id.viewAllContainer);
        lstAllActivities = (RecyclerView) view.findViewById(R.id.lstAllActivities);
        lblNoData = (TextView) view.findViewById(R.id.lblNoData);
        lstAllActivities.setLayoutManager(mLayoutManager);
        myActivityAdapter = new MyActivityAdapterViewAll(myActivities);
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
        lstAllActivities.setAdapter(myActivityAdapter);
        viewAllContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //getActivity().getSupportFragmentManager().beginTransaction().remove(MyActivityViewAll.this).commit();
                HealthMonUtility.replaceFragment(getActivity(), new MyActivitiesFragment());
            }
        });
    }
}
