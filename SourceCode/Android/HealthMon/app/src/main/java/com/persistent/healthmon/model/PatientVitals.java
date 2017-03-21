package com.persistent.healthmon.model;

import android.nfc.Tag;

import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 5/12/2016.
 */
public class PatientVitals implements Comparable<PatientVitals>{

    private static final String TAG = PatientVitals.class.getSimpleName();

    String patient_id;
    String HM_userId;
    String dateInsertServer;

    //BPM
    int HM_DeviceID;
    int HM_systolic;
    int HM_diastolic;
    int HM_pulseRate;
    String HM_timestamp;
    Date HM_timestamp_in_DATE;

    //Vitals
    Double temperature;
    Double weight;
    Double height;
    Double bmi;
    Double girth;
    Double fundalHeight;

    //ECG
    byte[] ecgWavePoints;

    //OXI
    int oxiSPO;
    int oxiPI;
    int oxiPulse;
    byte[] oxiWavePoints;
    byte[] oxiBeatPoints;

    //HB
    Double hb;

    public PatientVitals(Double temperature, Double weight, Double height, Double bmi, Double girth, Double fundalHeight, String patient_id, String HM_userId/*,Date HM_timestamp_in_DATE*/) {
        this.temperature = temperature;
        this.weight = weight;
        this.height = height;
        this.bmi = bmi;
        this.girth = girth;
        this.fundalHeight = fundalHeight;
        this.patient_id = patient_id;
        this.HM_userId = HM_userId;
        this.HM_timestamp_in_DATE = HM_timestamp_in_DATE;

    }

    public PatientVitals(String patient_id, String HM_userId, int HM_DeviceID, int HM_systolic, int HM_diastolic, int HM_pulseRate, String HM_timestamp) {
        this.patient_id = patient_id;
        this.HM_userId = HM_userId;
        this.HM_DeviceID = HM_DeviceID;
        this.HM_systolic = HM_systolic;
        this.HM_diastolic = HM_diastolic;
        this.HM_pulseRate = HM_pulseRate;
        this.HM_timestamp = HM_timestamp;
    }

    public PatientVitals() {
    }

    @Override
    public String toString() {
        return "PatientVitals{" +
                "patient_id='" + patient_id + '\'' +
                ", HM_userId='" + HM_userId + '\'' +
                ", HM_DeviceID=" + HM_DeviceID +
                ", HM_systolic=" + HM_systolic +
                ", HM_diastolic=" + HM_diastolic +
                ", HM_pulseRate=" + HM_pulseRate +
                ", HM_timestamp='" + HM_timestamp + '\'' +
                ", HM_timestamp_in_DATE=" + HM_timestamp_in_DATE +
/*                ", temperature=" + temperature +
                ", weight=" + weight +
                ", height=" + height +
                ", bmi=" + bmi +
                ", girth=" + girth +
                ", fundalHeight=" + fundalHeight +*/
                ", hb=" + hb +
/*                ", oxiSPO=" + oxiSPO +
                ", oxiPI=" + oxiPI +
                ", oxiPulse=" + oxiPulse +
                ", oxiWavePoints=" + Arrays.toString(oxiWavePoints) +
                ", oxiBeatPoints=" + Arrays.toString(oxiBeatPoints) +
                ", ecgWavePoints=" + Arrays.toString(ecgWavePoints) +*/
                '}';
    }

    public String toStringVitals() {
        return  //"asha1445" +
                "" + this.patient_id +
                "," + this.temperature +
                "," + this.weight +
                "," + this.height +
                "," + this.bmi +
                "," + this.girth +
                "," + this.fundalHeight +
                //"," + this.date +
                "," + this.dateInsertServer +
                "," + this.HM_userId ;
    }

    public String toStringBP() {
        return  //"asha1445" +
                "" + this.patient_id +
                "," + this.HM_systolic +
                "," + this.HM_diastolic +
                "," + this.HM_pulseRate +
                ","+ this.dateInsertServer +
                "," + this.HM_userId;
                //"," + this.HM_timestamp;
    }

    public String toStringECG() {
        return  //"asha1445" +
                "" + this.patient_id +
                //check for byte to tostring
                "," + this.ecgWavePoints.toString()+
                ","+ this.dateInsertServer +
                "," + this.HM_userId;
    }

    public String toStringOXI() {
        return  //"asha1445" +
                "" + this.patient_id +
                "," + this.oxiPulse+
                "," + this.oxiPI+
                "," + this.oxiSPO+
                "," + this.oxiWavePoints.toString() +
                "," + this.oxiBeatPoints.toString() +
                "," + this.dateInsertServer +
                "," + this.HM_userId ;
        //","+ this.HM_timestamp;
    }

