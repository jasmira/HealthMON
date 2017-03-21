package com.persistent.healthmon.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

import java.util.ArrayList;

/**
 * Created by pushkar_bhadle on 7/8/2016.
 */
public class HRAAdapter extends RecyclerView.Adapter<HRAAdapter.ViewHolder> {
    private static String TAG = Feedbackadapter.class.getCanonicalName();
    private Context mContext;
    private ArrayList<Feedback> mLstHRA;
    private ArrayList<Feedback> mlstParseHRA = new ArrayList<>();
    private String catName = "temp";
    private static int queNumber = -1;
    private int mCheckedPosition  = -1;
    private static String queDesc;
    public static Boolean isLoadResult;

    private int[] qimages = {R.drawable.hra_image_q1, R.drawable.hra_image_q2, R.drawable.hra_image_q3,
            R.drawable.hra_image_q4, R.drawable.hra_image_q5, R.drawable.hra_image_q6,
            R.drawable.hra_image_q7,-1, R.drawable.hra_image_q9, R.drawable.hra_image_q10,
            R.drawable.hra_image_q11, R.drawable.hra_image_q12};

    public HRAAdapter(ArrayList<Feedback> mHra, Boolean loadResult) {
        this.mLstHRA = mHra;
        this.isLoadResult = loadResult;
        parseQuestionList();
    }

