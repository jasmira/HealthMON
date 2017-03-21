package com.persistent.healthmon.placeholder;

import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
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
import com.persistent.healthmon.fragments.IndividualPatientTaskFragment;
import com.persistent.healthmon.interfaces.OnPatientSelected;
import com.persistent.healthmon.listners.RecyclerItemClickListener;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.DateUtil;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.HealthMonUtility;
import com.persistent.healthmon.util.PreferanceManager;

import java.text.SimpleDateFormat;

/**
 * Created by pushkar_bhadle on 4/22/2016.
 */
public class DueTaskPlaceHolder extends Fragment implements LoaderManager.LoaderCallbacks<Cursor>
{
    OnPatientSelected onPatientSelected;
    RecyclerView recyclerView;
    LinearLayout llDashboard,llDashboardActive, llAllPatient,llAllPatientActive;
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";
    private static final String TAG = DueTaskPlaceHolder.class.getCanonicalName();
    private static CustomRecyclerCursorAdapter mCustomRecyclerCursorAdapter;

    public DueTaskPlaceHolder() {
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static DueTaskPlaceHolder newInstance(int sectionNumber) {
        DueTaskPlaceHolder fragment = new DueTaskPlaceHolder();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        HealthMonLog.i(TAG,"DueTaskPlaceHolder");
        return fragment;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, final ViewGroup container,
                             Bundle savedInstanceState) {
        final View rootView = inflater.inflate(R.layout.fragment_dashboard_task_tabs, container, false);
        // TextView textView = (TextView) rootView.findViewById(R.id.task_section_label);
        recyclerView = (RecyclerView) rootView.findViewById(R.id.recycler_view_dashboard_task);
        final LinearLayoutManager layoutManager = new LinearLayoutManager(getActivity());
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        recyclerView.setLayoutManager(layoutManager);

        getLoaderManager().initLoader(CursorLoaderManager.DASHBOARD_DUE_TASKS, null, this);

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
                bundle.putString(Constants.KEY_BUNDLE_DUE_TASK_SEARCH,newText);
                getLoaderManager().initLoader(CursorLoaderManager.DASHBOARD_DUE_TASKS_SEARCH, bundle, DueTaskPlaceHolder.this);
                getLoaderManager().restartLoader(CursorLoaderManager.DASHBOARD_DUE_TASKS_SEARCH, bundle, DueTaskPlaceHolder.this);
                return false;
            }
        });

        searchView.setOnCloseListener(new SearchView.OnCloseListener() {
            @Override
            public boolean onClose() {
                getLoaderManager().restartLoader(CursorLoaderManager.DASHBOARD_DUE_TASKS, null, DueTaskPlaceHolder.this);
                return false;
            }
        });

        searchView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchView.setIconified(false);
            }
        });

/*        recyclerView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "Task Clicked",
                        Toast.LENGTH_SHORT).show();
            }
        });*/

        //textView.setText(getString(R.string.section_format, getArguments().getInt(ARG_SECTION_NUMBER)));


        //CursorLoader cursor1 = DatabaseHelper.getInstance(getActivity()).getUpcomingTasksCursror();
