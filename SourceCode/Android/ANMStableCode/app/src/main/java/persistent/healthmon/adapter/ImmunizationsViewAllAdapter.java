
package persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.model.MyImmunizations;

/**
 * Created by harshal_patil on 6/17/2016.
 */
public class ImmunizationsViewAllAdapter extends RecyclerView.Adapter<ImmunizationsViewAllAdapter.MyViewHolderMain> {

    ArrayList<MyImmunizations> myImmunizations;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;

    public ImmunizationsViewAllAdapter(ArrayList<MyImmunizations> myImmunizations) {
        this.myImmunizations = myImmunizations;
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 0 ? TYPE_HEADER : TYPE_ROW);
    }

    @Override
    public ImmunizationsViewAllAdapter.MyViewHolderMain onCreateViewHolder(ViewGroup parent, int viewType) {
        context = parent.getContext();
        if (viewType == TYPE_HEADER) {
            return new MyViewHolderHeader(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_immunizations_header1, parent, false));
        } else {
            return new MyViewHolderRow(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.my_immunizations_row1, parent, false));

        }
    }

    @Override
    public void onBindViewHolder(ImmunizationsViewAllAdapter.MyViewHolderMain holder, final int position) {
        //TODO
        if (holder.getItemViewType() == TYPE_ROW) {
            MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
            myViewHolderRow.txtImmunizationName.setText(myImmunizations.get(position - 1).getImmunizationName());
            myViewHolderRow.txtQuantity.setText("1");
            myViewHolderRow.txtGivenBy.setText(myImmunizations.get(position - 1).getGivenBy());
            myViewHolderRow.txtRole.setText(myImmunizations.get(position-1).getRole());
            myViewHolderRow.txtLocation.setText(myImmunizations.get(position-1).getGivenAt());
            myViewHolderRow.txtdueDate.setText(myImmunizations.get(position - 1).getDueDate());

            myViewHolderRow.txtdoneDate.setText(myImmunizations.get(position - 1).getDueDate());

        }
    }

    @Override
    public int getItemCount() {
        if (myImmunizations.size() == 0) {
            return myImmunizations.size();
        } else {
            return myImmunizations.size();
        }
    }

    public class MyViewHolderHeader extends MyViewHolderMain {
        public MyViewHolderHeader(View itemView) {
            super(itemView);
        }
    }

    public class MyViewHolderRow extends MyViewHolderMain {
        TextView txtImmunizationName, txtQuantity, txtdueDate, txtdoneDate, txtGivenBy, txtRole, txtLocation;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtImmunizationName = (TextView) itemView.findViewById(R.id.imName);
            txtdueDate = (TextView) itemView.findViewById(R.id.imDueDate);
            txtdoneDate = (TextView) itemView.findViewById(R.id.imDoneDate);
            txtGivenBy = (TextView) itemView.findViewById(R.id.imGivenBy);
            txtRole = (TextView) itemView.findViewById(R.id.imRole);
            txtLocation = (TextView) itemView.findViewById(R.id.imLocation);
            txtQuantity = (TextView) itemView.findViewById(R.id.imQuantity);

        }
    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}