    public String toStringHB() {
        return  "" + this.patient_id +
                //"asha1445" +
                "," + this.hb +
                "," + this.dateInsertServer +
                "," + this.HM_userId ;
    }

    public void getECGEachPoint(){
        HealthMonLog.i(TAG,"ECG Graph started");
        for (byte byt : ecgWavePoints){
            HealthMonLog.i(TAG,String.valueOf(byt));
        }
        HealthMonLog.i(TAG,this.ecgWavePoints.toString());
    }

    public int getOxiSPO() {
        return oxiSPO;
    }public void setOxiSPO(int oxiSPO) {
        this.oxiSPO = oxiSPO;
    }public int getOxiPI() {
        return oxiPI;
    }public void setOxiPI(int oxiPI) {
        this.oxiPI = oxiPI;
    }public int getOxiPulse() {
        return oxiPulse;
    }public void setOxiPulse(int oxiPulse) {
        this.oxiPulse = oxiPulse;
    }public byte[] getOxiBeatPoints() {
        return oxiBeatPoints;
    }public void setOxiBeatPoints(byte[] oxiBeatPoints) {
        this.oxiBeatPoints = oxiBeatPoints;
    }public byte[] getOxiWavePoints() {
        return oxiWavePoints;
    }public void setOxiWavePoints(byte[] oxiWavePoints) {
        this.oxiWavePoints = oxiWavePoints;
    }

    public byte[] getEcgWavePoints() {
        return ecgWavePoints;
    }

    public void setEcgWavePoints(byte[] ecgWavePoints) {
        this.ecgWavePoints = ecgWavePoints;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }


    public Double getHb() {
        return hb;
    }

    public void setHb(Double hb) {
        this.hb = hb;
    }

    public Double getWeight() {
        return weight;
    }

    public String getDateInsertServer() {
        return dateInsertServer;
    }

    public void setDateInsertServer(String dateInsertServer) {
        this.dateInsertServer = dateInsertServer;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getBmi() {
        return bmi;
    }

    public void setBmi(Double bmi) {
        this.bmi = bmi;
    }

    public Double getGirth() {
        return girth;
    }

    public void setGirth(Double girth) {
        this.girth = girth;
    }

    public Double getFundalHeight() {
        return fundalHeight;
    }

    public void setFundalHeight(Double fundalHeight) {
        this.fundalHeight = fundalHeight;
    }

    public Date getHM_timestamp_in_DATE() {
        return HM_timestamp_in_DATE;
    }

    public void setHM_timestamp_in_DATE(Date HM_timestamp_in_DATE) {
        this.HM_timestamp_in_DATE = HM_timestamp_in_DATE;
    }


    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getHM_userId() {
        return HM_userId;
    }

    public void setHM_userId(String HM_userId) {
        this.HM_userId = HM_userId;
    }

    public int getHM_DeviceID() {
        return HM_DeviceID;
    }

    public void setHM_DeviceID(int HM_DeviceID) {
        this.HM_DeviceID = HM_DeviceID;
    }

    public int getHM_systolic() {
        return HM_systolic;
    }

    public void setHM_systolic(int HM_systolic) {
        this.HM_systolic = HM_systolic;
    }

    public int getHM_diastolic() {
        return HM_diastolic;
    }

    public void setHM_diastolic(int HM_diastolic) {
        this.HM_diastolic = HM_diastolic;
    }

    public int getHM_pulseRate() {
        return HM_pulseRate;
    }

    public void setHM_pulseRate(int HM_pulseRate) {
        this.HM_pulseRate = HM_pulseRate;
    }

    public String getHM_timestamp() {
        return HM_timestamp;
    }

    public void setHM_timestamp(String HM_timestamp) {
        this.HM_timestamp = HM_timestamp;
    }


    @Override
    public int compareTo(PatientVitals another) {
        if (getHM_timestamp_in_DATE() == null || another.getHM_timestamp_in_DATE() == null) {
            return 0;
        }/*else if(getHM_timestamp_in_DATE().before(another.getHM_timestamp_in_DATE())){
                return 1;
        }else{
            return -1;
        }*/
        else if(getHM_timestamp_in_DATE().getTime() < another.getHM_timestamp_in_DATE().getTime()){
            return 1;
        }else{
            return -1;
        }
           //if last record not work properly try this
        /*        if(another.getHM_timestamp_in_DATE().after(getHM_timestamp_in_DATE())){
            return 1;
        }*/
        //return another.getHM_timestamp_in_DATE().compareTo(getHM_timestamp_in_DATE());
    }
}
