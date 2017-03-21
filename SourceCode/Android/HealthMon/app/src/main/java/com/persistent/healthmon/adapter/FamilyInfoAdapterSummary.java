package com.persistent.healthmon.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.PatientFamilyInfo;

import java.util.List;

/**
 * Created by khyati_shah on 5/17/2016.
 */
public class FamilyInfoAdapterSummary extends RecyclerView.Adapter<FamilyInfoAdapterSummary.MyViewHolder> {

    List<PatientFamilyInfo> familyInfos;

    public FamilyInfoAdapterSummary(List<PatientFamilyInfo> familyInfos) {
        this.familyInfos = familyInfos;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.row_familyinfo_summary, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        PatientFamilyInfo patientFamilyInfo = familyInfos.get(position);
        holder.valFullName.setText(patientFamilyInfo.getName());
        //holder.valAgeGender.setText(patientFamilyInfo.getAge() + "/" + patientFamilyInfo.getGender());
        holder.valDateofBirth.setText(patientFamilyInfo.getDob());
        holder.valRelationtoPatient.setText(patientFamilyInfo.getRelation_to_patient());
        holder.valMaritalStatus.setText(patientFamilyInfo.getMarrital_status());
        holder.valEducation.setText(patientFamilyInfo.getEducation());
        //holder.valIdCardType.setText(patientFamilyInfo.getIdCardType());
        holder.valIdCardNumber.setText(patientFamilyInfo.getIdCardNumber());
        holder.valContact.setText(patientFamilyInfo.getContact());
    }


    @Override
    public int getItemCount() {
        return familyInfos.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView valFullName, valAgeGender, valDateofBirth, valRelationtoPatient, valMaritalStatus, valEducation, valIdCardType, valIdCardNumber, valContact;

        public MyViewHolder(View view) {
            super(view);
            valFullName = (TextView) view.findViewById(R.id.valFullName);
            valAgeGender = (TextView) view.findViewById(R.id.valAgeGender);
            valDateofBirth = (TextView) view.findViewById(R.id.valDateofBirth);
            valRelationtoPatient = (TextView) view.findViewById(R.id.valRelationtoPatient);
            valMaritalStatus = (TextView) view.findViewById(R.id.valMaritalStatus);
            valEducation = (TextView) view.findViewById(R.id.valEducation);
            valIdCardType = (TextView) view.findViewById(R.id.valIdCardType);
            valIdCardNumber = (TextView) view.findViewById(R.id.valIdCardNumber);
            valContact = (TextView) view.findViewById(R.id.valContact);

        }
    }
}
