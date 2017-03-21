package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import persistent.healthmon.R;
import persistent.healthmon.model.DocPatientInfo;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.util.Constants;

/**
 * Created by khyati_shah on 6/15/2016.
 */
public class PatientListAdapter extends RecyclerView.Adapter<PatientListAdapter.MyViewHolderMain> {

    DocPatientInfo docPatientInfo;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;

    public PatientListAdapter(DocPatientInfo docPatientInfo) {
        this.docPatientInfo = docPatientInfo;
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public PatientListAdapter.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.header_patient_list, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.row_patient_list, parent, false));

        }


    }

    @Override
    public void onBindViewHolder(PatientListAdapter.MyViewHolderMain holder, final int position) {

        if (holder.getItemViewType() == TYPE_ROW) {
            MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
            PatientPersonalInfo patientPersonalInfo = docPatientInfo.getPatientPersonalInfos().get(position - 1);
            if (patientPersonalInfo.getPriority() == Constants.PRIORITY_HIGH_RISK_PATIENT) {
                myViewHolderRow.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.colorred));
            }
            if (patientPersonalInfo.getPriority() == Constants.PRIORITY_MODERATE_RISK_PATIENT) {
                myViewHolderRow.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.coloryellow));
            }
            if (patientPersonalInfo.getPriority() == Constants.PRIORITY_NORMAL_PATIENT) {
                myViewHolderRow.txtSeviority.setBackgroundColor(context.getResources().getColor(R.color.colorGreenButtonDark));
            }
            myViewHolderRow.txtPatientName.setText(patientPersonalInfo.getFirstName() + " " + patientPersonalInfo.getLastName());
            myViewHolderRow.txtProgName.setText("ANC");
            myViewHolderRow.txtTask.setText("6");
            myViewHolderRow.txtPID.setText(patientPersonalInfo.getPatient_id());
            myViewHolderRow.txtAssignedTo.setText(docPatientInfo.getDocName());
            myViewHolderRow.txtStatus.setText("Pending");
        }
    }

    @Override
    public int getItemCount() {
        if (docPatientInfo.getPatientPersonalInfos().size() == 0) {
            return docPatientInfo.getPatientPersonalInfos().size();
        } else {
            return docPatientInfo.getPatientPersonalInfos().size() + 1;
        }
    }

    public class MyViewHolderHeader extends MyViewHolderMain {
        public MyViewHolderHeader(View itemView) {
            super(itemView);
        }
    }

    public class MyViewHolderRow extends MyViewHolderMain {
        TextView txtSeviority, txtPatientName, txtPID, txtProgName, txtTask, txtAssignedTo, txtStatus;
        ImageView imgPatientPic;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtSeviority = (TextView) itemView.findViewById(R.id.txtSeviority);
            txtPatientName = (TextView) itemView.findViewById(R.id.txtPatientName);
            txtPID = (TextView) itemView.findViewById(R.id.txtPID);
            txtProgName = (TextView) itemView.findViewById(R.id.txtProgName);
            txtTask = (TextView) itemView.findViewById(R.id.txtTask);
            txtAssignedTo = (TextView) itemView.findViewById(R.id.txtAssignedTo);
            txtStatus = (TextView) itemView.findViewById(R.id.txtStatus);
            imgPatientPic = (ImageView) itemView.findViewById(R.id.imgPatientPic);
        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}
