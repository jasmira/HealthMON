package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;


import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.PatientFamilyInfo;

/**
 * Created by khyati_shah on 3/31/2016.
 */
public class FamilyInfoAdapterPreview extends RecyclerView.Adapter<FamilyInfoAdapterPreview.MyViewHolder> {

    List<PatientFamilyInfo> familyInfos;
    Context context;

    public FamilyInfoAdapterPreview(List<PatientFamilyInfo> familyInfos) {
        this.familyInfos = familyInfos;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.row_family_info_preview, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        PatientFamilyInfo patientFamilyInfo = familyInfos.get(position);
        holder.valFullName.setText(patientFamilyInfo.getName());
        String gender = "";
        if (patientFamilyInfo.getGenderId() == 1) {
            gender = context.getResources().getString(R.string.txtFemale);
        } else {
            gender = context.getResources().getString(R.string.txtMale);
        }
        holder.valAgeGender.setText(patientFamilyInfo.getAge() + "/" + gender);
        holder.valDateofBirth.setText(patientFamilyInfo.getDob());
        holder.valRelationtoPatient.setText(patientFamilyInfo.getRelation_to_patient());
        holder.valMaritalStatus.setText(patientFamilyInfo.getMarrital_status());
        holder.valEducation.setText(patientFamilyInfo.getEducation());
        holder.valIdCardType.setText(DatabaseHelper.getInstance(context).getCardType(patientFamilyInfo.getIdCardTypeId()));
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
