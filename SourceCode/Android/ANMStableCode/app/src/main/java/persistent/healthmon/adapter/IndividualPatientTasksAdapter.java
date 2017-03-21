package persistent.healthmon.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import persistent.healthmon.R;
import persistent.healthmon.util.PreferanceManager;
import persistent.healthmon.viewcontroller.TasksHRAFragment;
import persistent.healthmon.util.Constants;
import persistent.healthmon.viewcontroller.ImmunizationActivity;
import persistent.healthmon.viewcontroller.MedicationActivity;


/**
 * Created by harshal_patil on 7/13/2016.
 */
public class IndividualPatientTasksAdapter extends BaseAdapter {

    int [] result;
    Context context;
    int [] imageId;
    private static LayoutInflater inflater=null;
    public IndividualPatientTasksAdapter(Context healthMonMainActivity, int[] prgmNameList, int[] prgmImages) {
        // TODO Auto-generated constructor stub
        result=prgmNameList;
        context=healthMonMainActivity;
        imageId=prgmImages;

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
                if (position == 2) {

                    Intent intent = new Intent(context, ImmunizationActivity.class);
                    intent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",context));
                    context.startActivity(intent);
                } else if (position == 0) {
                    Intent intent = new Intent(context, TasksHRAFragment.class);
                    intent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",context));
                    context.startActivity(intent);
                }
                if (position == 5) {
                    Intent intent = new Intent(context, MedicationActivity.class);
                    intent.putExtra(Constants.SELECTED_PATIENT_ID, PreferanceManager.getStringPreferences(Constants.KEY_PATIENT_SELECTED,"",context));
                    context.startActivity(intent);                }

            }
        });

        return gridView;
    }
}