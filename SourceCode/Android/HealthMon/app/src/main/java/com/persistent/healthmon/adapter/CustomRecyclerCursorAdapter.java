package com.persistent.healthmon.adapter;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Locale;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 4/11/2016.
 */
//TO DO:
public class CustomRecyclerCursorAdapter extends CursorRecyclerAdapter<CustomRecyclerCursorAdapter.ViewHolder>{
    private static String TAG = CustomRecyclerCursorAdapter.class.getCanonicalName();
    private Context mContext;

    public CustomRecyclerCursorAdapter(Context context, Cursor cursor){
        super(context,cursor);
    }

    public CustomRecyclerCursorAdapter(Cursor cursor) {
        super(cursor);
    }

    @Override
    public void onBindViewHolderCursor(CustomRecyclerCursorAdapter.ViewHolder holder, Cursor cursor) {
        holder.mTxttaskcount.setText(cursor.getString(cursor.getColumnIndex(cursor.getColumnName(0))));
        holder.mTxtpersonname.setText(cursor.getString(cursor.getColumnIndex(cursor.getColumnName(12))));
        String patient_ID = "("+mContext.getResources().getString(R.string.txtPatientID)+": "+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(10)))+")";
        holder.mTxtpersonpin.setText(patient_ID);
//        byte[] byteArray = cursor.getBlob(3);
/*        if(byteArray!=null){
            holder.mImgpatientImg.setImageBitmap(BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length));
        }*/

        String color = cursor.getString(cursor.getColumnIndex(cursor.getColumnName(7)));
        if(color.equals("1")){
            holder.mImgpatientColorCode.setBackgroundColor(ContextCompat.getColor(mContext,R.color.colorgreentask));
        }else if(color.equals("2")){
            holder.mImgpatientColorCode.setBackgroundColor(ContextCompat.getColor(mContext,R.color.coloryellow));
        }else if(color.equals("3")){
            holder.mImgpatientColorCode.setBackgroundColor(ContextCompat.getColor(mContext,R.color.colorred));
        }
        //holder.mTxttaskname.setText(cursor.getString(cursor.getColumnIndex(cursor.getColumnName(4))));
        holder.mTxttaskname.setText(mContext.getString(R.string.txtVisitPatient));
        String date = cursor.getString(cursor.getColumnIndex(cursor.getColumnName(8)));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT);
        Date date1 = null;
        String strDate22 = "";

        try {
            date1 = simpleDateFormat.parse(date);
            SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(Constants.DbConstants.DATE_FORMAT_DASHBOARD);
            strDate22 = simpleDateFormat2.format(date1);
            Date today = new Date();
            String strToday = simpleDateFormat2.format(today);
            if(strToday.equalsIgnoreCase(strDate22)){
                holder.mTxttaskdate.setText(mContext.getString(R.string.txtToday));
            }else {
                holder.mTxttaskdate.setText(strDate22);
            }
            HealthMonLog.i(TAG,"Date in Cursor ="+date+"  Date in DATE = "+date1+" Date in string = "+ strDate22);
        } catch (ParseException e) {
            e.printStackTrace();
            HealthMonLog.i(TAG,"Date in Cursor = Error in parsing");
        }
        holder.mTxttaskname.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
            //    Toast.makeText(mContext, "Delete clcicked", Toast.LENGTH_LONG).show();

            }
        });
        HealthMonLog.i(TAG,"Count="+cursor.getCount());
/*
        HealthMonLog.i(TAG,"0="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(0))));
        HealthMonLog.i(TAG,"1="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(1))));
        HealthMonLog.i(TAG,"2="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(2))));
        HealthMonLog.i(TAG,"3="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(3))));
        //4 = Task Name
        HealthMonLog.i(TAG,"4="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(4))));
        //5 = Task Description
        HealthMonLog.i(TAG,"5="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(5))));
        //6 = Task Type
        HealthMonLog.i(TAG,"6="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(6))));
        //7 = Task Severity
        HealthMonLog.i(TAG,"7="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(7))));
        //8  = Date
        HealthMonLog.i(TAG,"8="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(8))));
        HealthMonLog.i(TAG,"9="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(9))));
        HealthMonLog.i(TAG,"10="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(10))));
        HealthMonLog.i(TAG,"11="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(11))));
        HealthMonLog.i(TAG,"12="+cursor.getString(cursor.getColumnIndex(cursor.getColumnName(12))));
*/


    }

    @Override
    public CustomRecyclerCursorAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_dashboard_tasks, parent, false);
        mContext = parent.getContext();
        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }


    public static class ViewHolder extends RecyclerView.ViewHolder{
        // each data item is just a string in this case
        public TextView mTxtpersonname;
        public TextView mTxtpersonpin;
        public TextView mTxttaskname;
        public TextView mTxttaskcount;
        public TextView mTxttaskdate;
        public ImageView mImgpatientImg;
        public TextView mImgpatientColorCode;
        public View mViewLayout;

        public ViewHolder(View v) {
            super(v);
            mViewLayout = v;
            mTxtpersonname =(TextView) v.findViewById(R.id.txtTaskPatientName);
            mTxtpersonpin =(TextView) v.findViewById(R.id.txtTaskPatientId);
            mTxttaskname =(TextView) v.findViewById(R.id.txtTaskName);
            mTxttaskcount =(TextView) v.findViewById(R.id.txtTaskCount);
            mTxttaskdate =(TextView) v.findViewById(R.id.txtTaskDate);
            mImgpatientImg =(ImageView) v.findViewById(R.id.imgPatientPhoto);
            mImgpatientColorCode =(TextView) v.findViewById(R.id.txtpatientcolorcode);
        }
    }
}

