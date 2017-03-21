package com.persistent.healthmon.adapter;

import android.app.Dialog;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.interfaces.FamilyInfoAdapterEdit;
import com.persistent.healthmon.model.PatientFamilyInfo;

import java.util.List;

/**
 * Created by khyati_shah on 3/31/2016.
 */
public class PatientFamilyInfoAdapter extends RecyclerView.Adapter<PatientFamilyInfoAdapter.MyViewHolder> {

    List<PatientFamilyInfo> familyInfos;
    FamilyInfoAdapterEdit familyInfoAdapterEdit;
    Context context;

    public PatientFamilyInfoAdapter(List<PatientFamilyInfo> familyInfos, FamilyInfoAdapterEdit familyInfoAdapterEdit) {
        this.familyInfos = familyInfos;
        this.familyInfoAdapterEdit = familyInfoAdapterEdit;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.row_patient_family, parent, false);
        context = parent.getContext();
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, final int position) {
        PatientFamilyInfo patientFamilyInfo = familyInfos.get(position);
        //holder.txtAadharNo.setText(patientFamilyInfo.getAadhar_no());
        holder.txtEducation.setText(patientFamilyInfo.getEducation());
        holder.txtMaritalStatus.setText(patientFamilyInfo.getMarrital_status());
        holder.txtAge.setText(String.valueOf(patientFamilyInfo.getAge()));
        holder.txtDOB.setText(patientFamilyInfo.getDob());
        String gender;
        if (patientFamilyInfo.getGenderId() == 1) {
            gender = context.getResources().getString(R.string.txtFemale);
        } else {
            gender = context.getResources().getString(R.string.txtMale);
        }
        holder.txtGender.setText(gender);
        holder.txtContact.setText(patientFamilyInfo.getContact());
        holder.txtRelation.setText(patientFamilyInfo.getRelation_to_patient());
        holder.txtName.setText(patientFamilyInfo.getName());
        holder.btnEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                familyInfoAdapterEdit.onEdit(position);
            }
        });
        holder.btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Button btnOk, btnCancel;
                final Dialog dialog = new Dialog(context);
                dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog.setContentView(R.layout.dialog_delete_confirmation);
                btnOk = (Button) dialog.findViewById(R.id.btnOk);
                btnCancel = (Button) dialog.findViewById(R.id.btnCancel);
                btnOk.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        familyInfos.remove(position);
                        notifyDataSetChanged();
                        dialog.dismiss();
                    }
                });
                btnCancel.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });
                dialog.show();
            }
        });
    }


    @Override
    public int getItemCount() {
        return familyInfos.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView txtAadharNo, txtEducation, txtMaritalStatus, txtAge, txtDOB, txtGender, txtContact, txtRelation, txtName;
        public Button btnEdit, btnDelete;

        public MyViewHolder(View view) {
            super(view);
            txtAadharNo = (TextView) view.findViewById(R.id.txtAadharNo);
            txtEducation = (TextView) view.findViewById(R.id.txtEducation);
            txtMaritalStatus = (TextView) view.findViewById(R.id.txtMaritalStatus);
            txtAge = (TextView) view.findViewById(R.id.txtAge);
            txtDOB = (TextView) view.findViewById(R.id.txtDOB);
            txtGender = (TextView) view.findViewById(R.id.txtGender);
            txtContact = (TextView) view.findViewById(R.id.txtContact);
            txtRelation = (TextView) view.findViewById(R.id.txtRelation);
            txtName = (TextView) view.findViewById(R.id.txtName);
            btnDelete = (Button) view.findViewById(R.id.btnDelete);
            btnEdit = (Button) view.findViewById(R.id.btnEdit);
        }
    }
}
