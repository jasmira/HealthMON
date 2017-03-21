package com.persistent.healthmon.viewcontroller;

import android.app.Activity;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.ListPopupWindow;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.mikhaellopez.circularimageview.CircularImageView;
import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.NotificationToolbarAdapter;
import com.persistent.healthmon.communication.NetworkStatusReceiver;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.fragments.AllPatientFragment;
import com.persistent.healthmon.fragments.CollaborationFragment;
import com.persistent.healthmon.fragments.DashBoardMainFragment;
import com.persistent.healthmon.fragments.DashboardTasksFragment;
import com.persistent.healthmon.fragments.EducationFragment;
import com.persistent.healthmon.fragments.MyActivitiesFragment;
import com.persistent.healthmon.fragments.PatientRegistrationFragment;
import com.persistent.healthmon.fragments.ReportsFragment;
import com.persistent.healthmon.model.AshaDetails;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.Tasks;
import com.persistent.healthmon.placeholder.AshaProfilePopupWindow;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;

public class HealthMonMainActivity extends AppCompatActivity {

    private static final String TAG = HealthMonMainActivity.class.getSimpleName();
    private DashboardTasksFragment mAdapter;
    byte[] byteArray = new byte[0];

    ListPopupWindow listPopupWindow;
    ArrayList<String> user_spinner_string;

    Menu menu;

    private static int notification_count = 0;
    private static TextView tv_notification_count = null;
    private static TextView last_sync = null;
    boolean check = true;
    LinearLayout llDashboard, llDashboardActive, llPatientRegistration, llPatientRegistrationActive, llAllPatient, llAllPatientActive, llReports, llReportsActive, llEducation, llEducationActive, llCollaboration, llCollaborationActive, llMyActivities, llMyActivitiesActive;
    ImageView ivDashboard, ivPatientRegistration, ivAllPatient, ivReports, ivEducation;

    Toolbar toolbar;
    ArrayList<Tasks> notification;
    View notification_click_view;
    int notification_count_temp;
    Activity activity;
    private boolean bolBroacastRegistred;

    static TextView toolbar_asha_name;
    static CircularImageView circular_asha_toolbar;

    private DashBoardMainFragment dashBoardMainFragment = new DashBoardMainFragment();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        activity = HealthMonMainActivity.this;

        //getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        initPanel();
        HealthMonUtility.addFragment(HealthMonMainActivity.this, dashBoardMainFragment);
        toolbar = (Toolbar) findViewById(R.id.toolbar_dashboard);
        toolbar_asha_name = (TextView) findViewById(R.id.toolbar_profile_layout_username);
        //CircularImageView circularToolbarAsha = (CircularImageView) findViewById(R.id.dashboarduserimage);
        AshaDetails ashaDetails = DatabaseHelper.getInstance(this).getAshaDetails(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext()));
        if (ashaDetails != null) {
            toolbar_asha_name.setText(ashaDetails.getAsha_name());
            // circularToolbarAsha.setImageResource(R.drawable.asha_4);
        }        //CircularImageView circularToolbarAsha = (CircularImageView) findViewById(R.id.dashboarduserimage);
        //to remove left padding in toolbar
        toolbar.setContentInsetsAbsolute(0, 0);
        if (NetworkStatusReceiver.isOnline(getApplicationContext())) {
            showNetworkStatus(true);
            PreferanceManager.setBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, true, getApplicationContext());
