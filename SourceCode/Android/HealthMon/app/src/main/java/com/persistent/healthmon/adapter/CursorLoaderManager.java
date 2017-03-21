package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v4.content.CursorLoader;

import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

/**
 * Created by pushkar_bhadle on 4/7/2016.
 */
public class CursorLoaderManager {
    private static final String TAG = CursorLoaderManager.class.getSimpleName();
    private static CursorLoaderManager mInstance;
    //Cursor Loader ids
    public final static int DASHBOARD_DUE_TASKS = 1;
    public final static int DASHBOARD_UPCOMING_TASKS = 2;
    public final static int DASHBOARD_DUE_TASKS_SEARCH = 3;
    public final static int DASHBOARD_UPCOMING_TASKS_SEARCH = 4;
    public final static int DASHBOARD_TASKS_SEARCH = 5;

    public final static String[] CURSOR_NAME = new String[]{
            "NO CURSOR","DASHBOARD_DUE_TASKS", "DASHBOARD_UPCOMING_TASKS",
            "DASHBOARD_DUE_TASKS_SEARCH","DASHBOARD_UPCOMING_TASKS_SEARCH",
            "DASHBOARD_TASKS_SEARCH"
    };

    private CursorLoaderManager() {}

    public static CursorLoaderManager getInstance() {
        return (mInstance == null) ? mInstance = new CursorLoaderManager()
                : mInstance;
    }

    public CursorLoader getCursorLoader(Context context, int code,String id) {

        String SELECTION;
        String[] projection;

        HealthMonLog.i(TAG, "getCursorLoader(): code=" + code);

        CursorLoader cursorLoader = null;

        switch (code) {
/*            case DASHBOARD_DUE_TASKS:


                //String[] projection = new String[]{"address", "body", "thread_id", "date", "type","read","rowid as _id"};
                projection = new String[]{ "patient_id",  "selected_program" , "name", "contact" };

                cursorLoader = new CursorLoader( context, *//*Telephony.Sms.CONTENT_URI*//*Constants.DASHBOARD_TASK_CONTENT_URI,
                        projection, null, null,"patient_id"+" DESC");

                break;

            case DASHBOARD_TASKS_SEARCH:


                HealthMonLog.i(TAG, "getCursorLoader(): code="+code+", Id="+id);
                //projection = new String[]{"address", "body", "thread_id", "date", "type","read","rowid as _id"};
                projection = new String[]{ "patient_id",  "selected_program" , "name", "contact" };


                String selection=null;

                cursorLoader = new CursorLoader( context, *//*Telephony.Sms.CONTENT_URI*//*Constants.DASHBOARD_TASK_CONTENT_URI,
                        projection, null, null,"patient_id"+" ASC");
                break;

            case DASHBOARD_UPCOMING_TASKS:


                //String[] projection = new String[]{"address", "body", "thread_id", "date", "type","read","rowid as _id"};
                projection = new String[]{ "patient_id",  "selected_program" , "name", "contact" };

                cursorLoader = new CursorLoader( context, *//*Telephony.Sms.CONTENT_URI*//*Constants.DASHBOARD_TASK_CONTENT_URI,
                        projection, null, null,"patient_id"+" DESC");

                break;*/

        }

        return cursorLoader;
    }

}
