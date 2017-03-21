package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.interfaces.OnMoSelected;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.model.UserMO;

/**
 * Created by khyati_shah on 7/28/2016.
 */
public class MoListAdapter extends RecyclerView.Adapter<MoListAdapter.MyViewHolder> {
    ArrayList<UserMO> userMOs;
    PatientPersonalInfo patientPersonalInfo;
    Context context;
    OnMoSelected onMoSelected;

    public MoListAdapter(ArrayList<UserMO> userMOs, PatientPersonalInfo patientPersonalInfo, OnMoSelected onMoSelected) {
        this.userMOs = userMOs;
        this.patientPersonalInfo = patientPersonalInfo;
        this.onMoSelected = onMoSelected;
    }

    @Override
    public MoListAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_mo_list, parent, false);
        this.context = parent.getContext();
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MoListAdapter.MyViewHolder holder, final int position) {
        holder.txtMoName.setText(userMOs.get(position).getMOName());
        holder.txtSpecialization.setText(userMOs.get(position).getMOQualification());

        holder.llMoContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                holder.imgTick.setVisibility(View.VISIBLE);
                onMoSelected.OnMoSelected(position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return userMOs.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView txtMoName, txtSpecialization;
        ImageView imgTick;
        LinearLayout llMoContainer;

        public MyViewHolder(View itemView) {
            super(itemView);
            txtMoName = (TextView) itemView.findViewById(R.id.txtMoName);
            txtSpecialization = (TextView) itemView.findViewById(R.id.txtSpecialization);
            imgTick = (ImageView) itemView.findViewById(R.id.imgTick);
            llMoContainer = (LinearLayout) itemView.findViewById(R.id.llMoContainer);
        }
    }
}
