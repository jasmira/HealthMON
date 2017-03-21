
package com.persistent.healthmon.adapter;

 import android.content.Context;
 import android.support.v7.widget.RecyclerView;
 import android.view.LayoutInflater;
 import android.view.View;
 import android.view.ViewGroup;
 import android.widget.LinearLayout;
 import android.widget.TextView;
 import com.persistent.healthmon.R;
 import com.persistent.healthmon.database.DatabaseHelper;
 import com.persistent.healthmon.model.MyActivity;
 import com.persistent.healthmon.model.MyImmunizations;
 import com.persistent.healthmon.util.Constants;
 import com.persistent.healthmon.util.DateUtil;
 import java.util.ArrayList;
 import java.util.Collections;

/**
 * Created by harshal_patil on 6/17/2016.
 */
public class ImmunizationsAdapter extends RecyclerView.Adapter<ImmunizationsAdapter.MyViewHolderMain> {

    ArrayList<MyImmunizations> myImmunizations;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;

    public ImmunizationsAdapter(ArrayList<MyImmunizations> myImmunizations) {
        this.myImmunizations = myImmunizations;
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public ImmunizationsAdapter.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_immunizations_header, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_immunizations_row, parent, false));

        }


    }

    @Override
    public void onBindViewHolder(ImmunizationsAdapter.MyViewHolderMain holder, final int position) {

        if (holder.getItemViewType() == TYPE_ROW) {
            MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
            myViewHolderRow.txtImmunizationName.setText(myImmunizations.get(position - 1).getImmunizationName());
            //String convertedDt = DateUtil.dateConvert(myImmunizations.get(position - 1).getDueDate(), "yyyy-MM-dd", "dd-MM-yyyy");
            //myViewHolderRow.txtdueDate.setText(convertedDt);
            //String convertedDt1 = DateUtil.dateConvert(myImmunizations.get(position - 1).getDoneDate(), "yyyy-MM-dd", "dd-MM-yyyy");
            //myViewHolderRow.txtdoneDate.setText(convertedDt1);
            myViewHolderRow.txtdueDate.setText(myImmunizations.get(position - 1).getDueDate());
            myViewHolderRow.txtdoneDate.setText(myImmunizations.get(position - 1).getDueDate());
            myViewHolderRow.txtGivenBy.setText(myImmunizations.get(position - 1).getGivenBy());
            myViewHolderRow.txtRole.setText(myImmunizations.get(position-1).getRole());
            myViewHolderRow.txtLocation.setText(myImmunizations.get(position-1).getGivenAt());

        }
    }

    @Override
    public int getItemCount() {
        if (myImmunizations.size() == 0) {
            return myImmunizations.size();
        } else {
            return myImmunizations.size() + 1;
        }
    }

    public class MyViewHolderHeader extends MyViewHolderMain {
        public MyViewHolderHeader(View itemView) {
            super(itemView);
        }
    }

    public class MyViewHolderRow extends MyViewHolderMain {
        TextView txtImmunizationName, txtdueDate, txtdoneDate, txtGivenBy, txtRole, txtLocation;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtImmunizationName = (TextView) itemView.findViewById(R.id.imName);
            txtdueDate = (TextView) itemView.findViewById(R.id.imDueDate);
            txtdoneDate = (TextView) itemView.findViewById(R.id.imDoneDate);
            txtGivenBy = (TextView) itemView.findViewById(R.id.imGivenBy);
            txtRole = (TextView) itemView.findViewById(R.id.imRole);
            txtLocation = (TextView) itemView.findViewById(R.id.imGivenAt);

        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}

