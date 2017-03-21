package persistent.healthmon.adapter;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import persistent.healthmon.R;
import persistent.healthmon.fragments.DashBoardCallSupportFragment;
import persistent.healthmon.fragments.HealthLogFragment;
import persistent.healthmon.interfaces.OnPatientTaskSelect;
import persistent.healthmon.util.HealthMonUtility;


/**
 * Created by pushkar_bhadle on 3/31/2016.
 */
public class DashboardHelpGuideGridAdapter extends BaseAdapter {

    int [] result;
    Context context;
    int [] imageId;
    OnPatientTaskSelect onPatientTaskSelect;
    private static LayoutInflater inflater=null;
    public DashboardHelpGuideGridAdapter(Context healthMonMainActivity, OnPatientTaskSelect onPatientTaskSelect,int[] prgmNameList, int[] prgmImages) {
        // TODO Auto-generated constructor stub
        this.onPatientTaskSelect = onPatientTaskSelect;
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
        View gridView;

        gridView = inflater.inflate(R.layout.dashboard_helpguide_grid, parent,false);
        holder.tv=(TextView) gridView.findViewById(R.id.textView1);
        holder.img=(ImageView) gridView.findViewById(R.id.imageView1);

        holder.tv.setText(result[position]);
        holder.img.setImageResource(imageId[position]);

       gridView.setOnClickListener(new View.OnClickListener() {

           @Override
           public void onClick(View v) {
               onPatientTaskSelect.onTaskClick(position);
              //DashBoardCallSupportFragment individualPatientTaskFragment = new DashBoardCallSupportFragment();
              //HealthMonUtility.replaceFragment(context, individualPatientTaskFragment);
           }
       });

        return gridView;
    }
}