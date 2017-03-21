package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.model.Tasks;

/**
 * Created by khyati_shah on 6/16/2016.
 */
public class DashboardAlertsAdapter extends RecyclerView.Adapter<DashboardAlertsAdapter.MyViewHolder> {

    ArrayList<Tasks> tasks;
    Context context;


    public DashboardAlertsAdapter(ArrayList<Tasks> tasks) {
        this.tasks = tasks;
    }

    @Override
    public DashboardAlertsAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_alert_task, parent, false);
        this.context = parent.getContext();
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(DashboardAlertsAdapter.MyViewHolder holder, final int position) {
        holder.txtTaskName.setText(tasks.get(position).getUser_Task_Name());
        holder.txtTaskDate.setText(tasks.get(position).getDate());
        holder.txtPatientId.setText(tasks.get(position).getHM_Patient_id());
    }

    @Override
    public int getItemCount() {
        return tasks.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView txtTaskName, txtTaskDate, txtPatientId;

        public MyViewHolder(View itemView) {
            super(itemView);
            txtTaskName = (TextView) itemView.findViewById(R.id.txtTaskName);
            txtTaskDate = (TextView) itemView.findViewById(R.id.txtTaskDate);
            txtPatientId = (TextView) itemView.findViewById(R.id.txtPatientId);
        }

    }

}