/*            WebserviceManager.getTaskDetails(HealthMonMainActivity.this);
            WebserviceManager.getAshaDetails(HealthMonMainActivity.this);*/
        } else {
            showNetworkStatus(false);
            PreferanceManager.setBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, false, getApplicationContext());
        }
        registerReceiver(broadcastReceiverConnected, new IntentFilter(Constants.BROADcAST_CONNECTED));
        registerReceiver(broadcastReceiverDisconnected, new IntentFilter(Constants.BROADcAST_DISCONNECTED));
        bolBroacastRegistred = true;

        LocalBroadcastManager.getInstance(this).registerReceiver(mMessageReceiver,
                new IntentFilter(Constants.LOG_OUT));
        if (toolbar != null) {
            setSupportActionBar(toolbar);
        }
    }

    private void initPanel() {
        llDashboard = (LinearLayout) findViewById(R.id.llDashboard);
        llDashboardActive = (LinearLayout) findViewById(R.id.llDashboardactive);
        llPatientRegistration = (LinearLayout) findViewById(R.id.llPatientRegistration);
        llPatientRegistrationActive = (LinearLayout) findViewById(R.id.llPatientRegistrationactive);
        llAllPatient = (LinearLayout) findViewById(R.id.llAllPatient);
        llAllPatientActive = (LinearLayout) findViewById(R.id.llAllPatientactive);
        llReports = (LinearLayout) findViewById(R.id.llReports);
        llReportsActive = (LinearLayout) findViewById(R.id.llReportsactive);
        llEducation = (LinearLayout) findViewById(R.id.llEducation);
        llEducationActive = (LinearLayout) findViewById(R.id.llEducationactive);
        ivDashboard = (ImageView) findViewById(R.id.ivDashboardPannelDashboard);
        ivPatientRegistration = (ImageView) findViewById(R.id.ivDashboardPannelRegistration);
        ivAllPatient = (ImageView) findViewById(R.id.ivDashboardPannelAllPatients);
        ivReports = (ImageView) findViewById(R.id.ivDashboardPannelReports);
        ivEducation = (ImageView) findViewById(R.id.ivDashboardPannelEducation);
        llCollaboration = (LinearLayout) findViewById(R.id.llCollaboration);
        llCollaborationActive = (LinearLayout) findViewById(R.id.llCollaborationactive);
        llMyActivities = (LinearLayout) findViewById(R.id.llMyActivities);
        llMyActivitiesActive = (LinearLayout) findViewById(R.id.llMyActivitiesactive);

        llDashboard.setOnClickListener(panelOnClickListener);
        llPatientRegistration.setOnClickListener(panelOnClickListener);
        llAllPatient.setOnClickListener(panelOnClickListener);
        llReports.setOnClickListener(panelOnClickListener);
        llEducation.setOnClickListener(panelOnClickListener);
        llCollaboration.setOnClickListener(panelOnClickListener);
        llMyActivities.setOnClickListener(panelOnClickListener);
    }

    public void selectorDashboardPanel(LinearLayout activeLayout) {
        llDashboard.setVisibility(View.VISIBLE);
        llPatientRegistration.setVisibility(View.VISIBLE);
        llAllPatient.setVisibility(View.VISIBLE);
        llReports.setVisibility(View.VISIBLE);
        llEducation.setVisibility(View.VISIBLE);
        llCollaboration.setVisibility(View.VISIBLE);
        llMyActivities.setVisibility(View.VISIBLE);

        llDashboardActive.setVisibility(View.GONE);
        llPatientRegistrationActive.setVisibility(View.GONE);
        llAllPatientActive.setVisibility(View.GONE);
        llReportsActive.setVisibility(View.GONE);
        llEducationActive.setVisibility(View.GONE);
        llCollaborationActive.setVisibility(View.GONE);
        llMyActivitiesActive.setVisibility(View.GONE);
        if (activeLayout == llDashboardActive) {
            llDashboard.setVisibility(View.GONE);
        } else if (activeLayout == llPatientRegistrationActive) {
            llPatientRegistration.setVisibility(View.GONE);
        } else if (activeLayout == llAllPatientActive) {
            llAllPatient.setVisibility(View.GONE);
        } else if (activeLayout == llReportsActive) {
            llReports.setVisibility(View.GONE);
        } else if (activeLayout == llEducationActive) {
            llEducation.setVisibility(View.GONE);
        } else if (activeLayout == llCollaborationActive) {
            llCollaboration.setVisibility(View.GONE);
        } else if (activeLayout == llMyActivitiesActive) {
            llMyActivities.setVisibility(View.GONE);
        }
        activeLayout.setVisibility(View.VISIBLE);
    }

    private View.OnClickListener panelOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            final View clicked = v;
            boolean changeFragment = true;
            //check session maintenance for patient registration before moving to other tab
            FragmentManager fragmentManager = getSupportFragmentManager();
            PatientRegistrationFragment patientRegistrationFragment = (PatientRegistrationFragment) fragmentManager.findFragmentByTag(PatientRegistrationFragment.class.toString());
            if (patientRegistrationFragment != null && patientRegistrationFragment.isVisible()) {
                //Toast.makeText(getApplicationContext(), "Patient Registration is visible", Toast.LENGTH_LONG).show();
                if (!PreferanceManager.getIsRegistrationSessionStored(getApplicationContext())) {
                    final Dialog dialog = new Dialog(HealthMonMainActivity.this);
                    dialog.setContentView(R.layout.dialog_dataloss_patient_registration);
                    Button btnOk = (Button) dialog.findViewById(R.id.btnOk);
                    Button btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
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
                            dialog.dismiss();
                            changeTab(clicked);
                        }
                    });
                    dialog.show();

                } else {
                    changeTab(clicked);
                }
            } else {
                changeTab(v);

            }
        }
    };

    public void changeTab(View v) {
        if (v.getId() == R.id.llDashboard) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new DashBoardMainFragment());
            selectorDashboardPanel(llDashboardActive);
        }
        if (v.getId() == R.id.llPatientRegistration) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new PatientRegistrationFragment());
            selectorDashboardPanel(llPatientRegistrationActive);
        }
        if (v.getId() == R.id.llAllPatient) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new AllPatientFragment());
            selectorDashboardPanel(llAllPatientActive);
        }
        if (v.getId() == R.id.llReports) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new ReportsFragment());
           /* FragmentManager fragmentManager = ((FragmentActivity) this).getSupportFragmentManager();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            fragmentTransaction.replace(R.id.fragmentContainer, new ReportsFragment());
            fragmentTransaction.addToBackStack(null);
            fragmentTransaction.commit();*/
            selectorDashboardPanel(llReportsActive);
