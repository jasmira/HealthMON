package com.persistent.healthmon.communication;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.EducationData;
import com.persistent.healthmon.interfaces.LoginData;
import com.persistent.healthmon.interfaces.OnResult;
import com.persistent.healthmon.interfaces.PatientPersonalInfoRegistration;
import com.persistent.healthmon.model.AshaDetails;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.model.MyImmunizations;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.model.PatientFamilyInfo;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientStatus;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.model.Tasks;
import com.persistent.healthmon.model.TrainingDetails;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;
import com.persistent.healthmon.viewcontroller.HealthMonLoginActivity;
import com.persistent.healthmon.viewcontroller.HealthMonMainActivity;
import com.persistent.healthmon.volley.VolleySingleton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by khyati_shah on 3/11/2016.
 */
public class WebserviceManager {
    private final static String TAG = WebserviceManager.class.getCanonicalName();

    public static void login(Context context, final String userName, final String password, final LoginData loginData) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.LOGIN_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                        loginData.onData(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
                loginData.onError(error);
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }


            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                // params.put(Constants.LOGIN_KEY_USERNAME, "Pallavi");
                // params.put(Constants.LOGIN_KEY_PASSWORD, "pallavi1");
                params.put(Constants.LOGIN_KEY_USERNAME, userName);
                params.put(Constants.LOGIN_KEY_PASSWORD, password);
                params.put(Constants.LOGIN_KEY_USERTYPE, "asha");
                params.put(Constants.LOGIN_KEY_LANGUAGE, "English");
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }


    public static void insertPersonalInfo(final Context context, final ArrayList<PatientPersonalInfo> patientPersonalInfos, final ArrayList<PatientAddressDetail> addressDetails, final PatientPersonalInfoRegistration patientPersonalInfoRegistration) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PERSONAL_INFO_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_personalInfo:", response.toString());
                        patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientPersonalInfos.size(); i++) {
                    String values =
                            patientPersonalInfos.get(i).getPatient_id() +
                                    "," + addressDetails.get(i).getPin() + "," + addressDetails.get(i).getVillageId() + "," + addressDetails.get(i).getTalId() + "," + addressDetails.get(i).getDistrictId() + "," +
                                    "1" + "," + "1" + "," + patientPersonalInfos.get(i).getIdCardTypeId() + "," + patientPersonalInfos.get(i).getGenderId() + "," + patientPersonalInfos.get(i).getCategoryId() + "," +
                                    patientPersonalInfos.get(i).getSalutation() + "," + patientPersonalInfos.get(i).getFirstName() + "," + patientPersonalInfos.get(i).getMiddleName() + "," + patientPersonalInfos.get(i).getLastName() + "," +
                                    patientPersonalInfos.get(i).getDob() + "," + patientPersonalInfos.get(i).getAge() + "," + patientPersonalInfos.get(i).getLanguage() + "," + patientPersonalInfos.get(i).getPlace_of_birth() + "," + patientPersonalInfos.get(i).getEducation() + "," +
                                    patientPersonalInfos.get(i).isBpl() + "," + patientPersonalInfos.get(i).getMarrital_status() + "," + patientPersonalInfos.get(i).getContact() + ", " +
                                    addressDetails.get(i).getAddr1() + "," +
                                    addressDetails.get(i).getAddr2() + "," + patientPersonalInfos.get(i).getEm_contact() + "," +
                                    addressDetails.get(i).getWard() + "," +
                                    patientPersonalInfos.get(i).getPatient_image_string() + "," +
                                    patientPersonalInfos.get(i).getAsha_id() + "," +
                                    patientPersonalInfos.get(i).getTimeStamp() + "," + patientPersonalInfos.get(i).getAsha_id() + "," + patientPersonalInfos.get(i).getTimeStamp() + "," + patientPersonalInfos.get(i).getIdCardNumber();
                    params.put(String.valueOf(i), values);

                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertPatientFamilyInfo(final Context context, final ArrayList<PatientFamilyInfo> patientFamilyInfo) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_FAMILY_INFO_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_familyInfo:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientFamilyInfo.size(); i++) {
                    params.put(String.valueOf(i), patientFamilyInfo.get(i).toString());

                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, Constants.TOKEN, context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertMyActivity(final Context context, final ArrayList<MyActivity> myActivities) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_MY_ACTIVITY_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
            /*    Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);*/
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < myActivities.size(); i++) {
                    params.put(String.valueOf(i), myActivities.get(i).toString());
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertMyActivityAndroidId(final Context context, MyActivity myActivities) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.UPDATE_MY_ACTIVITY_ANDROID_ID_URL + myActivities.getTaskId() + "/" + myActivities.getServer_task_id(),
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
            /*    Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);*/
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void editMyActivityStatus(final Context context, final String activity_andorid_id, final String status) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.UPDATE_MY_ACTIVITY_STATUS_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
            /*    Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);*/
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                params.put("0", activity_andorid_id + "," + status);
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getMyActivityForAsha(final Context context, final OnResult onResult) {

        final ArrayList<MyActivity> myActivities = new ArrayList<>();
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_MY_ACTIVITY_URL + PreferanceManager.getAshaId(context),
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        boolean isNewActivity = false;
                        Log.e("Response:", response.toString());
                        try {
                            JSONArray jsonArrayActivities = new JSONArray(response.toString());
                            for (int i = 0; i < jsonArrayActivities.length(); i++) {
                                JSONObject jsonActivity = jsonArrayActivities.getJSONObject(i);
                                MyActivity myActivity = new MyActivity();
                                if (jsonActivity.getString("Andriod_User_Tasks_id") == null || jsonActivity.getString("Andriod_User_Tasks_id").equalsIgnoreCase("null")) {
                                    String taskId = PreferanceManager.getAshaId(context) + "_a_" + +HealthMonUtility.getActivityNoFromFile(context);
                                    myActivity.setTaskId(taskId);
                                    isNewActivity = true;
                                } else {
                                    myActivity.setTaskId(jsonActivity.getString("Andriod_User_Tasks_id"));
                                    isNewActivity = false;
                                }

                                myActivity.setServer_task_id(jsonActivity.getString("User_Tasks_id"));
                                myActivity.setAshaId(PreferanceManager.getAshaId(context));
                                myActivity.setComments(jsonActivity.getString("User_Task_Description"));
                                myActivity.setActivityName(jsonActivity.getString("User_Task_Name"));
                                if (!jsonActivity.getString("User_Task_Date").equalsIgnoreCase("null")) {
                                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT);
                                    java.util.Date date = simpleDateFormat.parse(jsonActivity.getString("User_Task_Date"));
                                    DateFormat taskDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    DateFormat taskTimeFormat = new SimpleDateFormat("hh:mm a");
                                    //String convertedDt = jsonActivity.getString("User_Task_Date").substring(0, 10);
                                    String dtDaskDate = taskDateFormat.format(date);
                                    String timeTaskTime = taskTimeFormat.format(date);
                                    myActivity.setTaskDate(dtDaskDate);
                                    //String convertedTime = DateUtil.convertTime(jsonActivity.getString("User_Task_Date").substring(11, 16), "HH:mm", "hh:mm a");
                                    myActivity.setTaskCreatedTime(timeTaskTime);
                                }
                                myActivity.setCreatedByName(jsonActivity.getString("createdByName"));
                                if (jsonActivity.getString("Task_Status") == null || jsonActivity.getString("Task_Status").equalsIgnoreCase("null")) {
                                    myActivity.setTaskStatus(Constants.ACTIVITY_STATUS_DUE);
                                } else {
                                    myActivity.setTaskStatus(jsonActivity.getString("Task_Status"));
                                }
                                myActivity.setIs_Edited("0");
                                myActivity.setIs_Uploaded("1");
                                DatabaseHelper.getInstance(context).insertMyActivity(myActivity);
                                if (isNewActivity)
                                    //send request for inserting android id
                                    insertMyActivityAndroidId(context, myActivity);
                            }
                            onResult.onResponse("");
                            // }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
                onResult.onError(error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertProgramlInfo(final Context context, final ArrayList<ProgramInfo> programInfos) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PROGRAM_INFO_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < programInfos.size(); i++) {
                    params.put(String.valueOf(i), programInfos.get(i).toString());
                }

                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getTaskDetails(final Activity activity) {

        /*HealthMonLog.i(TAG,"Task URL = "+Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1,AppManager.getInstance()));*/
        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +
                        String.valueOf(PreferanceManager.getAshaId(activity.getApplicationContext())),

                //"http://10.51.232.175:4300/getHmTaskAlerts/1",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.d("getTaskDetails", response.toString());


                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response
                                        .get(i);
                                HealthMonLog.i(TAG, "Response: getTaskDetails" + jsonObject.toString());
                                String strDate = jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DATE);
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT);
                                java.util.Date date = simpleDateFormat.parse(strDate);
                                HealthMonLog.i(TAG, "Response: Date in DATE" + date);
                                SimpleDateFormat sdfr = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT);
                                try {
                                    dateString = sdfr.format(date);
                                    HealthMonLog.i(TAG, "Response: Date in string :" + dateString);
                                } catch (Exception ex) {
                                    System.out.println(ex);
                                }
                                Tasks tasks = new Tasks(
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USERTASK_ID),
                                        //jsonObject.getInt(Constants.DbConstants.COLUMN_USERPROGRAM_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_USER_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_TYPE),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_SEVERITY),
                                        dateString,
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ACTIONABLE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_ID),
                                        // jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_NAME),
                                        date.getTime(),
                                        Constants.DbConstants.TASK_TO_SHOW);
                                // 1 to show task
                                HealthMonLog.i(TAG, "Response: Tasks receive : " + tasks.toString());
                                boolean result = DatabaseHelper.getInstance(activity).addTaskDetails(tasks);
                                //HealthMonLog.i(TAG,"Response: Tasks = "+tasks.toString()+"  Result = "+result);
                                if (Constants.DbConstants.SERVER_TASK_TYPE_NOTIFICATION.equals(tasks.getUser_Task_Type()) && result) {

                                    int cnt_temp = PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , 0, activity.getApplicationContext());
                                    cnt_temp++;
                                    PreferanceManager.setIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , cnt_temp, activity.getApplicationContext());
                                    //   HealthMonLog.i(TAG,"Response: Notification count"+PreferanceManager.getIntegerPreferences(Constants.KEY_NOTIFICATION_COUNT,0,activity.getApplicationContext()));
                                }
                                //if there is object in object
                                //JSONObject phone = jsonObject.getJSONObject("phone");


                            }
                            HealthMonMainActivity.updateNotificationCount(PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                    , 0, activity.getApplicationContext()));

                            HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgLastSyncCompleted));
                        } catch (JSONException e) {
                            e.printStackTrace();
                            //HealthMonUtility.showErrorDialog(context, context.getResources().getString(R.string.msgTaskDetailsNotFetch));
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
                HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgSyncError));

            }

        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };

        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void getLoginTaskDetails(final Activity activity) {

        /*HealthMonLog.i(TAG,"Task URL = "+Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1,AppManager.getInstance()));*/
        JsonArrayRequest req = new JsonArrayRequest(
                //Constants.GET_ALL_ACTIVITY_URL,
                Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +
                        String.valueOf(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())),

                //"http://10.51.232.175:4300/getHmTaskAlerts/1",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.i(TAG, "URL Task" + Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +
                                String.valueOf(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())));
                        HealthMonLog.i(TAG, "URL Activity" + Constants.GET_ALL_ACTIVITY_URL);
                        HealthMonLog.d("", response.toString());


                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response
                                        .get(i);
                                HealthMonLog.i(TAG, "Response: " + jsonObject.toString());
                                String strDate = jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DATE);
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT);
                                java.util.Date date = simpleDateFormat.parse(strDate);
                                HealthMonLog.i(TAG, "Response: Date in DATE" + date);
                                SimpleDateFormat sdfr = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT);
                                try {
                                    dateString = sdfr.format(date);
                                    HealthMonLog.i(TAG, "Response: Date in string :" + dateString);
                                } catch (Exception ex) {
                                    System.out.println(ex);
                                }
                                Tasks tasks = new Tasks(
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USERTASK_ID),
                                        // jsonObject.getInt(Constants.DbConstants.COLUMN_USERPROGRAM_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_USER_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_TYPE),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_SEVERITY),
                                        dateString,
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ACTIONABLE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_ID),
                                        // jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_NAME),
                                        date.getTime(),
                                        Constants.DbConstants.TASK_TO_SHOW);
                                // 1 to show task
                                HealthMonLog.i(TAG, "Response: Tasks receive : " + tasks.toString());
                                boolean result = DatabaseHelper.getInstance(activity).addTaskDetails(tasks);
                                //HealthMonLog.i(TAG,"Response: Tasks = "+tasks.toString()+"  Result = "+result);
                                if (Constants.DbConstants.SERVER_TASK_TYPE_NOTIFICATION.equals(tasks.getUser_Task_Type()) && result) {

                                    int cnt_temp = PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , 0, activity.getApplicationContext());
                                    cnt_temp++;
                                    PreferanceManager.setIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , cnt_temp, activity.getApplicationContext());
                                    //   HealthMonLog.i(TAG,"Response: Notification count"+PreferanceManager.getIntegerPreferences(Constants.KEY_NOTIFICATION_COUNT,0,activity.getApplicationContext()));
                                }
                                //if there is object in object
                                //JSONObject phone = jsonObject.getJSONObject("phone");


                            }
                            HealthMonMainActivity.updateNotificationCount(PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                    , 0, activity.getApplicationContext()));

                            //    HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgLastSyncCompleted));
                        } catch (JSONException e) {
                            e.printStackTrace();
                            //HealthMonUtility.showErrorDialog(context, context.getResources().getString(R.string.msgTaskDetailsNotFetch));
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
//                HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgSyncError));

            }

        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };

        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }


    public static void getActivityDetails(final Activity activity) {

        /*HealthMonLog.i(TAG,"Task URL = "+Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1,AppManager.getInstance()));*/
        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_ALL_ACTIVITY_URL +
                        String.valueOf(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())),

                //"http://10.51.232.175:4300/getHmTaskAlerts/1",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.d("", response.toString());


                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response
                                        .get(i);
                                HealthMonLog.i(TAG, "Response: getActivity" + jsonObject.toString());
                                String strDate = jsonObject.getString(Constants.DbConstants.COLUMN_TASK_CREATED_DATE);
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT);
                                java.util.Date date = simpleDateFormat.parse(strDate);
                                HealthMonLog.i(TAG, "Response: Date in DATE" + date);
                                SimpleDateFormat sdfr = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT);
                                try {
                                    dateString = sdfr.format(date);
                                    HealthMonLog.i(TAG, "Response: Date in string :" + dateString);
                                } catch (Exception ex) {
                                    System.out.println(ex);
                                }
                                Tasks tasks = new Tasks(
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USERTASK_ID),
                                        // jsonObject.getInt(Constants.DbConstants.COLUMN_USERPROGRAM_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_USER_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_TYPE),
                                        dateString,
                                        //jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_ID),
                                        // jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ID),
                                        //jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_NAME),
                                        date.getTime(),
                                        Constants.DbConstants.TASK_TO_SHOW);
                                // 1 to show task
                                HealthMonLog.i(TAG, "Response: Tasks receive : " + tasks.toString());
                                boolean result = DatabaseHelper.getInstance(activity).addTaskDetails(tasks);
                                //HealthMonLog.i(TAG,"Response: Tasks = "+tasks.toString()+"  Result = "+result);
                                if ((Constants.DbConstants.SERVER_TASK_TYPE_NOTIFICATION.equals(tasks.getUser_Task_Type()) && result) ||
                                        (Constants.DbConstants.SERVER_TASK_TYPE_ACTIVITY.equals(tasks.getUser_Task_Type()) && result)) {

                                    int cnt_temp = PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , 0, activity.getApplicationContext());
                                    cnt_temp++;
                                    PreferanceManager.setIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                            , cnt_temp, activity.getApplicationContext());
                                    //   HealthMonLog.i(TAG,"Response: Notification count"+PreferanceManager.getIntegerPreferences(Constants.KEY_NOTIFICATION_COUNT,0,activity.getApplicationContext()));
                                }
                                //if there is object in object
                                //JSONObject phone = jsonObject.getJSONObject("phone");


                            }
                            HealthMonMainActivity.updateNotificationCount(PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())
                                    , 0, activity.getApplicationContext()));

                            //    HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgLastSyncCompleted));
                        } catch (JSONException e) {
                            e.printStackTrace();
                            //HealthMonUtility.showErrorDialog(context, context.getResources().getString(R.string.msgTaskDetailsNotFetch));
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
//                HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgSyncError));

            }

        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };

        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }


    public static void getAshaDetails(final Activity activity) {

        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_ASHA_DETAILS_URL +
                        String.valueOf(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", activity.getApplicationContext())),
                //"http://10.51.232.175:4300/getUserProfileInfo/1001",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d("", response.toString());

                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getAshaDetails()" + jsonObject.toString());
 /*                               JSONObject jsonObject1 = jsonObject.getJSONObject(Constants.DbConstants.COLUMN_ASHA_PIC);
                                JSONArray jsonArray = jsonObject1.getJSONArray("data");
                                byte[] byteBlob = Base64.decode("",Base64.DEFAULT);
                                //String str = Base64.decode(jsonArray.toString(),Base64.DEFAULT);
                                HealthMonLog.i(TAG,"Response: getAshaDetails() arrays \nJsonArray = "+jsonArray);
                                HealthMonLog.i(TAG,"Response: getAshaDetails() arrays \nbyteblob = "+byteBlob);
                                jsonObject1.getString("").getBytes();
                                byte[] bytes = new byte[jsonArray.length()]; // ar is my JSONArray
                                for (int j = 0; i < jsonArray.length(); i++) {
                                    Integer dd = Integer.valueOf((Integer) jsonArray.get(j));
                                    bytes[j] = dd.byteValue();
                                }
                                for (int k = 0; k< jsonArray.length();k++){
                                    HealthMonLog.i(TAG,"Response: getAshaDetails() arrays \nbytes = "+bytes[k]);
                                }*/

                                AshaDetails ashaDetails = new AshaDetails(
                                        null,
                                        jsonObject.getString(Constants.DbConstants.COLUMN_ASHA_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_ASHA_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_QUALIFICATION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_EMERGENCY_CONTACT),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_ADDRESS),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_ADDRESS2),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_CONTACT));

                                HealthMonLog.i(TAG, "Response: getAshaDetails() ashadetails " + ashaDetails.toString());

                                DatabaseHelper.getInstance(activity).addAshaDetails(ashaDetails);
                                //if there is object in object
                                //JSONObject phone = jsonObject.getJSONObject("phone");

                                //TODO might be usefull for image loading after image from server
                                HealthMonMainActivity.updateAshaToolbar(ashaDetails.getAsha_name());
                            }
                            //Activity activity = (Activity) context;


                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
                // HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgAshaDetailsNotFetch));
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void getVitalDetails(final Activity activity) {

        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_PATIENT_VITALS_URL,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d("", response.toString());

                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getVitalDetails()" + jsonObject.toString());

                                PatientVitals patientVitals = new PatientVitals(
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_TEMPERATURE),
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_WEIGHT),
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_HEIGHT),
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_BMI),
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_GIRTH),
                                        jsonObject.getDouble(Constants.DbConstants.COLUMN_VITALS_FUNDAL),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID)
                                );

                                HealthMonLog.i(TAG, "Response: getVitalDetails() vitaldetails " + patientVitals.toString());

                                DatabaseHelper.getInstance(activity).addPatientVital(patientVitals);
                            }
                            //Activity activity = (Activity) context;


                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
                // HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgAshaDetailsNotFetch));
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void insertPatientVitals(final Context context, final ArrayList<PatientVitals> patientVitals) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_VITAL_URL,
                //"http://10.88.45.177:4300/addPatientsVitals/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientVitals.size(); i++) {
                    params.put(String.valueOf(i), patientVitals.get(i).toStringVitals());
                    HealthMonLog.i(TAG, "InsertVitals = " + params.toString());
                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, Constants.TOKEN, context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertPatientBP(final Context context, final ArrayList<PatientVitals> patientVitals) {

        //Change url
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_BP_URL,
                //"http://10.88.45.177:4300/addPatientsVitals/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientVitals.size(); i++) {
                    params.put(String.valueOf(i), patientVitals.get(i).toStringBP());
                    HealthMonLog.i(TAG, "InsertBP = " + params.toString());
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getEducationContent(final Activity activity, final EducationData educationData) {

        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_EDUCATION_CONTEN_URL,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d("TEST", response.toString());
                        educationData.onData(response.toString());
                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getContentDetails()" + jsonObject.toString());

                                TrainingDetails trnDetails = new TrainingDetails(
                                        jsonObject.getString(Constants.DbConstants.COLUMN_LEARNING_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PROGRAM_id),
                                        //jsonObject.getString(Constants.DbConstants.COLUMNN_USER_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_USER_TYPE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_LEARNING_TTPE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_CONTENT_TYPE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_LEARNING_LINK),
                                        //jsonObject.getString(Constants.DbConstants.COLUMN_CREATION_DATE),
                                        //jsonObject.getString(Constants.DbConstants.COLUMN_ACTIVE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PROGRAM_DESC)

                                );

                                //HealthMonLog.i(TAG,"Response: getEducationDetails() TrainingDetails "+trnDetails.getContent_type().toString());

                                DatabaseHelper.getInstance(activity).addEducationContentDetails(trnDetails);
                            }
                            //Activity activity = (Activity) context;


                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                //Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                //activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void insertPatientECG(final Context context, final ArrayList<PatientVitals> patientVitals) {

        //Change url
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_ECG_URL,
                //"http://10.88.45.177:4400/addPatientsECGInfo/",
                //Constants.BASE_URL + Constants.INSERT_PATIENT_BP_URL,
                //"http://10.88.45.177:4300/addPatientsVitals/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientVitals.size(); i++) {
                    params.put(String.valueOf(i), patientVitals.get(i).toStringECG());
                    HealthMonLog.i(TAG, "InsertBP = " + params.toString());
                    HealthMonLog.i(TAG, "insertPatientECG = " + params.toString());
                }
                for (int i = 0; i < patientVitals.size(); i++) {
                    patientVitals.get(i).getECGEachPoint();
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertPatientOXI(final Context context, final ArrayList<PatientVitals> patientVitals) {

        //Change url
        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_OXI_URL,
                //"http://10.88.45.177:4400/addPatientsECGInfo/",
                //Constants.BASE_URL + Constants.INSERT_PATIENT_BP_URL,
                //"http://10.88.45.177:4300/addPatientsVitals/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response:", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientVitals.size(); i++) {
                    params.put(String.valueOf(i), patientVitals.get(i).toStringOXI());
                    HealthMonLog.i(TAG, "InsertOXI = " + params.toString());
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertPatientHB(final Context context, final ArrayList<PatientVitals> patientVitals) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_HB_URL,
                // "http://10.88.45.163:4300/patient/addPatientsHB/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < patientVitals.size(); i++) {
                    params.put(String.valueOf(i), patientVitals.get(i).toStringHB());
                    HealthMonLog.i(TAG, "InsertHB = " + params.toString());
                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, Constants.TOKEN, context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getCarePlan(final Activity activity, final String patientId) {

        JsonObjectRequest jsonObjReq = new JsonObjectRequest(Constants.BASE_URL + Constants.GET_CARE_PLAN_URL + patientId, null, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                Log.d("TEST", response.toString());

                try {

                    JSONArray jsonArray = (JSONArray) response.get("patientCarePlan");

                    HealthMonLog.i(TAG, "Response: getImmunization" + jsonArray.toString());
                    for (int j = 0; j < jsonArray.length(); j++) {
                        JSONObject jsonObject = (JSONObject) jsonArray.get(j);
                        HealthMonLog.i(TAG, "Response: getresponse()" + jsonObject.toString());

                        String Category = jsonObject.getString("Category_Desc");

                        if (Category.equals("Vaccines")) {
                            String immunizationName = jsonObject.getString("Template_Task_Desc");
                            String freqDesc = jsonObject.getString("Frequency_Desc");
                            String doneDate = jsonObject.getString("Created_Date");
                            String Dt = DateUtil.dateConvert(doneDate, "yyyy-MM-dd", "dd-MM-yyyy");
                            String dueDate = DateUtil.getDueDate(Dt, 0);
                            String givenBy = jsonObject.getString("MedicineGivenBy_User_Name");
                            String role = jsonObject.getString("Created_By");
                            String location = jsonObject.getString("PHC");
                            HealthMonLog.i(TAG, "Arrkey = " + immunizationName + freqDesc + doneDate + givenBy + role);
                            MyImmunizations immunizations = new MyImmunizations(
                                    patientId,
                                    immunizationName,
                                    freqDesc,
                                    dueDate,
                                    doneDate,
                                    givenBy,
                                    role,
                                    location);

                            Log.d("123", immunizations.toString());

                            DatabaseHelper.getInstance(activity).insertImmunization(immunizations);
                        }
                    }
                } catch (JSONException e) {
                    Toast.makeText(activity, "Exc", Toast.LENGTH_SHORT).show();

                    // e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {

        @Override
        public void onErrorResponse(VolleyError error) {

            if (error.getClass().equals(TimeoutError.class)) {
                // Show timeout error message
                Toast.makeText(activity,
                        "Oops. Timeout error!",
                        Toast.LENGTH_LONG).show();
            }

        }
    }){
        @Override
        public Map<String, String> getHeaders() throws AuthFailureError {
            HashMap<String, String> headers = new HashMap<String, String>();
            headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
            return headers;
        }};


        VolleySingleton.getInstance(activity).addToRequestQueue(jsonObjReq);
    }

    public static void getFeedbackQuestions(final Activity activity) {

        JsonArrayRequest req = new JsonArrayRequest(
                //Constants.GET_FEEDBACK_QUESTIONS_URL,
                Constants.BASE_URL + Constants.GET_FEEDBACK_QUESTIONS_URL,
                //Can change this as per requrement
                // /+String.valueOf(PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1001,activity.getApplicationContext())),
                //"http://10.51.232.175:4300/getUserProfileInfo/1001",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d("", response.toString());

                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getFeedbackQuestions()" + jsonObject.toString());
                                String arrkey = jsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_NEWARRKEY1);
                                JSONArray arrData = jsonObject.getJSONArray(Constants.DbConstants.COLUMN_FEEDBACK_DATA);
                                HealthMonLog.i(TAG, "Arrkey = " + arrkey + " Data = " + arrData);
                                for (int j = 0; j < arrData.length(); j++) {
                                    JSONObject arrjsonObject = (JSONObject) arrData.get(j);
                                    String arrQuestionkey = arrjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_NEWARRKEY1);
                                    JSONArray arrQuestionData = arrjsonObject.getJSONArray(Constants.DbConstants.COLUMN_FEEDBACK_DATA);
                                    HealthMonLog.i(TAG, "ArrQuestionkey = " + arrQuestionkey + "Question Data = " + arrQuestionData);
                                    for (int k = 0; k < arrQuestionData.length(); k++) {
                                        JSONObject arrQuestionjsonObject = (JSONObject) arrQuestionData.get(k);
                                        String image = arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image);
                                        HealthMonLog.i(TAG, "Question Image = " + image);
                                        Feedback feedback = new Feedback(
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image));

                                        HealthMonLog.i(TAG, "Response: getFeedbackQuestions() Question Details " + feedback.toString());

                                        DatabaseHelper.getInstance(activity).addFeedbackQuestionsFromServer(feedback);
                                    }
                                }
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
                // HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgAshaDetailsNotFetch));
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void getHRAQuestions(final Activity activity) {

        JsonArrayRequest req = new JsonArrayRequest(
                //Constants.GET_HRA_URL,
                Constants.BASE_URL + Constants.GET_HRA_URL,
                //Can change this as per requrement
                // /+String.valueOf(PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1001,activity.getApplicationContext())),
                //"http://10.51.232.175:4300/getUserProfileInfo/1001",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.i(TAG + "Responce : ", response.toString());

                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getHRAQuestions()" + jsonObject.toString());
                                String arrkey = jsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_NEWARRKEY1);
                                JSONArray arrData = jsonObject.getJSONArray(Constants.DbConstants.COLUMN_FEEDBACK_DATA);
                                HealthMonLog.i(TAG, "Arrkey = " + arrkey + " Data = " + arrData);
                                for (int j = 0; j < arrData.length(); j++) {
                                    JSONObject arrjsonObject = (JSONObject) arrData.get(j);
                                    String arrQuestionkey = arrjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_NEWARRKEY1);
                                    JSONArray arrQuestionData = arrjsonObject.getJSONArray(Constants.DbConstants.COLUMN_FEEDBACK_DATA);
                                    HealthMonLog.i(TAG, "ArrQuestionkey = " + arrQuestionkey + "Question Data = " + arrQuestionData);
                                    for (int k = 0; k < arrQuestionData.length(); k++) {
                                        JSONObject arrQuestionjsonObject = (JSONObject) arrQuestionData.get(k);
                                        String image = arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image);
                                        HealthMonLog.i(TAG, "Question Image = " + image);
                                        //Integer p_id = Integer.valueOf(arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID));
                                        //if(p_id != null) {
                                        Feedback feedback = new Feedback(
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image));
                                        HealthMonLog.i(TAG, "Response: getHRAQuestions() Question Details " + feedback.toString());

                                      /*  Feedback feedback = new Feedback(
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION),
                                                arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION),
                                                arrQuestionjsonObject.getInt(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID));

                                        HealthMonLog.i(TAG, "Response: getFeedbackQuestions() Question Details " + feedback.toString());*/

                                        DatabaseHelper.getInstance(activity).addFeedbackQuestionsFromServer(feedback);
                                        DatabaseHelper.getInstance(activity).addFeedbackQuestionsFromServer(feedback);
                                        // }
                                       // }
                                    }
                                }
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "getHRAQuestions():Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
                // HealthMonUtility.showErrorDialog(activity, activity.getResources().getString(R.string.msgAshaDetailsNotFetch));
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }

    public static void insertPatientFeedbackResult(final Context context, final ArrayList<Feedback> lstfeedback) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                //Constants.INSERT_PATIENT_FEEDBACK_RESULT_URL,
                Constants.BASE_URL + Constants.INSERT_PATIENT_FEEDBACK_RESULT_URL,
                // "http://10.88.45.163:4300/patient/addPatientsHB/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < lstfeedback.size(); i++) {
                    params.put(String.valueOf(i), lstfeedback.get(i).toStringFeedbackResult());
                    HealthMonLog.i(TAG, "Insert Feedback Result = " + params.toString());
                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, Constants.TOKEN, context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void insertReferal(final Context context, final ArrayList<Referal> referals, final OnResult onResult) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                //Constants.INSERT_REFERAL_URL2,
                Constants.BASE_URL + Constants.INSERT_REFERAL_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_personalInfo:", response.toString());
                        onResult.onResponse(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, HealthMonLoginActivity.class);
                context.startActivity(intent);
                Log.e("Error: ", error.toString());
                onResult.onError(error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < referals.size(); i++) {
                    params.put(String.valueOf(i), referals.get(i).toString());
                    HealthMonLog.i(TAG,"Referals => "+params.toString());
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    //Master tables request
    public static void getCountryMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_COUNTRY_MASTER,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertCountryMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getCityMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_CITY_MASTER + "0/0/0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertCityyMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getDistrictMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_DISTRICT_MASTER + "0/0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertDistrictMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getStateMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_STATE_MASTER + "0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertStateMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getVillageMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_VILLAGE_MASTER + "0/0/0/0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertVillageMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {

                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getPinMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_PIN_MASTER + "0/0/0/0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertPinMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {

                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getCastCategoryMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_CAST_CATEGORY_MASTER,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertCastCategoryMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {

                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getGenderMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_GENDER_MASTER,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertGenderMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {

                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getCardCategoryMaster(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_ID_CARD_MASTER,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                        DatabaseHelper.getInstance(context).insertIdentityCardMaster(response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {

                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void setAllPatientSeverity(final Context context, final PatientStatus patientStatus) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_SEVERITY_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                //params.put("0", patientStatus);
                params.put("Patient_id", patientStatus.getPatientId());
                params.put("HBFlag", String.valueOf(patientStatus.getHbFlag()));
                params.put("HBValue", String.valueOf(patientStatus.getHbValue()));
                params.put("BPSysFlag", String.valueOf(patientStatus.getBpSysFlag()));
                params.put("BPSysValue", String.valueOf(patientStatus.getBpSysValue()));
                params.put("BPDiaFlag", String.valueOf(patientStatus.getBpDiaFlag()));
                params.put("BPDiaValue", String.valueOf(patientStatus.getBpDiaValue()));
                params.put("BPPulseFlag", String.valueOf(patientStatus.getBpPulseFlag()));
                params.put("BPPulseValue", String.valueOf(patientStatus.getBpPulseValue()));
                params.put("WeightFlag", String.valueOf(patientStatus.getWeightFlag()));
                params.put("WeightValue", String.valueOf(patientStatus.getWeightValue()));
                params.put("OxyPulseFlag", String.valueOf(patientStatus.getOxiPulseFlag()));
                params.put("OxyPulseValue", String.valueOf(patientStatus.getOxiPulseValue()));
                params.put("OxiSpO2Flag", String.valueOf(patientStatus.getOxiSpO2Flag()));
                params.put("OxiPulseO2Value", String.valueOf(patientStatus.getOxiSpO2Value()));
                params.put("OverallFlag", String.valueOf(patientStatus.getOverallFlag()));
                params.put("OverAllStatus", String.valueOf(patientStatus.getStatusMsg()));
                params.put("ExaminationDate", String.valueOf(DateUtil.getCurrentTimeStamp()));
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

    public static void getMedicationMaster(final Activity activity) {

        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_MEDICATION_MASTER,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d("Response: getMedication", response.toString());
                        try {
                            // Parsing json array response
                            // loop through each json object
                            ArrayList<Medication> medicationList = new ArrayList<>();
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response.get(i);
                                HealthMonLog.i(TAG, "Response: getMedicationMaster()" + jsonObject.toString());

                                Medication medication = new Medication(
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_FORM),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ROUTE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_UNITS),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_TYPE),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY)
                                );

                                HealthMonLog.i(TAG, "Response: getMedicationMaster() vitaldetails " + medication.toString());

                                medicationList.add(medication);
                            }
                            DatabaseHelper.getInstance(activity).addServerDrugNameList(medicationList);
                            //Activity activity = (Activity) context;


                        } catch (JSONException e) {
                            e.printStackTrace();
                            HealthMonLog.d(TAG, "Error: " + e.getMessage());
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(activity, HealthMonLoginActivity.class);
                activity.startActivity(intent);
                HealthMonLog.d(TAG, "Error: " + error.getMessage());
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };
        VolleySingleton.getInstance(activity).addToRequestQueue(req);
    }


    public static void insertPatientMedication(final Context context, final ArrayList<Medication> lstMedication) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_MEDICATION_URL,
                // "http://10.88.45.163:4300/patient/addPatientsHB/",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        // patientPersonalInfoRegistration.onPatientPersonlInfoRegister();
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.toString());
            }
        }) {

            @Override
            public String getBodyContentType() {
                return "application/x-www-form-urlencoded; charset=UTF-8";
            }

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }

            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> params = new HashMap<String, String>();
                for (int i = 0; i < lstMedication.size(); i++) {
                    params.put(String.valueOf(i), lstMedication.get(i).toStringMedicationInsert());
                    HealthMonLog.i(TAG, "Insert Medication Result = " + params.toString());
                }
                //params.put(Constants.KEY_TOKEN,PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, Constants.TOKEN, context) );
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }
}
