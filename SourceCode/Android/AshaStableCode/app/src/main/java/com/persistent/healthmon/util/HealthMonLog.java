package com.persistent.healthmon.util;

import android.util.Log;

/**
 * Created by pushkar_bhadle on 3/11/2016.
 */
public class HealthMonLog {
    public static final boolean ON = true;

    public static void i(String TAG, String message){
        if(ON)
            Log.i(TAG, message);
    }

    public static void d(String TAG, String message){
        if(ON)
            Log.d(TAG, message);
    }

    public static void e(String TAG, String message){
        if(ON)
            Log.e(TAG, message);
    }

    public static void w(String TAG, String message){
        if(ON)
            Log.w(TAG, message);
    }

    public static void v(String TAG, String message){
        if(ON)
            Log.v(TAG, message);
    }
}
