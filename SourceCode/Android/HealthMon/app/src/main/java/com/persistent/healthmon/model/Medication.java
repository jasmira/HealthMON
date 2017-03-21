package com.persistent.healthmon.model;

import com.persistent.healthmon.util.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

/**
 * Created by pushkar_bhadle on 6/22/2016.
 */
public class Medication {

    String patient_id;
    int drug_id;
    String medicine_qty;
    int created_by;
    String created_date;
    int updated_by;
    int updated_date;
    int duration_in_days;
    String drug_name;
    int due_date;

    //Adapter
    String given_by;
    String role;
    String location;
    String done_date;
    String user_ID;

    //getAPI
    String drug_form;
    String routes;
    String units;
    int server_drug_type;
    String server_drug_description;

    //Drug Names
    String spinner_drug_name;
    String drug_type;

    public Medication(String patient_id, int drug_id, String medicine_qty, int created_by, String created_date, int updated_by, int updated_date, int duration_in_days, String drug_name, int due_date) {
        this.patient_id = patient_id;
        this.drug_id = drug_id;
        this.medicine_qty = medicine_qty;
        this.created_by = created_by;
        this.created_date = created_date;
        this.updated_by = updated_by;
        this.updated_date = updated_date;
        this.duration_in_days = duration_in_days;
        this.drug_name = drug_name;
        this.due_date = due_date;
    }

    public Medication(int drug_id, String drug_name, String drug_form, String units, String routes, int server_drug_type, String server_drug_description, String drug_type) {
        this.drug_id = drug_id;
        this.drug_name = drug_name;
        this.drug_form = drug_form;
        this.units = units;
        this.routes = routes;
        this.server_drug_type = server_drug_type;
        this.server_drug_description = server_drug_description;
        this.drug_type = drug_type;
    }

    public Medication() {
    }

    public String getGiven_by() {
        return given_by;
    }

    public void setGiven_by(String given_by) {
        this.given_by = given_by;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public String getDrug_form() {
        return drug_form;
    }

    public void setDrug_form(String drug_form) {
        this.drug_form = drug_form;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }

    public String getRoutes() {
        return routes;
    }

    public void setRoutes(String routes) {
        this.routes = routes;
    }

    public int getServer_drug_type() {
        return server_drug_type;
    }

    public void setServer_drug_type(int server_drug_type) {
        this.server_drug_type = server_drug_type;
    }

    public String getServer_drug_description() {
        return server_drug_description;
    }

    public void setServer_drug_description(String server_drug_description) {
        this.server_drug_description = server_drug_description;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public int getDrug_id() {
        return drug_id;
    }

    public void setDrug_id(int drug_id) {
        this.drug_id = drug_id;
    }

    public String getDone_date() {
        return done_date;
    }

    public void setDone_date(String done_date) {
        this.done_date = done_date;
    }

    public String getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(String user_ID) {
        this.user_ID = user_ID;
    }

    public String getMedicine_qty() {
        return medicine_qty;
    }

    public void setMedicine_qty(String medicine_qty) {
        this.medicine_qty = medicine_qty;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public int getUpdated_date() {
        return updated_date;
    }

    public String getSpinner_drug_name() {
        return spinner_drug_name;
    }

    public void setSpinner_drug_name(String spinner_drug_name) {
        this.spinner_drug_name = spinner_drug_name;
    }

    public String getDrug_type() {
        return drug_type;
    }

    public void setDrug_type(String drug_type) {
        this.drug_type = drug_type;
    }

    public void setUpdated_date(int updated_date) {
        this.updated_date = updated_date;
    }

    public int getDuration_in_days() {
        return duration_in_days;
    }

    public void setDuration_in_days(int duration_in_days) {
        this.duration_in_days = duration_in_days;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public int getDue_date() {
        return due_date;
    }

    public void setDue_date(int due_date) {
        this.due_date = due_date;
    }

    @Override
    public String toString() {
        return "Medication{" +
                "patient_id='" + patient_id + '\'' +
                ", drug_id=" + drug_id +
                ", medicine_qty='" + medicine_qty + '\'' +
                ", created_by=" + created_by +
                ", created_date='" + created_date + '\'' +
                ", updated_by=" + updated_by +
                ", updated_date=" + updated_date +
                ", duration_in_days=" + duration_in_days +
                ", drug_name='" + drug_name + '\'' +
                ", due_date=" + due_date +
                ", given_by='" + given_by + '\'' +
                ", role='" + role + '\'' +
                ", location='" + location + '\'' +
                ", done_date='" + done_date + '\'' +
                ", spinner_drug_name='" + spinner_drug_name + '\'' +
                ", drug_type='" + drug_type + '\'' +
                '}';
    }

    public String toStringSpinner() {
        return "Medication{" +
                "spinner_drug_name='" + spinner_drug_name + '\'' +
                ", drug_type='" + drug_type + '\'' +
                '}';
    }

    public static Comparator<Medication> medicationDATE = new Comparator<Medication>() {

        public int compare(Medication s1, Medication s2) {

            String h1 = s1.getCreated_date();
            String h2 = s2.getCreated_date();
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

    public String toStringMedicationInsert() {

        String strDate = this.created_date;
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING);
        SimpleDateFormat sdf2 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT);
        String strstrDate = null;
        try {
            Date date = sdf.parse(strDate);
            strstrDate = sdf2.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        return  // "" +// this.user_ID +
                "" + this.patient_id +
                "," + this.drug_id+
                "," + this.medicine_qty+
                "," + this.given_by+
                "," + strstrDate +
                "," + this.duration_in_days +
                "," + this.drug_type ;
    }

}
