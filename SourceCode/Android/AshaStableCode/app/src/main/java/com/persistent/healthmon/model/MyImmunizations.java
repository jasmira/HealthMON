package com.persistent.healthmon.model;

/**
 * Created by harshal_patil on 6/17/2016.
 */
public class MyImmunizations {

    String freqDesc;
    String ashaId;
    String immunizationName;
    String dueDate;
    String doneDate;
    String givenBy;
    String role;
    String givenAt;
    public MyImmunizations(String patientId, String immunizationName, String freqDesc, String dueDate, String doneDate, String givenBy, String role , String location) {
        this.patientId = patientId;
        this.immunizationName = immunizationName;
        this.freqDesc = freqDesc;
        this.dueDate = dueDate;
        this.doneDate = doneDate;
        this.givenBy = givenBy;
        this.role = role;
        this.givenAt = location;
    }
    public MyImmunizations(){

    }
    public String getAshaId() {
        return ashaId;
    }

    public void setAshaId(String ashaId) {
        this.ashaId = ashaId;
    }

    public String getImmunizationName() {
        return immunizationName;
    }

    public void setImmunizationName(String immunizationName) {
        this.immunizationName = immunizationName;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getDoneDate() {
        return doneDate;
    }

    public void setDoneDate(String doneDate) {
        this.doneDate = doneDate;
    }

    public String getGivenBy() {
        return givenBy;
    }

    public void setGivenBy(String givenBy) {
        this.givenBy = givenBy;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getGivenAt() {
        return givenAt;
    }

    public void setGivenAt(String givenAt) {
        this.givenAt = givenAt;
    }

    public String getIs_Uploaded() {
        return is_Uploaded;
    }

    public void setIs_Uploaded(String is_Uploaded) {
        this.is_Uploaded = is_Uploaded;
    }

    public String getFreqDesc() {
        return freqDesc;
    }

    public void setFreqDesc(String freqDesc) {
        this.freqDesc = freqDesc;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    String patientId;

    String stausDone;
    String is_Uploaded;


    @Override
    public String toString() {
        return this.ashaId + this.immunizationName + "," + this.dueDate + "," + this.doneDate + "," + this.givenBy + "," + this.role + "," + this.givenAt;

    }

}
