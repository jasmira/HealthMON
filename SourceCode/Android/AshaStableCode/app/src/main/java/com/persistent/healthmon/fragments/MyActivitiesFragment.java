package com.persistent.healthmon.fragments;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SwitchCompat;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.MyActivityAdapter;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.OnAdapterNotify;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.interfaces.ReminderCreated;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.util.ArrayList;

/**
 * Created by pushkar_bhadle on 4/14/2016.
 */
public class MyActivitiesFragment extends BaseFragment implements View.OnClickListener, ReminderCreated, OnAdapterNotify, OnResult {

    RecyclerView lstAllActivities;
    Button btnAddActivity;
    EditText txtDate, txtReminderTime;
    //EditText txtReminderDate, txtReminderTime, txtDate;
    ArrayList<MyActivity> myActivities = new ArrayList<>();
    MyActivityAdapter myActivityAdapter;
    LinearLayout viewAllContainer;
    MyActivity myActivity;
    TextView lblNoData;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_my_activities, null);
        initView(view);
        return view;
    }

    private void initView(View view) {
        WebserviceManager.getMyActivityForAsha(getActivity(), this);
        btnAddActivity = (Button) view.findViewById(R.id.btnAddActivity);
        btnAddActivity.setOnClickListener(this);
        lstAllActivities = (RecyclerView) view.findViewById(R.id.lstAllActivities);
        lblNoData = (TextView) view.findViewById(R.id.lblNoData);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity());
        lstAllActivities.setLayoutManager(mLayoutManager);
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
        myActivityAdapter = new MyActivityAdapter(myActivities, this);
        lstAllActivities.setAdapter(myActivityAdapter);
        viewAllContainer = (LinearLayout) view.findViewById(R.id.viewAllContainer);
        viewAllContainer.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btnAddActivity) {
            showAddActivityDialog();
        }
        if (v.getId() == R.id.viewAllContainer) {
            HealthMonUtility.replaceFragment(getActivity(), new MyActivityViewAll());
        }
    }

    private void showAddActivityDialog() {
        Button btnCancel, btnSave;
        final SwitchCompat swtchReminder;
        final Spinner spinnerReminderTime;
        final EditText edtActivity, edtComments;
        final Dialog dialog = new Dialog(getActivity());
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_add_activity);
        btnSave = (Button) dialog.findViewById(R.id.btnSave);
        btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
        spinnerReminderTime = (Spinner) dialog.findViewById(R.id.spinnerReminderTime);
        spinnerReminderTime.setEnabled(false);
        //txtReminderDate = (EditText) dialog.findViewById(R.id.txtReminderDate);
        txtReminderTime = (EditText) dialog.findViewById(R.id.txtReminderTime);
        edtActivity = (EditText) dialog.findViewById(R.id.edtActivity);
        edtComments = (EditText) dialog.findViewById(R.id.edtComments);
        txtDate = (EditText) dialog.findViewById(R.id.txtDate);
        txtDate.addTextChangedListener(watch);
        txtReminderTime.addTextChangedListener(watch);
        swtchReminder = (SwitchCompat) dialog.findViewById(R.id.swtchReminder);
        swtchReminder.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (isChecked) {
                    spinnerReminderTime.setEnabled(true);
                   /* Drawable drawableCaleder = ContextCompat.getDrawable(getActivity(), R.drawable.ic_calender);
                    txtReminderDate.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableCaleder, null);
                    txtReminderDate.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                    txtReminderDate.setEnabled(true);

                    Drawable drawableClock = ContextCompat.getDrawable(getActivity(), R.drawable.ic_clock);
                    txtReminderTime.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableClock, null);
                    txtReminderTime.setTextColor(getActivity().getResources().getColor(R.color.colorBlack));
                    txtReminderTime.setEnabled(true);*/
                } else {
                    spinnerReminderTime.setEnabled(false);
                    /*Drawable drawableCaleder = ContextCompat.getDrawable(getActivity(), R.drawable.ic_calender_gray);
                    txtReminderDate.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableCaleder, null);
                    txtReminderDate.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                    txtReminderDate.setEnabled(false);

                    Drawable drawableClock = ContextCompat.getDrawable(getActivity(), R.drawable.ic_clock_gray);
                    txtReminderTime.setCompoundDrawablesWithIntrinsicBounds(null, null, drawableClock, null);
                    txtReminderTime.setTextColor(getActivity().getResources().getColor(R.color.colortextgray));
                    txtReminderTime.setEnabled(false);*/
                }
            }
        });

        /*txtReminderDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HealthMonUtility.showDatePicker(getActivity(), dtListenerReminderDt);
            }
        });*/

        txtDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HealthMonUtility.showDatePicker(getActivity(), dtListenerActivityDt);
            }
        });

        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });

        txtReminderTime.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                HealthMonUtility.showTimePicker(getActivity(), timePickerListener);
            }
        });

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                myActivity = new MyActivity();
                String taskId = PreferanceManager.getAshaId(getActivity()) + "_a_" + +HealthMonUtility.getActivityNoFromFile(getActivity());
                myActivity.setTaskId(taskId);
                myActivity.setAshaId(PreferanceManager.getAshaId(getActivity()));
                myActivity.setComments(edtComments.getText().toString());
                myActivity.setTaskStatus(Constants.ACTIVITY_STATUS_DUE);
                myActivity.setIs_Edited("0");
                myActivity.setIs_Uploaded("0");

                if (edtActivity.getText() != null && !edtActivity.getText().toString().equalsIgnoreCase("")) {
                    myActivity.setActivityName(edtActivity.getText().toString());

                } else {
                    edtActivity.setError(getActivity().getResources().getString(R.string.txtEnterValue));
                    edtActivity.requestFocus();
                    return;
                }
                if (txtDate.getText() != null && !txtDate.getText().toString().equalsIgnoreCase("")) {
                    if (DateUtil.isPastDate(txtDate.getText().toString())) {
                        txtDate.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                        txtDate.requestFocus();
                        return;
                    }

                    String convertedDt = DateUtil.dateConvert(txtDate.getText().toString(), "dd-MM-yyyy", "yyyy-MM-dd");
                    myActivity.setTaskDate(convertedDt);
                } else {
                    txtDate.setError(getActivity().getResources().getString(R.string.txtEnterValue));
                    txtDate.requestFocus();
                    return;
                }
                if (txtReminderTime.getText() != null && !txtReminderTime.getText().toString().equalsIgnoreCase("")) {
                    if (txtDate.getText() != null && !txtDate.getText().toString().equalsIgnoreCase("")) {
                        if (DateUtil.isToday(txtDate.getText().toString())) {
                            if (DateUtil.isPastTime(txtDate.getText().toString() + " " + txtReminderTime.getText().toString())) {
                                txtReminderTime.setError(getActivity().getResources().getString(R.string.txtEnterCorrectValue));
                                txtReminderTime.requestFocus();
                                return;
                            }
                        }
                    }

                    myActivity.setTaskCreatedTime(txtReminderTime.getText().toString());
                } else {
                    txtReminderTime.setError(getActivity().getResources().getString(R.string.txtEnterValue));
                    txtReminderTime.requestFocus();
                    return;
                }
                myActivity.setCreatedByName(Constants.ACTIVITY_CREATEDBY_SELF);
                //if reminder checked
                if (swtchReminder.isChecked()) {
                    myActivity.setReminderInterval(spinnerReminderTime.getSelectedItem().toString());
                    HealthMonUtility.setReminder(getActivity(), txtDate.getText().toString(), txtReminderTime.getText().toString(), spinnerReminderTime.getSelectedItem().toString(), edtActivity.getText().toString(), MyActivitiesFragment.this);
                } else {
                    //DB insertion
                    DatabaseHelper.getInstance(getActivity()).insertMyActivity(myActivity);
                    //web service call
                    ArrayList<MyActivity> temp = new ArrayList<MyActivity>();
                    temp.add(myActivity);
                    WebserviceManager.insertMyActivity(getActivity(), temp);
                    myActivities.add(myActivity);
                    myActivityAdapter.notifyDataSetChanged();
                    if (myActivities.size() == 0) {
                        lblNoData.setVisibility(View.VISIBLE);
                    } else {
                        lblNoData.setVisibility(View.GONE);
                    }
                }
                dialog.dismiss();
            }
        });
        dialog.show();
        Display display = ((WindowManager) getActivity().getSystemService(getActivity().WINDOW_SERVICE)).getDefaultDisplay();
        int width = display.getWidth();
        dialog.getWindow().setLayout((6 * width) / 7, LinearLayout.LayoutParams.WRAP_CONTENT);

    }

    private TimePickerDialog.OnTimeSetListener timePickerListener = new TimePickerDialog.OnTimeSetListener() {


        @Override
        public void onTimeSet(TimePicker view, int hourOfDay, int minutes) {

            String timeSet = "";
            if (hourOfDay > 12) {
                hourOfDay -= 12;
                timeSet = "PM";
            } else if (hourOfDay == 0) {
                hourOfDay += 12;
                timeSet = "AM";
            } else if (hourOfDay == 12)
                timeSet = "PM";
            else
                timeSet = "AM";


            String strMinutes = "";
            if (minutes < 10)
                strMinutes = "0" + minutes;
            else
                strMinutes = String.valueOf(minutes);

            // Append in a StringBuilder
            String aTime = new StringBuilder().append(hourOfDay).append(':')
                    .append(strMinutes).append(" ").append(timeSet).toString();
            txtReminderTime.setText(aTime);
        }

    };
    /*private DatePickerDialog.OnDateSetListener dtListenerReminderDt = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            txtReminderDate.setText(arg3 + "-" + arg2 + "-" + arg1);

        }
    };*/

    private DatePickerDialog.OnDateSetListener dtListenerActivityDt = new DatePickerDialog.OnDateSetListener() {
        @Override
        public void onDateSet(DatePicker arg0, int arg1, int arg2, int arg3) {
            // TODO Auto-generated method stub
            // arg1 = year
            // arg2 = month
            // arg3 = day
            arg2++;
            txtDate.setText(arg3 + "-" + arg2 + "-" + arg1);

        }
    };

    TextWatcher watch = new TextWatcher() {

        @Override
        public void afterTextChanged(Editable arg0) {
            // TODO Auto-generated method stub

        }

        @Override
        public void beforeTextChanged(CharSequence arg0, int arg1, int arg2,
                                      int arg3) {
            // TODO Auto-generated method stub

        }

        @Override
        public void onTextChanged(CharSequence s, int a, int b, int c) {
            txtReminderTime.setError(null);
            txtDate.setError(null);
        }
    };

    @Override
    public void onReminderCreated(Uri eventURI, Uri reminderURI) {
        myActivity.setEvent_URI(eventURI.toString());
        myActivity.setReminder_URI(reminderURI.toString());
        //DB insertion
        DatabaseHelper.getInstance(getActivity()).insertMyActivity(myActivity);
        myActivities.add(myActivity);
        //web service call
        ArrayList<MyActivity> temp = new ArrayList<>();
        temp.add(myActivity);
        WebserviceManager.insertMyActivity(getActivity(), temp);
        myActivityAdapter.notifyDataSetChanged();
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
    }

    @Override
    public void onNotify() {
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
    }

    @Override
    public void onError(String message) {
        myActivities.clear();
        myActivities.addAll(DatabaseHelper.getInstance(getActivity()).getAllMyActivityForStatus(Constants.ACTIVITY_STATUS_DUE));
        myActivityAdapter.notifyDataSetChanged();
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
    }

    @Override
    public void onResponse(String message) {
        myActivities.clear();
        myActivities.addAll(DatabaseHelper.getInstance(getActivity()).getAllMyActivityForStatus(Constants.ACTIVITY_STATUS_DUE));
        myActivityAdapter.notifyDataSetChanged();
        if (myActivities.size() == 0) {
            lblNoData.setVisibility(View.VISIBLE);
        } else {
            lblNoData.setVisibility(View.GONE);
        }
    }
}