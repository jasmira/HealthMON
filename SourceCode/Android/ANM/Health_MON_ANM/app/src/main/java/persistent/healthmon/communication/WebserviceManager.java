package persistent.healthmon.communication;

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
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.interfaces.LoginData;
import persistent.healthmon.interfaces.OnResult;
import persistent.healthmon.interfaces.PatientPersonalInfoRegistration;
import persistent.healthmon.model.CarePlanRow;
import persistent.healthmon.model.Feedback;
import persistent.healthmon.model.Medication;
import persistent.healthmon.model.MyImmunizations;
import persistent.healthmon.model.PatientAddressDetail;
import persistent.healthmon.model.PatientFamilyInfo;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.PatientStatus;
import persistent.healthmon.model.ProgramInfo;
import persistent.healthmon.model.ReferalAppoinment;
import persistent.healthmon.model.UserMO;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.DateUtil;
import persistent.healthmon.util.HealthMonLog;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.LoginActivity;
import persistent.healthmon.volley.VolleySingleton;


public class WebserviceManager {
    private final static String TAG = WebserviceManager.class.getName();

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
                                        HealthMonLog.i(TAG,"Question Image = "+image);
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
                Constants.BASE_URL + Constants.GET_HRA_QUESTIONS_URL,
                //Can change this as per requrement
                // /+String.valueOf(PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1001,activity.getApplicationContext())),
                //"http://10.51.232.175:4300/getUserProfileInfo/1001",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.i(TAG+"Responce : ", response.toString());

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
                                        String image =  arrQuestionjsonObject.getString(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image);
                                        HealthMonLog.i(TAG,"Question Image = "+image);
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



    /*public static void getTaskDetails(final Activity activity) {

        *//*HealthMonLog.i(TAG,"Task URL = "+Constants.BASE_URL + Constants.GET_ALL_TASKS_URL +PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,1,AppManager.getInstance()));*//*
        JsonArrayRequest req = new JsonArrayRequest(
                Constants.BASE_URL + Constants.GET_ALL_TASKS_URL ,

                //"http://10.51.232.175:4300/getHmTaskAlerts/1",
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        HealthMonLog.d(TAG+"GetCarePlan", response.toString());


                        try {
                            // Parsing json array response
                            // loop through each json object
                            for (int i = 0; i < response.length(); i++) {
                                String dateString = null;
                                JSONObject jsonObject = (JSONObject) response
                                        .get(i);
                                HealthMonLog.i(TAG, "Response: " + jsonObject.toString());
                                Tasks tasks = new Tasks(
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USERTASK_ID),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USERPROGRAM_ID),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_USER_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_NAME),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_DESCRIPTION),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_TASK_TYPE),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_SEVERITY),
                                        dateString,
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ACTIONABLE),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_PATIENT_ID),
                                        jsonObject.getInt(Constants.DbConstants.COLUMN_TASK_ID),
                                        jsonObject.getString(Constants.DbConstants.COLUMN_PATIENT_NAME),
                                        date.getTime(),
                                        Constants.DbConstants.TASK_TO_SHOW);
                                // 1 to show task
                                HealthMonLog.i(TAG, "Response: Tasks receive : " + tasks.toString());
                                boolean result = DatabaseHelper.getInstance(activity).addTaskDetails(tasks);
                                //HealthMonLog.i(TAG,"Response: Tasks = "+tasks.toString()+"  Result = "+result);
                                if (Constants.DbConstants.SERVER_TASK_TYPE_NOTIFICATION.equals(tasks.getUser_Task_Type()) && result) {

                                    int cnt_temp = PreferanceManager.getIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, 1001, activity.getApplicationContext())
                                            , 0, activity.getApplicationContext());
                                    cnt_temp++;
                                    PreferanceManager.setIntegerPreferences(Constants.KEY_NOTI_COUNT + PreferanceManager.getIntegerPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, 1001, activity.getApplicationContext())
                                            , cnt_temp, activity.getApplicationContext());
                                    //   HealthMonLog.i(TAG,"Response: Notification count"+PreferanceManager.getIntegerPreferences(Constants.KEY_NOTIFICATION_COUNT,0,activity.getApplicationContext()));
                                }
                                //if there is object in object
                                //JSONObject phone = jsonObject.getJSONObject("phone");


                            }
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
                Intent intent = new Intent(activity, LoginActivity.class);
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

*/

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
                Intent intent = new Intent(context, LoginActivity.class);
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
                Intent intent = new Intent(context, LoginActivity.class);
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
                Intent intent = new Intent(context, LoginActivity.class);
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

