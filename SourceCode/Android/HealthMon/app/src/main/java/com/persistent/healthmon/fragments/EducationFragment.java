package com.persistent.healthmon.fragments;

import android.app.FragmentManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.graphics.Paint;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.adapter.EntryAdapter;
import com.persistent.healthmon.adapter.GenericModelAdapter;
import com.persistent.healthmon.interfaces.GenericModel;
import com.persistent.healthmon.interfaces.Item;
import com.persistent.healthmon.model.ANCModel;
import com.persistent.healthmon.model.CHModel;
import com.persistent.healthmon.model.Dataset;
import com.persistent.healthmon.model.EntryItem;
import com.persistent.healthmon.model.FPModel;
import com.persistent.healthmon.model.PNCModel;
import com.persistent.healthmon.model.SectionItem;
import com.persistent.healthmon.placeholder.AudioPopUpActivity;
import com.persistent.healthmon.placeholder.HelpGuidePopupWindow;
import com.persistent.healthmon.placeholder.PDFViewerPopupActivity;
import com.persistent.healthmon.placeholder.PregnancyDietPopupWindow;
import com.persistent.healthmon.placeholder.ReferToDocPopupWindow;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.viewcontroller.HealthMonMainActivity;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by khyati_shah on 3/28/2016.
 */
public class EducationFragment extends BaseFragment implements AdapterView.OnItemClickListener {

    GenericModelAdapter adapter;
    ListView listView;
    private static final int NUMBER_OF_COLS = 4;
    List<Map<String, List<Object>>> item = new ArrayList<Map<String, List<Object>>>();
    Map<String, String> sectionHeaderTitles = new HashMap<String, String>();
    ArrayList<Item> items = new ArrayList<Item>();
    ListView listview_main = null;
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
        listview_main = (ListView) view.findViewById(R.id.listView_main);


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
        TextView textView = (TextView) view.findViewById(R.id.txtOnlineTrn);
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
        adapter = new GenericModelAdapter(getActivity(), R.layout.list_item1, item, sectionHeaderTitles, NUMBER_OF_COLS, mItemClickListener);
        listView.setAdapter(adapter);

