package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.ANCRegisterReportAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.ANCRegisterReport;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by khyati_shah on 6/7/2016.
 */
public class ANCRegisterReportFragment extends BaseFragment {

    RecyclerView lstRegisteredPatient;
    View view;
    ANCRegisterReportAdapter ancRegisterReportAdapter;
    ArrayList<ANCRegisterReport> ancRegisterReports, dateFilteredLst;
    TextView txtToFromDt, txtNoDataAvailable;
    String fromDate, toDate;

    @Override

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        fromDate = getArguments().getString(Constants.REPORT_FROM_DATE);
        toDate = getArguments().getString(Constants.REPORT_TO_DATE);
        view = inflater.inflate(R.layout.fragment_anc_register_report, container, false);
        initView(view);
        return view;
    }

    private void initView(View view) {
        dateFilteredLst = new ArrayList<ANCRegisterReport>();
        lstRegisteredPatient = (RecyclerView) view.findViewById(R.id.lstRegisteredPatient);
        txtToFromDt = (TextView) view.findViewById(R.id.txtToFromDt);
        txtNoDataAvailable = (TextView) view.findViewById(R.id.txtNoDataAvailable);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstRegisteredPatient.setLayoutManager(mLayoutManager);
        ancRegisterReports = DatabaseHelper.getInstance(getActivity()).getANCRegistrationReport();
        if (fromDate != null && toDate != null && !fromDate.equals("") && !toDate.equals("")) {
            Date dtToDate = DateUtil.toDate(toDate, "dd-MM-yyyy");
            Date dtFromDate = DateUtil.toDate(fromDate, "dd-MM-yyyy");
            for (int i = 0; i < ancRegisterReports.size(); i++) {
                String arrDtSplit[] = ancRegisterReports.get(i).getRegDtae().split("\\s+");
                Date regDt = DateUtil.toDate(arrDtSplit[0], "dd-MM-yyyy");
                if (DateUtil.isBetweenDates(dtFromDate, dtToDate, regDt)) {
                    dateFilteredLst.add(ancRegisterReports.get(i));
                }
            }
            txtToFromDt.setText(fromDate + " - " + toDate);
        } else {
            dateFilteredLst.addAll(ancRegisterReports);
            txtToFromDt.setText("");
        }
        if (dateFilteredLst.size() > 0) {
            lstRegisteredPatient.setVisibility(View.VISIBLE);
            txtNoDataAvailable.setVisibility(View.GONE);
        } else {
            lstRegisteredPatient.setVisibility(View.GONE);
            txtNoDataAvailable.setVisibility(View.VISIBLE);
        }
        ancRegisterReportAdapter = new ANCRegisterReportAdapter(dateFilteredLst);
        lstRegisteredPatient.setAdapter(ancRegisterReportAdapter);
    }


}
