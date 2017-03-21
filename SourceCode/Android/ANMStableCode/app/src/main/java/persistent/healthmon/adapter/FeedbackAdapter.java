package persistent.healthmon.adapter;

import android.content.Context;
import android.graphics.Color;
import android.support.v7.widget.RecyclerView;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import java.util.ArrayList;

import persistent.healthmon.R;
import persistent.healthmon.model.Feedback;
import persistent.healthmon.util.Constants;

/**
 * Created by gaurav_polekar on 7/15/2016.
 */
public class FeedbackAdapter extends RecyclerView.Adapter<FeedbackAdapter.ViewHolder> {
        private static String TAG = FeedbackAdapter.class.getCanonicalName();
        private Context mContext;
        private ArrayList<Feedback> mFeedback;
        private ArrayList<Feedback> mlstParseFeedback = new ArrayList<>();
        private String catName = "temp";
        private static int queNumber = -1;
        private static String queDesc;
        public static Boolean isLoadResult;

        public FeedbackAdapter(ArrayList<Feedback> mFeedback,Boolean loadResult) {
            this.mFeedback = mFeedback;
            this.isLoadResult = loadResult;
            parseQuestionList();
        }

        @Override
        public FeedbackAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View viewLayout = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_task_feedback, parent, false);
            mContext = parent.getContext();

            ViewHolder vh = new ViewHolder(viewLayout);
            return vh;
        }

        private void parseQuestionList() {
            for(Feedback tempFeedback : mFeedback) {
                if(tempFeedback.getSurvey_template_id() == Constants.DbConstants.FEEDBACK_SURVEY_TEMPLATE_ID) {
                    //Function might not work as per expection as we use .equalsIgnoreCase("null")
                    //we are considering null value in database
                    if (tempFeedback.getSurvey_Question_Description().equalsIgnoreCase("null")) {
                        tempFeedback.setHeader(true);
                        mlstParseFeedback.add(tempFeedback);
                    } else if (tempFeedback.getSurvey_Question_no() != queNumber) {
                        queNumber = tempFeedback.getSurvey_Question_no();
                        tempFeedback.setHeader(false);
                        mlstParseFeedback.add(tempFeedback);
                    }
                }
            }
        }

        @Override
        public void onBindViewHolder(FeedbackAdapter.ViewHolder holder, final int position) {

            if(mlstParseFeedback.get(position).isHeader()){
                holder.mRadioGroup.setVisibility(View.GONE);
                //if change this then change here
                //<color name="colorLightGreenBg">#e8f8f5</color>
                holder.mTxtQuestionName.setBackgroundColor(Color.parseColor("#e8f8f5"));
                holder.mTxtQuestionName.setTextColor(Color.parseColor("#000000"));
                holder.mTxtQuestionName.setTextSize(TypedValue.COMPLEX_UNIT_PX, mContext.getResources().getDimensionPixelSize( R.dimen.text20sp ) );
                holder.mTxtQuestionName.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
                holder.mTxtQuestionName.setText(mlstParseFeedback.get(position).getSurvey_Question_Category());
            }else{
                holder.mTxtQuestionName.setPadding(15,0,0,0);
                holder.mTxtQuestionName.setTextSize(TypedValue.COMPLEX_UNIT_PX, mContext.getResources().getDimensionPixelSize( R.dimen.text16sp ) );
                holder.mTxtQuestionName.setText(mlstParseFeedback.get(position).getSurvey_Question_Description());
            }



            holder.mRadioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
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
            });
            if(isLoadResult) {
                try {
                    if (mlstParseFeedback.get(position).getAnswer().equals(Constants.StronglyAgree)) {
                        holder.mRadioStronglyA.setChecked(true);
                    } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.Agree)) {
                        holder.mRadioAgree.setChecked(true);
                    } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.DisAgree)) {
                        holder.mRadioDisagree.setChecked(true);
                    } else if (mlstParseFeedback.get(position).getAnswer().equals(Constants.StronglyDisAgree)) {
                        holder.mRadioStronglyD.setChecked(true);
                    }

                    if (mlstParseFeedback.get(position).getAnswer().isEmpty()) {
                    }
                } catch (Exception e) {
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
