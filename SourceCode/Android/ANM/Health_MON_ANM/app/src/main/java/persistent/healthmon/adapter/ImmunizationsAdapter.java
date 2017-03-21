
package persistent.healthmon.adapter;

import android.app.Dialog;
import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;

import persistent.healthmon.R;
import persistent.healthmon.communication.WebserviceManager;
import persistent.healthmon.database.DatabaseHelper;
import persistent.healthmon.model.MyImmunizations;
import persistent.healthmon.util.Constants;
import persistent.healthmon.util.HealthMonUtility;
import persistent.healthmon.interfaces.OnAdapterNotify;


/**
 * Created by harshal_patil on 6/17/2016.
 */
public class ImmunizationsAdapter extends RecyclerView.Adapter<ImmunizationsAdapter.MyViewHolderMain> {

    ArrayList<MyImmunizations> myImmunizations;
    private static final int TYPE_HEADER = 1;
    private static final int TYPE_ROW = 2;
    Context context;
    OnAdapterNotify onAdapterNotify;
    MyImmunizations myImmu;

    public ImmunizationsAdapter(ArrayList<MyImmunizations> myImmunizations, OnAdapterNotify onAdapterNotify) {
        this.myImmunizations = myImmunizations;
        this.onAdapterNotify = onAdapterNotify;
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

    private void showSuccessfulDialog() {
        TextView  txtMessage;
        Button btnOk, btnCancel;
        final Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_done);
        txtMessage = (TextView) dialog.findViewById(R.id.txtMessage);
        txtMessage.setText("Would you like to save the changes?");
        btnOk = (Button) dialog.findViewById(R.id.btnYes);
        btnCancel = (Button) dialog.findViewById(R.id.btnNo);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                        dialog.dismiss();

                    }
                });

        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });

        dialog.show();
    }
    @Override
    public void onBindViewHolder(ImmunizationsAdapter.MyViewHolderMain holder, final int position) {
        //TODO
        if (holder.getItemViewType() == TYPE_ROW) {
            MyViewHolderRow myViewHolderRow = (MyViewHolderRow) holder;
            myViewHolderRow.txtImmunizationName.setText(myImmunizations.get(position - 1).getImmunizationName());
            myViewHolderRow.txtQuantity.setText("1");
            myViewHolderRow.txtRole.setText(myImmunizations.get(position-1).getRole());
            myViewHolderRow.txtGivenBy.setText(myImmunizations.get(position - 1).getGivenBy());
            myViewHolderRow.txtLocation.setText(myImmunizations.get(position-1).getGivenAt());
            myViewHolderRow.txtdueDate.setText(myImmunizations.get(position - 1).getDueDate());
            myViewHolderRow.btnDone.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //DatabaseHelper.getInstance(context).updateActivityStatus(myImmunizations.get(position - 1).getTaskId(), Constants.ACTIVITY_STATUS_DELETE);
                    myImmunizations.get(position-1).setGivenAt("Village1");
                    myImmunizations.get(position-1).setGivenBy("ANM1");
                    //DatabaseHelper.getInstance(context).insertImmunization(myImmu);
                    //web service call
                    WebserviceManager.insertImmunizations(context, myImmunizations);
                    //showSuccessfulDialog();

                    myImmunizations.remove(position - 1);
                    myImmunizations.removeAll(Collections.singleton(null));
                    notifyDataSetChanged();
                    onAdapterNotify.onNotify();

                }
            });


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
        TextView txtImmunizationName, txtQuantity, txtRole, txtGivenBy, txtLocation, txtdueDate;
        Button btnDone;

        public MyViewHolderRow(View itemView) {
            super(itemView);
            txtImmunizationName = (TextView) itemView.findViewById(R.id.imName);
            txtQuantity = (TextView) itemView.findViewById(R.id.imQuantity);
            txtRole = (TextView) itemView.findViewById(R.id.imRole);
            txtGivenBy = (TextView) itemView.findViewById(R.id.imGivenBy);
            txtLocation = (TextView) itemView.findViewById(R.id.imLocation);
            txtdueDate = (TextView) itemView.findViewById(R.id.imDueDate);
            btnDone = (Button) itemView.findViewById(R.id.btnDone);
            btnDone.setOnClickListener(mclickListener);

        }

        private View.OnClickListener mclickListener = new View.OnClickListener() {
            public void onClick(View v) {

            }
        };

    }

    public class MyViewHolderMain extends RecyclerView.ViewHolder {
        public MyViewHolderMain(View itemView) {
            super(itemView);
        }
    }
}

