package com.persistent.healthmon.adapter;

import android.graphics.Color;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.Contacts;

import java.util.List;

/**
 * Created by manasveena_suguru on 11/18/2016.
 */

public class CollaborationListAdapter extends RecyclerView.Adapter <CollaborationListAdapter.MyViewHolder>
{

    private List<Contacts> contactList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView txtContactName, txtContactStatus, txtContactTaluka;

        public MyViewHolder(View view) {
            super(view);
            txtContactName = (TextView) view.findViewById(R.id.collaboration_contact_name);
            txtContactTaluka = (TextView) view.findViewById(R.id.collaboration_contact_taluka);
            txtContactStatus = (TextView) view.findViewById(R.id.collaboration_contact_status);
        }
    }

    public CollaborationListAdapter(List<Contacts> contactList) {
        this.contactList = contactList;
    }

    @Override
    public int getItemCount() {
        return contactList.size();
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.collaboration_list_row, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Contacts contact = contactList.get(position);
        holder.txtContactName.setText(contact.getContactName());
        holder.txtContactTaluka.setText(contact.getTaluka());
        holder.txtContactStatus.setText(contact.getStatus());

        if(contact.getStatus().equals("Online")){
            holder.txtContactStatus.setTextColor(Color.parseColor("#1dbd9d"));
        }else{
            holder.txtContactStatus.setTextColor(Color.parseColor("#898989"));
        }


    }

}