/*          Intent intent = new Intent(HealthMonMainActivity.this, HealthDevicesActivity.class);
            startActivity(intent);*/
        }
        if (v.getId() == R.id.llEducation) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new EducationFragment());
            selectorDashboardPanel(llEducationActive);
        }
        if (v.getId() == R.id.llCollaboration) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new CollaborationFragment());
            selectorDashboardPanel(llCollaborationActive);
        }
        if (v.getId() == R.id.llMyActivities) {
            HealthMonUtility.replaceFragment(HealthMonMainActivity.this, new MyActivitiesFragment());
            selectorDashboardPanel(llMyActivitiesActive);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.menu = menu;
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        View menu_dashboard_notification = menu.findItem(R.id.toolbar_menu_dashboard_notification).getActionView();
        View menu_dashboard_sync = menu.findItem(R.id.toolbar_menu_dashboard_sync).getActionView();
        View menu_dashboard_user_profile = findViewById(R.id.toolbar_profile_layout);
        View menu_dashboard_last_sync = menu.findItem(R.id.toolbar_menu_dashboard_lastsync).getActionView();

        tv_notification_count = (TextView) menu_dashboard_notification.findViewById(R.id.hotlist_hot);
        last_sync = (TextView) menu_dashboard_last_sync.findViewById(R.id.tvdashboardlastsync);
        last_sync.setText(PreferanceManager.getStringPreferences(Constants.KEY_LASTSYNC + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext())
                , getString(R.string.txtLastSyncNotAvaliable), getApplicationContext()));
        updateNotificationCount(PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext())
                , 0, getApplicationContext()));

        AshaDetails ashaDetails = DatabaseHelper.getInstance(this).getAshaDetails(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext()));
        if (ashaDetails != null) {
            toolbar_asha_name.setText(ashaDetails.getAsha_name());
            // circularToolbarAsha.setImageResource(R.drawable.asha_4);
        }

        menu_dashboard_notification.setOnClickListener(toolbarOnClickListener);
        menu_dashboard_sync.setOnClickListener(toolbarOnClickListener);
        menu_dashboard_user_profile.setOnClickListener(toolbarOnClickListener);
        return super.onCreateOptionsMenu(menu);
    }


    private View.OnClickListener toolbarOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (v.getId() == R.id.toolbar_menu_dashboard_notification) {
                notification_click_view = v;
                showPopupList(v, new ArrayAdapter<String>(HealthMonMainActivity.this, android.R.layout.simple_spinner_dropdown_item, user_spinner_string));
                updateNotificationCount(0);
                PreferanceManager.setIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext()),
                        0, getApplicationContext());
            }
            if (v.getId() == R.id.toolbar_menu_dashboard_sync) {
                if (PreferanceManager.getBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, false, getApplicationContext())) {
                    Toast.makeText(getApplicationContext(), getResources().getString(R.string.toastDataSyncStarted), Toast.LENGTH_SHORT).show();

                    //Web service calls
                    WebserviceManager.getTaskDetails(HealthMonMainActivity.this);
                    WebserviceManager.getMedicationMaster(HealthMonMainActivity.this);
                    WebserviceManager.getActivityDetails(HealthMonMainActivity.this);
                    //WebserviceManager.getAshaDetails(HealthMonMainActivity.this);

                    //Vital Call
                    ArrayList<PatientVitals> patientVitals = new ArrayList<>();
                    patientVitals = DatabaseHelper.getInstance(activity).getAllPatientVital("-1");
                    HealthMonLog.i(TAG, "Patient Vital from database = " + patientVitals.toString());
                    WebserviceManager.insertPatientVitals(HealthMonMainActivity.this, patientVitals);

                    //BP call
                    ArrayList<PatientVitals> patientBP = new ArrayList<>();
                    patientBP = DatabaseHelper.getInstance(activity).getAllPatientBP("-1");
                    HealthMonLog.i(TAG, "Patient BP from database = " + patientBP.toString());
                    WebserviceManager.insertPatientBP(HealthMonMainActivity.this, patientBP);

                    //ECG call
                    ArrayList<PatientVitals> patientECG = new ArrayList<>();
                    patientECG = DatabaseHelper.getInstance(activity).getAllPatientECG("-1");
                    HealthMonLog.i(TAG, "Patient ECG from database = " + patientECG.toString());
                    WebserviceManager.insertPatientECG(HealthMonMainActivity.this, patientECG);

                    //OXI call
                    ArrayList<PatientVitals> patientOXI = new ArrayList<>();
                    patientOXI = DatabaseHelper.getInstance(activity).getAllPatientOXI("-1");
                    HealthMonLog.i(TAG, "Patient ECG from database = " + patientOXI.toString());
                    WebserviceManager.insertPatientOXI(HealthMonMainActivity.this, patientOXI);

                    //HB call
                    ArrayList<PatientVitals> patientHB = new ArrayList<>();
                    patientHB = DatabaseHelper.getInstance(activity).getAllPatientHB("-1");
                    HealthMonLog.i(TAG, "Patient HB from database = " + patientHB.toString());
                    WebserviceManager.insertPatientHB(HealthMonMainActivity.this, patientHB);

                    //FEEDBACK get question call
                    WebserviceManager.getFeedbackQuestions(HealthMonMainActivity.this);


                    //Insert Feedback ans call
                    ArrayList<Feedback> feedbacksRslt = new ArrayList<>();
                    feedbacksRslt = DatabaseHelper.getInstance(activity).getFeedbackResults("-1");
                    HealthMonLog.i(TAG, "Patient Feedback Result from database = " + feedbacksRslt.toString());
                    WebserviceManager.insertPatientFeedbackResult(HealthMonMainActivity.this, feedbacksRslt);

                    //Insert HRA ans call
                    ArrayList<Feedback> hraRslt = new ArrayList<>();
                    hraRslt = DatabaseHelper.getInstance(activity).getHRAResults("-1");
                    HealthMonLog.i(TAG, "Patient HRA Result from database = " + hraRslt.toString());
                    WebserviceManager.insertPatientFeedbackResult(HealthMonMainActivity.this, hraRslt);

                    //Insert Medication ans call
                    ArrayList<Medication> medicationRslt = new ArrayList<>();
                    medicationRslt = DatabaseHelper.getInstance(activity).getMedicationDetails("-1");
                    HealthMonLog.i(TAG, "Patient Medication Result from database = " + medicationRslt.toString());
                    WebserviceManager.insertPatientMedication(HealthMonMainActivity.this, medicationRslt);


                    PreferanceManager.setStringPreferences(Constants.KEY_LASTSYNC + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext()),
                            HealthMonUtility.gettoolbarDate(), getApplicationContext());
                    if (menu != null) {
                        TextView tv = (TextView) menu.findItem(R.id.toolbar_menu_dashboard_lastsync).getActionView().findViewById(R.id.tvdashboardlastsync);
                        tv.setText(PreferanceManager.getStringPreferences(Constants.KEY_LASTSYNC + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", getApplicationContext()),
                                getString(R.string.txtLastSyncNotAvaliable), getApplicationContext()));
                    }
                    /*FragmentManager fm = getSupportFragmentManager();
                    //Fragment fragment_byID = fm.findFragmentById(R.id);
                    //OR
                    Fragment fragment_byTag = fm.findFragmentByTag("UpcomingTaskPlaceHolder");
                    Bundle bundle = new Bundle();
                    fragment_byTag.getLoaderManager().restartLoader(CursorLoaderManager.DASHBOARD_UPCOMING_TASKS_SEARCH, bundle, null);*/

                    //DashboardTasksFragment fragment =(DashboardTasksFragment) getSupportFragmentManager().findFragmentById(R.id.fragment_dashboard_tasks);
 /*                     if(fragment != null)  // could be null if not instantiated yet
                    {
                        if(fragment.getView() != null)
                        {
                            // no need to call if fragment's onDestroyView()
                            //has since been called.
                            fragment.refresh(); // do what updates are required
                        }
                    }*/

                    //HealthMonUtility.reloadFragment(activity,dashBoardMainFragment,R.id.recycler_view_dashboard_task);
                } else {
                    HealthMonUtility.showErrorDialog(HealthMonMainActivity.this, getResources().getString(R.string.msgNetworkConnectivityNotAvailable));
                }
            }
            if (v.getId() == R.id.toolbar_profile_layout) {
                final AshaProfilePopupWindow popupWindow = new AshaProfilePopupWindow(getBaseContext());
                popupWindow.show(findViewById(R.id.id_activity_main), 0, 0);
                View container = (View) popupWindow.getContentView().getParent();
                WindowManager wm = (WindowManager) getSystemService(Context.WINDOW_SERVICE);
                //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
                WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                p.dimAmount = 0.4f;
                wm.updateViewLayout(container, p);
            }
        }
    };

    public byte[] getByteArrayFromDrawable(Drawable drawable) {
        Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream);
        byteArray = stream.toByteArray();
        return byteArray;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        switch (item.getItemId()) {

            default:
                return super.onOptionsItemSelected(item);
        }
    }

    BroadcastReceiver broadcastReceiverConnected = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            showNetworkStatus(true);
            PreferanceManager.setBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, true, getApplicationContext());
            HealthMonLog.i(TAG, "Network status = > " + PreferanceManager.getBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, false, getApplicationContext()));
        }
    };

    BroadcastReceiver broadcastReceiverDisconnected = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            showNetworkStatus(false);
            PreferanceManager.setBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, false, getApplicationContext());
            HealthMonLog.i(TAG, "Network status = > " + PreferanceManager.getBooleanPreferences(Constants.KEY_BROADCAST_CONNECTED, false, getApplicationContext()));
            //TODO add here not neteork
        }
    };

    // handler for received Intents for logout event
    private BroadcastReceiver mMessageReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //do your code snippet here.
            finish();
        }
    };

    @Override
    protected void onResume() {
        if (HealthMonUtility.isTablet(HealthMonMainActivity.this)) {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        } else {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }
        super.onResume();
    }

    @Override
    public void onBackPressed() {

   /* if (getSupportFragmentManager().getBackStackEntryCount() != 0) {
        getSupportFragmentManager().popBackStack();
    } else*/
        if (getSupportFragmentManager().getBackStackEntryCount() == 0) {
            Intent intent = new Intent(getApplicationContext(), HealthMonMainActivity.class);
            startActivity(intent);
            // or just go back to main activity
            super.onBackPressed();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (bolBroacastRegistred) {
            unregisterReceiver(broadcastReceiverConnected);
            unregisterReceiver(broadcastReceiverDisconnected);
            LocalBroadcastManager.getInstance(this).unregisterReceiver(mMessageReceiver);
            bolBroacastRegistred = false;

        }
    }

    @Override
    protected void onStop() {
        super.onStop();

    }

    public void showNetworkStatus(boolean isOnline) {
        circular_asha_toolbar = (CircularImageView) findViewById(R.id.dashboarduserimage);
        circular_asha_toolbar.setImageResource(R.drawable.asha_4);
        circular_asha_toolbar.setBorderWidth(5);
        if (isOnline) {
            circular_asha_toolbar.setBorderColor(getResources().getColor(R.color.colorgreenonline));
        } else {
            circular_asha_toolbar.setBorderColor(getResources().getColor(R.color.colorred));
        }

    }

    private void showPopupList(View anchorView, ListAdapter adapter) {
        listPopupWindow = new ListPopupWindow(this);
        listPopupWindow.setModal(true);
        listPopupWindow.setHeight(550);
        listPopupWindow.setWidth(400);
        // listPopupWindow.setListSelector(getResources().getDrawable(R.drawable.btn_borderless));
        notification = DatabaseHelper.getInstance(getBaseContext()).getNotificaitons();
        HealthMonLog.i(TAG, "notification_count_temp = " + notification_count_temp);
        if (notification != null) {
            listPopupWindow.setAdapter(new NotificationToolbarAdapter(this, R.layout.dashboard_toolbar_notification, notification));
            listPopupWindow.setAnchorView(anchorView);
            listPopupWindow.show();
        } else {
            listPopupWindow.setAnchorView(anchorView);
            listPopupWindow.show();
        }
    }

    /*   @Override
       protected void onPause() {
           super.onPause();
           {
           unregisterReceiver(broadcastReceiverConnected);
           unregisterReceiver(broadcastReceiverDisconnected);
           LocalBroadcastManager.getInstance(this).unregisterReceiver(mMessageReceiver);
       }}
   */
    public static void updateNotificationCount(final int new_notification_number) {
        notification_count = new_notification_number;
        if (tv_notification_count == null) return;
        if (new_notification_number == 0)
            tv_notification_count.setVisibility(View.INVISIBLE);
        else {
            tv_notification_count.setVisibility(View.VISIBLE);
            tv_notification_count.setText(Integer.toString(new_notification_number));
        }
    }

    public static void updateAshaToolbar(final String name) {
        if(name != null) {
//            toolbar_asha_name.setText("" + name);
        }

    }
}
