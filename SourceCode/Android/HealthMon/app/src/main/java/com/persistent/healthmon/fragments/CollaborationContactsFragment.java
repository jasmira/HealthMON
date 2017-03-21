package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.CollaborationListAdapter;
import com.persistent.healthmon.model.Contacts;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by manasveena_suguru on 11/21/2016.
 */

public class CollaborationContactsFragment extends Fragment{

    private List<Contacts> contactsList = new ArrayList<Contacts>();
    private CollaborationListAdapter collaborationListAdapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.collaboration_contacts_fragment, container, false);

        RecyclerView recyclerView = (RecyclerView) rootView.findViewById(R.id.collaboration_contacts_recyclerview);
        processContactList();

        collaborationListAdapter = new CollaborationListAdapter(contactsList);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(rootView.getContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.setAdapter(collaborationListAdapter);

        return rootView;
    }

    public CollaborationContactsFragment() {
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }


    public void processContactList(){

        Contacts contact = new Contacts("Rutuja Kulkarni ANM","Offline","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Dr. Radhika Apte MO","Online","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Ambulance Driver Kiran","Offline","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Dr. Mahesh Jadhav MO","Online","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Rutuja Kulkarni ANM","Online","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Dr. Radhika Apte MO","Offline","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Ambulance Driver Kiran","Offline","Taluka 1");
        contactsList.add(contact);

        contact = new Contacts("Dr. Mahesh Jadhav MO","Offline","Taluka 1");
        contactsList.add(contact);


        contact = new Contacts("Rutuja Kulkarni ANM","Offline","Taluka 1");
        contactsList.add(contact);
    }

}
