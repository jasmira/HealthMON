package com.persistent.healthmon.placeholder;

import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.CursorLoaderManager;
import com.persistent.healthmon.adapter.CustomRecyclerCursorAdapter;
import com.persistent.healthmon.fragments.AllPatientFragment;
import com.persistent.healthmon.listners.RecyclerItemClickListener;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

/**
 * Created by pushkar_bhadle on 4/22/2016.
 */
public class UpcomingTaskPlaceHolder extends Fragment implements LoaderManager.LoaderCallbacks<Cursor>{
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    RecyclerView recyclerView;
    private static final String TAG = UpcomingTaskPlaceHolder.class.getCanonicalName();
    private static final String ARG_SECTION_NUMBER = "section_number";
    private static CustomRecyclerCursorAdapter mCustomRecyclerCursorAdapter;
    LinearLayout llDashboard,llDashboardActive, llAllPatient,llAllPatientActive;

    public UpcomingTaskPlaceHolder() {
    }

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static UpcomingTaskPlaceHolder newInstance(int sectionNumber) {
        UpcomingTaskPlaceHolder fragment = new UpcomingTaskPlaceHolder();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        HealthMonLog.i(TAG, "DueTaskPlaceHolder");
        return fragment;
    }



    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        final View rootView = inflater.inflate(R.layout.fragment_dashboard_task_tabs, container, false);
        // TextView textView = (TextView) rootView.findViewById(R.id.task_section_label);
        recyclerView = (RecyclerView) rootView.findViewById(R.id.recycler_view_dashboard_task);
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        recyclerView.setLayoutManager(layoutManager);

        getLoaderManager().initLoader(CursorLoaderManager.DASHBOARD_UPCOMING_TASKS, null, this);
        final SearchView searchView = (SearchView) rootView.findViewById(R.id.search_view_dashboard_task);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {



            @Override
            public boolean onQueryTextSubmit(String query) {
                // TODO Auto-generated method stub

                Toast.makeText(getContext(), query,
                        Toast.LENGTH_SHORT).show();

                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                // TODO Auto-generated method stub
                Bundle bundle = new Bundle();
                bundle.putString(Constants.KEY_BUNDLE_UPCOMING_TASK_SEARCH,newText);
                getLoaderManager().initLoader(CursorLoaderManager.DASHBOARD_UPCOMING_TASKS_SEARCH, bundle, UpcomingTaskPlaceHolder.this);
                getLoaderManager().restartLoader(CursorLoaderManager.DASHBOARD_UPCOMING_TASKS_SEARCH, bundle, UpcomingTaskPlaceHolder.this);
                return false;
            }

        });


        searchView.setOnCloseListener(new SearchView.OnCloseListener() {
            @Override
            public boolean onClose() {

                getLoaderManager().restartLoader(CursorLoaderManager.DASHBOARD_UPCOMING_TASKS, null, UpcomingTaskPlaceHolder.this);
                return false;
            }
        });

        searchView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchView.setIconified(false);
            }
        });



        //textView.setText(getString(R.string.section_format, getArguments().getInt(ARG_SECTION_NUMBER)));




/*        Cursor cursor = DatabaseHelper.getInstance(getActivity()).getUpcomingTasks();


        mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(cursor);
        recyclerView.setAdapter(mCustomRecyclerCursorAdapter);*/

        recyclerView.addOnItemTouchListener(new RecyclerItemClickListener(getActivity(), recyclerView, new RecyclerItemClickListener.OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position) {

                Cursor cursor = mCustomRecyclerCursorAdapter.getCursor();
                cursor.moveToPosition(position);
                llDashboard = (LinearLayout) getActivity().findViewById(R.id.llDashboard);
                llDashboardActive = (LinearLayout)  getActivity().findViewById(R.id.llDashboardactive);
                llAllPatient = (LinearLayout)  getActivity().findViewById(R.id.llAllPatient);
                llAllPatientActive = (LinearLayout)  getActivity().findViewById(R.id.llAllPatientactive);

                llDashboard.setVisibility(View.VISIBLE);
                llDashboardActive.setVisibility(View.GONE);
                llAllPatient.setVisibility(View.GONE);
                llAllPatientActive.setVisibility(View.VISIBLE);
                HealthMonUtility.replaceFragment(getContext(), new AllPatientFragment());
                //onPatientSelected.onPatientSelected(recyclerView.get(position));

            }

            @Override
            public void onItemLongClick(View view, int position) {

            }
        }));
        //setListViewListener(this, recyclerView,mCustomRecyclerCursorAdapter);