        return view;
    }

    View.OnClickListener mItemClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            int position = (Integer) v.getTag(R.id.row);
            int col = (Integer) v.getTag(R.id.col);

            Map<String, List<Object>> map = adapter.getItem(position);
            String selectedItemType = adapter.getItemTypeAtPosition(position);
            List<Object> list = map.get(selectedItemType);
            GenericModel model = (GenericModel) list.get(col);
            if ((position == 1) && (col == 0)) {
                displayVideo(R.raw.antenatalcare);
                HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
            } else if ((position == 1) && (col == 1)) {
                 /* HealthMonLog.d("EducationFragment","position "+position+"col"+col);
                  Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
                  intent.putExtra("fileName", "antenatalcare.pdf");
                  getActivity().startActivity(intent);*/
//                  CopyReadAssets("antenatalcare11.pdf");
//                  final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
//                  final AnteNatalCarePopupWnidow popupWindow = new AnteNatalCarePopupWnidow(getActivity(), "antenatalcare11.pdf");
//                  popupWindow.show(getView(), 0, 0);
//                  View container = (View) popupWindow.getContentView().getParent();
//                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
//                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
//                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
//                  p.dimAmount = 0.4f;
//                  wm.updateViewLayout(container, p);
                displayPDF("antenatalcare.pdf");

            } else if ((position == 1) && (col == 2)) {
               /* HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                try {
                    Intent intent = new Intent(getActivity(), AudioPopUpActivity.class);
                    intent.putExtra("audioFileName", R.raw.antenatalcareaudio);
                    getActivity().startActivity(intent);

                } catch (Exception e) {
                    e.printStackTrace();
                }*/
                disPlayAudio(R.raw.antenatalcareaudio,"antinatalcare");
            } else if ((position == 3) && (col == 0)) {
                HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                displayVideo(R.raw.antenatalcare);
            } else if ((position == 3) && (col == 1)) {
//                  displayVideo(R.raw.prenatalandpostnatalcare);
                /*HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                try {
                    Intent intent = new Intent(getActivity(), AudioPopUpActivity.class);
                    intent.putExtra("audioFileName", R.raw.postnatal);
                    getActivity().startActivity(intent);

                } catch (Exception e) {
                    e.printStackTrace();*/
                disPlayAudio(R.raw.postnatal,"postnatal");
            } else if ((position == 3) && (col == 2)) {
                 /* HealthMonLog.d("EducationFragment","position "+position+"col"+col);
                  Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
                  intent.putExtra("fileName", "whomcapnc2014briefera4.pdf");
                  getActivity().startActivity(intent);*/
                displayPDF("whomcapnc2014briefera4.pdf");

//                  final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(getActivity());
//                  popupWindow.show(getView(), 0, 0);
//                  View container = (View) popupWindow.getContentView().getParent();
//                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
//                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
//                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
//                  p.dimAmount = 0.4f;
//                  wm.updateViewLayout(container, p);

            } else if ((position == 5) && (col == 0)) {
                HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                displayVideo(R.raw.familyplanningmunna);
            } else if ((position == 5) && (col == 1)) {
               /* HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                try {
                    Intent intent = new Intent(getActivity(), AudioPopUpActivity.class);
                    intent.putExtra("audioFileName", R.raw.familyplanning);
                    getActivity().startActivity(intent);

                } catch (Exception e) {
                    e.printStackTrace();
                }*/
                disPlayAudio(R.raw.familyplanning,"familyPlanning");
            } else if ((position == 5) && (col == 2)) {
                 /* HealthMonLog.d("EducationFragment","position "+position+"col"+col);
                  Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
                  intent.putExtra("fileName", "familyplanning.pdf");
                  getActivity().startActivity(intent);*/
//                  final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
//                  popupWindow.show(getView(), 0, 0);
//                  View container = (View) popupWindow.getContentView().getParent();
//                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
//                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
//                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
//                  p.dimAmount = 0.4f;
//                  wm.updateViewLayout(container, p);
                displayPDF("familyplanning.pdf");
            } else if ((position == 7) && (col == 0)) {
                HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                displayVideo(R.raw.childcarehindi);
            } else if ((position == 7) && (col == 1)) {
               // HealthMonLog.d("EducationFragment", "position " + position + "col" + col);

                  /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
                  intent.putExtra("fileName", "childhealth.pdf");
                  getActivity().startActivity(intent);*/
                displayPDF("childhealth.pdf");

//                  final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
//                  popupWindow.show(getView(), 0, 0);
//                  View container = (View) popupWindow.getContentView().getParent();
//                  WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
//                  WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
//                  p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
//                  p.dimAmount = 0.4f;
//                  wm.updateViewLayout(container, p);
            } else if ((position == 7) && (col == 2)) {
              /*  HealthMonLog.d("EducationFragment", "position " + position + "col" + col);
                try {
                    Intent intent = new Intent(getActivity(), AudioPopUpActivity.class);
                    intent.putExtra("audioFileName", R.raw.newbornchildcare);
                    getActivity().startActivity(intent);

                } catch (Exception e) {
                    e.printStackTrace();
                }*/
                disPlayAudio(R.raw.newbornchildcare,"newBornchildcare");

            }

        }
    };

    private void displayVideo(int i) {
        VideoFragment fragment = new VideoFragment();
        Bundle args = new Bundle();
        args.putInt("video", i);
        fragment.setArguments(args);
        FragmentTransaction transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.educationContainer, fragment);
        transaction.addToBackStack("EducationFragment");
        transaction.commit();
    }


