package persistent.healthmon.adapter;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.mikhaellopez.circularimageview.CircularImageView;

import java.util.ArrayList;
import java.util.Locale;

import persistent.healthmon.R;
import persistent.healthmon.interfaces.OnPatientSelected;
import persistent.healthmon.model.PatientPersonalInfo;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.ImageResizer;

/**
 * Created by khyati_shah on 5/6/2016.
 */
public class AllPatientAdapter extends RecyclerView.Adapter<AllPatientAdapter.MyViewHolder> {

    ArrayList<PatientPersonalInfo> patientPersonalInfosSearchSave = null;
    ArrayList<PatientPersonalInfo> patientPersonalInfos;
    Context context;
    OnPatientSelected onPatientSelected;


    public AllPatientAdapter(ArrayList<PatientPersonalInfo> patientPersonalInfos, OnPatientSelected onPatientSelected) {
        this.patientPersonalInfos = patientPersonalInfos;
        this.onPatientSelected = onPatientSelected;
        patientPersonalInfosSearchSave = new ArrayList<PatientPersonalInfo>();
        patientPersonalInfosSearchSave.addAll(patientPersonalInfos);
    }

    @Override
    public AllPatientAdapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_patient_card, parent, false);
        this.context = parent.getContext();
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(AllPatientAdapter.MyViewHolder holder, final int position) {

        String gender = "";
        if (patientPersonalInfos.get(position).getGenderId() == 1) {
            gender = "F";
        } else {
            gender = "M";
        }
        holder.txtPatientName.setText(patientPersonalInfos.get(position).getFirstName() + " " + patientPersonalInfos.get(position).getLastName() + ", " + patientPersonalInfos.get(position).getAge() + "/" + gender);
        // holder.txtAgeGender.setText(patientPersonalInfos.get(position).getAge() + " / " + gender);
        holder.txtPID.setText(patientPersonalInfos.get(position).getPatient_id());
        holder.txtContact.setText(patientPersonalInfos.get(position).getContact());
        holder.llHBContainer.setVisibility(View.INVISIBLE);
        holder.llBloodPresureContainer.setVisibility(View.INVISIBLE);
        if (patientPersonalInfos.get(position).getPatient_image_string() != null) {
            byte[] b = Base64.decode(patientPersonalInfos.get(position).getPatient_image_string(), Base64.DEFAULT);
            //Bitmap patientImg = BitmapFactory.decodeByteArray(b, 0, b.length);
            Bitmap patientImg = ImageResizer.getBitmapThumbnail(context, patientPersonalInfos.get(position).getPatient_image_string());

            holder.imgPatient.setImageBitmap(patientImg);

        } else {
            holder.imgPatient.setImageDrawable(context.getResources().getDrawable(R.drawable.user_default_blue));
        }
        switch (patientPersonalInfos.get(position).getPriority()) {
            case Constants.PRIORITY_HIGH_RISK_PATIENT:
                holder.txtPriority.setBackgroundColor(context.getResources().getColor(R.color.colorred));
                break;
            case Constants.PRIORITY_MODERATE_RISK_PATIENT:
                holder.txtPriority.setBackgroundColor(context.getResources().getColor(R.color.coloryellow));
                break;
            case Constants.PRIORITY_NORMAL_PATIENT:
                holder.txtPriority.setBackgroundColor(context.getResources().getColor(R.color.colorGreenButtonDark));
                break;
            default:
                holder.txtPriority.setBackgroundColor(context.getResources().getColor(R.color.colorGreenButtonDark));
                break;
        }

       /* holder.card_view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(context,"Clicked",Toast.LENGTH_LONG).show();
                onPatientSelected.onPatientSelected(patientPersonalInfos.get(position));
            }
        });*/
        holder.patientInfoContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onPatientSelected.onPatientSelected(patientPersonalInfos.get(position));
            }
        });
        holder.txtMark.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onPatientSelected.onMarkVisitSelected(patientPersonalInfos.get(position));
            }
        });
    }

    @Override
    public int getItemCount() {
        return patientPersonalInfos.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        CircularImageView imgPatient;
        //txtAgeGender
        TextView txtPatientName, txtPID, txtContact, txtPriority, txtMark;
        CardView card_view;
        LinearLayout llHBContainer, llBloodPresureContainer, patientInfoContainer;

        public MyViewHolder(View itemView) {
            super(itemView);
            txtPatientName = (TextView) itemView.findViewById(R.id.txtPatientName);
            // txtAgeGender = (TextView) itemView.findViewById(R.id.txtAgeGender);
            txtPID = (TextView) itemView.findViewById(R.id.txtPID);
            txtPriority = (TextView) itemView.findViewById(R.id.txtPriority);
            txtContact = (TextView) itemView.findViewById(R.id.txtContact);
            txtMark = (TextView) itemView.findViewById(R.id.txtMark);
            imgPatient = (CircularImageView) itemView.findViewById(R.id.imgPatient);
            card_view = (CardView) itemView.findViewById(R.id.card_view);
            llHBContainer = (LinearLayout) itemView.findViewById(R.id.llHBContainer);
            patientInfoContainer = (LinearLayout) itemView.findViewById((R.id.patientInfoContainer));
            llBloodPresureContainer = (LinearLayout) itemView.findViewById(R.id.llBloodPresureContainer);
        }
    }

    // Filter Class
    public void filter(String charText) {
        charText = charText.toLowerCase(Locale.getDefault());
        patientPersonalInfos.clear();
        if (charText.length() == 0) {
            patientPersonalInfos.addAll(patientPersonalInfosSearchSave);
        } else {
            for (PatientPersonalInfo personalInfo : patientPersonalInfosSearchSave) {
                if (personalInfo.getFirstName().toLowerCase(Locale.getDefault()).contains(charText)) {
                    if (!patientPersonalInfos.contains(personalInfo))
                        patientPersonalInfos.add(personalInfo);
                }
                if (personalInfo.getPatient_id().toLowerCase(Locale.getDefault()).contains(charText)) {
                    if (!patientPersonalInfos.contains(personalInfo))
                        patientPersonalInfos.add(personalInfo);
                }
                if (personalInfo.getLastName().toLowerCase(Locale.getDefault()).contains(charText)) {
                    if (!patientPersonalInfos.contains(personalInfo))
                        patientPersonalInfos.add(personalInfo);
                }
            }
        }
        notifyDataSetChanged();
    }

}
