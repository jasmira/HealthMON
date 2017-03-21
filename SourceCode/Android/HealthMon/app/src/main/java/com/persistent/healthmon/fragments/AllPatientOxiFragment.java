package com.persistent.healthmon.fragments;

import android.app.Dialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.PulseOxiWvFormBluetoothService;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.interfaces.IndividualPatientOptionLoad;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.placeholder.PulseOxPopupWindow;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.threads.HealthDeviceManager;
import com.persistent.healthmon.threads.PulseOximeterConnectionThread;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;
import com.vesag.bt.beans.PulseOXPacketParameter;
import com.vesag.bt.beans.PulseOXPacketWaveform;
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
 * Created by pushkar_bhadle on 5/16/2016.
 */
public class AllPatientOxiFragment extends BaseFragment implements View.OnClickListener {

    private static final String TAG = AllPatientOxiFragment.class.getSimpleName();
    private PulseOximeterConnectionThread mPulseOxiMeterThread = null;
    String value;
    IndividualPatientOptionLoad individualPatientOptionLoad;
    PatientVitals patientVitals = new PatientVitals();
    Button btnCaputreReading, btnCaputreGraph, btnSave, btnCancel;

    private EditText edtSpO2, edtPI, edtPulseRate;
    private Context mContext;

    private boolean isCaptureReading = false;
    private boolean isCaptureWave = false;

    ArrayList<Integer> wavepoints = new ArrayList<>();
    ArrayList<Integer> pulseBeats = new ArrayList<>();
    ArrayList<Integer> pulseOxiWavePackets ;

    //for Wave form
    private RelativeLayout mRelativeLayoutOXIWaveForm;
    private XYSeries xySeries;
    private XYMultipleSeriesDataset dataset;
    private XYMultipleSeriesRenderer renderer;
    private XYSeriesRenderer rendererSeries;
    private GraphicalView view;
    //private double samplingRate = 0.6;
    //Sampling freq for PulseOxi signal is 10Hz. So the sampling rate is 0.1seconds
    private double samplingRate = /*6.7;//ms */ 0.1; //seconds

    private int yMax = 140;
    private int yMin = 0;
    private double currentX = 0;
    private final int chartDelay = 10; //  millisecond delay for count
    private ChartingThread chartingThread;

    // TODO: package visibility so that queue service can see when it is ready for data
    static boolean isActive = false;
    LinkedBlockingQueue<Double> queue = new LinkedBlockingQueue<Double>();

    public AllPatientOxiFragment() {
        // Required empty public constructor
    }


    public AllPatientOxiFragment(IndividualPatientOptionLoad individualPatientOptionLoad) {
        this.individualPatientOptionLoad = individualPatientOptionLoad;
    }


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {

        }
        mContext = getActivity();
        ClassicBluetoothManager.getInstance().queryForPairedDevices();
        ClassicBluetoothManager.getInstance().discoverDevices();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.all_patient_task_oxi, container, false);
        initView(view);
        value = getArguments().getString(Constants.SELECTED_PATIENT_ID);
        ArrayList<PatientVitals> patientOxilist = DatabaseHelper.getInstance(getActivity()).getAllPatientOXI(value);
        Collections.sort(patientOxilist);
        HealthMonLog.i(TAG, "Sorted List -> " + patientOxilist.toString());
        if (patientOxilist.size() > 0) {
            Date date = patientOxilist.get(0).getHM_timestamp_in_DATE();
            if (date != null) {
                String strDate = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING).format(date);
                tv_ltRecorded.setText(strDate);
            }
            tv_ltData.setText("" + patientOxilist.get(0).getOxiPulse());
/*            ArrayList<Integer> oxiWavePoint = new ArrayList<>();
            // ecgWavePoints.addAll ((ArrayList<Integer>) HealthMonUtility.convertByteArrayToIntArrayList(patientVitals.get(0).getEcgWavePoints()));
            oxiWavePoint.addAll((ArrayList<Integer>) HealthMonUtility.convertByteArrayToIntArrayList(patientOxilist.get(0).getOxiWavePoints()));
            if (oxiWavePoint != null) {
                showGraph(oxiWavePoint);
            }*/
        }