    public static void getCarePlan(final Context activity, final String patientId) {
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
                            String quantity = ""; //jsonObject.getString("Template_Task_Desc");
                            String freqDesc = jsonObject.getString("Frequency_Desc");
                            String doneDate = jsonObject.getString("Created_Date");
                            String Dt = DateUtil.dateConvert(doneDate, "yyyy-MM-dd", "dd-MM-yyyy");
                            String dueDate = DateUtil.getDueDate(Dt, 0);
                            String givenBy = jsonObject.getString("MedicineGivenBy_User_Name");
                            String role = jsonObject.getString("Updated_By");
                            String location = jsonObject.getString("PHC");
                            HealthMonLog.i(TAG, "Arrkey = " + immunizationName + freqDesc + doneDate + givenBy + role);
                            MyImmunizations immunizations = new MyImmunizations(
                                    patientId,
                                    immunizationName,
                                    quantity,
                                    freqDesc,
                                    dueDate,
                                    doneDate,
                                    givenBy,
                                    role,
                                    location);


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
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", activity));
                return headers;
            }
        };


        VolleySingleton.getInstance(activity).addToRequestQueue(jsonObjReq);
    }

    public static void insertPatientImmunizationStatus(final Context context, final ArrayList<MyImmunizations> lstImmunizations) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_PATIENT_FEEDBACK_RESULT_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
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
                for (int i = 0; i < lstImmunizations.size(); i++) {
                    params.put(String.valueOf(i), lstImmunizations.get(i).toStringImmunizationStatus());
                    HealthMonLog.i(TAG, "Insert Immunization Result = " + params.toString());
                }
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }


    public static void insertImmunizations(final Context context, final ArrayList<MyImmunizations> myImminizations) {
        Map<String, String> postParam = new HashMap<String, String>();
        postParam.put("Patient_Id", myImminizations.get(0).getPatientId().toString());
        postParam.put("Template_Task_Desc", myImminizations.get(0).getImmunizationName().toString());
        postParam.put("Quantity", "1");
        postParam.put("MedicineGivenBy_User_Name", "ANM1");
        postParam.put("PHC", "Village1");
        postParam.put("Updated_Date", myImminizations.get(0).getDoneDate().toString());
        postParam.put("Category_Desc", "Vaccines");


        JsonObjectRequest jsonObjReq = new JsonObjectRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.INSERT_MY_IMMUNIZATIONS_URL, new JSONObject(postParam),
                new Response.Listener<JSONObject>() {

                    @Override
                    public void onResponse(JSONObject response) {
                        Log.d(TAG, response.toString());

                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error: " + error.getMessage());
            }

        }) {

            /**
             * Passing some request headers
             */
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Content-Type", "application/json; charset=utf-8");
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }


        };

        // Adding request to request queue
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjReq);

    }

    public static void sendCarePlanForApproval(final Context context, final String patientID, final List<CarePlanRow> list) {
        Log.d(TAG,"patientID = [" + patientID + "]");
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
        JSONArray param = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            CarePlanRow row = list.get(i);
            JSONObject object = new JSONObject();
            try {
                object.put(Constants.PARAM_TEMPLATE_NAME, row.getTemplateName());
                object.put(Constants.PARAM_TEMPLATE_ID, row.getId());
                object.put(Constants.PARAM_TASK, row.getTask());
                object.put(Constants.PARAM_FREQUENCY, row.getFrequency());
                object.put(Constants.PARAM_ROLE, row.getRole());
                object.put(Constants.PARAM_ACTIVITY, row.getActivity());
                object.put(Constants.PARAM_IS_APPROVED, 0);

                object.put(Constants.PARAM_CREATED_BY, PreferanceManager.getAshaId(context));
                object.put(Constants.PARAM_UPDATED_BY, PreferanceManager.getAshaId(context));
                object.put(Constants.PARAM_MEDICINE_GIVEN_BY, PreferanceManager.getAshaId(context));
                object.put(Constants.PARAM_CREATED_DATE, sdf.format(new Date()));
                object.put(Constants.PARAM_UPDATED_DATE, sdf.format(new Date()));
            } catch (JSONException e) {
                e.printStackTrace();
            }
            param.put(object);
        }
        Log.d(TAG, param.toString());
        JsonArrayRequest request = new JsonArrayRequest(
                Request.Method.POST,
                Constants.BASE_URL + Constants.CARE_PLAN_SEND_TO_APPROVAL_URL + patientID,
                param,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d(TAG, "onResponse() called with: " + "response = [" + response + "]");
                        Toast.makeText( context, "Sent ", Toast.LENGTH_SHORT).show();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(context, "Error  " , Toast.LENGTH_SHORT).show();
                    }
                }
        ) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }
        };
        VolleySingleton.getInstance(context).addToRequestQueue(request);
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
                Intent intent = new Intent(activity, LoginActivity.class);
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

    public static void getAllPatient(final Context context, final OnResult onResult) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_ALL_PATIENT_URL + "0",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        try {
                            JSONArray jsonArrayAllPatient = new JSONArray(response.toString());
                            for (int i = 0; i < jsonArrayAllPatient.length(); i++) {
                                JSONObject jsonObjectPatinet = jsonArrayAllPatient.getJSONObject(i);
                                PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();
                                patientPersonalInfo.setPatient_id(jsonObjectPatinet.getString("Patient_id"));
                                patientPersonalInfo.setFirstName(jsonObjectPatinet.getString("Patient_FName"));
                                patientPersonalInfo.setMiddleName(jsonObjectPatinet.getString("Patient_MName"));
                                patientPersonalInfo.setLastName(jsonObjectPatinet.getString("Patient_LName"));
                                patientPersonalInfo.setPatient_image_string(jsonObjectPatinet.getString("Patient_Image"));
                                patientPersonalInfo.setAge(jsonObjectPatinet.getInt("Patient_Age"));
                                patientPersonalInfo.setContact(jsonObjectPatinet.getString("Patient_Contact"));
                                patientPersonalInfo.setEm_contact(jsonObjectPatinet.getString("Patient_Emergency_number"));
                                patientPersonalInfo.setIdCardNumber(jsonObjectPatinet.getString("Card_Number"));
                                patientPersonalInfo.setIdCardTypeId(jsonObjectPatinet.getInt("Card_Type_id"));
                                patientPersonalInfo.setCategoryId(jsonObjectPatinet.getInt("Cast_Category_Id"));
                                String regDate = DateUtil.dateConvert(jsonObjectPatinet.getString("Created_Date"), Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT, "yyyy-MM-dd HH:mm:ss");
                                patientPersonalInfo.setTimeStamp(regDate);
                                patientPersonalInfo.setEducation(jsonObjectPatinet.getString("Education"));
                                patientPersonalInfo.setGenderId(jsonObjectPatinet.getInt("Gender_Id"));
                                patientPersonalInfo.setBpl((jsonObjectPatinet.getInt("Patient_BPL")) == 1 ? true : false);
                                String DOBDate = DateUtil.dateConvert(jsonObjectPatinet.getString("Patient_DOB"), Constants.DbConstants.SERVER_DATABASE_DATE_FORMAT, "yyyy-MM-dd HH:mm:ss");
                                patientPersonalInfo.setDob(DOBDate);
                                patientPersonalInfo.setLanguage(jsonObjectPatinet.getString("Patient_Language"));
                                patientPersonalInfo.setMarrital_status(jsonObjectPatinet.getString("Patient_Marital_Status"));
                                patientPersonalInfo.setPlace_of_birth(jsonObjectPatinet.getString("Patient_POB"));
                                patientPersonalInfo.setSalutation(jsonObjectPatinet.getString("Patient_Salutation"));

                                PatientAddressDetail patientAddressDetail = new PatientAddressDetail();
                                patientAddressDetail.setAddr1(jsonObjectPatinet.getString("Address_line1"));
                                patientAddressDetail.setAddr2(jsonObjectPatinet.getString("Address_line2"));
                                patientAddressDetail.setTalId(jsonObjectPatinet.getInt("City_id"));
                                patientAddressDetail.setDistrictId(jsonObjectPatinet.getInt("District_id"));
                                patientAddressDetail.setWard(jsonObjectPatinet.getString("Patient_Ward"));
                                patientAddressDetail.setPin(jsonObjectPatinet.getString("PinCode"));
                                patientAddressDetail.setVillageId(jsonObjectPatinet.getInt("Village_id"));

                                //patient Severity web service call
                                getPatientSeverity(context, patientPersonalInfo.getPatient_id());
                                WebserviceManager.getCarePlan(context, patientPersonalInfo.getPatient_id());
                                DatabaseHelper.getInstance(context).insertPatientPersonalInfo(patientPersonalInfo, patientAddressDetail);
                            }
                            onResult.onResponse("");
                        } catch (Exception e) {
                            e.printStackTrace();
                            onResult.onError("");
                        }

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

    public static void getPatientSeverity(final Context context, final String patientId) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_PATIENT_SEVERITY_URL + patientId,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        if (!response.toString().equalsIgnoreCase("[]")) {
                            try {
                                JSONArray jsonArray = new JSONArray(response.toString());
                                JSONObject jsonObject = jsonArray.getJSONObject(0);
                                PatientStatus patientStatus = new PatientStatus();
                                patientStatus.setPatientId(jsonObject.getString("Patient_id"));
                                patientStatus.setHbFlag(Integer.parseInt(jsonObject.getString("HBFlag")));
                                patientStatus.setHbValue(Integer.parseInt(jsonObject.getString("HBValue")));
                                patientStatus.setBpSysFlag(Integer.parseInt(jsonObject.getString("BPSysFlag")));
                                patientStatus.setBpSysValue(Integer.parseInt(jsonObject.getString("BPSysValue")));
                                patientStatus.setBpDiaValue(Integer.parseInt(jsonObject.getString("BPDiaValue")));
                                patientStatus.setBpPulseFlag(Integer.parseInt(jsonObject.getString("BPPulseFlag")));
                                patientStatus.setBpPulseValue(Integer.parseInt(jsonObject.getString("BPPulseValue")));
                                patientStatus.setWeightFlag(Integer.parseInt(jsonObject.getString("WeightFlag")));
                                patientStatus.setWeightValue(Integer.parseInt(jsonObject.getString("WeightValue")));
                                patientStatus.setOxiPulseFlag(Integer.parseInt(jsonObject.getString("OxyPulseFlag")));
                                patientStatus.setOxiPulseValue(Integer.parseInt(jsonObject.getString("OxyPulseValue")));
                                patientStatus.setOxiSpO2Flag(Integer.parseInt(jsonObject.getString("OxiSpO2Flag")));
                                patientStatus.setOxiSpO2Value(Integer.parseInt(jsonObject.getString("OxiPulseO2Value")));
                                patientStatus.setOverallFlag(Integer.parseInt(jsonObject.getString("OverallFlag")));
                                patientStatus.setStatusMsg(jsonObject.getString("OverAllStatus"));
                                DatabaseHelper.getInstance(context).insertPatientSeverity(patientStatus);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }

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

    public static void getCarePlanTemplates(final Context context) {
        JsonArrayRequest request = new JsonArrayRequest(
                Request.Method.GET,
                Constants.BASE_URL + Constants.GET_CARE_TEMPLATES_URL,
                (JSONArray) null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        List<CarePlanRow> rows = new ArrayList<CarePlanRow>();
                        HealthMonLog.d(TAG, "onResponse() called with: " + "response = [" + response + "]");
                        for (int i = 0; i < response.length(); i++) {
                            try {
                                JSONObject object = response.getJSONObject(i);
                                CarePlanRow row = new CarePlanRow();
                                row.setId(object.getString(Constants.PARAM_TEMPLATE_ID));
                                row.setTemplateName(object.getString(Constants.PARAM_TEMPLATE_NAME));
                                row.setActivity(object.getString(Constants.PARAM_ACTIVITY));
                                row.setActivity(object.getString(Constants.PARAM_ACTIVITY));
                                row.setTask(object.getString(Constants.PARAM_TASK));
                                row.setFrequency(object.getString(Constants.PARAM_FREQUENCY));
                                row.setRole(object.getString(Constants.PARAM_ROLE));

                                rows.add(row);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        DatabaseHelper.getInstance(context).insertCarePlanTemplates(rows);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                        Toast.makeText(context, "Error in loading care plan templates " + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                }
        ) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put(Constants.AUTHORIZATION_URL, PreferanceManager.getStringPreferences(Constants.KEY_TOKEN, "", context));
                return headers;
            }
        };
        VolleySingleton.getInstance(context).addToRequestQueue(request);
    }

    public static void getAllMO(final Context context) {
        StringRequest jsonObjRequest = new StringRequest(Request.Method.GET,
                Constants.BASE_URL + Constants.GET_ALL_MO_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response :", response.toString());
                        try {
                            JSONArray jsonArrayAllPatient = new JSONArray(response.toString());
                            for (int i = 0; i < jsonArrayAllPatient.length(); i++) {
                                JSONObject jsonObjectMO = jsonArrayAllPatient.getJSONObject(i);
                                UserMO userMO = new UserMO();
                                userMO.setMoId(jsonObjectMO.getString("User_id"));
                                userMO.setMOName(jsonObjectMO.getString("User_Name"));
                                userMO.setMOQualification(jsonObjectMO.getString("User_qualification"));
                                userMO.setPHCId(jsonObjectMO.getString("PHC_ID"));
                                DatabaseHelper.getInstance(context).insertMODetails(userMO);
                            }

                        } catch (Exception e) {
                            e.printStackTrace();

                        }

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

    public static void addMOAppoinment(final Context context, final ReferalAppoinment referalAppoinment) {

        StringRequest jsonObjRequest = new StringRequest(Request.Method.POST,
                Constants.BASE_URL + Constants.ADD_MO_APPOINTMENT_URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.e("Response_ProgramInfo:", response.toString());
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Intent intent = new Intent(context, LoginActivity.class);
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
                String values = referalAppoinment.getMO_Id() + "," + referalAppoinment.getPatientId() + "," + referalAppoinment.getAppoinmentDate() + "," + referalAppoinment.getAcceptedFlag() + "," + referalAppoinment.getCreatedDate() + "," + referalAppoinment.getCreatedBy() + "," + referalAppoinment.getReffred() + "," + referalAppoinment.getAcceptedFlag();
                HashMap<String, String> params = new HashMap<String, String>();
                params.put("0", values);
                return params;
            }

        };
        VolleySingleton.getInstance(context).addToRequestQueue(jsonObjRequest);
    }

}
