package com.persistent.healthmon.adapter;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.placeholder.AshaProfilePopupWindow;
import com.persistent.healthmon.placeholder.HelpGuidePopupWindow;
import com.persistent.healthmon.placeholder.PregnancyDietPopupWindow;
import com.persistent.healthmon.placeholder.PulseOxPopupWindow;
import com.persistent.healthmon.placeholder.ReferToDocPopupWindow;
import com.persistent.healthmon.viewcontroller.HealthMonMainActivity;

/**
 * Created by pushkar_bhadle on 3/31/2016.
 */
public class DashboardHelpGuideGridAdapter extends BaseAdapter {

    int [] result;
    Context context;
    int [] imageId;

    private static LayoutInflater inflater=null;
    public DashboardHelpGuideGridAdapter(Context healthMonMainActivity, int[] prgmNameList, int[] prgmImages) {
        // TODO Auto-generated constructor stub
        result=prgmNameList;
        context=healthMonMainActivity;
        imageId=prgmImages;
        //inflater = ( LayoutInflater )context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

    }

    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return result.length;
    }

    @Override
    public Object getItem(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    @Override
    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return position;
    }

    public class Holder
    {
        TextView tv;
        ImageView img;
    }

    @Override
    public View getView(final int position, final View convertView, final ViewGroup parent) {
        Holder holder=new Holder();
        LayoutInflater inflater = ((Activity) context).getLayoutInflater();
        final View gridView;

        gridView = inflater.inflate(R.layout.dashboard_helpguide_grid, parent,false);
        holder.tv=(TextView) gridView.findViewById(R.id.textView1);
        holder.img=(ImageView) gridView.findViewById(R.id.imageView1);

        holder.tv.setText(result[position]);
        holder.img.setImageResource(imageId[position]);
  /*      if(position==0 || position==2 ||position==3||position==4 || position==6 ||position==7 || position==8){
            gridView.setBackgroundColor(Color.LTGRAY);
        }
    */    gridView.setOnClickListener(new View.OnClickListener() {

           @Override
           public void onClick(View v) {

               if (position == 1) {
                   final HelpGuidePopupWindow popupWindow = new HelpGuidePopupWindow(context);
                   popupWindow.show(parent, 0, 0);
                   //layout_MainMenu.getForeground().setAlpha(150);
                   View   container;
                   if(Build.VERSION.SDK_INT>22 ) {
                       container = (View) popupWindow.getContentView().getParent().getParent();
                   }
                   else{
                       container=(View) popupWindow.getContentView().getParent();
                   }

                   WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                   //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
                   WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                   p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                   p.dimAmount = 0.4f;
                   wm.updateViewLayout(container, p);
               } else if (position == 5) {
                   final PulseOxPopupWindow popupWindow = new PulseOxPopupWindow(context);
                   popupWindow.show(parent, 0, 0);
                   //layout_MainMenu.getForeground().setAlpha(150);
                   //View container = (View) popupWindow.getContentView().getParent().getParent();
                   View   container;
                   if(Build.VERSION.SDK_INT>22 ) {
                       container = (View) popupWindow.getContentView().getParent().getParent();
                   }
                   else{
                       container=(View) popupWindow.getContentView().getParent();
                   }
                   WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                   //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
                   WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                   p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                   p.dimAmount = 0.4f;
                   wm.updateViewLayout(container, p);
               } else if (position == 10) {
                   final ReferToDocPopupWindow popupWindow = new ReferToDocPopupWindow(context);
                   popupWindow.show(parent, 0, 0);
                   //layout_MainMenu.getForeground().setAlpha(150);
                   //View container = (View) popupWindow.getContentView().getParent().getParent();
                   View   container;
                   if(Build.VERSION.SDK_INT>22 ) {
                       container = (View) popupWindow.getContentView().getParent().getParent();
                   }
                   else{
                       container=(View) popupWindow.getContentView().getParent();
                   }
                   WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                   //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
                   WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                   p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                   p.dimAmount = 0.4f;
                   wm.updateViewLayout(container, p);
               }else if (position == 9) {
                   final PregnancyDietPopupWindow popupWindow = new PregnancyDietPopupWindow(context);
                   popupWindow.show(parent, 0, 0);
                   //layout_MainMenu.getForeground().setAlpha(150);
                   //View container = (View) popupWindow.getContentView().getParent().getParent();
                   View   container;
                   if(Build.VERSION.SDK_INT>22 ) {
                       container = (View) popupWindow.getContentView().getParent().getParent();
                   }
                   else{
                       container=(View) popupWindow.getContentView().getParent();
                   }
                   WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
                   //Dim will not work on Android M as layoutParams don't cast to WindowManager.LayoutParams
                   WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
                   p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
                   p.dimAmount = 0.4f;
                   wm.updateViewLayout(container, p);
               }
           }
       });

        return gridView;
    }
}