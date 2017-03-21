package com.persistent.healthmon.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.Tasks;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

import java.util.List;

/**
 * Created by pushkar_bhadle on 5/11/2016.
 */
public class NotificationToolbarAdapter extends ArrayAdapter<Tasks> {
    private static final String TAG = NotificationToolbarAdapter.class.getSimpleName();
    private Context context;
    List<Tasks> list;
    public NotificationToolbarAdapter(Context ctx, int txtViewResourceId, List<Tasks> objects) {
        super(ctx, txtViewResourceId, objects);
        this.list = objects;
        context = ctx;
    }

    @Override
    public View getDropDownView(int position, View cnvtView, ViewGroup prnt) {
        return getCustomView(position, cnvtView, prnt);
    }

    @Override
    public View getView(int pos, View cnvtView, ViewGroup prnt) {
        return getCustomView(pos, cnvtView, prnt);
    }



    public View getCustomView(final int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View mySpinner = inflater.inflate(R.layout.dashboard_toolbar_notification, parent, false);
        HealthMonLog.i(TAG,"Notification list = "+list.toString());
        if(list != null){
            //if (list.get(position).getTask_to_show() == Constants.DbConstants.TASK_TO_SHOW) {
                TextView notification_name = (TextView) mySpinner.findViewById(R.id.notification_name);
                notification_name.setText(list.get(position).getUser_Task_Name());

                final TextView notification_date = (TextView) mySpinner.findViewById(R.id.notification_date);
                notification_date.setText(list.get(position).getUser_Task_Description());

                TextView notification_time = (TextView) mySpinner.findViewById(R.id.notification_time);
                notification_time.setText(list.get(position).getUser_Task_Date());

                Button notification_dismiss = (Button) mySpinner.findViewById(R.id.btdismiss);
                notification_dismiss.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        DatabaseHelper.getInstance(context).removeNotificaiton(list.get(position));
                        list.remove(position);
                        if(list.size()!=0) {
                            NotificationToolbarAdapter.this.notifyDataSetChanged();
                        }else{
                            NotificationToolbarAdapter.this.clear();
                        }
                    }
                });
            //}
        }

        return mySpinner;
    }
}
