package com.persistent.healthmon.util;

import com.persistent.healthmon.R;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by pushkar_bhadle on 3/31/2016.
 */
public class DashboardTasks {
    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getNumberOfTasks() {
        return numberOfTasks;
    }

    public void setNumberOfTasks(int numberOfTasks) {
        this.numberOfTasks = numberOfTasks;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getPatientPhoto() {
        return patientPhoto;
    }

    public void setPatientPhoto(int patientPhoto) {
        this.patientPhoto = patientPhoto;
    }

    String patientName;
    int numberOfTasks;
    int patientId;
    int patientPhoto;

    public DashboardTasks(String patientName, int numberOfTasks, int patientId, int patientPhoto) {
        this.patientName = patientName;
        this.numberOfTasks = numberOfTasks;
        this.patientId = patientId;
        this.patientPhoto = patientPhoto;
    }

public List<DashboardTasks> patient;

    // This method creates an ArrayList that has three Person objects
// Checkout the project associated with this tutorial on Github if
// you want to use the same images.
    private void initializeData(){
        patient = new ArrayList<>();
        patient.add(new DashboardTasks("Emma Wilson", 4,1234423, R.drawable.ic_plus));
        patient.add(new DashboardTasks("Lavery Maiss", 7,78356, R.drawable.ic_plus));
        patient.add(new DashboardTasks("Lillie Watts", 0,45623, R.drawable.ic_plus));
    }

    public List<DashboardTasks> getPatientList(){
        initializeData();
        return patient;
    }

}
