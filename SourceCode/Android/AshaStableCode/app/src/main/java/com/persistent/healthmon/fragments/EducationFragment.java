package com.persistent.healthmon.fragments;

import android.content.Context;
import android.graphics.Paint;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.support.annotation.Nullable;

import android.support.v4.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import android.database.Cursor;

import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ListView;

import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.EntryAdapter;
import com.persistent.healthmon.adapter.GenericModelAdapter;

import com.persistent.healthmon.model.ANCModel;
import com.persistent.healthmon.model.CHModel;
import com.persistent.healthmon.model.Dataset;

import com.persistent.healthmon.model.EntryItem;
import com.persistent.healthmon.model.FPModel;
import com.persistent.healthmon.interfaces.GenericModel;
import com.persistent.healthmon.interfaces.Item;
import com.persistent.healthmon.model.PNCModel;
import com.persistent.healthmon.model.SectionItem;
import com.persistent.healthmon.placeholder.HelpGuidePopupWindow;
import com.persistent.healthmon.placeholder.PregnancyDietPopupWindow;
import com.persistent.healthmon.placeholder.PulseOxPopupWindow;
import com.persistent.healthmon.placeholder.ReferToDocPopupWindow;
import com.persistent.healthmon.util.Constants;


/**
 * Created by khyati_shah on 3/28/2016.
 */
public class EducationFragment extends BaseFragment implements AdapterView.OnItemClickListener {