/*        //Validations Text color
        edtSpO2.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = edtSpO2.getText().toString();
                if(strHB.matches("[0-9.]*") || strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 15 || Double.parseDouble(s.toString()) <=7) {
                        edtSpO2.setTextColor(getResources().getColor(R.color.colorred));
                    }
                }
            }
        });

        edtPulseRate.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                String strHB = edtPulseRate.getText().toString();
                if(strHB.matches("[0-9.]*") || strHB.equals("")) {
                    if (Double.parseDouble(s.toString()) > 15 || Double.parseDouble(s.toString()) <=7) {
                        edtPulseRate.setTextColor(getResources().getColor(R.color.colorred));
                    }
                }
            }
        });*/
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
        if (v.getId() == R.id.btnHelp) {
            final PulseOxPopupWindow popupWindow = new PulseOxPopupWindow(getContext());
            popupWindow.show(v, 0, 0);
            //layout_MainMenu.getForeground().setAlpha(150);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getContext().getSystemService(Context.WINDOW_SERVICE);
            //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
            //Toast.makeText(getContext(), getString(R.string.txtComingSoon), Toast.LENGTH_SHORT).show();
        }
        if (v.getId() == R.id.tv_connection) {
            showConnectionSetting(v);
        }
        if (v.getId() == R.id.btn_oxi_capture_reading) {
            if (ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                //Discover other devices
                if (!isRunning) {
                    if (isCaptureWave) {
                        showReadingWarningDialog(getActivity(), getString(R.string.txtTaskOxiCaptureReadingWarning));
                    } else {
                        startReadingPulseOxiDevice();
                    }
                } else
                    stopReading();
            } else {
                Toast.makeText(getContext(), getString(R.string.txtBluetoothDisable), Toast.LENGTH_SHORT).show();
            }

        }
        if (v.getId() == R.id.btn_oxi_capture_graph) {
            if (ClassicBluetoothManager.getInstance().isBluetoothEnabled()) {
                //Discover other devices
                if (!isRunning)
                    if (isCaptureReading) {
                        showWaveWarningDialog(getActivity(), getString(R.string.txtTaskOxiCaptureWaveWarning));
                    } else {
                        startReadingPulseOximeterForWaveform();
                    }
                else
                    stopReadingGraph();
            } else {
                Toast.makeText(getContext(), getString(R.string.txtBluetoothDisable), Toast.LENGTH_SHORT).show();
            }
        }
        if (v.getId() == R.id.btn_oxi_save) {
            if (!isCaptureReading) {
                HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskOxiCaptureWave));
            } else if (!isCaptureWave) {
                HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskOxiCaptureReading));
            } else {

                boolean valid = true;
                String strspo = edtSpO2.getText().toString();
                String strpi = edtPI.getText().toString();
                String strpulse = edtPulseRate.getText().toString();
                if (!strspo.matches("[0-9]*") || strspo.equals("")) {
                    valid = false;
                } else if (!strpi.matches("[0-9]*") || strpi.equals("")) {
                    valid = false;
                } else if (!strpulse.matches("[0-9]*") || strpulse.equals("")) {
                    valid = false;
                } else {
                    int spo = Integer.parseInt(String.valueOf(edtSpO2.getText()));
                    int pi = Integer.parseInt(String.valueOf(edtPI.getText()));
                    int pul = Integer.parseInt(String.valueOf(edtPulseRate.getText()));
                    if (spo < 95 || spo > 100 || pi < 1 || pi > 100 || pul < 10 || pul > 255) {
                        valid = false;
                    } else {
                        patientVitals.setOxiSPO(spo);
                        patientVitals.setOxiPI(pi);
                        patientVitals.setOxiPulse(pul);
                        patientVitals.setPatient_id(value);
                        patientVitals.setHM_timestamp(new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                        patientVitals.setHM_timestamp_in_DATE(new Date());
                        patientVitals.setHM_userId(PreferanceManager.getAshaId(getContext()));

                        HealthMonLog.i(TAG, "Vitals Oxi  = " + patientVitals.toString());
                    }

                }
                if (valid) {
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
                            int flagSPO2 = Constants.PRIORITY_NORMAL_PATIENT;
                            int flagOxiPulse = Constants.PRIORITY_NORMAL_PATIENT;
                            dialog.dismiss();
                            DatabaseHelper.getInstance(getActivity()).insertOXIDetails(patientVitals);
                            if (patientVitals.getOxiSPO() > 95) {
                                flagSPO2 = Constants.PRIORITY_NORMAL_PATIENT;
                            } else {
                                flagSPO2 = Constants.PRIORITY_HIGH_RISK_PATIENT;
                            }
                            if (patientVitals.getOxiPulse() > 70 || patientVitals.getOxiPulse() < 60) {
                                flagOxiPulse = Constants.PRIORITY_HIGH_RISK_PATIENT;
                            }
                            //Severity change spo2
                            DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagSPO2, Constants.DbConstants.COLUMN_OXI_SPO2_FLAG, patientVitals.getOxiSPO(), Constants.DbConstants.COLUMN_OXI_SPO2_VALUE);
                            //Severity change Pulse Oxi
                            DatabaseHelper.getInstance(getActivity()).updatePatientStatus(value, flagOxiPulse, Constants.DbConstants.COLUMN_OXI_PULSE_FLAG, patientVitals.getOxiPulse(), Constants.DbConstants.COLUMN_OXI_PULSE_VALUE);
                            Toast.makeText(getContext(), getString(R.string.txtTaskBPDataInserted), Toast.LENGTH_SHORT).show();
                            getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientOxiFragment.this).commit();
                            individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientOxiFragment.this.getTag());
                        }
                    });
                    dialog.show();
                    //DatabaseHelper.getInstance(getActivity()).insertOXIDetails(patientVitals);
                    // HealthMonUtility.showErrorDialog(getActivity(), getString(R.string.txtTaskBPDataInserted));
                    //getActivity().getSupportFragmentManager().beginTransaction().remove(AllPatientOxiFragment.this).commit();
                    //individualPatientOptionLoad.onCurrentFragmentDiscard(AllPatientVitalFragment.class.getName());
                } else {
                    HealthMonUtility.showErrorDialog(getActivity(), getActivity().getResources().getString(R.string.txtTaskBPDataNotValid));
                }
            }

        }
        if (v.getId() == R.id.btn_oxi_cancel) {
            vitalCancelDialog(AllPatientOxiFragment.this, individualPatientOptionLoad);
        }
    }


    private void stopReading() {
        disconnectDevice();
        if (mPulseOxiMeterThread != null)
            mPulseOxiMeterThread.cancel();
    }

    private Handler mDataHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            HealthMonLog.d(TAG, "mDataHandler: handleMessage()");

            try {
                Bundle bundle = msg.getData();
                if (bundle.containsKey("PulseOXPacketParameter")) {
                    String deviceId = bundle.getString(Constants.DEVICE_ID);
                    PulseOXPacketParameter pulseOXPacketParameter = (PulseOXPacketParameter) bundle.getSerializable("PulseOXPacketParameter");

                    int spo2 = pulseOXPacketParameter.getSpO2();
                    int pi = pulseOXPacketParameter.getPerfusionIndex();
                    int pulseRate = pulseOXPacketParameter.getPulseRate();
                    HealthMonLog.i(TAG, "OXI readings => SpO2 " + spo2 + "  PI " + pi + "  Pulse Rate " + pulseRate);
                    isCaptureReading = true;
                    displayPulseOxiMeterReport(spo2, pi, pulseRate);
                }
                showProgressbarDataReading(false, Constants.PULSE_OXI);
/*                if(!isRunning){
                    btnCaputreReading.setVisibility(View.GONE);
                    btnCaputreGraph.setVisibility(View.GONE);
                }else{
                    btnCaputreReading.setVisibility(View.VISIBLE);
                    btnCaputreGraph.setVisibility(View.VISIBLE);
                }*/
                /*if(mPulseOxiMeterThread != null)
                    mPulseOxiMeterThread.cancel();*/
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    };

    private void disconnect() {
        if (mPulseOxiMeterThread != null)
            mPulseOxiMeterThread.cancel();
    }

    private void displayPulseOxiMeterReport(int spo2, int pi, int pulseRate) {
        edtSpO2.setText("" + spo2);
        edtPI.setText("" + pi);
        edtPulseRate.setText("" + pulseRate);
    }

    public void startReadingPulseOxiDevice() {

        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.PULSE_OXIMETER);
        if (address == null) {
            Toast.makeText(mContext, "Device not configured", Toast.LENGTH_SHORT).show();
            return;
        }

        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);
        if (bluetoothDevice == null)
            return;

        HealthMonLog.i(TAG, "startReadingPulseOxiDevice(): Pulse Oxi address=" + bluetoothDevice.getAddress());

        disconnect();
        showProgressbarDataReading(true, Constants.PULSE_OXI);
        //Pulse Oximeter device
        mPulseOxiMeterThread = new PulseOximeterConnectionThread(
                bluetoothDevice,
                BluetoothAdapter.getDefaultAdapter(),
                mMessageHandler,
                mDataHandler,
                null);

        mPulseOxiMeterThread.start();
    }

    @Override
    public void onStop() {
        super.onStop();
        stopReading();
        stopReadingGraph();
        showProgressbarDataReading(false, Constants.PULSE_OXI);
        mContext.unregisterReceiver(mReceiver);
    }

    private void initView(View view) {

        //Base initializaion
        initCaptureTestView(view);
        btn_helpGuide.setOnClickListener(this);
        tv_BLConn.setOnClickListener(this);
        tv_test.setText(getString(R.string.txtpulseocimeter));
        iv_test.setImageResource(R.drawable.ic_landing_pulseoximeter);

        //Device Mode/ Manual Mode code
/*        btn_ModeSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked) {
                    edtSpO2.setEnabled(true);
                    edtPI.setEnabled(true);
                    edtPulseRate.setEnabled(true);
                    tv_deviceMode.setText(getString(R.string.txtTaskManualMode));
                    Toast.makeText(getContext(),getString(R.string.txtTaskManualMode),Toast.LENGTH_SHORT).show();
                    btnCaputreReading.setVisibility(View.GONE);
                    btnCaputreGraph.setVisibility(View.GONE);
                } else {
                    edtSpO2.setEnabled(false);
                    edtPI.setEnabled(false);
                    edtPulseRate.setEnabled(false);
                    edtSpO2.setText("");
                    edtPI.setText("");
                    edtPulseRate.setText("");
                    tv_deviceMode.setText(getString(R.string.txtTaskDeviceMode));
                    Toast.makeText(getContext(),getString(R.string.txtTaskDeviceMode),Toast.LENGTH_SHORT).show();
                    btnCaputreReading.setVisibility(View.VISIBLE);
                    btnCaputreGraph.setVisibility(View.VISIBLE);
                }
            }
        });*/

        llSwitchMode.setVisibility(View.GONE);

        edtSpO2 = (EditText) view.findViewById(R.id.edtOxiSpO);
        edtPI = (EditText) view.findViewById(R.id.edtOXIPI);
        edtPulseRate = (EditText) view.findViewById(R.id.edtOxiPulse);
        btnCaputreReading = (Button) view.findViewById(R.id.btn_oxi_capture_reading);
        btnCaputreGraph = (Button) view.findViewById(R.id.btn_oxi_capture_graph);
        btnCancel = (Button) view.findViewById(R.id.btn_oxi_cancel);
        btnSave = (Button) view.findViewById(R.id.btn_oxi_save);
        mRelativeLayoutOXIWaveForm = (RelativeLayout) view.findViewById(R.id.rl_oxi_graph);

        btnCaputreReading.setOnClickListener(this);
        btnCaputreGraph.setOnClickListener(this);
        btnCancel.setOnClickListener(this);
        btnSave.setOnClickListener(this);
        edtSpO2.setEnabled(false);
        edtPI.setEnabled(false);
        edtPulseRate.setEnabled(false);

/*        if(isRunning){
            btnCaputreReading.setVisibility(View.GONE);
            btnCaputreGraph.setVisibility(View.GONE);
        }else{
            btnCaputreReading.setVisibility(View.VISIBLE);
            btnCaputreGraph.setVisibility(View.VISIBLE);
        }*/

    }

    //for wave form
    @Override
    public void onStart() {
        super.onStart();
        registerReceiver();
    }


    private void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter(Constants.ACTION_PULSE_WAVE_SERVICE_DESTROYED);
        intentFilter.addAction(bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM);
        mContext.registerReceiver(mReceiver, intentFilter);

    }

    private void stopReadingGraph() {
        disconnectDevice();
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                PulseOxiWvFormBluetoothService.class);
        mContext.stopService(pOxiWvFormBluetoothIntent);
    }

    public void startReadingPulseOximeterForWaveform() {
        String address = HealthDeviceManager.getInstance().getHealthDeviceAddress(HealthDevice.PULSE_OXIMETER);
        if (address == null) {
            Toast.makeText(mContext, "Pulse Oximeter device has not been set", Toast.LENGTH_SHORT).show();
            return;
        }
        BluetoothDevice bluetoothDevice = ClassicBluetoothManager.getInstance().getBluetoothDevice(address);

        HealthMonLog.d(TAG, "PULSE_OXIMETER_WAVEFORM_DEVICE device selected");
        showProgressbarDataReading(true, Constants.PULSE_OXI_GRAPH);
/*        if(!isRunning){
            btnCaputreReading.setVisibility(View.GONE);
            btnCaputreGraph.setVisibility(View.GONE);
        }else{
            btnCaputreReading.setVisibility(View.VISIBLE);
            btnCaputreGraph.setVisibility(View.VISIBLE);
        }*/
        Intent pOxiWvFormBluetoothIntent = new Intent(mContext,
                PulseOxiWvFormBluetoothService.class);

        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device Name",
                bluetoothDevice.getName());
        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device addr",
                bluetoothDevice.getAddress());
        pOxiWvFormBluetoothIntent.putExtra("POxiWvForm device id",
                bluetoothDevice);

        pOxiWvFormBluetoothIntent.putExtra(Constants.DEVICE_ID, "123");
        Constants.setPULSE_OXI_DEVICE_ID(Integer.parseInt("123"));
        mContext.startService(pOxiWvFormBluetoothIntent);
    }

    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, final Intent intent) {
            String action = intent.getAction();

            // When discovery finds a device
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {

                // When discovery is finished, change the Activity title
            } else if (BluetoothAdapter.ACTION_DISCOVERY_FINISHED
                    .equals(action)) {
                showProgressbarDataReading(false, Constants.PULSE_OXI_GRAPH);
            } else if (Constants.ACTION_PULSE_WAVE_SERVICE_DESTROYED.equals(action)) {
                showProgressbarDataReading(false, Constants.PULSE_OXI_GRAPH);
            } else if (bt_util_Constants.DONE_PARSING_SHOW_PULSE_OXI_WAVEFORM
                    .equalsIgnoreCase(action)) {
                ArrayList<PulseOXPacketWaveform> pulseOxiWvFormPackets = (ArrayList<PulseOXPacketWaveform>) intent
                        .getSerializableExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS);
                //if need to add device ID in it
                //String deviceId = intent.getStringExtra(Constants.DEVICE_ID);
                ArrayList<Integer> wavepointsToStore = UtilClass
                        .getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets);
                ArrayList<Integer> pulseBeatsToStore = UtilClass
                        .getPulseBeatFromAllPacketsForPulseOxi(pulseOxiWvFormPackets);
                byte[] byteArray = UtilClass
                        .convertIntArrayListToByteArray(wavepointsToStore);
                byte[] pulseBeatsByteArray = UtilClass
                        .convertIntArrayListToByteArray(pulseBeatsToStore);
                patientVitals.setOxiWavePoints(HealthMonUtility.convertIntArrayListToByteArray(wavepointsToStore));
                patientVitals.setOxiBeatPoints(HealthMonUtility.convertIntArrayListToByteArray(pulseBeatsToStore));
                showProgressbarDataReading(false, Constants.PULSE_OXI_GRAPH);

                if (pulseOxiWvFormPackets != null
                        && pulseOxiWvFormPackets.size() > 0) {
                    isCaptureWave = true;
                    pulseOxiWavePackets = new ArrayList<>();
                    pulseOxiWavePackets.addAll(UtilClass.getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets));
                    showGraph(pulseOxiWavePackets);
                    isCaptureWave = true;
