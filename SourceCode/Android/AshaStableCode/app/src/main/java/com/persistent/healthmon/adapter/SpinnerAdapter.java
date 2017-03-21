package com.persistent.healthmon.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.persistent.healthmon.model.SpinerIdValue;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 7/7/2016.
 */
public class SpinnerAdapter extends ArrayAdapter {

    ArrayList<SpinerIdValue> spinerIdValues;

    public SpinnerAdapter(Context context, int resource, ArrayList<SpinerIdValue> spinerIdValues) {
        super(context, resource, spinerIdValues);
        this.spinerIdValues = spinerIdValues;
    }

    @Override
    public int getCount() {
        return spinerIdValues.size();
    }

    @Override
    public int getPosition(Object item) {
        return super.getPosition(item);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        TextView v = (TextView) super.getView(position, convertView, parent);
        v.setText(spinerIdValues.get(position).getValue());
        return v;
    }

    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        TextView v = (TextView) super.getView(position, convertView, parent);
        v.setText(spinerIdValues.get(position).getValue());
        return v;
    }
}
