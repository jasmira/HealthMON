package com.persistent.healthmon.model;

/**
 * Created by manasveena_suguru on 11/18/2016.
 */

public class Contacts {

    private String contactName;
    private String status;
    private String taluka;

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTaluka() {
        return taluka;
    }

    public void setTaluka(String taluka) {
        this.taluka = taluka;
    }

    public Contacts(String contactName, String status, String taluka) {
        this.contactName = contactName;
        this.status = status;
        this.taluka = taluka;
    }

    public Contacts(){

    }

}
