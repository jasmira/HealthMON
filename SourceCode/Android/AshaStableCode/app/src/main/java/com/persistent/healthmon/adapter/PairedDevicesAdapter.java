package com.persistent.healthmon.adapter;

import android.bluetooth.BluetoothDevice;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;

import java.util.List;

/**
 * Created by sunil_muttepawar on 12/25/2015.
 */
public class PairedDevicesAdapter extends RecyclerView.Adapter<PairedDevicesAdapter.ViewHolder> {

    private List<BluetoothDevice> mDeviceList;
    public PairedDevicesAdapter(List<BluetoothDevice> deviceList){
        mDeviceList = deviceList;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.device_list_view_item, parent, false);
        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {

        public TextView textView;

        public ViewHolder(View itemView) {
            super(itemView);
            textView = (TextView) itemView.findViewById(R.id.textView);
        }
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        holder.textView.setText(mDeviceList.get(position).getName());
    }

    @Override
    public int getItemCount() {
        return mDeviceList.size();
    }

    public BluetoothDevice getItem(int position){
        if(position < mDeviceList.size())
            return mDeviceList.get(position);
        else
            return null;
    }

}