/*            Cursor cursor = DatabaseHelper.getInstance(getActivity()).getDueTasks();
            mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(cursor);
            recyclerView.setAdapter(mCustomRecyclerCursorAdapter);*/
        // recyclerView.setOnClickListener(this);
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
                    //TODO: Requier Patient ID same in upcoming
                    //onPatientSelected();

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
        if(id == CursorLoaderManager.DASHBOARD_DUE_TASKS) {
            Uri students = Uri.parse(Constants.URL);


            try {


                String[] projection = new String[]{Constants.DbConstants.COLUMN_TASK_ALERTS_ID,
                        Constants.DbConstants.COLUMN_USERTASK_ID, Constants.DbConstants.COLUMN_USERPROGRAM_ID,
                        Constants.DbConstants.COLUMN_USER_ID, Constants.DbConstants.COLUMN_TASK_NAME,
                        Constants.DbConstants.COLUMN_TASK_DESCRIPTION, Constants.DbConstants.COLUMN_TASK_TYPE,
                        Constants.DbConstants.COLUMN_TASK_SEVERITY, Constants.DbConstants.COLUMN_TASK_DATE,
                        Constants.DbConstants.COLUMN_TASK_ACTIONABLE, Constants.DbConstants.COLUMN_PATIENT_ID,
                        Constants.DbConstants.COLUMN_TASK_ID, Constants.DbConstants.COLUMN_PATIENT_NAME};

                cursorLoader = new CursorLoader(getContext(), /*Telephony.Sms.CONTENT_URI*/students,
                        projection,
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " <= " + DateUtil.gettodayinLong() + " AND "
                                + Constants.DbConstants.COLUMN_TASK_TYPE + " = ? AND "+
                                Constants.DbConstants.COLUMN_USER_ID + " = ? ",
                               //+ ") GROUP BY ("+Constants.DbConstants.COLUMN_PATIENT_ID,
                        new String[]{Constants.DbConstants.SERVER_TASK_TYPE_TASK, PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext())},
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " DESC");
                HealthMonLog.i(TAG, "CursorLoader = " + cursorLoader.toString() + "User ID = "+PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext()));
                return cursorLoader;

            } catch (Exception e) {
                HealthMonLog.e(TAG, "error in  onCreateLoader()");
                e.printStackTrace();
                return null;

            }
        }
        if(id == CursorLoaderManager.DASHBOARD_DUE_TASKS_SEARCH) {
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
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " <= " + DateUtil.gettodayinLong() +
                                " AND " + Constants.DbConstants.COLUMN_TASK_TYPE + " = ? AND (" +
                                Constants.DbConstants.COLUMN_PATIENT_NAME+" LIKE '%"+args.getString(Constants.KEY_BUNDLE_DUE_TASK_SEARCH)+"%' "+
                                " OR "+
                                Constants.DbConstants.COLUMN_PATIENT_ID+" LIKE '%"+args.getString(Constants.KEY_BUNDLE_DUE_TASK_SEARCH)+"%' ) " +
                                " AND "+Constants.DbConstants.COLUMN_USER_ID + " = ?",
                        new String[]{Constants.DbConstants.SERVER_TASK_TYPE_TASK, PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID,"",getContext())},
                        Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " DESC");
                HealthMonLog.i(TAG, "CursorLoader = " + cursorLoader.toString());
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
        HealthMonLog.i(TAG, "onLoadFinished(): Cursor=" + CursorLoaderManager.CURSOR_NAME[loader.getId()]+" cursor size:"+data.getCount());

        if(loader.getId() ==CursorLoaderManager.DASHBOARD_DUE_TASKS){
                mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(data);
                recyclerView.setAdapter(mCustomRecyclerCursorAdapter);
        }
        if(loader.getId() == CursorLoaderManager.DASHBOARD_DUE_TASKS_SEARCH){
            mCustomRecyclerCursorAdapter = new CustomRecyclerCursorAdapter(data);
            //mCustomRecyclerCursorAdapter.swapCursor(data);
            recyclerView.setAdapter(mCustomRecyclerCursorAdapter);
        }
    }

    @Override
    public void onLoaderReset(Loader<Cursor> loader) {
        HealthMonLog.i(TAG, "onLoaderReset()");
    }

    //Insert proper patient ID
/*    @Override
    public void onPatientSelected(PatientPersonalInfo patientPersonalInfo) {
        IndividualPatientTaskFragment individualPatientTaskFragment = new IndividualPatientTaskFragment();
        Bundle args = new Bundle();
        args.putString(Constants.SELECTED_PATIENT_ID, "Pallavi18");
        individualPatientTaskFragment.setArguments(args);
        //HealthMonUtility.addFragment(getActivity(), individualPatientTaskFragment);
        HealthMonUtility.replaceFragment(getActivity(), individualPatientTaskFragment);

    }*/


}

