package com.persistent.healthmon.viewcontroller;

import android.app.Application;
import android.content.Context;


import com.persistent.healthmon.database.DatabaseHelper;

/**
 * Created by pushkar_bhadle on 5/4/2016.
 */
public class AppManager extends Application {
    private static AppManager mAppManager = null;
    private static Context mAppContext;

    public AppManager(){
        mAppContext = this;
    }

    public static AppManager getInstance(){
        return mAppManager;
    }


    @Override
    public void onTerminate() {
        super.onTerminate();
    }

    @Override
    public void onCreate() {
        super.onCreate();

        mAppContext = this.getApplicationContext();
        mAppManager = this;
        DatabaseHelper.getInstance(this);
    }

    public Context getAppContext(){
        return mAppContext;
    }

}
