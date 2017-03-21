package com.persistent.healthmon.placeholder;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.nfc.Tag;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v4.graphics.drawable.RoundedBitmapDrawable;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.widget.Toast;

import com.mikhaellopez.circularimageview.CircularImageView;
import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.NetworkStatusReceiver;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.AshaDetails;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.PreferanceManager;
import com.persistent.healthmon.util.RoundImage;
import com.persistent.healthmon.viewcontroller.HealthMonLoginActivity;

/**
 * Created by pushkar_bhadle on 4/25/2016.
 */
public class AshaProfilePopupWindow extends android.widget.PopupWindow
{
    private final static String TAG = AshaProfilePopupWindow.class.getCanonicalName();
    Context ctx;
    Button btnSignOut;
    TextView asha_name,asha_id,qualification,Emergency_contact,Address,Contact;
    CircularImageView asha_image;
    View popupView;

    public AshaProfilePopupWindow(Context context)
    {
        super(context);
        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.asha_profile_popup_window, null);
        setContentView(popupView);

        btnSignOut = (Button)popupView.findViewById(R.id.btn_sign_out);
        asha_image = (CircularImageView)popupView.findViewById(R.id.profile_image);
        asha_name = (TextView) popupView.findViewById(R.id.asha_popup_ashaname);
        asha_id = (TextView) popupView.findViewById(R.id.asha_popup_ashaid);
        qualification = (TextView) popupView.findViewById(R.id.asha_popup_qualification);
        Emergency_contact = (TextView) popupView.findViewById(R.id.asha_popup_emergency_contact);
        Address = (TextView) popupView.findViewById(R.id.asha_popup_address);
        Contact = (TextView) popupView.findViewById(R.id.asha_popup_contact);

        setHeight(WindowManager.LayoutParams.FILL_PARENT);
        setWidth(440);

        ctx.registerReceiver(broadcastReceiverConnected, new IntentFilter(Constants.BROADcAST_CONNECTED));
        ctx.registerReceiver(broadcastReceiverDisconnected, new IntentFilter(Constants.BROADcAST_DISCONNECTED));
     //   CircularImageView circularAsha = (CircularImageView) popupView.findViewById(R.id.dashboarduserimage);

        AshaDetails ashaDetails = DatabaseHelper.getInstance(ctx).getAshaDetails(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",ctx));
        if(ashaDetails != null){
            HealthMonLog.i(TAG,"Asha details = "+ashaDetails.toString());
/*            if(ashaDetails.getAsha_pic()!=null){
                Bitmap bitmap = BitmapFactory.decodeByteArray(ashaDetails.getAsha_pic() , 0, ashaDetails.getAsha_pic().length);
                asha_image.setImageBitmap(bitmap);
            }*/
//            circularAsha.setImageResource(R.drawable.asha_4);
            asha_name.setText(ashaDetails.getAsha_name());
            asha_id.setText(String.valueOf(ashaDetails.getAsha_id()));
            qualification.setText(ashaDetails.getQualification());
            Emergency_contact.setText(ashaDetails.getEmergencyContact());
            Address.setText(ashaDetails.getAddress()+"\n"+ashaDetails.getAddress2());
            Contact.setText(ashaDetails.getContact());
        }
        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        setBackgroundDrawable(new BitmapDrawable());
        if (NetworkStatusReceiver.isOnline(ctx)) {
            showNetworkStatus(true);
        } else {
            showNetworkStatus(false);
        }
        btnSignOut.setOnClickListener(new Button.OnClickListener(){

            @Override
            public void onClick(View v) {


                PreferanceManager.setBooleanPreferences("isLoginCheckBoxClicked",false,ctx);
                Intent intent = new Intent(ctx,  HealthMonLoginActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                Intent intent2 = new Intent(Constants.LOG_OUT);
                //send the broadcast to all activities who are listening
                LocalBroadcastManager.getInstance(ctx).sendBroadcast(intent2);
                ctx.startActivity(intent);

            }});
    } // End constructor


    // Attaches the view to its parent anchor-view at position x and y
    public void show(View anchor, int x, int y){
        showAtLocation(anchor, Gravity.START | Gravity.TOP, x, y);
    }


    public void showNetworkStatus(boolean isOnline) {
        asha_image.setImageResource(R.drawable.asha_4);
        asha_image.setBorderWidth(7);
        asha_image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        asha_image.addShadow();
        asha_image.setShadowRadius(1);
        if(isOnline){
            asha_image.setBorderColor(ctx.getResources().getColor(R.color.colorgreenonline));
        }else{
            asha_image.setBorderColor(ctx.getResources().getColor(R.color.colorred));
        }
    }

    BroadcastReceiver broadcastReceiverConnected = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            showNetworkStatus(true);
        }
    };

    BroadcastReceiver broadcastReceiverDisconnected = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            showNetworkStatus(false);
        }
    };



    @Override
    public void dismiss() {
        super.dismiss();
        ctx.unregisterReceiver(broadcastReceiverConnected);
        ctx.unregisterReceiver(broadcastReceiverDisconnected);
    }
}