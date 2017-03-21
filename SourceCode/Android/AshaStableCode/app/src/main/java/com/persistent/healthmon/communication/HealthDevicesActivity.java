package com.persistent.healthmon.communication;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import com.persistent.healthmon.R;
import com.persistent.healthmon.fragments.EcgFragment;
import com.persistent.healthmon.fragments.HealthDeviceSettingsActivity;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.util.HealthMonLog;


public class HealthDevicesActivity extends AppCompatActivity implements EcgFragment.OnFragmentInteractionListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_health_devices);
        HealthMonLog.i("HealthDevicesActivity", "onCreate");

        Button button = (Button) findViewById(R.id.btn_setting);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(HealthDevicesActivity.this, HealthDeviceSettingsActivity.class);
                startActivity(intent);
            }
        });

        ClassicBluetoothManager.getInstance().queryForPairedDevices();
        ClassicBluetoothManager.getInstance().discoverDevices();
    }


    @Override
    public void onFragmentInteraction(Uri uri) {

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_health_monitor, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId() == R.id.action_scan_devices){

            return true;
        }
        else if(item.getItemId() == R.id.action_device_settings){
            Intent intent = new Intent(HealthDevicesActivity.this, HealthDeviceSettingsActivity.class);
            startActivity(intent);
        }
        return true;
    }
}