/*                    Intent waveFormIntent = new Intent(
                            mContext,
                            PulseOxiWaveformActivity.class);
                    HealthMonLog.i(TAG,"OXI wave form -> "+UtilClass
                            .getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets));

                    waveFormIntent
                            .putExtra(
                                    bt_util_Constants.PULSE_OXI_WAVEPOINTS,
                                    UtilClass
                                            .getWavePointsFromAllPacketsForPulseOxi(pulseOxiWvFormPackets));
                    waveFormIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(waveFormIntent);*/
                } else {
                    showProgressbarDataReading(false, Constants.PULSE_OXI_GRAPH);
/*                    Toast.makeText(mContext,
                            getString(R.string.reset_blutooth),
                            Toast.LENGTH_LONG).show();*/
                }
            }
        }
    };

    //Chart Draw

    public void showGraph(ArrayList<Integer> pulseOxiWavePacket) {
        readPulseOxiWavepoints(pulseOxiWavePacket);
        setChartLook();
        dataset = new XYMultipleSeriesDataset();
        xySeries = new XYSeries(renderer.getChartTitle());
        dataset.addSeries(xySeries);
        view = ChartFactory.getLineChartView(getContext(), dataset, renderer);
        view.refreshDrawableState();
        currentX = 0; // reset the horizontal of the graphing

        // To deal with onCreate coming from orientation change, only create chartingThread first time
        if (chartingThread == null) {
            ChartHandler chartUIHandler = new ChartHandler();
            chartingThread = new ChartingThread(chartUIHandler);
            chartingThread.start();
        }
        isActive = true;
        mRelativeLayoutOXIWaveForm.addView(view);
    }

    private void readPulseOxiWavepoints(ArrayList<Integer> pulseOxiWavePacket) {
        //ArrayList<Integer> pulseOxiWavePoints = getIntent().getIntegerArrayListExtra(bt_util_Constants.PULSE_OXI_WAVEPOINTS);

        if (pulseOxiWavePacket != null) {
            Iterator<Integer> wavepointIterator = pulseOxiWavePacket.iterator();
            while (wavepointIterator.hasNext()) {
                Double val = Double.valueOf(wavepointIterator.next());
//	    		Integer val = wavepointIterator.next();
                //  		val = (val-2048)*3/416;
                queue.offer(val);
            }
        }

    }

    class ChartHandler extends Handler {
        @Override
        public void handleMessage(Message msg) {
            double yVal = ((double) msg.arg1) / 1000;
            HealthMonLog.d("PulseOxiWaveformActivity", "x " + currentX + " y " + yVal);
            xySeries.add(currentX, yVal);
            view.repaint();
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
        // renderer.setChartTitle("Pulse Oximeter Waveform");
        // renderer.setChartTitleTextSize(30);
        // renderer.setFitLegend(true);
        renderer.setGridColor(Color.BLACK);

        renderer.setPanEnabled(true, false); // TODO
        renderer.setXAxisMin(0);
        renderer.setXAxisMax(6);
        renderer.setPanLimits(new double[]{0, 31, 0, 5});
        renderer.setPointSize(0.5f);
        renderer.setXTitle("X (s)");
        renderer.setYTitle("Y (mV)");
        renderer.setMargins(new int[]{10, 10, 20, 15}); // TODO: i doubled
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
                //		Integer yVal = null;
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

    public void showReadingWarningDialog(Context context, String message) {
        TextView txtErrorMsg;
        Button btnOk;
        // Create custom dialog object
        final Dialog dialog = new Dialog(context);
        // Include dialog.xml file
        dialog.setContentView(R.layout.dialog_error);
        txtErrorMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
        btnOk = (Button) dialog.findViewById(R.id.btnOk);

        txtErrorMsg.setText(message);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startReadingPulseOxiDevice();
                dialog.dismiss();
            }
        });
        // Set dialog title
        //dialog.setTitle("Custom Dialog");
        dialog.show();
    }

    public void showWaveWarningDialog(Context context, String message) {
        TextView txtErrorMsg;
        Button btnOk;
        // Create custom dialog object
        final Dialog dialog = new Dialog(context);
        // Include dialog.xml file
        dialog.setContentView(R.layout.dialog_error);
        txtErrorMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
        btnOk = (Button) dialog.findViewById(R.id.btnOk);

        txtErrorMsg.setText(message);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startReadingPulseOximeterForWaveform();
                dialog.dismiss();
            }
        });
        // Set dialog title
        //dialog.setTitle("Custom Dialog");
        dialog.show();
    }

}
