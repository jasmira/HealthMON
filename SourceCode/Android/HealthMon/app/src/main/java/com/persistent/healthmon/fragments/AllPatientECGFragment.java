package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.ECGBluetoothService;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;
import com.vesag.bt.beans.ECGDataRealtime;
import com.vesag.bt.util.UtilClass;
import com.vesag.bt.util.bt_util_Constants;

import org.achartengine.ChartFactory;
import org.achartengine.GraphicalView;
import org.achartengine.chart.PointStyle;
import org.achartengine.model.XYMultipleSeriesDataset;
import org.achartengine.model.XYSeries;
import org.achartengine.renderer.XYMultipleSeriesRenderer;
import org.achartengine.renderer.XYSeriesRenderer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * Created by pushkar_bhadle on 5/17/2016.
 */
public class AllPatientECGFragment  extends BaseFragment implements View.OnClickListener  {
    private static final String TAG = AllPatientECGFragment.class.getSimpleName();

    // private OnFragmentInteractionListener mListener;
    String value;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    private Context mContext;

    private RelativeLayout mRelativeLayoutECGWaveForm;
    private Button btnCapture,btnSave, btnCancel;

    private boolean isCapture = false;




    private ArrayList<Integer> ecgWavePoints;
    private XYSeries xySeries;
    private XYMultipleSeriesDataset dataset;
    private XYMultipleSeriesRenderer renderer;
    private XYSeriesRenderer rendererSeries;
    private GraphicalView graphicalView;
    //private double samplingRate = 0.6;
    //Sampling freq for ECG signal is 150Hz. So the sampling rate is 0.0067seconds

    private double samplingRate = /*6.7;//ms */ 0.0067; //seconds
    private int pointsToDisplay = 75;

    private int yMax = 5;
    private int yMin = -5;
    private int xScrollAhead = 35;
    private double currentX = 0;
    private final int chartDelay = 10; //  millisecond delay for count
    private ChartingThread chartingThread;
    static boolean isActive = false;
    LinkedBlockingQueue<Double> queue = new LinkedBlockingQueue<Double>();

    public AllPatientECGFragment() {
    }

    public AllPatientECGFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ClassicBluetoothManager.getInstance().queryForPairedDevices();
        ClassicBluetoothManager.getInstance().discoverDevices();
        if (getArguments() != null) {

        }
        mContext = getActivity();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater,ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.all_patient_task_ecg, container, false);
        initView(view);
        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        HealthMonLog.i(TAG, "Patient ID = " + value);
        ArrayList<PatientVitals> patientVitals = new ArrayList<>();
        patientVitals = DatabaseHelper.getInstance(getActivity()).getAllPatientECG(value);
        Collections.sort(patientVitals);
        HealthMonLog.i(TAG, "Sorted patient list => " + patientVitals.toString());
        if (patientVitals.size() > 0) {
            Date date = patientVitals.get(0).getHM_timestamp_in_DATE();
            if(date != null) {
                String strDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
                tv_ltRecorded.setText(strDate);
            }
/*            ArrayList<Integer> ecgPoint = new ArrayList<>();
           // ecgWavePoints.addAll ((ArrayList<Integer>) HealthMonUtility.convertByteArrayToIntArrayList(patientVitals.get(0).getEcgWavePoints()));
            ecgPoint.addAll ((ArrayList<Integer>) HealthMonUtility.convertByteArrayToIntArrayList(patientVitals.get(0).getEcgWavePoints()));
            if(ecgPoint != null) {
                showECGGraph(ecgPoint);
              //  HealthMonUtility.insertECGWavePoints(ecgPoint);
            }*/
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
        if (v.getId() == R.id.btn_ecg_capture) {
            if (ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                //Discover other devices
                if (!isRunning) {
                    startReadingECGDevice();
                }
                else
                    stopReading();
            } else {
                Toast.makeText(getContext(), "Bluetooth is Disabled", Toast.LENGTH_SHORT).show();
            }
        }
        if (v.getId() == R.id.btnHelp) {
            Toast.makeText(getContext(), "Coming soon", Toast.LENGTH_SHORT).show();
        }
        if (v.getId() == R.id.tv_connection) {
            showConnectionSetting(v);
        }
        if (v.getId() == R.id.btn_ecg_cancel) {
            vitalCancelDialog(AllPatientECGFragment.this,individualPatientOptionLoad);
        }
        if (v.getId() == R.id.btn_ecg_save) {
            if(isCapture) {
                performSave();
/*                PatientVitals patientVitals = new PatientVitals();
                patientVitals.setPatient_id(value);
                patientVitals.setHM_DeviceID(0);
                patientVitals.setHM_userId(String.valueOf(PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, 1, getContext())));
                patientVitals.setEcgWavePoints(HealthMonUtility.convertIntArrayListToByteArray(ecgWavePoints));
                patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                patientVitals.setHM_timestamp_in_DATE(new Date());
                HealthMonLog.i(TAG,"ECG = "+patientVitals.toString());
                DatabaseHelper.getInstance(getActivity()).insertECGNRTDetails(patientVitals);
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtTaskBPDataInserted));
                getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientECGFragment.this).commit();
                individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());*/
            }else{
                HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtTaskBPDataNotValid));
            }
        }
    }

    private void performSave(){
        final Dialog dialog = new Dialog(getContext());
        dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
        Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
        Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
        TextView tvErrMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
        tvErrMsg.setText(getString(R.string.txtSaveData));
        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                return;
            }
        });
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PatientVitals patientVitals = new PatientVitals();
                patientVitals.setPatient_id(value);
                patientVitals.setHM_DeviceID(0);
                patientVitals.setHM_userId(PreferanceManager.getAshaId(getContext()));
                patientVitals.setEcgWavePoints(HealthMonUtility.convertIntArrayListToByteArray(ecgWavePoints));
                patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                patientVitals.setHM_timestamp_in_DATE(new Date());
                HealthMonLog.i(TAG,"ECG = "+patientVitals.toString());
                DatabaseHelper.getInstance(getActivity()).insertECGNRTDetails(patientVitals);
                dialog.dismiss();
                getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientECGFragment.this).commit();
                individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientECGFragment.this.getTag());
            }
        });
        dialog.show();


        //HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtTaskBPDataInserted));
        //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientECGFragment.this).commit();
        //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
    }


    private void stopReading(){
        disconnectDevice();
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                ECGBluetoothService.class);
        mContext.stopService(pOxiWvFormBluetoothIntent);
    }

