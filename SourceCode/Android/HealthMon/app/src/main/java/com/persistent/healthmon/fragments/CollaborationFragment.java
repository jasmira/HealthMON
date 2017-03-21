package com.persistent.healthmon.fragments;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.TabLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.support.v4.view.ViewPager;


import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.CollaborationAdapter;
import com.persistent.healthmon.adapter.CollaborationListAdapter;
import com.persistent.healthmon.model.Contacts;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by pushkar_bhadle on 4/14/2016.
 */
public class CollaborationFragment extends BaseFragment implements TabLayout.OnTabSelectedListener{

    private TabLayout tabLayout;
    private ViewPager listViewPager;
    private CollaborationAdapter collaborationAdapter;

    private List<Contacts> contactsList = new ArrayList<Contacts>();
    private CollaborationListAdapter collaborationListAdapter;
    private RecyclerView recyclerView;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_collaboration, container, false);
        collaborationAdapter = new CollaborationAdapter(getChildFragmentManager(),this.getContext());
        listViewPager = (ViewPager) view.findViewById(R.id.list_container);

        listViewPager.setAdapter(collaborationAdapter);

        //Initializing the tablayout
        tabLayout = (TabLayout) view.findViewById(R.id.collaboration_tabs);
        tabLayout.setupWithViewPager(listViewPager);

//        tabLayout.setTabTextColors(getResources().getColorStateList(R.drawable.tab_text_color,null));
        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);

        return view;
    }

    @Override
    public void onTabSelected(TabLayout.Tab tab) {

    }

    @Override
    public void onTabUnselected(TabLayout.Tab tab) {

    }

    @Override
    public void onTabReselected(TabLayout.Tab tab) {

    }

}