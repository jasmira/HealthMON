package com.persistent.healthmon.viewcontroller;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;
import android.widget.RelativeLayout;

import com.persistent.healthmon.R;
import com.persistent.healthmon.util.HealthMonUtility;

/**
 * Created by harshal_patil on 2/28/2016.
 */
public class HealthMonSplashActivity extends Activity {

    private static final int SPLASH_LOAD_INTERVAL = 3000;
    private Handler mHandler;
    private Runnable mRunnable;
    boolean isLarge;
    private RelativeLayout relativeLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //Remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        setContentView(R.layout.splash_screen);

        mHandler = new Handler(getMainLooper());
        mRunnable = new Runnable() {

            @Override
            public void run() {
                openNextActivity();
            }
        };


        mHandler.postDelayed(mRunnable, SPLASH_LOAD_INTERVAL);

    }


    private void openNextActivity() {

        Intent intent = new Intent(HealthMonSplashActivity.this,  HealthMonLoginActivity.class);
        startActivity(intent);

        finish();


    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mHandler.removeCallbacks(mRunnable);
    }
    @Override
    protected void onResume() {
        super.onResume();

        if (HealthMonUtility.isTablet(HealthMonSplashActivity.this)) {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
        } else {
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        }

    }

}