/*
    @Override
    protected void updateDeviceRunning(String str) {
        super.updateDeviceRunning(str);
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                ECGBluetoothService.class);
        if(pOxiWvFormBluetoothIntent!=null)
        mContext.stopService(pOxiWvFormBluetoothIntent);
    }
*/

    public void startReadingECGDevice(){
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.ECG_DEVICE);
        if(address == null){
            Toast.makeText(mContext, "ECG device has not configured", Toast.LENGTH_SHORT).show();
            return;
        }
        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);

        HealthMonLog.i(TAG, "startReadingECGDevice()");
        showProgressbarDataReading(true,Constants.ECG_DEVICE);
        Intent ecgBluetoothIntent = new Intent(mContext,
                ECGBluetoothService.class);
        ecgBluetoothIntent.putExtra("ECG device Name",
                bluetoothDevice.getName());
        ecgBluetoothIntent.putExtra("ECG device addr",
                bluetoothDevice.getAddress());
        ecgBluetoothIntent.putExtra("ECG device id",
                bluetoothDevice);

        ecgBluetoothIntent.putExtra(Constants.DEVICE_ID, Constants.ECG_STR_DEVICE_ID);
        Constants.setECG_DEVICE_ID(Integer.parseInt(Constants.ECG_STR_DEVICE_ID));
        mContext.startService(ecgBluetoothIntent);
    }