/*    private void playAudio() {
        if (mp != null) {
            mp.release();
        }
        // Create a new MediaPlayer to play this sound
        mp = MediaPlayer.create(getActivity(), R.raw.b);
        mp.start();
    }*/


    private void CopyReadAssets(String fileName) {
        AssetManager assetManager = getActivity().getAssets();

        InputStream in = null;
        OutputStream out = null;
        File file = new File(getActivity().getFilesDir(), fileName);
        try {
            in = assetManager.open("abc.pdf");
            out = getActivity().openFileOutput(file.getName(), Context.MODE_WORLD_READABLE);

            copyFile(in, out);
            in.close();
            in = null;
            out.flush();
            out.close();
            out = null;
        } catch (Exception e) {
            Log.e("tag", e.getMessage());
        }

        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setDataAndType(
                Uri.parse("file://" + getActivity().getFilesDir() + "/" + fileName),
                "application/pdf");
        getActivity().startActivity(intent);
    }

    private void copyFile(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
    }

    private void displayPDF(String pdffile) {
        /*final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(getActivity());
        popupWindow.show(getView(), 0, 0);
        View container = (View) popupWindow.getContentView().getParent();
        WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.4f;
        wm.updateViewLayout(container, p);*/
        PDFFragment fragment = new PDFFragment();
        Bundle args = new Bundle();
        args.putString("pdf", pdffile);
        fragment.setArguments(args);
        FragmentTransaction transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.educationContainer, fragment);
        transaction.addToBackStack("EducationFragment");
        transaction.commit();


    }
    private void disPlayAudio(int i,String fileName)
    {
        AudioFragment fragment = new AudioFragment();
        Bundle args = new Bundle();
        args.putInt("audio", i);
        args.putString("fileName",fileName);
        fragment.setArguments(args);
        FragmentTransaction transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.educationContainer, fragment);
        transaction.addToBackStack("EducationFragment");
        transaction.commit();

    }


    private void initItems() {
        List<String> itemTypesList = new ArrayList<String>();
        itemTypesList.add(getResources().getString(R.string.ANC));
        itemTypesList.add(getResources().getString(R.string.PNC));
        itemTypesList.add(getResources().getString(R.string.FP));
        itemTypesList.add(getResources().getString(R.string.CH));

        sectionHeaderTitles.put(getResources().getString(R.string.ANC), getResources().getString(R.string.ANC));
        sectionHeaderTitles.put(getResources().getString(R.string.PNC), getResources().getString(R.string.PNC));
        sectionHeaderTitles.put(getResources().getString(R.string.FP), getResources().getString(R.string.FP));
        sectionHeaderTitles.put(getResources().getString(R.string.CH), getResources().getString(R.string.CH));

        for (String itemType : itemTypesList) {
            Map<String, List<Object>> map = new HashMap<String, List<Object>>();
            List<Object> list = new ArrayList<Object>();

            for (int i = 1; i < 4; i++) {
                String itemName = itemType + " " + i;
                String subTitle = "title " + i;
                int image;

                Object object = null;

                if (itemType == getResources().getString(R.string.ANC)) {
                    image = Constants.ancImages[i - 1];
                    object = new ANCModel(itemName, subTitle, image);
                } else if (itemType == getResources().getString(R.string.PNC)) {
                    image = Constants.pncImages[i - 1];

                    object = new PNCModel(itemName, subTitle, image);
                } else if (itemType == getResources().getString(R.string.FP)) {
                    image = Constants.fpImages[i - 1];
                    object = new FPModel(itemName, subTitle, image);
                } else if (itemType == getResources().getString(R.string.CH)) {
                    image = Constants.chImages[i - 1];
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
        //Log.d("MyTraining", "onItemClick() called with: " + "arg0 = [" + arg0 + "], arg1 = [" + arg1 + "], position = [" + position + "], arg3 = [" + arg3 + "]");
        if (position == 1) {
          /*  final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(getActivity());
            popupWindow.show(getView(), 0, 0);
            View container = (View) popupWindow.getContentView().getParent();
            WindowManager wm = (WindowManager) getActivity().getSystemService(Context.WINDOW_SERVICE);
            WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
            p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
            p.dimAmount = 0.4f;
            wm.updateViewLayout(container, p);*/
           /* Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "bemoc.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("bemoc.pdf");
        }
        if (position == 2) {
            /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "bemoc.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("bemoc.pdf");
        }
        if (position == 4) {
           /* Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "Post Natal Assessment.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("Post Natal Assessment.pdf");
        }
        if (position == 5) {
           /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "Asha Booklet.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("Asha Booklet.pdf");
        }
        if (position == 7) {
           /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "Introduction to family planning.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("Introduction to family planning.pdf");
        }
        if (position == 8) {
           /* Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "Introduction to family planning.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("Introduction to family planning.pdf");
        }
        if (position == 9) {
            /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "Introduction to family planning.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("Introduction to family planning.pdf");
        }
        if (position == 11) {
           /* Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "childcareAndcommonDiseases.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("childcareAndcommonDiseases.pdf");
        }
        if (position == 12) {
            /*Intent intent = new Intent(getActivity(), PDFViewerPopupActivity.class);
            intent.putExtra("fileName", "childcareAndcommonDiseases.pdf");
            getActivity().startActivity(intent);*/
            displayPDF("childcareAndcommonDiseases.pdf");
        }

    }

    @Override
    public void onDestroy() {
  /*    if(getActivity().getSupportFragmentManager().getBackStackEntryCount() > 0){
          FragmentTransaction fragmentTransaction=getActivity().getSupportFragmentManager().beginTransaction();
          fragmentTransaction.remove()
      }*/
        if (null != mp) {
            mp.release();
        }
        super.onDestroy();
    }

}
