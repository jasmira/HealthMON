package com.persistent.healthmon.model;

import com.persistent.healthmon.util.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 6/9/2016.
 */
public class Feedback implements Comparable<Feedback>{

    boolean isHeader;

    int survey_Questionair_id;
    int programs_id;
    int survey_template_id;
    String survey_Question_Category;
    int survey_Question_no;
    String survey_Question_Description;
    String survey_Question_Options;
    int parent_Qid;
    String timeStampInString;
    Date timeStampInDate;
    ArrayList<String> subQuestions = new ArrayList<>();
    String queImageString;


    //For Results
    int result_id;
    String patient_id;
    String answer;
    int state = -1;

    public Feedback(int survey_Questionair_id, int programs_id, int survey_template_id, String survey_Question_Category, int survey_Question_no, String survey_Question_Description, String survey_Question_Options, int parent_Qid, String queImageString) {
        this.survey_Questionair_id = survey_Questionair_id;
        this.programs_id = programs_id;
        this.survey_template_id = survey_template_id;
        this.survey_Question_Category = survey_Question_Category;
        this.survey_Question_no = survey_Question_no;
        this.survey_Question_Description = survey_Question_Description;
        this.survey_Question_Options = survey_Question_Options;
        this.parent_Qid = parent_Qid;
        this.queImageString = queImageString;
    }
    public Feedback(){

    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getSurvey_Questionair_id() {
        return survey_Questionair_id;
    }

    public void setSurvey_Questionair_id(int survey_Questionair_id) {
        this.survey_Questionair_id = survey_Questionair_id;
    }

    public String getQueImageString() {
        return queImageString;
    }

    public void setQueImageString(String queImageString) {
        this.queImageString = queImageString;
    }

    public String getTimeStampInString() {
        return timeStampInString;
    }

    public void setTimeStampInString(String timeStampInString) {
        this.timeStampInString = timeStampInString;
    }
    public ArrayList<String> getSubQuestions() {
        return subQuestions;
    }

    public void setSubQuestions(ArrayList<String> subQuestions) {
        this.subQuestions = subQuestions;
    }
    public String getSurvey_Question_Options() {
        return survey_Question_Options;
    }

    public int getParent_Qid() {
        return parent_Qid;
    }

    public void setParent_Qid(int parent_Qid) {
        this.parent_Qid = parent_Qid;
    }

    public void setSurvey_Question_Options(String survey_Question_Options) {
        this.survey_Question_Options = survey_Question_Options;
    }

    public Date getTimeStampInDate() {
        return timeStampInDate;
    }

    public void setTimeStampInDate(Date timeStampInDate) {
        this.timeStampInDate = timeStampInDate;
    }

    public String getSurvey_Question_Description() {
        return survey_Question_Description;
    }

    public void setSurvey_Question_Description(String survey_Question_Description) {
        this.survey_Question_Description = survey_Question_Description;
    }

    public int getSurvey_Question_no() {
        return survey_Question_no;
    }

    public void setSurvey_Question_no(int survey_Question_no) {
        this.survey_Question_no = survey_Question_no;
    }

    public String getSurvey_Question_Category() {
        return survey_Question_Category;
    }

    public void setSurvey_Question_Category(String survey_Question_Category) {
        this.survey_Question_Category = survey_Question_Category;
    }

    public int getSurvey_template_id() {
        return survey_template_id;
    }

    public void setSurvey_template_id(int survey_template_id) {
        this.survey_template_id = survey_template_id;
    }

    public int getResult_id() {
        return result_id;
    }

    public void setResult_id(int result_id) {
        this.result_id = result_id;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public int getPrograms_id() {
        return programs_id;
    }

    public void setPrograms_id(int programs_id) {
        this.programs_id = programs_id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean isHeader() {
        return isHeader;
    }

    public void setHeader(boolean header) {
        isHeader = header;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "isHeader=" + isHeader +
                ", survey_Questionair_id=" + survey_Questionair_id +
                ", programs_id=" + programs_id +
                ", survey_template_id=" + survey_template_id +
                ", survey_Question_Category='" + survey_Question_Category + '\'' +
                ", survey_Question_no=" + survey_Question_no +
                ", survey_Question_Description='" + survey_Question_Description + '\'' +
                ", survey_Question_Options='" + survey_Question_Options + '\'' +
                ", parent_Qid=" + parent_Qid +
                ", timeStampInString='" + timeStampInString + '\'' +
                ", timeStampInDate=" + timeStampInDate +
                ", subQuestions=" + subQuestions +
                ", queImageString='" + queImageString + '\'' +
                ", result_id=" + result_id +
                ", patient_id='" + patient_id + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }

    @Override
    public int compareTo(Feedback another) {
        if (getSurvey_Question_Category() == null || another.getSurvey_Question_Category() == null)
            return 0;
        //if last record not work properly try this
        /*        if(another.getHM_timestamp_in_DATE().after(getHM_timestamp_in_DATE())){
            return 1;
        }*/
        return another.getSurvey_Question_Category().compareTo(getSurvey_Question_Category());
    }

    public static Comparator<Feedback> hraDATE = new Comparator<Feedback>() {

        public int compare(Feedback s1, Feedback s2) {

            String h1 = s1.getTimeStampInString();
            String h2 = s2.getTimeStampInString();
            Date date1 = null;
            Date date2 = null;
            try {
                date1 = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(h1);
                date2 = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(h2);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            try {
                if (date1 == null || date2 == null) {
                    return 0;
                }/*else if(getHM_timestamp_in_DATE().before(another.getHM_timestamp_in_DATE())){
                return 1;
        }else{
            return -1;
        }*/ else if (date1.getTime() < date2.getTime()) {
                    return 1;
                } else {
                    return -1;
                }
            }catch (Exception e){
                e.printStackTrace();
            }
            return 0;
        }};

    public String toStringFeedbackQuestions() {
        return  "" + this.patient_id +
                "," + this.patient_id;
    }

    public String toStringFeedbackResult() {
        return  //"" + this.result_id +
                "" + this.survey_Questionair_id +
                "," + this.patient_id +
                "," + this.answer ;
                //"," + this.timeStampInString;
    }
}