/*    @Override
    public void onAttach(Context activity) {
        super.onAttach(activity);
        try {
            mListener = (OnFragmentInteractionListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }


    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        public void onFragmentInteraction(Uri uri);
    }*/


    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, final Intent intent) {
            String action = intent.getAction();

            // When discovery finds a device
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {

                // When discovery is finished, change the Activity title
            } else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED
                    .equals(action)) {
        //        showProgressbarDataReading(false,Constants.ECG_DEVICE);

            }
            else if (Constants.ACTION_ECG_WAVE_SERVICE_DESTROYED.equals(action)) {
                showProgressbarDataReading(false,Constants.ECG_DEVICE);
                showECGGraph(ecgWavePoints);
                isCapture = true;

            }
            else if (bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM
                    .equalsIgnoreCase(action)) {

                final String transmissionType = intent
                        .getStringExtra(bt_util_Constants.TRANSMISSION_TYPE);

                if (transmissionType
                        .equalsIgnoreCase(bt_util_Constants.NONREALTIME_TYPE)) {
                    ArrayList<Integer> wavepoints = intent
                            .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS);
                    if (wavepoints != null && wavepoints.size() > 0) {
                        Thread dbThread = new Thread(new Runnable() {
                            @Override
                            public void run() {
                                nonRealTimeECGdataCollection(intent);
                            }
                        });
                        dbThread.start();
                    } else {
                        showProgressbarDataReading(false,Constants.ECG_DEVICE);
                    }

                } else if (transmissionType
                        .equalsIgnoreCase(bt_util_Constants.REALTIME_TYPE)) {
                    ArrayList<ECGDataRealtime> realTimePackets = (ArrayList<ECGDataRealtime>) intent
                            .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
                    if (realTimePackets != null && realTimePackets.size() > 0) {
                        Thread dbThread = new Thread(new Runnable() {

                            @Override
                            public void run() {
                                realTimeECGdataCollection(intent);
                            }
                        });
                        dbThread.start();
                    } else {
                        Toast.makeText(mContext,
                                "In real time data collection",//getString(R.string.reset_blutooth),
                                Toast.LENGTH_LONG).show();
                    }

                }


            }
        }
        private void nonRealTimeECGdataCollection(Intent intent) {
            //This is we are executing
            final ArrayList<Integer> wavepoints = intent
                    .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS);
            ecgWavePoints = new ArrayList<>();
            ecgWavePoints.addAll(intent
                    .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS));
            String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
            HealthMonLog.v(TAG,"On Recive DEVICE_ID:" + deviceId+ "NONREALTIME_TYPE" + ecgWavePoints.toString());


            if (wavepoints != null && wavepoints.size() > 0) {

            } else {
                Toast.makeText(mContext,
                        getString(R.string.reset_blutooth), Toast.LENGTH_LONG)
                        .show();
            }
