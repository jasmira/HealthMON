package persistent.healthmon.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;

import java.util.ArrayList;
import java.util.List;

import persistent.healthmon.R;

/**
 * Created by gaurav_polekar on 7/27/2016.
 */
public class MultiSelectSpinnerAdapter extends ArrayAdapter implements  CompoundButton.OnCheckedChangeListener {

    private Context context;
    private List<String> itemList;
    private List<String> itemSelectedList;
    public MultiSelectSpinnerAdapter(Context context, int resource, List<String> list) {
        super(context, resource, list);
        this.context = context;
        this.itemList = list;
        itemSelectedList = new ArrayList<String>();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View row = inflater.inflate(R.layout.row_multi_spinner, parent,
                false);
        CheckBox checkBox = (CheckBox) row;
        checkBox.setOnCheckedChangeListener(this);
        if(itemSelectedList.contains(checkBox.getText())){
            checkBox.setChecked(true);
        }
        else
        {
            checkBox.setChecked(false);
        }
        checkBox.setText(itemList.get(position));
        return row;
    }

    @Override
    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View row = inflater.inflate(R.layout.row_multi_spinner, parent,
                false);
        CheckBox checkBox = (CheckBox) row;
        checkBox.setOnCheckedChangeListener(this);
        checkBox.setText(itemList.get(position));
        if(itemSelectedList.contains(checkBox.getText())){
            checkBox.setChecked(true);
        }
        else
        {
            checkBox.setChecked(false);
        }
        return row;
    }

    /*@Override
    public void onClick(View v) {
        CheckBox checkBox = (CheckBox) v;
        if(checkBox.isChecked()){
            if(! itemSelectedList.contains(checkBox.getText())){
                itemSelectedList.add(checkBox.getText().toString());
            }
        }
        else{
            if(itemSelectedList.contains(checkBox.getText())){
                itemSelectedList.remove(checkBox.getText().toString());
            }
        }
    }*/
    public List<String> getSelectedItems(){
        return itemSelectedList;
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        CheckBox checkBox = (CheckBox) buttonView;
        if(isChecked){
            if(! itemSelectedList.contains(checkBox.getText()))
                itemSelectedList.add(checkBox.getText().toString());
            else
                itemSelectedList.remove(checkBox.getText().toString());
        }
    }
}
