package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.PreferanceManager;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 6/1/2016.
 */
public class MyActivityAdapterViewAll extends RecyclerView.Adapter<MyActivityAdapterViewAll.MyViewHolderMain> {

    ArrayList<MyActivity> myActivities;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;

    public MyActivityAdapterViewAll(ArrayList<MyActivity> myActivities) {
        this.myActivities = myActivities;
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public MyActivityAdapterViewAll.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_activity_header_viewall, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_activity_row_viewall, parent, false));

        }


    }

    @Override
    public void onBindViewHolder(MyActivityAdapterViewAll.MyViewHolderMain holder, final int position) {

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
            myViewHolderRow.txtStatus.setText(myActivities.get(position - 1).getTaskStatus());
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
        TextView txtSrNo, txtDate, txtActivityName, txtComments, txtTime, txtCreatedBy, txtStatus;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtSrNo = (TextView) itemView.findViewById(R.id.txtSrNo);
            txtDate = (TextView) itemView.findViewById(R.id.txtDate);
            txtActivityName = (TextView) itemView.findViewById(R.id.txtActivityName);
            txtComments = (TextView) itemView.findViewById(R.id.txtComments);
            txtTime = (TextView) itemView.findViewById(R.id.txtTime);
            txtCreatedBy = (TextView) itemView.findViewById(R.id.txtCreatedBy);
            txtStatus = (TextView) itemView.findViewById(R.id.txtStatus);

        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}
