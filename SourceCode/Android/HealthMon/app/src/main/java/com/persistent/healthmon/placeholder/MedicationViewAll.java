package com.persistent.healthmon.placeholder;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.BitmapDrawable;
import android.os.Handler;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SwitchCompat;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.TextClock;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.AvailableDevicesAdapter;
import com.persistent.healthmon.adapter.MedicationIFAAdapter;
import com.persistent.healthmon.adapter.PairedDevicesAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.listners.RecyclerItemClickListener;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.viewcontroller.AppManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by pushkar_bhadle on 7/13/2016.
 */
public class MedicationViewAll extends android.widget.PopupWindow{

    Context ctx;
    View popupView;
    //Constants
    private static final String TAG = MedicationViewAll.class.getSimpleName();

    public static final int REQUEST_CODE_ENABLE_BLUETOOTH = 1;

    //Recycler
    private RecyclerView mRecyclerViewIFATabets;
    private RecyclerView mRecyclerViewCATablets;
    private RecyclerView mRecyclerViewOtherTablets;

    //TextView
    private TextView tv_ifa_total_tablets,tv_ca_total_tablets, tv_other_total_tablets;

    ArrayList<Medication> mIFAlst = new ArrayList<Medication>();
    ArrayList<Medication> mCAlst = new ArrayList<Medication>();
    ArrayList<Medication> mOtherlst = new ArrayList<Medication>();

    //Adapters for paired and available devices
    private MedicationIFAAdapter mAdapterIFA, mAdapterCA, mAdapterOther;
    private static int cntIFA = 0, cntCA=0, cntOther = 0;

    private ProgressBar mDeviceScanningProgressBar;

    public MedicationViewAll(Context context,String patient_ID)
    {
        super(context);

        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.medication_view_all, null);
        setContentView(popupView);

        setHeight(700);
        setWidth(900);


        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        setBackgroundDrawable(new BitmapDrawable());



        //Refer static views
        mRecyclerViewIFATabets = (RecyclerView)popupView.findViewById(R.id.recycler_view_ifa_tablets);
        mRecyclerViewCATablets = (RecyclerView)popupView.findViewById(R.id.recycler_view_ca_tablets);
        mRecyclerViewOtherTablets = (RecyclerView)popupView.findViewById(R.id.recycler_view_other_tablets);

        //TextViews
        tv_ifa_total_tablets = (TextView)popupView.findViewById(R.id.tv_ifa_total_tablets);
        tv_ca_total_tablets = (TextView)popupView.findViewById(R.id.tv_ca_total_tablets);
        tv_other_total_tablets = (TextView)popupView.findViewById(R.id.tv_other_total_tablets);

        ArrayList<Medication> dbLstMedication = DatabaseHelper.getInstance(ctx).getMedicationDetails(patient_ID);
        HealthMonLog.i(TAG, "Medication list => " + dbLstMedication.toString());
        if (dbLstMedication.size() > 0) {
            for (Medication medn : dbLstMedication) {
                if (medn.getDrug_type().equalsIgnoreCase(Constants.MEDICATION_DRUG_IFA)) {
                    cntIFA = cntIFA +Integer.parseInt(medn.getMedicine_qty());
                    mIFAlst.add(medn);
                }
                if (medn.getDrug_type().equalsIgnoreCase(Constants.MEDICATION_DRUG_CA)) {
                    cntCA = cntCA +Integer.parseInt(medn.getMedicine_qty());
                    mCAlst.add(medn);
                }
                if (medn.getDrug_type().equalsIgnoreCase(Constants.MEDICATION_DRUG_OTHER)) {
                    cntOther = cntOther +Integer.parseInt(medn.getMedicine_qty());
                    mOtherlst.add(medn);
                }
            }
            if(!mIFAlst.isEmpty()){
                HealthMonLog.i(TAG, "Medication IFA list => " + mIFAlst.toString());
                setIFAList(mIFAlst);
            }
            if(!mCAlst.isEmpty()){
                HealthMonLog.i(TAG, "Medication CA list => " + mCAlst.toString());
                setCAList(mCAlst);
            }
            if(!mOtherlst.isEmpty()){
                HealthMonLog.i(TAG, "Medication Other list => " + mOtherlst.toString());
                setOtherList(mOtherlst);
            }
        }
        tv_ifa_total_tablets.setText(""+cntIFA);
        tv_ca_total_tablets.setText(""+cntCA);
        tv_other_total_tablets.setText(""+cntOther);
    }

    // Attaches the view to its parent anchor-view at position x and y
    public void show(View anchor, int x, int y){
        showAtLocation(anchor, Gravity.CENTER, x, y);
    }

    @Override
    public void dismiss() {
        super.dismiss();
        cntIFA = 0;
        cntCA = 0;
        cntOther = 0;
    }

    private void setIFAList(ArrayList<Medication> lstTablets){
        try {
            RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(AppManager.getInstance());
            mRecyclerViewIFATabets.setLayoutManager(mLayoutManager);
            mAdapterIFA = new MedicationIFAAdapter(lstTablets);
            //LinearLayoutManager layoutManager = new LinearLayoutManager(AppManager.getInstance());
            //layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            //mRecyclerViewIFATabets.setLayoutManager(layoutManager);
            mRecyclerViewIFATabets.setLayoutManager(mLayoutManager);
            mRecyclerViewIFATabets.setAdapter(mAdapterIFA);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void setCAList(ArrayList<Medication> lstTablets){
        try {
            mAdapterCA = new MedicationIFAAdapter(lstTablets);
            LinearLayoutManager layoutManager = new LinearLayoutManager(ctx);
            layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            mRecyclerViewCATablets.setLayoutManager(layoutManager);
            mRecyclerViewCATablets.setAdapter(mAdapterCA);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void setOtherList(ArrayList<Medication> lstTablets){
        try {
            mAdapterOther = new MedicationIFAAdapter(lstTablets);
            LinearLayoutManager layoutManager = new LinearLayoutManager(ctx);
            layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
            mRecyclerViewOtherTablets.setLayoutManager(layoutManager);
            mRecyclerViewOtherTablets.setAdapter(mAdapterOther);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
