package com.persistent.healthmon.adapter;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Color;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.database.DatabaseHelper;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by pushkar_bhadle on 6/9/2016.
 */
public class Feedbackadapter extends RecyclerView.Adapter<Feedbackadapter.ViewHolder> {
    private static String TAG = Feedbackadapter.class.getCanonicalName();
    private Context mContext;
    private ArrayList<Feedback> mlstParseFeedback = new ArrayList<>();
    private String catName = "temp";
    private static String queDesc;
    public static Boolean isLoadResult;

    public Feedbackadapter(ArrayList<Feedback> mFeedback,Boolean loadResult) {
        this.mlstParseFeedback = mFeedback;
        this.isLoadResult = loadResult;

    }

    @Override
    public Feedbackadapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_task_feedback, parent, false);
        mContext = parent.getContext();

        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }



    @Override
    public void onBindViewHolder(Feedbackadapter.ViewHolder holder, final int position) {

        if(mlstParseFeedback.get(position).isHeader()){
            holder.mRadioGroup.setVisibility(View.GONE);
            //if change this then change here
            //<color name="colorLightGreenBg">#e8f8f5</color>
            holder.mTxtQuestionName.setBackgroundColor(Color.parseColor("#e8f8f5"));
           // holder.mTxtQuestionName.setTextColor(Color.parseColor("#000000"));
            holder.mTxtQuestionName.setTextSize(TypedValue.COMPLEX_UNIT_PX, mContext.getResources().getDimensionPixelSize( R.dimen.text20sp ) );
            holder.mTxtQuestionName.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
            holder.mTxtQuestionName.setText(mlstParseFeedback.get(position).getSurvey_Question_Category());

            holder.mTxtQuestionName.setPadding(0,0,0,0);
        }else{
            holder.mTxtQuestionName.setPadding(15,0,0,0);
            holder.mTxtQuestionName.setTextSize(TypedValue.COMPLEX_UNIT_PX, mContext.getResources().getDimensionPixelSize( R.dimen.text16sp ) );
            holder.mTxtQuestionName.setText(mlstParseFeedback.get(position).getSurvey_Question_Description());

            holder.mRadioGroup.setVisibility(View.VISIBLE);
            holder.mTxtQuestionName.setBackgroundColor(Color.parseColor("#ffffff"));
            //holder.mTxtQuestionName.setTextColor(Color.parseColor("#999999"));
        }

        if(mlstParseFeedback.get(position).getState() == 0){
            holder.mRadioGroup.clearCheck();
            holder.mRadioStronglyA.setChecked(true);
            holder.mRadioAgree.setChecked(false);
            holder.mRadioDisagree.setChecked(false);
            holder.mRadioStronglyD.setChecked(false);
        }else if(mlstParseFeedback.get(position).getState() == 1){
            holder.mRadioGroup.clearCheck();
            holder.mRadioStronglyA.setChecked(false);
            holder.mRadioAgree.setChecked(true);
            holder.mRadioDisagree.setChecked(false);
            holder.mRadioStronglyD.setChecked(false);
        }else if(mlstParseFeedback.get(position).getState() == 2){
            holder.mRadioGroup.clearCheck();
            holder.mRadioStronglyA.setChecked(false);
            holder.mRadioAgree.setChecked(false);
            holder.mRadioDisagree.setChecked(true);
            holder.mRadioStronglyD.setChecked(false);
        }else if(mlstParseFeedback.get(position).getState() == 3){
            holder.mRadioGroup.clearCheck();
            holder.mRadioStronglyA.setChecked(false);
            holder.mRadioAgree.setChecked(false);
            holder.mRadioDisagree.setChecked(false);
            holder.mRadioStronglyD.setChecked(true);
        }else {
            holder.mRadioGroup.clearCheck();
        }

        holder.mRadioStronglyA.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton yes = (RadioButton)v;
                if(yes.isChecked()){
                    mlstParseFeedback.get(position).setState(0);
                    mlstParseFeedback.get(position).setAnswer(Constants.StronglyAgree);
                }
            }
        });

        holder.mRadioAgree.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton no = (RadioButton)v;
                if(no.isChecked()){
                    mlstParseFeedback.get(position).setState(1);
                    mlstParseFeedback.get(position).setAnswer(Constants.Agree);
                }
            }
        });

        holder.mRadioDisagree.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton yes = (RadioButton)v;
                if(yes.isChecked()){
                    mlstParseFeedback.get(position).setState(2);
                    mlstParseFeedback.get(position).setAnswer(Constants.DisAgree);
                }
            }
        });

        holder.mRadioStronglyD.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton no = (RadioButton)v;
                if(no.isChecked()){
                    mlstParseFeedback.get(position).setState(3);
                    mlstParseFeedback.get(position).setAnswer(Constants.StronglyDisAgree);
                }
            }
        });