/*            new Handler().post(new Runnable() {
                @Override
                public void run() {
                    //customAdapter = new CustomCursorAdapter(MainActivity2.this, databaseHelper.getAllData());
                    //listView.setAdapter(customAdapter);

                }
            });*/


        return rootView;
    }




    @Override
    public Loader<Cursor> onCreateLoader(int id, Bundle args) {
        HealthMonLog.i(TAG, "onCreateLoader(): Cursor Id: " + id);
        CursorLoader cursorLoader = null;
        if(id == CursorLoaderManager.DASHBOARD_UPCOMING_TASKS) {
            Uri students = Uri.parse(Constants.URL);


            try {
                String[] projection = new String[]{Constants.DbConstants.COLUMN_TASK_ALERTS_ID,
                        Constants.DbConstants.COLUMN_USERTASK_ID, Constants.DbConstants.COLUMN_USERPROGRAM_ID,
                        Constants.DbConstants.COLUMN_USER_ID, Constants.DbConstants.COLUMN_TASK_NAME,
                        Constants.DbConstants.COLUMN_TASK_DESCRIPTION, Constants.DbConstants.COLUMN_TASK_TYPE,
                        Constants.DbConstants.COLUMN_TASK_SEVERITY, Constants.DbConstants.COLUMN_TASK_DATE,
                        Constants.DbConstants.COLUMN_TASK_ACTIONABLE, Constants.DbConstants.COLUMN_PATIENT_ID,
                        Constants.DbConstants.COLUMN_TASK_ID, Constants.DbConstants.COLUMN_PATIENT_NAME,
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE};

                //String selection = "( "+ Constants.DbConstants.COLUMN_TASK_DATE + " )";

                cursorLoader = new CursorLoader(getContext(), /*Telephony.Sms.CONTENT_URI*/students,
                        projection,
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " > " + DateUtil.gettodayinLong() + " AND "
                                + Constants.DbConstants.COLUMN_TASK_TYPE + " = ? AND "
                                + Constants.DbConstants.COLUMN_USER_ID + " = ?",
                        new String[]{Constants.DbConstants.SERVER_TASK_TYPE_TASK, PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext())},
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " DESC");
                HealthMonLog.i(TAG, "CursorLoader = " + cursorLoader.toString() + "User ID = "+String.valueOf(PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext())));
                return cursorLoader;

            } catch (Exception e) {
                HealthMonLog.e(TAG, "error in  onCreateLoader()");
                e.printStackTrace();
                return null;

            }
        }
        if(id == CursorLoaderManager.DASHBOARD_UPCOMING_TASKS_SEARCH) {
            Uri students = Uri.parse(Constants.URL);
            try {
                String[] projection = new String[]{Constants.DbConstants.COLUMN_TASK_ALERTS_ID,
                        Constants.DbConstants.COLUMN_USERTASK_ID, Constants.DbConstants.COLUMN_USERPROGRAM_ID,
                        Constants.DbConstants.COLUMN_USER_ID, Constants.DbConstants.COLUMN_TASK_NAME,
                        Constants.DbConstants.COLUMN_TASK_DESCRIPTION, Constants.DbConstants.COLUMN_TASK_TYPE,
                        Constants.DbConstants.COLUMN_TASK_SEVERITY, Constants.DbConstants.COLUMN_TASK_DATE,
                        Constants.DbConstants.COLUMN_TASK_ACTIONABLE, Constants.DbConstants.COLUMN_PATIENT_ID,
                        Constants.DbConstants.COLUMN_TASK_ID, Constants.DbConstants.COLUMN_PATIENT_NAME,
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE};

                //String selection = "( "+ Constants.DbConstants.COLUMN_TASK_DATE + " )";

                cursorLoader = new CursorLoader(getContext(), /*Telephony.Sms.CONTENT_URI*/students,
                        projection,
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " > " + DateUtil.gettodayinLong() +
                                " AND " + Constants.DbConstants.COLUMN_TASK_TYPE + " = ? AND (" +
                                Constants.DbConstants.COLUMN_PATIENT_NAME+" LIKE '%"+args.getString(Constants.KEY_BUNDLE_UPCOMING_TASK_SEARCH)+"%' "+
                                " OR "+
                                Constants.DbConstants.COLUMN_PATIENT_ID+" LIKE '%"+args.getString(Constants.KEY_BUNDLE_UPCOMING_TASK_SEARCH)+"%' )"+
                                " AND "+Constants.DbConstants.COLUMN_USER_ID + " = ?",
                        new String[]{Constants.DbConstants.SERVER_TASK_TYPE_TASK, PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext())},
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " DESC");
                HealthMonLog.i(TAG, "CursorLoader = " + cursorLoader.toString());
                HealthMonLog.i(TAG,"Search word = "+args.getString("Key"));
                return cursorLoader;


            } catch (Exception e) {
                HealthMonLog.e(TAG, "error in  onCreateLoader()");
                e.printStackTrace();
                return null;

            }
        }


        return cursorLoader;
    }

    @Override
    public void onLoadFinished(Loader<Cursor> loader, Cursor data) {
        if(loader.getId() == CursorLoaderManager.DASHBOARD_UPCOMING_TASKS){
            mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(data);
            //mCustomRecyclerCursorAdapter.swapCursor(data);
            recyclerView.setAdapter(mCustomRecyclerCursorAdapter);
        }
        if(loader.getId() == CursorLoaderManager.DASHBOARD_UPCOMING_TASKS_SEARCH){
            mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(data);
            //mCustomRecyclerCursorAdapter.swapCursor(data);
            recyclerView.setAdapter(mCustomRecyclerCursorAdapter);
        }
    }

    @Override
    public void onLoaderReset(Loader<Cursor> loader) {
          //  mCustomRecyclerCursorAdapter.swapCursor(null);
    }
}