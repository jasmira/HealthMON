package com.persistent.healthmon.viewcontroller;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Spinner;

import com.android.volley.NoConnectionError;
import com.android.volley.VolleyError;
import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.interfaces.LoginData;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.Encrypt_Digest;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

/**
 * Created by harshal_patil on 2/28/2016.
 */
public class HealthMonLoginActivity extends Activity implements OnClickListener, LoginData {
    private final static String TAG = HealthMonLoginActivity.class.getSimpleName();
    private EditText mEditTextUsername;
    private EditText mEditTextPassword;
    private Button mButtonLogin;
    private String mUsername, mPassword;
    private CheckBox mLoginCheckBox;
    private Spinner spinnerLanguage;
    String user_id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_screen);
        HealthMonUtility.hideKeyboard(HealthMonLoginActivity.this);
        spinnerLanguage = (Spinner) findViewById(R.id.spinnerLanguage);
        mEditTextUsername = (EditText) findViewById(R.id.editTextUsername);
        mEditTextPassword = (EditText) findViewById(R.id.editTextPassword);
        mButtonLogin = (Button) findViewById(R.id.buttonLogin);
        mButtonLogin.setOnClickListener(this);
        mLoginCheckBox = (CheckBox) findViewById(R.id.saveLoginCheckBox);
        mButtonLogin = (Button) findViewById(R.id.buttonLogin);
        mButtonLogin.setOnClickListener(this);

        spinnerLanguage.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                switch (position) {
                    case 1:
                        HealthMonUtility.changeLocale(getBaseContext(), "mr");
                        restartActivity();
                        break;
                    case 2:
                        HealthMonUtility.changeLocale(getBaseContext(), "hi");
                        restartActivity();
                        break;
                    case 3:
                        HealthMonUtility.changeLocale(getBaseContext(), "en");
                        restartActivity();
                        break;

                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
            }

        });
        mEditTextUsername.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                ArrayList<String> arrCredentials = PreferanceManager.getLoginCredentials(getApplicationContext(), s.toString());
                if (arrCredentials.size() > 1) {
                    mEditTextPassword.setText(arrCredentials.get(1));
                } else {
                    mEditTextPassword.setText("");
                }
            }
        });

        LocalBroadcastManager.getInstance(this).registerReceiver(mMessageReceiver,
                new IntentFilter(Constants.LOG_OUT));
    }

    public void restartActivity() {
        Intent i = new Intent(getApplicationContext(), HealthMonLoginActivity.class);
        startActivity(i);
        finish();
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (HealthMonUtility.isTablet(HealthMonLoginActivity.this)) {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        } else {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mMessageReceiver);
        //   mHandler.removeCallbacks(mRunnable);
    }

    // handler for received Intents for logout event
    private BroadcastReceiver mMessageReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //do your code snippet here.
            finish();
        }
    };

    private void toggleEnableOrDisableViews(boolean disable) {
        mButtonLogin.setClickable(disable);
        mEditTextUsername.setEnabled(disable);
        mEditTextPassword.setEnabled(disable);
    }


    private void toggleProgressBar(boolean isEnable) {
        ProgressBar progressBar = (ProgressBar) findViewById(R.id.progressBar);
        progressBar.setVisibility(isEnable ? View.VISIBLE : View.GONE);
    }


    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.buttonLogin) {

            mUsername = mEditTextUsername.getText().toString();
            mPassword = mEditTextPassword.getText().toString();

            if (mUsername == null || mUsername.equalsIgnoreCase("")) {
                mEditTextUsername.setError(getResources().getString(R.string.txtEnterValue));
                mEditTextUsername.requestFocus();
                return;
            }

            if (mPassword == null || mPassword.equalsIgnoreCase("")) {
                mEditTextPassword.setError(getResources().getString(R.string.txtEnterValue));
                mEditTextPassword.requestFocus();
                return;
            }

            try {
                String encryptedPassword = Encrypt_Digest.encrypt(mPassword);

            } catch (Exception e) {
                e.printStackTrace();
            }

            // calling login service
            WebserviceManager.login(getApplicationContext(), mUsername, mPassword, this);
            /*Intent intent = new Intent(getApplicationContext(), HealthMonMainActivity.class);
            startActivity(intent);*/
        }

    }

    @Override
    public void onData(String response) {
        try {
            JSONObject result = new JSONObject(response);
            HealthMonLog.i(TAG, "Login Response = " + result.toString() + "    ,  In String =  " + response);
            String authorize = result.getJSONObject("result").getString("authorized");
            if (!result.getJSONObject("result").isNull(Constants.LOGIN_RESPONSE_USER_ID)) {
                user_id = result.getJSONObject("result").getString(Constants.LOGIN_RESPONSE_USER_ID);
            }
            if (authorize.equalsIgnoreCase("false")) {

                HealthMonUtility.showErrorDialog(HealthMonLoginActivity.this, getResources().getString(R.string.msgLoginErrorInvalidCredential));
            } else {
                //Logic to store data in shared preferences
                if (mLoginCheckBox.isChecked()) {
                    PreferanceManager.setLoginCredentials(getApplicationContext(), mUsername, mPassword);
                }
                String Token = result.getJSONObject("result").getString(Constants.TOKEN);
                PreferanceManager.setStringPreferences(Constants.KEY_TOKEN, Token, this);
                //string ashaId for patient id generation
                PreferanceManager.setAshaId(getApplicationContext(), mUsername);
                PreferanceManager.setStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, user_id, getApplicationContext());
                WebserviceManager.getLoginTaskDetails(HealthMonLoginActivity.this);
                WebserviceManager.getActivityDetails(HealthMonLoginActivity.this);
                WebserviceManager.getAshaDetails(HealthMonLoginActivity.this);
                //requesting call mater data
                getMasterData();
                Intent intent = new Intent(getApplicationContext(), HealthMonMainActivity.class);
                startActivity(intent);
                finish();
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void getMasterData() {
        WebserviceManager.getCountryMaster(getApplicationContext());
        WebserviceManager.getCityMaster(getApplicationContext());
        WebserviceManager.getDistrictMaster(getApplicationContext());
        WebserviceManager.getStateMaster(getApplicationContext());
        WebserviceManager.getVillageMaster(getApplicationContext());
        WebserviceManager.getPinMaster(getApplicationContext());
        WebserviceManager.getCastCategoryMaster(getApplicationContext());
        WebserviceManager.getGenderMaster(getApplicationContext());
        WebserviceManager.getCardCategoryMaster(getApplicationContext());
        WebserviceManager.getMedicationMaster(HealthMonLoginActivity.this);
        WebserviceManager.getHRAQuestions(HealthMonLoginActivity.this);
    }

    @Override
    public void onError(VolleyError error) {
        // mEditTextUsername.setError("Please check Username");
        //mEditTextUsername.requestFocus();
        if (error instanceof NoConnectionError)
            HealthMonUtility.showErrorDialog(HealthMonLoginActivity.this, getResources().getString(R.string.msgErrorNoInternet));
        else
            HealthMonUtility.showErrorDialog(HealthMonLoginActivity.this, getResources().getString(R.string.msgLoginErrorInvalidCredential));
    }
}

