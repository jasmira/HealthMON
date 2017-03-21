package persistent.healthmon.adapter;

import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Iterator;
import java.util.List;
import persistent.healthmon.R;
import persistent.healthmon.model.CarePlanRow;

/**
 * Created by gaurav_polekar on 7/20/2016.
 */
public class CarePlanDisplayAdapter extends RecyclerView.Adapter<CarePlanDisplayAdapter.MyViewHolder> {


    private List<CarePlanRow> rows;
    public static final int VIEW_TYPE_HEADER = 0;
    public static final int VIEW_TYPE_ROW = 1;
    public boolean showRemove = true;
    public CarePlanDisplayAdapter(List<CarePlanRow> rows,boolean showRemove){
        this.rows = rows;
        this.showRemove = showRemove;
    }
    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        View itemView;
        if(viewType == VIEW_TYPE_HEADER){
            //header
            itemView = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.row_careplan_display_header, viewGroup, false);
            return new MyViewHolderHeader(itemView);
        }
        else{
            //normal row
            itemView = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.row_careplan_display_normal, viewGroup, false);
            return new MyViewHolderRow(itemView);
        }
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, final int position) {
        if(holder.getItemViewType() == VIEW_TYPE_HEADER){
            MyViewHolderHeader holderHeader = (MyViewHolderHeader) holder;



            holderHeader.txtRemove.setText(Html.fromHtml("<u>Remove</u>"));
            if(showRemove){
                holderHeader.txtRemove.setVisibility(View.VISIBLE);
                holderHeader.txtTitle.setVisibility(View.VISIBLE);
                holderHeader.txtTitle.setText(rows.get(position).getTemplateName());
            }else {
                holderHeader.txtTitle.setVisibility(View.INVISIBLE);
                holderHeader.txtRemove.setVisibility(View.INVISIBLE);
            }
            holderHeader.txtRemove.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //remove this
                    for (Iterator<CarePlanRow> iterator = rows.iterator(); iterator.hasNext(); ) {
                        CarePlanRow row = iterator.next();
                        if(row.equals(rows.get(position))) {
                            iterator.remove();
                        }
                    }
                    CarePlanDisplayAdapter.this.notifyDataSetChanged();
                }
            });
        }else{
            MyViewHolderRow holderRow = (MyViewHolderRow) holder;

            try{
                String prevActivity="";
                prevActivity = rows.get(position - 1).getActivity();
                if(!prevActivity.equals(rows.get(position).getActivity()))
                    holderRow.txtActivity.setText(rows.get(position).getActivity());
                else
                    holderRow.txtActivity.setText("");
            }catch (Exception e){
                e.printStackTrace();
            }

            holderRow.txtFrequency.setText(rows.get(position).getFrequency());
            holderRow.txtRole.setText(rows.get(position).getRole());
            holderRow.txtTask.setText(rows.get(position).getTask());
        }
    }

    @Override
    public int getItemViewType(int position) {
        return rows.get(position).getType();
    }

    @Override
    public int getItemCount() {
        return rows.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public MyViewHolder(View itemView) {
            super(itemView);
        }
    }
    public class MyViewHolderHeader extends MyViewHolder {
        TextView txtTitle,txtRemove;
        public MyViewHolderHeader(View itemView) {
            super(itemView);
            txtTitle = (TextView) itemView.findViewById(R.id.textViewCareplanTemplateTitle);
            txtRemove = (TextView) itemView.findViewById(R.id.textViewRemove);
        }
    }
    public class MyViewHolderRow extends MyViewHolder {
        TextView txtRole,txtTask,txtActivity,txtFrequency;
        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtActivity = (TextView) itemView.findViewById(R.id.textViewActivityName);
            txtTask = (TextView) itemView.findViewById(R.id.textViewTaskName);
            txtRole = (TextView) itemView.findViewById(R.id.textViewRoleName);
            txtFrequency = (TextView) itemView.findViewById(R.id.textViewFrequencyName);
        }
    }
}
