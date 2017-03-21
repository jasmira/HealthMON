package com.persistent.healthmon.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.CustomRecyclerCursorAdapter;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.placeholder.DueTaskPlaceHolder;
import com.persistent.healthmon.placeholder.UpcomingTaskPlaceHolder;
import com.persistent.healthmon.util.Constants;

/**
 * Created by pushkar_bhadle on 3/23/2016.
 */
public class DashboardTasksFragment extends BaseFragment {
    private static String TAG = DashboardTasksFragment.class.getCanonicalName();

    private SectionsPagerAdapter mSectionsPagerAdapter;
    private ViewPager mViewPager;
    private static CustomRecyclerCursorAdapter mCustomRecyclerCursorAdapter;
    private static CustomRecyclerCursorAdapter mDueTaskRecyclerCursorAdapter;
    private static DatabaseHelper databaseHelper;
    static LinearLayout llDashboard,llDashboardActive, llAllPatient,llAllPatientActive;




    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dashboard_tasks, null);
        // return super.onCreateView(inflater, container, savedInstanceState);
        mSectionsPagerAdapter = new SectionsPagerAdapter(getFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = (ViewPager) view.findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        TabLayout tabLayout = (TabLayout) view.findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(mViewPager);
        return view;
    }

    @Override
    public void startActivityForResult(Intent intent, int requestCode) {
        super.startActivityForResult(intent, requestCode);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
    }


    public static void setListViewListener(final Fragment fragmentCtx, final RecyclerView recyclerView, final CustomRecyclerCursorAdapter adapter){

    }

    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        DueTaskPlaceHolder dueTasks;
        UpcomingTaskPlaceHolder upcomingTasks;

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
            Bundle dueTasksBunde = new Bundle();
            dueTasksBunde.putInt(Constants.KEY_FRAGMENT_TYPE,Constants.CATEGORY_DUETASK);
            dueTasks = new DueTaskPlaceHolder();
            dueTasks.setArguments(dueTasksBunde);

            Bundle upcomingBunde = new Bundle();
            dueTasksBunde.putInt(Constants.KEY_FRAGMENT_TYPE,Constants.CATEGORY_UPCOMINGTASK);
            upcomingTasks = new UpcomingTaskPlaceHolder();

            upcomingTasks.setArguments(upcomingBunde);
        }

        @Override
        public Fragment getItem(int position) {

            if(position == 0) // if the position is 0 we are returning the First tab
            {
                return dueTasks;
            }else {
                return upcomingTasks;
            }
        }

        @Override
        public int getCount() {
            // Show 2 total pages.
            return 2;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            switch (position) {
                case 0:
                    return getString(R.string.txtduetasks);
                case 1:
                    return getString(R.string.txtupcomingtasks);
            }
            return null;
        }

        public void refereshList(int category){
            if(category == Constants.CATEGORY_DUETASK){

            }else {

            }

        }

    }
}
