package persistent.healthmon.adapter;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.interfaces.OnProgramInfoSave;

/**
 * Created by khyati_shah on 7/19/2016.
 */
public class ProgramInfoListAdapter extends BaseExpandableListAdapter {

    // 2 Child types
    private static final int CHILD_TYPE_1 = 0;
    private static final int CHILD_TYPE_2 = 1;

    // 1 Group types
    private static final int GROUP_TYPE_1 = 0;

    private Activity context;
    private List<String> group_list;
    OnProgramInfoSave onProgramInfoSave;

    public ProgramInfoListAdapter(Activity context, List<String> group_list, OnProgramInfoSave onProgramInfoSave) {
        this.context = context;
        this.group_list = group_list;
        this.onProgramInfoSave = onProgramInfoSave;
    }

    public Object getChild(int groupPosition, int childPosition) {
        //return comments_feed_collection.get(group_list.get(groupPosition)).get(childPosition);
        return childPosition;
    }

    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    public View getChildView(final int groupPosition, final int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
        //final String incoming_text = (String) getChild(groupPosition, childPosition);
        LayoutInflater inflater = context.getLayoutInflater();

        int childType = getChildType(groupPosition, childPosition);
        Button btnSave;
        // We need to create a new "cell container"
        // if (convertView == null || convertView.getTag() != childType) {
        switch (childType) {
            case CHILD_TYPE_1:
                convertView = inflater.inflate(R.layout.program_info_anc_child, null);
                    /*btnSave = (Button) convertView.findViewById(R.id.btnSave);
                    btnSave.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {

                        }
                    });*/
                convertView.setTag(childType);
                break;
            case CHILD_TYPE_2:
                convertView = inflater.inflate(R.layout.program_tobaco_cessation, null);
                btnSave = (Button) convertView.findViewById(R.id.btnSave);
                btnSave.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {

                    }
                });
                convertView.setTag(childType);
                break;
            default:
                // Maybe we should implement a default behaviour but it should be ok we know there are 4 child types right?
                break;
        }
        // }


        return convertView;
    }

    public int getChildrenCount(int groupPosition) {
        /*String groupName = group_list.get(groupPosition);
        List<String> groupContent = comments_feed_collection.get(groupName);*/
        return 1;
    }

    public Object getGroup(int groupPosition) {
        return group_list.get(groupPosition);
    }

    public int getGroupCount() {
        return group_list.size();
    }

    public long getGroupId(int groupPosition) {
        return groupPosition;
    }

    public View getGroupView(final int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        final String incoming_text = (String) getGroup(groupPosition);
        TextView progName;
        ImageView imgSavedTick;
        LinearLayout llDeleteContainer;
        int groupType = getGroupType(groupPosition);

        // We need to create a new "cell container"
        if (convertView == null){// || convertView.getTag() != groupType) {
            switch (groupType) {
                case GROUP_TYPE_1:
                    convertView = inflater.inflate(R.layout.program_info_header, null);
                    break;
            }
        }

        switch (groupType) {
            case GROUP_TYPE_1:
                progName = (TextView) convertView.findViewById(R.id.txtProgName);
                progName.setText(group_list.get(groupPosition));
                llDeleteContainer = (LinearLayout) convertView.findViewById(R.id.llDeleteContainer);
                llDeleteContainer.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Toast.makeText(context, "Clicked", Toast.LENGTH_LONG).show();
                        group_list.remove(groupPosition);
                        notifyDataSetChanged();
                    }
                });
                break;
        }

        return convertView;
    }


    public boolean hasStableIds() {
        return true;
    }


    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return false;
    }


    @Override
    public int getChildTypeCount() {
        return 2; // I defined 4 child types (CHILD_TYPE_1, CHILD_TYPE_2, CHILD_TYPE_3, CHILD_TYPE_UNDEFINED)
    }

    @Override
    public int getGroupTypeCount() {
        return 1; // I defined 3 groups types (GROUP_TYPE_1, GROUP_TYPE_2, GROUP_TYPE_3)
    }

    @Override
    public int getGroupType(int groupPosition) {
        switch (groupPosition) {
            case 0:
                return GROUP_TYPE_1;
            case 1:
                return GROUP_TYPE_1;

            default:
                return GROUP_TYPE_1;
        }
    }

    @Override
    public int getChildType(int groupPosition, int childPosition) {
        String groupName = group_list.get(groupPosition);
        if (groupName.equalsIgnoreCase(context.getResources().getString(R.string.txtAnteNatalCare))) {
            return CHILD_TYPE_1;
        } else {
            return CHILD_TYPE_2;
        }
    }
}
