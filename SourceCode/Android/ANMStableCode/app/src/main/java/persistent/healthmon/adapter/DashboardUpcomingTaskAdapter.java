package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.model.Tasks;
import persistent.healthmon.util.Constants;

/**
 * Created by khyati_shah on 6/16/2016.
 */
public class DashboardUpcomingTaskAdapter extends RecyclerView.Adapter<DashboardUpcomingTaskAdapter.MyViewHolder> {

    ArrayList<Tasks> tasks;
    Context context;


    public DashboardUpcomingTaskAdapter(ArrayList<Tasks> tasks) {
        this.tasks = tasks;
    }

    @Override
    public DashboardUpcomingTaskAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_upcomming_task, parent, false);
        this.context = parent.getContext();
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(DashboardUpcomingTaskAdapter.MyViewHolder holder, final int position) {
        if (tasks.get(position).getUser_Task_Severity() == Constants.PRIORITY_HIGH_RISK_PATIENT) {
            holder.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.colorred));
        }
        if (tasks.get(position).getUser_Task_Severity() == Constants.PRIORITY_MODERATE_RISK_PATIENT) {
            holder.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.coloryellow));
        }
        if (tasks.get(position).getUser_Task_Severity() == Constants.PRIORITY_NORMAL_PATIENT) {
            holder.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.colorGreenButtonDark));
        }
        holder.txtPatientName.setText(tasks.get(position).getPatient_full_name());
        holder.txtPID.setText("( ID: " + tasks.get(position).getHM_Patient_id() + ")");
        holder.txtTaskCount.setText("6");
    }

    @Override
    public int getItemCount() {
        return tasks.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView txtSeviority, txtPatientName, txtPID, txtTaskCount;
        ImageView imgPatientPic;

        public MyViewHolder(View itemView) {
            super(itemView);
            txtSeviority = (TextView) itemView.findViewById(R.id.txtSeviority);
            txtPatientName = (TextView) itemView.findViewById(R.id.txtPatientName);
            txtPID = (TextView) itemView.findViewById(R.id.txtPID);
            txtTaskCount = (TextView) itemView.findViewById(R.id.txtTaskCount);
        }

    }

}

