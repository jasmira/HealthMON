package com.persistent.healthmon.communication;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.provider.SyncStateContract;
import android.widget.Toast;

import com.persistent.healthmon.util.Constants;

public class NetworkStatusReceiver extends BroadcastReceiver {
    public NetworkStatusReceiver() {
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.

        if(isOnline(context)){
            context.sendBroadcast(new Intent(Constants.BROADcAST_CONNECTED));
        }else{
            context.sendBroadcast(new Intent(Constants.BROADcAST_DISCONNECTED));
        }
    }

    public static boolean isOnline(Context context) {

        ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = cm.getActiveNetworkInfo();

        return (netInfo != null && netInfo.isConnected());

    }

    public static boolean isOffline(Context context) {

        ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = cm.getActiveNetworkInfo();

        return (!netInfo.isConnected());

    }
}
