package com.persistent.healthmon.adapter;

import android.bluetooth.BluetoothDevice;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.util.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by pushkar_bhadle on 7/13/2016.
 */
public class MedicationIFAAdapter extends RecyclerView.Adapter<MedicationIFAAdapter.ViewHolder> {

    private ArrayList<Medication> mIFAList;
    public MedicationIFAAdapter(ArrayList<Medication> mIFAList){
        this.mIFAList = mIFAList;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_medication_view_all, parent, false);
        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {

        public TextView tv_drug_name,tv_due,tv_done,tv_quantity,tv_given,tv_role,tv_location;

        public ViewHolder(View itemView) {
            super(itemView);
            tv_drug_name = (TextView) itemView.findViewById(R.id.tv_m_drug_name);
            tv_due = (TextView) itemView.findViewById(R.id.tv_m_due_date);
            tv_done = (TextView) itemView.findViewById(R.id.tv_m_done_date);
            tv_quantity = (TextView) itemView.findViewById(R.id.tv_m_quantity);
            tv_given = (TextView) itemView.findViewById(R.id.tv_m_given_by);
            tv_role = (TextView) itemView.findViewById(R.id.tv_m_role);
            tv_location = (TextView) itemView.findViewById(R.id.tv_m_given_at);
        }
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        holder.tv_drug_name.setText(""+mIFAList.get(position).getDrug_name());
        holder.tv_due.setText(""+mIFAList.get(position).getDue_date());
        String strDate = mIFAList.get(position).getCreated_date();
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING);
        SimpleDateFormat sdf2 = new SimpleDateFormat(Constants.DbConstants.UI_DATE_FORMAT_VITALS_STRING);
        Date date = null;
        String dateStr = null;
        try {
            date = sdf.parse(strDate);
            dateStr = sdf2.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        holder.tv_done.setText(""+dateStr);
        holder.tv_quantity.setText(""+mIFAList.get(position).getMedicine_qty());
        holder.tv_given.setText(""+mIFAList.get(position).getGiven_by());
        holder.tv_role.setText(""+mIFAList.get(position).getRole());
        holder.tv_location.setText(""+mIFAList.get(position).getLocation());
    }

    @Override
    public int getItemCount() {
        return mIFAList.size();
    }

    public Medication getItem(int position){
            return mIFAList.get(position);
    }

}
