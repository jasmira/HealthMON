package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;


import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.model.Medication;

/**
 * Created by pushkar_bhadle on 7/12/2016.
 */
public class MedicationAdapter   extends RecyclerView.Adapter<MedicationAdapter.ViewHolder> {
    private Context mContext;
    private ArrayList<Medication> mLstMedication;
    private String catName = "temp";
    private static int queNumber = -1;
    private static String queDesc;
    public static Boolean isLoadResult;

    public MedicationAdapter(ArrayList<Medication> mHra) {
        this.mLstMedication = mHra;
    }

    @Override
    public MedicationAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_medication_other, parent, false);
        mContext = parent.getContext();
        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }

    @Override
    public void onBindViewHolder(MedicationAdapter.ViewHolder holder, final int position) {

        holder.mdurgName.setText(mLstMedication.get(position).getDrug_name());
        holder.mDrugQnty.setText(mLstMedication.get(position).getMedicine_qty());
        holder.mGivenBy.setText(mLstMedication.get(position).getGiven_by());
        holder.mRole.setText(mLstMedication.get(position).getRole());
        holder.mLocn.setText(mLstMedication.get(position).getLocation());
        holder.mdelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mLstMedication.remove(position);
                MedicationAdapter.this.notifyDataSetChanged();
            }
        });


    }

    @Override
    public int getItemCount() {
        return mLstMedication.size();
    }

    public ArrayList<Medication> getMedicationList(){
        return this.mLstMedication;
    }

    @Override
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mLstMedication.clear();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public TextView mdurgName, mDrugQnty,mGivenBy, mRole, mLocn, mdelete;
        public View mViewLayout;

        public ViewHolder(View v) {
            super(v);
            mViewLayout = v;
            mdurgName = (TextView) v.findViewById(R.id.tvOtherRowDrugName);
            mDrugQnty = (TextView) v.findViewById(R.id.tvOtherRowQuantity);
            mGivenBy = (TextView) v.findViewById(R.id.tvOtherRowGivenBy);
            mRole = (TextView) v.findViewById(R.id.tvOtherRowRole);
            mLocn = (TextView) v.findViewById(R.id.tvOtherRowLocation);
            mdelete = (TextView) v.findViewById(R.id.btnMOtherDelete);
        }
    }
}
