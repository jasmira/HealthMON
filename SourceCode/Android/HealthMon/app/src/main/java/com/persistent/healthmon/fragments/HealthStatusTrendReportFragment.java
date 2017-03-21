package com.persistent.healthmon.fragments;

import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;

import org.achartengine.ChartFactory;
import org.achartengine.GraphicalView;
import org.achartengine.chart.PointStyle;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by khyati_shah on 6/9/2016.
 */
public class HealthStatusTrendReportFragment extends BaseFragment {

    String fromDate, toDate, selectedPatient;
    View view;
    TextView txtName, txtId, txtAgeGender, txtRegistrationDt, txtEDD, txtTrimester, txtLocality, txtToFromDt, reportHeader;
    boolean isBPChked, isHBChked, isGlucoChked;
    LinearLayout chartHB, chartBPSys, chartBPDia;
    ArrayList<PatientVitals> arrHBList;
    ArrayList<PatientVitals> arrBPList;
    ArrayList<PatientVitals> arrBPListDtFilter = new ArrayList<PatientVitals>();
    ArrayList<PatientVitals> arrHBListDtFilter = new ArrayList<PatientVitals>();

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        fromDate = getArguments().getString(Constants.REPORT_FROM_DATE);
        toDate = getArguments().getString(Constants.REPORT_TO_DATE);
        selectedPatient = getArguments().getString(Constants.REPORT_SELECTED_PATIENT);
        isBPChked = getArguments().getBoolean(Constants.REPORT_BP_SELECTED_FLAG);
        isHBChked = getArguments().getBoolean(Constants.REPORT_HP_SELECTED_FLAG);
        isGlucoChked = getArguments().getBoolean(Constants.REPORT_GLUCO_SELECTED_FLAG);
        view = inflater.inflate(R.layout.fragment_health_status_trend_report, container, false);
        initView(view);
        return view;
    }

    private void initView(View view) {
        txtName = (TextView) view.findViewById(R.id.txtName);
        reportHeader = (TextView) view.findViewById(R.id.reportHeader);
        txtId = (TextView) view.findViewById(R.id.txtId);
        txtAgeGender = (TextView) view.findViewById(R.id.txtAgeGender);
        txtRegistrationDt = (TextView) view.findViewById(R.id.txtRegistrationDt);
        txtEDD = (TextView) view.findViewById(R.id.txtEDD);
        txtTrimester = (TextView) view.findViewById(R.id.txtTrimester);
        txtLocality = (TextView) view.findViewById(R.id.txtLocality);
        txtToFromDt = (TextView) view.findViewById(R.id.txtToFromDt);
        chartHB = (LinearLayout) view.findViewById(R.id.chartHB);
        chartBPSys = (LinearLayout) view.findViewById(R.id.chartBPSys);
        chartBPDia = (LinearLayout) view.findViewById(R.id.chartBPDia);

        //getting values form DB
        arrBPList = DatabaseHelper.getInstance(getActivity()).getAllPatientBP(selectedPatient);
        //getting values form DB
        arrHBList = DatabaseHelper.getInstance(getActivity()).getAllPatientHB(selectedPatient);
        if (fromDate != null && toDate != null && !fromDate.equals("") && !toDate.equals("")) {
            Date dtToDate = DateUtil.toDate(toDate, "dd-MM-yyyy");
            Date dtFromDate = DateUtil.toDate(fromDate, "dd-MM-yyyy");

            //for BP
            if (isBPChked) {

                for (int i = 0; i < arrBPList.size(); i++) {
                    String arrDtSplit[] = arrBPList.get(i).getHM_timestamp().split("\\s+");
                    Date regDt = DateUtil.toDate(arrDtSplit[0], "dd-MM-yyyy");
                    if (DateUtil.isBetweenDates(dtFromDate, dtToDate, regDt)) {
                        arrBPListDtFilter.add(arrBPList.get(i));
                    }
                }
            }
            if (isHBChked) {

                for (int i = 0; i < arrHBList.size(); i++) {
                    String arrDtSplit[] = arrHBList.get(i).getHM_timestamp().split("\\s+");
                    Date regDt = DateUtil.toDate(arrDtSplit[0], "dd-MM-yyyy");
                    if (DateUtil.isBetweenDates(dtFromDate, dtToDate, regDt)) {
                        arrHBListDtFilter.add(arrHBList.get(i));
                    }
                }
            }

            txtToFromDt.setText(fromDate + " - " + toDate);
        } else {
            if (isBPChked)
                arrBPListDtFilter.addAll(arrBPList);
            if (isHBChked)
                arrHBListDtFilter.addAll(arrHBList);
            txtToFromDt.setText("");
        }

        //setting data in table
        PatientPersonalInfo patientPersonalInfo = DatabaseHelper.getInstance(getActivity()).getPatient(selectedPatient);
        ProgramInfo programInfo = DatabaseHelper.getInstance(getActivity()).getPatientProgramInfo(selectedPatient);
        PatientAddressDetail patientAddressDetail = DatabaseHelper.getInstance(getActivity()).getPatientAddress(selectedPatient);
        txtName.setText(patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getLastName());
        txtId.setText(patientPersonalInfo.getPatient_id());
        //txtAgeGender.setText(patientPersonalInfo.getAge() + "/" + patientPersonalInfo.getGender());
        txtEDD.setText(DateUtil.dateConvert(programInfo.getEDD(), "yyyy-MM-dd", "dd-MM-yyyy"));
        txtRegistrationDt.setText(DateUtil.dateConvert(patientPersonalInfo.getTimeStamp(), "yyyy-MM-dd HH:mm:ss", "dd-MM-yyyy"));
        //txtLocality.setText(patientAddressDetail.getVillageId());
        int monthsBetween = DateUtil.getMonthsBetween(DateUtil.toDate(programInfo.getLMPDate(), "yyyy-MM-dd"), new Date());
        if (monthsBetween >= 0 && monthsBetween <= 3) {
            txtTrimester.setText("1st");
        } else if (monthsBetween >= 4 && monthsBetween <= 6) {
            txtTrimester.setText("2nd");
        } else {
            txtTrimester.setText("3rd");
        }
        reportHeader.setText(getActivity().getResources().getString(R.string.txtHealthStatusTernedOf) + " " + patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getLastName());
        if (isBPChked) {
            if (arrBPListDtFilter.size() > 0) {
                drawBPSysChart();
                drawBPDiaChart();
            }
        } else {
            chartBPDia.setVisibility(View.GONE);
            chartBPSys.setVisibility(View.GONE);
        }
        if (isHBChked) {
            if (arrHBListDtFilter.size() > 0) {
                drawHBChart();
            }
        } else {
            chartHB.setVisibility(View.GONE);
        }
    }

    private void drawHBChart() {
        // Creating an  XYSeries for Income
        XYSeries hbXYSeries = new XYSeries("HB");
        for (int i = 0; i < arrHBListDtFilter.size(); i++) {
            hbXYSeries.add(i + 1, arrHBListDtFilter.get(i).getHb());
        }
        // Creating a dataset to hold each series
        XYMultipleSeriesDataset dataset = new XYMultipleSeriesDataset();
        // Adding Income Series to the dataset
        dataset.addSeries(hbXYSeries);
        // Creating XYSeriesRenderer to customize incomeSeries
        XYSeriesRenderer hbRenderer = new XYSeriesRenderer();
        hbRenderer.setColor(getActivity().getResources().getColor(R.color.colorBlue));
        hbRenderer.setPointStyle(PointStyle.CIRCLE);
        hbRenderer.setFillPoints(true);
        hbRenderer.setLineWidth(2);
        hbRenderer.setDisplayChartValues(true);

        // Creating a XYMultipleSeriesRenderer to customize the whole chart
        XYMultipleSeriesRenderer multiRenderer = new XYMultipleSeriesRenderer();
        multiRenderer.setXLabels(0);
        multiRenderer.setBackgroundColor(Color.WHITE);
        multiRenderer.setChartTitle(getActivity().getResources().getString(R.string.txtHbTrend));
        multiRenderer.setXTitle(getActivity().getResources().getString(R.string.txtDate));
        multiRenderer.setAxesColor(Color.BLACK);
        multiRenderer.setShowGridX(true);
        multiRenderer.setShowGridY(true);
        multiRenderer.setMarginsColor(Color.argb(0x00, 0xff, 0x00, 0x00)); // transparent margins
        multiRenderer.setYTitle(getActivity().getResources().getString(R.string.txtHaemoglobingdL));
        //multiRenderer.setZoomButtonsVisible(true);
        multiRenderer.setZoomEnabled(false);
        multiRenderer.setExternalZoomEnabled(false);
        multiRenderer.setZoomEnabled(false, false);
        multiRenderer.setPanEnabled(false, false);
        multiRenderer.setYLabelsColor(0, Color.BLACK);
        multiRenderer.setXLabelsColor(Color.BLACK);
        multiRenderer.setPointSize(4f);
        //setting the margin size for the graph in the order top, left, bottom, right
        //multiRenderer.setMargins(new int[]{30, 30, 30, 30});
        /*multiRenderer.setPanLimits(new double[]{1, 12, 5, 30});
        multiRenderer.setZoomLimits(new double[]{1, 12, 5, 30});*/
        for (int i = 0; i < arrHBListDtFilter.size(); i++) {
            multiRenderer.addXTextLabel(i + 1, DateUtil.dateConvert(arrHBListDtFilter.get(i).getHM_timestamp(), "dd-MM-yyyy HH:mm:ss", "dd MMM yy"));
        }
        multiRenderer.addSeriesRenderer(hbRenderer);
        GraphicalView chartView = ChartFactory.getLineChartView(getActivity(), dataset, multiRenderer);
        chartHB.addView(chartView, 0);
    }


    private void drawBPSysChart() {
        // Creating an  XYSeries for Income
        XYSeries hbXYSeries = new XYSeries(getActivity().getResources().getString(R.string.txtSystolicBP));
        for (int i = 0; i < arrBPListDtFilter.size(); i++) {
            hbXYSeries.add(i + 1, arrBPListDtFilter.get(i).getHM_systolic());
        }
        // Creating a dataset to hold each series
        XYMultipleSeriesDataset dataset = new XYMultipleSeriesDataset();
        // Adding Income Series to the dataset
        dataset.addSeries(hbXYSeries);
        // Creating XYSeriesRenderer to customize incomeSeries
        XYSeriesRenderer hbRenderer = new XYSeriesRenderer();
        hbRenderer.setColor(getActivity().getResources().getColor(R.color.colorBlue));
        hbRenderer.setPointStyle(PointStyle.CIRCLE);
        hbRenderer.setFillPoints(true);
        hbRenderer.setLineWidth(2);
        hbRenderer.setDisplayChartValues(true);
        // Creating a XYMultipleSeriesRenderer to customize the whole chart
        XYMultipleSeriesRenderer multiRenderer = new XYMultipleSeriesRenderer();
        multiRenderer.setXLabels(0);
        multiRenderer.setBackgroundColor(Color.WHITE);
        multiRenderer.setChartTitle(getActivity().getResources().getString(R.string.txtSystolicBP));
        multiRenderer.setXTitle(getActivity().getResources().getString(R.string.txtDate));
        multiRenderer.setAxesColor(Color.BLACK);
        multiRenderer.setShowGridX(true);
        multiRenderer.setShowGridY(true);
        multiRenderer.setMarginsColor(Color.argb(0x00, 0xff, 0x00, 0x00)); // transparent margins
        multiRenderer.setYTitle(getActivity().getResources().getString(R.string.txtBloodPressuremmHg));
        //multiRenderer.setZoomButtonsVisible(true);
        multiRenderer.setZoomEnabled(false);
        multiRenderer.setExternalZoomEnabled(false);
        multiRenderer.setZoomEnabled(false, false);
        multiRenderer.setPanEnabled(false, false);
        multiRenderer.setYLabelsColor(0, Color.BLACK);
        multiRenderer.setXLabelsColor(Color.BLACK);
        multiRenderer.setPointSize(4f);
        for (int i = 0; i < arrBPListDtFilter.size(); i++) {
            multiRenderer.addXTextLabel(i + 1, DateUtil.dateConvert(arrBPListDtFilter.get(i).getHM_timestamp(), "dd-MM-yyyy HH:mm:ss", "dd MMM yy"));
        }
        multiRenderer.addSeriesRenderer(hbRenderer);
        GraphicalView chartView = ChartFactory.getLineChartView(getActivity(), dataset, multiRenderer);
        chartBPSys.addView(chartView, 0);
    }

    private void drawBPDiaChart() {
        // Creating an  XYSeries for Income
        XYSeries hbXYSeries = new XYSeries(getActivity().getResources().getString(R.string.txtDiastolicBP));
        for (int i = 0; i < arrBPListDtFilter.size(); i++) {
            hbXYSeries.add(i + 1, arrBPListDtFilter.get(i).getHM_diastolic());
        }
        // Creating a dataset to hold each series
        XYMultipleSeriesDataset dataset = new XYMultipleSeriesDataset();
        // Adding Income Series to the dataset
        dataset.addSeries(hbXYSeries);
        // Creating XYSeriesRenderer to customize incomeSeries
        XYSeriesRenderer hbRenderer = new XYSeriesRenderer();
        hbRenderer.setColor(getActivity().getResources().getColor(R.color.colorBlue));
        hbRenderer.setPointStyle(PointStyle.CIRCLE);
        hbRenderer.setFillPoints(true);
        hbRenderer.setLineWidth(2);
        hbRenderer.setDisplayChartValues(true);
        // Creating a XYMultipleSeriesRenderer to customize the whole chart
        XYMultipleSeriesRenderer multiRenderer = new XYMultipleSeriesRenderer();
        multiRenderer.setXLabels(0);
        multiRenderer.setBackgroundColor(Color.WHITE);
        multiRenderer.setChartTitle(getActivity().getResources().getString(R.string.txtDiastolicBP));
        multiRenderer.setXTitle(getActivity().getResources().getString(R.string.txtDate));
        multiRenderer.setAxesColor(Color.BLACK);
        multiRenderer.setShowGridX(true);
        multiRenderer.setShowGridY(true);
        multiRenderer.setMarginsColor(Color.argb(0x00, 0xff, 0x00, 0x00)); // transparent margins
        multiRenderer.setYTitle(getActivity().getResources().getString(R.string.txtBloodPressuremmHg));
        //multiRenderer.setZoomButtonsVisible(true);
        multiRenderer.setZoomEnabled(false);
        multiRenderer.setExternalZoomEnabled(false);
        multiRenderer.setZoomEnabled(false, false);
        multiRenderer.setPanEnabled(false, false);
        multiRenderer.setYLabelsColor(0, Color.BLACK);
        multiRenderer.setXLabelsColor(Color.BLACK);
        multiRenderer.setPointSize(4f);
        for (int i = 0; i < arrBPListDtFilter.size(); i++) {
            multiRenderer.addXTextLabel(i + 1, DateUtil.dateConvert(arrBPListDtFilter.get(i).getHM_timestamp(), "dd-MM-yyyy HH:mm:ss", "dd MMM yy"));
        }
        multiRenderer.addSeriesRenderer(hbRenderer);
        GraphicalView chartView = ChartFactory.getLineChartView(getActivity(), dataset, multiRenderer);
        chartBPDia.addView(chartView, 0);
    }
}
