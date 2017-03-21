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
import android.widget.AdapterView;
import android.widget.ListView;

import com.android.volley.VolleyError;
import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.EntryAdapter;
import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.interfaces.EducationData;
import com.persistent.healthmon.interfaces.OnlineTrainingsTabChange;
import com.persistent.healthmon.model.EntryItem;
import com.persistent.healthmon.interfaces.Item;
import com.persistent.healthmon.model.SectionItem;

import com.persistent.healthmon.placeholder.ReferToDocPopupWindow;
import com.persistent.healthmon.placeholder.WebViewPopupWindow;
import com.persistent.healthmon.util.Constants;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;

import java.util.LinkedHashMap;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class InternalTrainingsFragment extends BaseFragment implements AdapterView.OnItemClickListener, EducationData {
    OnlineTrainingsTabChange onlineTrainingsTabChange;
    ArrayList<Item> items = new ArrayList<Item>();
    ListView listview_main=null;
    EntryAdapter adapter1 = null;
    private LinkedHashMap<String, Cursor> cursorMap;

    public InternalTrainingsFragment(OnlineTrainingsTabChange onlineTrainingsTabChange) {
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

        listview_main=(ListView)view.findViewById(R.id.listView_main);
        WebserviceManager.getEducationContent(getActivity(),this);

        view.setFocusableInTouchMode(true);
        view.requestFocus();

        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN) {
                    if (keyCode == KeyEvent.KEYCODE_BACK) {
                       // HealthMonUtility.replaceFragment(getActivity(), new EducationFragment(), R.id.onlineTrainingsContainer);
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
        final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
        popupWindow.show(arg1, 0, 0);
        //layout_MainMenu.getForeground().setAlpha(150);
        View container = (View) popupWindow.getContentView().getParent();
        WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
        //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.4f;
        wm.updateViewLayout(container, p);
   /*     EntryItem item = (EntryItem)items.get(position);
        final WebViewPopupWindow popupWindow = new WebViewPopupWindow(getActivity());
        popupWindow.show(arg1, 0, 0);
        View container = (View) popupWindow.getContentView().getParent();
        WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.4f;
        wm.updateViewLayout(container, p);*/
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
                if(TrnInternal.equals("" + 1))
                {
                    String Progr_Desc = contentObj.getString(Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION);
                    String Learning_Desc = contentObj.getString(Constants.DbConstants.COLUMN_PROGRAM_DESC);
                    String Learning_Url = contentObj.getString(Constants.DbConstants.COLUMN_LEARNING_LINK);
                    Constants.webUrl = Learning_Url;

                    items.add(new SectionItem(Progr_Desc));
                    items.add(new EntryItem(Learning_Desc));

                }

            }

            adapter1 = new EntryAdapter(getActivity(), items);
            listview_main.setAdapter(adapter1);
            listview_main.setOnItemClickListener(InternalTrainingsFragment.this);
        }
        catch (Exception exc){
            Log.d("Exc ", exc.getMessage() );
        }
    }

    @Override
    public void onError(VolleyError error) {
        Log.d("Exc ", error.getMessage() );


    }
}