/*            Intent waveFormIntent = new Intent(mContext,
                    ECGWaveFormActivity.class);
            waveFormIntent.putExtra(bt_util_Constants.ECG_WAVEPOINTS, intent
                    .getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS));
            waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(waveFormIntent);*/
        }

        private void realTimeECGdataCollection(Intent intent) {
            final ArrayList<ECGDataRealtime> realTimePackets = (ArrayList<ECGDataRealtime>) intent
                    .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
            String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
            Log.v(TAG, "REALTIME_TYPE On Recive DEVICE_ID:" + deviceId);
            Intent waveFormIntent = new Intent(mContext,
                    ECGWaveFormActivity.class);

            ArrayList<ECGDataRealtime> realTimePackets1 = (ArrayList<ECGDataRealtime>) intent
                    .getSerializableExtra(bt_util_Constants.REAL_TIME_PACKETS);
            waveFormIntent.putExtra(bt_util_Constants.ECG_WAVEPOINTS,
                    UtilClass.getWavePointsFromAllPackets(realTimePackets1));
            waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(waveFormIntent);
        }
    };

    //To show graph
    private void showECGGraph(ArrayList<Integer> ecgWavePoints) {
        readECGWavepoints(ecgWavePoints);
        setChartLook();
        dataset = new XYMultipleSeriesDataset();
        xySeries = new XYSeries(renderer.getChartTitle());
        dataset.addSeries(xySeries);
        graphicalView = ChartFactory.getLineChartView(getActivity().getApplicationContext(), dataset, renderer);
        graphicalView.refreshDrawableState();
        currentX = 0; // reset the horizontal of the graphing

        //setContentView(view);

        // To deal with onCreate coming from orientation change, only create chartingThread first time
        if (chartingThread == null) {
            ChartHandler chartUIHandler = new ChartHandler();
            chartingThread = new ChartingThread(chartUIHandler);
            chartingThread.start();
        }
        isActive = true;
        mRelativeLayoutECGWaveForm.addView(graphicalView);
    }

    @Override
    public void onStart() {
        super.onStart();
        registerReceiver();
    }

    @Override
    public void onStop() {
        super.onStop();
        mContext.unregisterReceiver(mReceiver);
        showProgressbarDataReading(false,Constants.ECG_DEVICE);
    }

    public void readECGWavepoints(ArrayList<Integer> ecgWavePoints) {
        //ecgWavePoints = getActivity().getIntent().getIntegerArrayListExtra(bt_util_Constants.ECG_WAVEPOINTS);

        if(ecgWavePoints != null)
        {
            Iterator<Integer> wavepointIterator = ecgWavePoints.iterator();
            while (wavepointIterator.hasNext()) {
                Double val = Double.valueOf(wavepointIterator.next());
                val = (val-2048)*3/416;
                queue.offer(val);
            }
        }

    }

    private void registerReceiver(){
        IntentFilter intentFilter = new IntentFilter(Constants.ACTION_ECG_WAVE_SERVICE_DESTROYED);
        intentFilter.addAction(bt_util_Constants.DONE_PARSING_SHOW_WAVEFORM);
        mContext.registerReceiver(mReceiver, intentFilter);
    }

    class ChartHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
            double yVal = ((double)msg.arg1)/1000;
            xySeries.add(currentX, yVal);
            graphicalView.repaint();
        }
    }

    public void setChartLook() {
        renderer = new XYMultipleSeriesRenderer();
        renderer.setApplyBackgroundColor(true);
        renderer.setBackgroundColor(Color.DKGRAY);//argb(100, 50, 50, 50));
        renderer.setLabelsTextSize(10);
        renderer.setLegendTextSize(10);
        renderer.setAxesColor(Color.BLACK);
        renderer.setAxisTitleTextSize(10);
        renderer.setChartTitle(getString(R.string.txtECGHeartbeats));
        renderer.setChartTitleTextSize(15);
        //renderer.setFitLegend(true);
        renderer.setGridColor(Color.BLACK);

        renderer.setPanEnabled(true, false); // TODO
        renderer.setXAxisMin(0);
        renderer.setXAxisMax(6);
        renderer.setPanLimits(new double[]{0,31,0,5});
        renderer.setPointSize(0.5f);
        renderer.setXTitle("X (s)");
        renderer.setYTitle("Y (mV)");
        renderer.setMargins(new int []{10, 10, 20, 15}); // TODO: i doubled
        renderer.setZoomButtonsVisible(false);
        renderer.setZoomEnabled(false);
        renderer.setShowGrid(true);
        renderer.setYAxisMax(yMax);
        renderer.setYAxisMin(yMin);
        renderer.setShowLabels(true);
        renderer.setShowLegend(true);

        renderer.setExternalZoomEnabled(false);
        renderer.setZoomEnabled(false, false);

        rendererSeries = new XYSeriesRenderer();
        rendererSeries.setColor(Color.GREEN);
        rendererSeries.setLineWidth(1f);
        rendererSeries.setPointStyle(PointStyle.CIRCLE);
        renderer.addSeriesRenderer(rendererSeries);
    }

    class ChartingThread extends Thread {
        private boolean continueCharting = true;
        private Handler handler;
        public ChartingThread(Handler handler) {
            this.handler = handler;
        }

        @Override
        public void run() {
            while (!queue.isEmpty()) {
                Double yVal = null;
                try {
                    Thread.sleep(chartDelay);
                    yVal = queue.poll(2, TimeUnit.SECONDS);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (yVal == null) {
                    // continue;
                }
                currentX = currentX + samplingRate;
                if (yVal > yMax) {
                    yMax = yVal.intValue();
                    renderer.setYAxisMax(yVal);
                } else if (yVal < yMin) {
                    yMin = yVal.intValue();
                    renderer.setYAxisMin(yVal);
                }

                // send Message to UI handler for charting.
                Message msg = Message.obtain();
                msg.arg1 = (int) Math.round(yVal * 1000);
                handler.sendMessage(msg);
            }
        }

        public void cancel() {
            continueCharting = false;
        }
    }

    private void initView(View view) {

        //Base initializaion
        initCaptureTestView(view);
        tv_BLConn.setOnClickListener(this);
        tv_test.setText(getString(R.string.txtecg));
        iv_test.setImageResource(R.drawable.ic_landing_ecg);
        llLastData.setVisibility(View.GONE);
        llSwitchMode.setVisibility(View.GONE);
        btn_helpGuide.setOnClickListener(this);

        mRelativeLayoutECGWaveForm = (RelativeLayout) view.findViewById(R.id.ecg_wave_form);
        btnCapture = (Button) view.findViewById(R.id.btn_ecg_capture);
        btnSave = (Button) view.findViewById(R.id.btn_ecg_save);
        btnCancel = (Button) view.findViewById(R.id.btn_ecg_cancel);
        btnCapture.setOnClickListener(this);
        btnSave.setOnClickListener(this);
        btnCancel.setOnClickListener(this);


    }
}
