package com.persistent.healthmon.fragments;

import android.content.res.AssetManager;
import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.DashboardHelpGuideGridAdapter;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.PatientPersonalInfo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

/**
 * Created by pushkar_bhadle on 3/18/2016.
 */
public class DashBoardMainFragment extends BaseFragment {
    GridView gridView;
    WebView w;
    /*R.string.txthaemoglobin,R.string.txtbloodpressure,R.string.txtimmunization,R.string.txtbloodglucose,R.string.txttemperature,R.string.txtpulseocimeter,R.string.txturineprotein,R.string.txtecg,R.string.txtfetalmonitor*/

    public int[] prgmNameList = {R.string.txthaemoglobin,R.string.txtbloodpressure,R.string.txtimmunization,R.string.txtbloodglucose,R.string.txttemperature,R.string.txtpulseocimeter,R.string.txturineprotein,R.string.txtecg,R.string.txtfetalmonitor,R.string.txtReferToDoc, R.string.txtPregnancyDient};
    public static int[] prgmImages = {R.drawable.ic_landing_haemoglobin,R.drawable.ic_landing_bloodpressure,R.drawable.ic_landing_immunization,R.drawable.ic_landing_bloodglucose,R.drawable.ic_landing_temperature,R.drawable.ic_landing_pulseoximeter,R.drawable.ic_landing_urineprotein,R.drawable.ic_landing_ecg,R.drawable.ic_landing_fetalmonitor, R.drawable.ic_landing_refertodoc, R.drawable.ic_landing_pregnancydiet};


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dashboard_main,container,false);
        gridView = (GridView) view.findViewById(R.id.dashboard_help_gridview);
        gridView.setAdapter(new DashboardHelpGuideGridAdapter(getActivity(),prgmNameList,prgmImages));

        return view;
    }



}
