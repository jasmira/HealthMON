package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.ANCRegisterReport;
import com.persistent.healthmon.util.DateUtil;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by khyati_shah on 6/7/2016.
 */
public class ANCRegisterReportAdapter extends RecyclerView.Adapter<ANCRegisterReportAdapter.MyViewHolderMain> {

    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;
    ArrayList<ANCRegisterReport> ancRegisterReports;

    public ANCRegisterReportAdapter(ArrayList<ANCRegisterReport> ancRegisterReports) {
        this.ancRegisterReports = ancRegisterReports;
    }

    @Override
    public ANCRegisterReportAdapter.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.anc_register_report_header, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.anc_register_report_row, parent, false));

        }
    }


    @Override
    public void onBindViewHolder(ANCRegisterReportAdapter.MyViewHolderMain holder, int position) {
        if (holder.getItemViewType() == TYPE_ROW) {
            try {
                MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
                myViewHolderRow.txtSrNo.setText(String.valueOf(position));
                myViewHolderRow.txtPatientName.setText(ancRegisterReports.get(position - 1).getPatientFirstName() + " " + ancRegisterReports.get(position - 1).getPatientLastName());
                DateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date dtLMP = dtFormat.parse(ancRegisterReports.get(position - 1).getLMPDate());
                int weeks = DateUtil.getWeeksBetween(dtLMP, new Date());
                myViewHolderRow.txtPrgWeeks.setText(String.valueOf(weeks) + " " + context.getResources().getString(R.string.txtWeeks));
                myViewHolderRow.txtVillage.setText(DatabaseHelper.getInstance(context).getVillage(ancRegisterReports.get(position - 1).getVillageId()));
                myViewHolderRow.txtWard.setText(ancRegisterReports.get(position - 1).getWard());
                myViewHolderRow.txtAge.setText(ancRegisterReports.get(position - 1).getAge());
                String convertedDt = DateUtil.dateConvert(ancRegisterReports.get(position - 1).getEDD(), "yyyy-MM-dd", "dd-MM-yyyy");
                myViewHolderRow.txtEDD.setText(convertedDt);
                convertedDt = DateUtil.dateConvert(ancRegisterReports.get(position - 1).getRegDtae(), "yyyy-MM-dd HH:mm:ss", "dd-MM-yyyy");
                myViewHolderRow.txtDate.setText(convertedDt);
                myViewHolderRow.txtDeliveryNo.setText(ancRegisterReports.get(position - 1).getDeliveryNum());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public int getItemCount() {
        if (ancRegisterReports.size() == 0) {
            return ancRegisterReports.size();
        } else {
            return ancRegisterReports.size() + 1;
        }
    }

    public class MyViewHolderHeader extends MyViewHolderMain {
        public MyViewHolderHeader(View itemView) {
            super(itemView);
        }
    }

    public class MyViewHolderRow extends MyViewHolderMain {
        TextView txtSrNo, txtDate, txtPatientName, txtPrgWeeks, txtVillage, txtWard, txtAge, txtEDD, txtDeliveryNo;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtSrNo = (TextView) itemView.findViewById(R.id.txtSrNo);
            txtDate = (TextView) itemView.findViewById(R.id.txtDate);
            txtPatientName = (TextView) itemView.findViewById(R.id.txtPatientName);
            txtPrgWeeks = (TextView) itemView.findViewById(R.id.txtPrgWeeks);
            txtVillage = (TextView) itemView.findViewById(R.id.txtVillage);
            txtWard = (TextView) itemView.findViewById(R.id.txtWard);
            txtAge = (TextView) itemView.findViewById(R.id.txtAge);
            txtEDD = (TextView) itemView.findViewById(R.id.txtEDD);
            txtDeliveryNo = (TextView) itemView.findViewById(R.id.txtDeliveryNo);

        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}