/*        holder.mRadioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
        {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                // checkedId is the RadioButton selected
                if(checkedId == R.id.radioFBStronglyA){
                    mlstParseFeedback.get(position).setAnswer(Constants.StronglyAgree);
                    //Toast.makeText(mContext, "Radio clcicked  Answer = "+mlstParseFeedback.get(position).getAnswer(), Toast.LENGTH_LONG).show();
                }else if(checkedId == R.id.radioFBAgree){
                    mlstParseFeedback.get(position).setAnswer(Constants.Agree);
                    //Toast.makeText(mContext, "Radio clcicked  ID = "+checkedId, Toast.LENGTH_LONG).show();
                }else if(checkedId == R.id.radioFBDisagree){
                    //Toast.makeText(mContext, "Radio clcicked  ID = "+checkedId, Toast.LENGTH_LONG).show();
                    mlstParseFeedback.get(position).setAnswer(Constants.DisAgree);
                }
                else if(checkedId == R.id.radioFBStronglyD){
                   // Toast.makeText(mContext, "Radio clcicked  ID = "+checkedId, Toast.LENGTH_LONG).show();
                    mlstParseFeedback.get(position).setAnswer(Constants.StronglyDisAgree);
                }
            }
        });*/
        if(isLoadResult) {
            try {
                if (mlstParseFeedback.get(position).getAnswer().equals(Constants.StronglyAgree)) {
                    holder.mRadioStronglyA.setChecked(true);
                    holder.mRadioAgree.setChecked(false);
                    holder.mRadioDisagree.setChecked(false);
                    holder.mRadioStronglyD.setChecked(false);
                } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.Agree)) {
                    holder.mRadioStronglyA.setChecked(false);
                    holder.mRadioAgree.setChecked(true);
                    holder.mRadioDisagree.setChecked(false);
                    holder.mRadioStronglyD.setChecked(false);
                } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.DisAgree)) {
                    holder.mRadioStronglyA.setChecked(false);
                    holder.mRadioAgree.setChecked(false);
                    holder.mRadioDisagree.setChecked(true);
                    holder.mRadioStronglyD.setChecked(false);
                } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.StronglyDisAgree)) {
                    holder.mRadioStronglyA.setChecked(true);
                    holder.mRadioAgree.setChecked(false);
                    holder.mRadioDisagree.setChecked(false);
                    holder.mRadioStronglyD.setChecked(true);
                }

                if (mlstParseFeedback.get(position).getAnswer().isEmpty()) {
                }
            } catch (Exception e) {
                HealthMonLog.e(TAG, "Adapter In feedback answer catch");
                e.printStackTrace();
            }
        }
    }

    @Override
    public int getItemCount() {
        return mlstParseFeedback.size();
    }

    public ArrayList<Feedback> getFeedbackList(){
        return this.mlstParseFeedback;
    }

    @Override
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mlstParseFeedback.clear();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public TextView mTxtQuestionName;
        public RadioGroup mRadioGroup;
        public RadioButton mRadioStronglyA;
        public RadioButton mRadioAgree;
        public RadioButton mRadioDisagree;
        public RadioButton mRadioStronglyD;
        public View mViewLayout;

        public ViewHolder(View v) {
            super(v);
            mViewLayout = v;
            mTxtQuestionName = (TextView) v.findViewById(R.id.tvFBQuestion);
            mRadioGroup = (RadioGroup) v.findViewById(R.id.radioGroupFB);
            mRadioStronglyA = (RadioButton) v.findViewById(R.id.radioFBStronglyA);
            mRadioAgree = (RadioButton) v.findViewById(R.id.radioFBAgree);
            mRadioDisagree = (RadioButton) v.findViewById(R.id.radioFBDisagree);
            mRadioStronglyD = (RadioButton) v.findViewById(R.id.radioFBStronglyD);
            if(isLoadResult) {
                for (int i = 0; i < mRadioGroup.getChildCount(); i++) {
                    mRadioGroup.getChildAt(i).setEnabled(false);
                }
            }
        }
    }
}