    GenericModelAdapter adapter;
    ListView listView;
    private static final int NUMBER_OF_COLS = 4;
    List<Map<String, List<Object>>> item = new ArrayList<Map<String, List<Object>>>();
    Map<String, String> sectionHeaderTitles = new HashMap<String, String>();    ArrayList<Item> items = new ArrayList<Item>();
    ListView listview_main=null;
    private Dataset dataSet;
    EntryAdapter adapter1 = null;
    private LinkedHashMap<String, Cursor> cursorMap;
    private MediaPlayer mp;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_education, container, false);
        getActivity().setVolumeControlStream(AudioManager.STREAM_MUSIC);

        dataSet = new Dataset();

        String sectionOne = getResources().getString(R.string.ANC);
        String sectionTwo = getResources().getString(R.string.PNC);
        String sectionThree = getResources().getString(R.string.FP);
        String sectionFour = getResources().getString(R.string.CH);


        dataSet.addSection(sectionOne, 3);
        dataSet.addSection(sectionTwo, 3);
        dataSet.addSection(sectionThree, 3);
        dataSet.addSection(sectionFour, 3);


        cursorMap = dataSet.getSectionCursorMap();

        listView = (ListView) view.findViewById(R.id.listview);
        listview_main=(ListView)view.findViewById(R.id.listView_main);


        items.add(new SectionItem(getResources().getString(R.string.ANC)));
        items.add(new EntryItem(getResources().getString(R.string.QUC)));
        items.add(new EntryItem(getResources().getString(R.string.ACI)));

        items.add(new SectionItem(getResources().getString(R.string.PNC)));
        items.add(new EntryItem(getResources().getString(R.string.PNA)));
        items.add(new EntryItem(getResources().getString(R.string.AB)));

        items.add(new SectionItem(getResources().getString(R.string.FP)));
        items.add(new EntryItem(getResources().getString(R.string.ITF)));
        items.add(new EntryItem(getResources().getString(R.string.SS)));
        items.add(new EntryItem(getResources().getString(R.string.Vasecotomy)));

        items.add(new SectionItem(getResources().getString(R.string.CH)));
        items.add(new EntryItem(getResources().getString(R.string.CO)));
        items.add(new EntryItem(getResources().getString(R.string.Dirhea)));


        adapter1 = new EntryAdapter(getActivity(), items);
        listview_main.setAdapter(adapter1);
        listview_main.setOnItemClickListener(EducationFragment.this);
        TextView textView =(TextView)view.findViewById(R.id.txtOnlineTrn);
        textView.setPaintFlags(textView.getPaintFlags() | Paint.UNDERLINE_TEXT_FLAG);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final OnlineTrainingsFragment fragment = new OnlineTrainingsFragment();
                final FragmentTransaction transaction = getFragmentManager().beginTransaction();
                transaction.replace(R.id.educationContainer, fragment);
                transaction.addToBackStack(Constants.ONLINE_TRAINING_FRAGMENT);
                transaction.commit();
                //HealthMonUtility.replaceFragment(getActivity(), new OnlineTrainingsFragment());
            }
        });

        initItems();
        adapter = new GenericModelAdapter(getActivity(),R.layout.list_item1, item, sectionHeaderTitles, NUMBER_OF_COLS, mItemClickListener);
        listView.setAdapter(adapter);

        return view;
    }

    View.OnClickListener mItemClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int position = (Integer)v.getTag(R.id.row);
            int col = (Integer)v.getTag(R.id.col);

            Map<String, List<Object>> map = adapter.getItem(position);
            String selectedItemType = adapter.getItemTypeAtPosition(position);
            List<Object> list = map.get(selectedItemType);
            GenericModel model = (GenericModel)list.get(col);
              if((position ==1)&&(col==0)){
                displayVideo();
            }
            else if((position ==1)&&(col==1)){
                  final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
                  popupWindow.show(getView(), 0, 0);
                  View container = (View) popupWindow.getContentView().getParent();
                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                  p.dimAmount = 0.4f;
                  wm.updateViewLayout(container, p);

              }
              else if((position ==1)&&(col==2)){
                  if (mp != null) {
                      mp.release();
                  }
                  // Create a new MediaPlayer to play this sound
                  mp = MediaPlayer.create(getActivity(), R.raw.a);
                  mp.start();
              }
            else if((position ==3)&&(col==0)){
                displayVideo();
            }
              else if((position ==3)&&(col==1)){
                  displayVideo();
              }
            else if((position ==3)&&(col==2)){
                  final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
                  popupWindow.show(getView(), 0, 0);
                  View container = (View) popupWindow.getContentView().getParent();
                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                  p.dimAmount = 0.4f;
                  wm.updateViewLayout(container, p);

              }
              else if((position ==5)&&(col==0)){
                  displayVideo();
              }
              else if((position ==5)&&(col==1)){
                  displayVideo();
              }
              else if((position ==5)&&(col==2)){
                  final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
                  popupWindow.show(getView(), 0, 0);
                  View container = (View) popupWindow.getContentView().getParent();
                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                  p.dimAmount = 0.4f;
                  wm.updateViewLayout(container, p);

              }
              else if((position ==7)&&(col==0)){
                  displayVideo();
              }
              else if((position ==7)&&(col==1)){

                  final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
                  popupWindow.show(getView(), 0, 0);
                  View container = (View) popupWindow.getContentView().getParent();
                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                  p.dimAmount = 0.4f;
                  wm.updateViewLayout(container, p);
              }
              else if((position ==7)&&(col==2)){
                  if (mp != null) {
                      mp.release();
                  }
                  // Create a new MediaPlayer to play this sound
                  mp = MediaPlayer.create(getActivity(), R.raw.b);
                  mp.start();
              }

        }
    };

    private void displayVideo(){
        final VideoFragment fragment = new VideoFragment();
        final FragmentTransaction transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.educationContainer, fragment);
        transaction.addToBackStack(Constants.VIDEO_FRAGMENT);
        transaction.commit();
    }

    private void playAudio(){
        if (mp != null) {
            mp.release();
        }
        // Create a new MediaPlayer to play this sound
        mp = MediaPlayer.create(getActivity(), R.raw.b);
        mp.start();
    }

    private void displayPDF(){
        final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
        popupWindow.show(getView(), 0, 0);
        View container = (View) popupWindow.getContentView().getParent();
        WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.4f;
        wm.updateViewLayout(container, p);

    }


    private void initItems(){
        List<String> itemTypesList = new ArrayList<String>();
        itemTypesList.add(getResources().getString(R.string.ANC));
        itemTypesList.add(getResources().getString(R.string.PNC));
        itemTypesList.add(getResources().getString(R.string.FP));
        itemTypesList.add(getResources().getString(R.string.CH));

        sectionHeaderTitles.put(getResources().getString(R.string.ANC), getResources().getString(R.string.ANC));
        sectionHeaderTitles.put(getResources().getString(R.string.PNC),getResources().getString(R.string.PNC));
        sectionHeaderTitles.put(getResources().getString(R.string.FP), getResources().getString(R.string.FP));
        sectionHeaderTitles.put(getResources().getString(R.string.CH), getResources().getString(R.string.CH));

        for (String itemType : itemTypesList){
            Map<String, List<Object>> map = new HashMap<String, List<Object>>();
            List<Object> list = new ArrayList<Object>();

            for (int i = 1 ; i < 4 ; i++){
                String itemName = itemType + " " + i;
                String subTitle = "title " + i;
                int image;

                Object object = null;

                if (itemType == getResources().getString(R.string.ANC)){
                    image = Constants.ancImages[i-1];
                    object = new ANCModel(itemName, subTitle, image);
                }
                else if(itemType == getResources().getString(R.string.PNC)){
                    image = Constants.pncImages[i-1];

                    object = new PNCModel(itemName, subTitle, image);
                }
                else if (itemType == getResources().getString(R.string.FP)){
                    image = Constants.fpImages[i-1];
                    object = new FPModel(itemName, subTitle, image);
                }
                else if (itemType == getResources().getString(R.string.CH)){
                    image = Constants.chImages[i-1];
                    object = new CHModel(itemName, subTitle, image);
                }

                list.add(object);
            }

            map.put(itemType, list);
            item.add(map);
        }
    }


    @Override
    public void onItemClick(AdapterView arg0, View arg1, int position, long arg3) {

        if(position==1){
            final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==2){
            final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==3){
            final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==4){
            final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==5){
            final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==6){
            final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==7){
            final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==8){
            final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
        if(position==9){
            final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);
        }
    }

    @Override
    public void onDestroy() {
        if(null!=mp){
            mp.release();
        }
        super.onDestroy();
    }
}
