package com.persistent.healthmon.fragments;

import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.support.annotation.Nullable;

import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;


import com.android.volley.VolleyError;
import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.EntryAdapter;

import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.interfaces.EducationData;
import com.persistent.healthmon.interfaces.Item;
import com.persistent.healthmon.interfaces.OnlineTrainingsTabChange;

import com.persistent.healthmon.model.Education;
import com.persistent.healthmon.model.EntryItem;

import com.persistent.healthmon.placeholder.WebViewPopupWindow;
import com.persistent.healthmon.util.Constants;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class ExternalTrainingsFragment extends BaseFragment implements AdapterView.OnItemClickListener, EducationData{
    OnlineTrainingsTabChange onlineTrainingsTabChange;
    ArrayList<Item> items = new ArrayList<Item>();
    ListView listview_main=null;
    EntryAdapter adapter1 = null;
    private LinkedHashMap<String, Cursor> cursorMap;
    WebView web;
    Education education;
    public ExternalTrainingsFragment(OnlineTrainingsTabChange onlineTrainingsTabChange) {
        this.onlineTrainingsTabChange = onlineTrainingsTabChange;
    }
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_internal_trns, null);
        web = new WebView(getActivity());
         education = new Education();

        listview_main=(ListView)view.findViewById(R.id.listView_main);
        WebserviceManager.getEducationContent(getActivity(), this);
        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                        getFragmentManager().popBackStack();
                        return true;
                    }

                }
                return false;
            }
        });
        return view;
    }

    @Override
    public void onItemClick(AdapterView arg0, View arg1, int position, long arg3) {

        web.loadUrl("http://nrhm.gov.in/communitisation/asha/resources/asha-training-modules.html");

    }

    @Override
    public void onData(String response) {
        try {
            Log.d("Response : ", response);

            JSONArray result = new JSONArray(response);
            for(int i=0;i<result.length();i++)
            {
                JSONObject contentObj = result.getJSONObject(i);
                String TrnInternal = contentObj.getString(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL);
                if(!TrnInternal.equals("" + 1))
                {
                    String Learning_Link = contentObj.getString(Constants.DbConstants.COLUMN_LEARNING_LINK);
                    education.setName(Learning_Link);

                    items.add(new EntryItem(Learning_Link));

                }

            }
            adapter1 = new EntryAdapter(getActivity(), items);
            listview_main.setAdapter(adapter1);
            listview_main.setOnItemClickListener(ExternalTrainingsFragment.this);

        }
        catch (Exception exc){

        }
    }

    @Override
    public void onError(VolleyError error) {

    }
}
