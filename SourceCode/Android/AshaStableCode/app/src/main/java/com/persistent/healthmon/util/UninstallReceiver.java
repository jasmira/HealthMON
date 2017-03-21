package com.persistent.healthmon.util;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Created by khyati_shah on 6/23/2016.
 */
public class UninstallReceiver extends BroadcastReceiver {

    /**
     * This method captures the event when a package has been removed
     */
    @Override
    public void onReceive(Context context, Intent intent) {
        System.out.println("Hello from CustomBroadcastReceiver");
        if (intent != null) {
            String action = intent.getAction();
            System.out.println("L1123 : " + action);
            if (action.equals(intent.ACTION_PACKAGE_REMOVED)) {
                //Log the event capture in the log file ...
                System.out.println("The package has been removed");
                Log.e("Uninstsall", "The package has been removed");
            }
        }
        context.unregisterReceiver(this);
    }
}
