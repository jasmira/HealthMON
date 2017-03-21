package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.fragments.CollaborationChatsFragment;
import com.persistent.healthmon.fragments.CollaborationContactsFragment;
import com.persistent.healthmon.fragments.CollaborationFragment;

import java.util.zip.Inflater;

/**
 * Created by manasveena_suguru on 11/17/2016.
 */

public class CollaborationAdapter extends FragmentPagerAdapter {

    String tabTitles[] = new String[]{"CHATS" , "ALL CONTACTS" };
    Context context;

    public CollaborationAdapter(FragmentManager fm, Context context) {
        super(fm);
        this.context = context;
        // TODO Auto-generated constructor stub
    }

    @Override
    public Fragment getItem(int position) {

        switch (position) {
            case 0:
                //Fragement for CHATS Tab
                return new CollaborationChatsFragment();

            case 1:
                //Fragment for ALL CONTACTS Tab
                return new CollaborationContactsFragment();

        }

        return null;
    }

    @Override
    public int getCount() {
        return  tabTitles.length;
    }


    public View getTabView(int position, View tab) {
        TextView tv = (TextView) tab.findViewById(R.id.custom_text);
        tv.setText(tabTitles[position]);
        return tab;
    }

    @Override
    public CharSequence getPageTitle(int position) {
        // Generate title based on item position
        return tabTitles[position];
    }
}