    @Override
    public HRAAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_hra, parent, false);
        mContext = parent.getContext();
        ViewHolder vh = new ViewHolder(viewLayout);
        return vh;
    }

    private void parseQuestionList() {
        ArrayList<Feedback> mLsthrafinal = new ArrayList<>();
        for(Feedback temphra : mLstHRA) {
            temphra.setState(-1);
            if(temphra.getSurvey_Question_Options().equalsIgnoreCase("null")){
                mLsthrafinal.add(temphra);
            }
        }
        for(Feedback tempFeedback : mLsthrafinal) {
            HealthMonLog.i(TAG,"TempFeedback = "+tempFeedback);
            if(tempFeedback.getSurvey_template_id() == Constants.DbConstants.HRA_SURVEY_TEMPLATE_ID) {
                //Function might not work as per expection as we use .equalsIgnoreCase("null")
                //we are considering null value in database
/*                if (tempFeedback.getParent_Qid() ==0) {
                    tempFeedback.setHeader(true);
                    mlstParseHRA.add(tempFeedback);
                } else{*/
                Feedback optionsFeedback = null;
                int cnt = 0;
                ArrayList<String> subOptn = new ArrayList<>();
                    for(Feedback subHRA : mLstHRA) {
                        if(tempFeedback.getSurvey_Question_no() == subHRA.getParent_Qid()){
                            //optionsFeedback = subHRA;
                            //if(optionsFeedback.equals(subHRA)){
/*                            if(cnt ==0){
                             //   mlstParseHRA.add(subHRA);
                                ArrayList<String> subLst = new ArrayList<>();
                                subLst.add(subHRA.getSurvey_Question_Options());
                                subHRA.setSubQuestions(subLst);
                                cnt++;
                            }else {*/
                            String optn = subHRA.getSurvey_Question_Options();
                            subOptn.add(optn);

/*                                ArrayList<String> subLst = optionsFeedback.getSubQuestions();
                                if (subLst.isEmpty()) {
                                    ArrayList<String> subLst2 = new ArrayList<>();
                                    subLst2.add(subHRA.getSurvey_Question_Options());
                                    subHRA.setSubQuestions(subLst2);
                                } else {
                                    subLst.add(subHRA.getSurvey_Question_Options());
                                    subHRA.setSubQuestions(subLst);
                                }
*//*                                if(tempFeedback.getSurvey_Question_no() == subHRA.getSurvey_Question_no()) {
                                    mlstParseHRA.remove(subHRA);
                                    mlstParseHRA.add(subHRA);
                                }else {
                                    mlstParseHRA.add(subHRA);
                                }*//*
                            //}
                            optionsFeedback = subHRA;*/
                        }

                    }
                tempFeedback.setSubQuestions(subOptn);
               // if(mlstParseHRA.isEmpty()) {
                    mlstParseHRA.add(tempFeedback);
               /* }else{
                    ArrayList<Feedback> lstParseHRA = mlstParseHRA;
                    for(Feedback tempHRA : mLstHRA){
                        if(!(tempFeedback.getSurvey_Question_no() == tempHRA.getSurvey_Question_no())
                                && tempFeedback.getSurvey_Question_Options().equalsIgnoreCase("null")){
                            mlstParseHRA.add(tempFeedback);
                        }
                    }
                }*/

            }
        }
        for(Feedback feedback:mlstParseHRA) {
            HealthMonLog.i(TAG, "Parsed HRA list = " + feedback.toString());
        }
    }

    @Override
    public void onBindViewHolder(final HRAAdapter.ViewHolder holder, final int position) {

        String que = "Q"+(position+1)+". "+mlstParseHRA.get(position).getSurvey_Question_Description();
        holder.mTxtQuestionName.setText(que);

//        Bitmap questionImg = ImageResizer.getBitmapThumbnail(mContext, mlstParseHRA.get(position).getQueImageString());
//        if(questionImg != null){
//            holder.mIVQue.setImageBitmap(questionImg);
//        }

        if (qimages[position] != -1) {
            holder.mIVQue.setImageResource(qimages[position]);
        } else {
            holder.mIVQue.setImageResource(R.drawable.user_default_blue);
        }

/*        if(position == 0 && mlstParseHRA.get(0).isSelected() && holder.mRadioGroup.isPressed())
        {
            lastChecked = holder.checkBox;
            lastCheckedPos = 0;
        }*/
        //setRadio(holder,1);
        //setRadio(holder, mlstParseHRA.get(position).getState());
        HealthMonLog.i(TAG,"position = "+position+"Status = "+mlstParseHRA.get(position).getState());
        holder.mRadioGroup.clearCheck();

        if(mlstParseHRA.get(position).getState() == 0){
            holder.mRadioGroup.clearCheck();
            holder.mRadioYes.setChecked(true);
            holder.mRadioNo.setChecked(false);
            //b1.setChecked(true);
            //RadioButton b2 = holder.mRadioNo;
            //b2.setChecked(false);
        }else if(mlstParseHRA.get(position).getState() == 1){
            /*RadioButton
            b1 = holder.mRadioNo;
            b1.setChecked(true);
            RadioButton b2 = holder.mRadioYes;
            b2.setChecked(false);*/
            holder.mRadioGroup.clearCheck();
            holder.mRadioYes.setChecked(false);
            holder.mRadioNo.setChecked(true);
        }else {
            holder.mRadioGroup.clearCheck();
        }

        holder.mRadioYes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton yes = (RadioButton)v;
                if(yes.isChecked()){
                    mlstParseHRA.get(position).setState(0);
                    mlstParseHRA.get(position).setAnswer(Constants.HRAYes);
                }
            }
        });

        holder.mRadioNo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RadioButton no = (RadioButton)v;
                if(no.isChecked()){
                    mlstParseHRA.get(position).setState(1);
                    mlstParseHRA.get(position).setAnswer(Constants.HRANo);
                }
            }
        });
        /*holder.mRadioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
        {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                // checkedId is the RadioButton selected
                if(checkedId == R.id.radioHRAYes){

                    mlstParseHRA.get(position).setState(0);
                    //setRadio(holder, mlstParseHRA.get(position).getState());
                    mlstParseHRA.get(position).setAnswer(Constants.HRAYes);
                }else if(checkedId == R.id.radioHRANo){
                    mlstParseHRA.get(position).setState(1);
                    //setRadio(holder, mlstParseHRA.get(position).getState());
                    mlstParseHRA.get(position).setAnswer(Constants.HRANo);
                    //Toast.makeText(mContext, "Radio clcicked  ID = "+checkedId, Toast.LENGTH_LONG).show();
                }
            }
        });

*/
    }

    @Override
    public int getItemCount() {
        return mlstParseHRA.size();
    }

    public ArrayList<Feedback> getFeedbackList(){
        return this.mlstParseHRA;
    }

    @Override
    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        super.onDetachedFromRecyclerView(recyclerView);
        this.mlstParseHRA.clear();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public TextView mTxtQuestionName;
        public RadioGroup mRadioGroup;
        public RadioButton mRadioYes;
        public RadioButton mRadioNo;
        public ImageView mIVQue;
        public View mViewLayout;

        public ViewHolder(View v) {
            super(v);
            mViewLayout = v;
            mTxtQuestionName = (TextView) v.findViewById(R.id.tvHRAQuestion);
            mIVQue = (ImageView) v.findViewById(R.id.iv_HRA_Q);
            mRadioGroup = (RadioGroup) v.findViewById(R.id.radioGroupHRA);
            mRadioYes = (RadioButton) v.findViewById(R.id.radioHRAYes);
            mRadioNo = (RadioButton) v.findViewById(R.id.radioHRANo);
/*            if(isLoadResult) {
                for (int i = 0; i < mRadioGroup.getChildCount(); i++) {
                    mRadioGroup.getChildAt(i).setEnabled(false);
                }
            }*/
        }
    }
}