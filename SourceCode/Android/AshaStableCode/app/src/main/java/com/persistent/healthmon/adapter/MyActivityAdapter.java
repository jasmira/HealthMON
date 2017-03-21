package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.interfaces.OnAdapterNotify;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by khyati_shah on 6/1/2016.
 */
public class MyActivityAdapter extends RecyclerView.Adapter<MyActivityAdapter.MyViewHolderMain> {

    ArrayList<MyActivity> myActivities;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;
    OnAdapterNotify onAdapterNotify;

    public MyActivityAdapter(ArrayList<MyActivity> myActivities, OnAdapterNotify onAdapterNotify) {
        this.myActivities = myActivities;
        this.onAdapterNotify = onAdapterNotify;
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public MyActivityAdapter.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_activity_header, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_activity_row, parent, false));

        }


    }

    @Override
    public void onBindViewHolder(MyActivityAdapter.MyViewHolderMain holder, final int position) {

        if (holder.getItemViewType() == TYPE_ROW) {
            MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
            myViewHolderRow.txtSrNo.setText(String.valueOf(position));
            myViewHolderRow.txtActivityName.setText(myActivities.get(position - 1).getActivityName());
            myViewHolderRow.txtComments.setText(myActivities.get(position - 1).getComments());
            if (myActivities.get(position - 1).getTaskDate() != null) {
                String convertedDt = DateUtil.dateConvert(myActivities.get(position - 1).getTaskDate(), "yyyy-MM-dd", "dd-MM-yyyy");
                myViewHolderRow.txtDate.setText(convertedDt);
            } else {
                myViewHolderRow.txtDate.setText("");
            }
            myViewHolderRow.txtTime.setText(myActivities.get(position - 1).getTaskCreatedTime());
            if (myActivities.get(position - 1).getCreatedByName().equalsIgnoreCase(PreferanceManager.getAshaId(context))) {
                myViewHolderRow.txtCreatedBy.setText(context.getResources().getString(R.string.txtCreatedBy) + " " + Constants.ACTIVITY_CREATEDBY_SELF);
            } else {
                myViewHolderRow.txtCreatedBy.setText(context.getResources().getString(R.string.txtCreatedBy) + " " + myActivities.get(position - 1).getCreatedByName());
            }
            myViewHolderRow.llContainerDelete.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //Toast.makeText(context, "Delete clcicked", Toast.LENGTH_LONG).show();
                    DatabaseHelper.getInstance(context).updateActivityStatus(myActivities.get(position - 1).getTaskId(), Constants.ACTIVITY_STATUS_DELETE);
                    //webservice call
                    WebserviceManager.editMyActivityStatus(context, myActivities.get(position - 1).getTaskId(), Constants.ACTIVITY_STATUS_DELETE);
                    //if reminder is set for activity
                    if (myActivities.get(position - 1).getEvent_URI() != null) {
                        HealthMonUtility.deleteReminder(context, myActivities.get(position - 1).getEvent_URI(), myActivities.get(position - 1).getReminder_URI());
                    }
                    myActivities.remove(position - 1);
                    myActivities.removeAll(Collections.singleton(null));
                    notifyDataSetChanged();
                    onAdapterNotify.onNotify();
                }
            });
            myViewHolderRow.llContainerDone.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //Toast.makeText(context, "Done clcicked", Toast.LENGTH_LONG).show();
                    DatabaseHelper.getInstance(context).updateActivityStatus(myActivities.get(position - 1).getTaskId(), Constants.ACTIVITY_STATUS_DONE);
                    //webservice call
                    WebserviceManager.editMyActivityStatus(context, myActivities.get(position - 1).getTaskId(), Constants.ACTIVITY_STATUS_DONE);
                    //if reminder is set for activity
                    if (myActivities.get(position - 1).getEvent_URI() != null) {
                        HealthMonUtility.deleteReminder(context, myActivities.get(position - 1).getEvent_URI(), myActivities.get(position - 1).getReminder_URI());
                    }
                    myActivities.remove(position - 1);
                    myActivities.removeAll(Collections.singleton(null));
                    notifyDataSetChanged();
                    onAdapterNotify.onNotify();
                }
            });
        }
    }

    @Override
    public int getItemCount() {
        if (myActivities.size() == 0) {
            return myActivities.size();
        } else {
            return myActivities.size() + 1;
        }
    }

    public class MyViewHolderHeader extends MyViewHolderMain {
        public MyViewHolderHeader(View itemView) {
            super(itemView);
        }
    }

    public class MyViewHolderRow extends MyViewHolderMain {
        TextView txtSrNo, txtDate, txtActivityName, txtComments, txtTime, txtCreatedBy;
        LinearLayout llContainerDone, llContainerDelete;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtSrNo = (TextView) itemView.findViewById(R.id.txtSrNo);
            txtDate = (TextView) itemView.findViewById(R.id.txtDate);
            txtActivityName = (TextView) itemView.findViewById(R.id.txtActivityName);
            txtComments = (TextView) itemView.findViewById(R.id.txtComments);
            txtTime = (TextView) itemView.findViewById(R.id.txtTime);
            txtCreatedBy = (TextView) itemView.findViewById(R.id.txtCreatedBy);
            llContainerDone = (LinearLayout) itemView.findViewById(R.id.llContainerDone);
            llContainerDelete = (LinearLayout) itemView.findViewById(R.id.llContainerDelete);

        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}
