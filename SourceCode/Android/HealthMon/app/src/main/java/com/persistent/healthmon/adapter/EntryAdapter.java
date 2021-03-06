package com.persistent.healthmon.adapter;

/**
 * Created by harshal_patil on 5/19/2016.
 */
import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.EntryItem;
import com.persistent.healthmon.interfaces.Item;
import com.persistent.healthmon.model.SectionItem;

public class EntryAdapter extends ArrayAdapter<Item> {

    private Context context;
    private ArrayList<Item> items;
    private LayoutInflater vi;

    public EntryAdapter(Context context,ArrayList<Item> items) {
        super(context,0, items);
        this.context = context;
        this.items = items;
        vi = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }


    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View v = convertView;

        final Item i = items.get(position);
        if (i != null) {
            if(i.isSection()){
                SectionItem si = (SectionItem)i;
                v = vi.inflate(R.layout.list_item_section, null);

                v.setOnClickListener(null);
                v.setOnLongClickListener(null);
                v.setLongClickable(false);

                final TextView sectionView = (TextView) v.findViewById(R.id.section_item);
                sectionView.setText(si.getTitle());

            }else{
                EntryItem ei = (EntryItem)i;
                v = vi.inflate(R.layout.list_item_entry, null);
                final TextView title = (TextView)v.findViewById(R.id.section_item);
                //final TextView subtitle = (TextView)v.findViewById(R.id.list_item_entry_summary);


                if (title != null)
                    title.setText(ei.title);
                //subtitle.setText(ei.subtitle);
            }
        }
        return v;
    }

}

