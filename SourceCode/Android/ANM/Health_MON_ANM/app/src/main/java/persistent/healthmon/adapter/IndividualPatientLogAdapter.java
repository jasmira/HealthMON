package persistent.healthmon.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import persistent.healthmon.R;
import persistent.healthmon.fragments.SummaryViewFragment;
import persistent.healthmon.util.HealthMonUtility;


/**
 * Created by harshal_patil on 7/13/2016.
 */
public class IndividualPatientLogAdapter extends BaseAdapter {

    int[] result;
    Context context;
    int[] imageId;
    private static LayoutInflater inflater = null;

    public IndividualPatientLogAdapter(Context healthMonMainActivity, int[] prgmNameList, int[] prgmImages) {
        // TODO Auto-generated constructor stub
        result = prgmNameList;
        context = healthMonMainActivity;
        imageId = prgmImages;
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

    public class Holder {
        TextView tv;
        ImageView img;
    }

    @Override
    public View getView(final int position, View convertView, final ViewGroup parent) {
        final Holder holder = new Holder();
        LayoutInflater inflater = ((Activity) context).getLayoutInflater();
        View gridView;

        gridView = inflater.inflate(R.layout.dashboard_helpguide_grid, parent, false);
        holder.tv = (TextView) gridView.findViewById(R.id.textView1);
        holder.img = (ImageView) gridView.findViewById(R.id.imageView1);

        holder.tv.setText(result[position]);
        holder.img.setImageResource(imageId[position]);

        gridView.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                if (holder.tv.getText().toString().equalsIgnoreCase(context.getResources().getString(R.string.txtSummary))) {
                    HealthMonUtility.replaceFragment(context, new SummaryViewFragment());
                }
            }
        });

        return gridView;
    }
}