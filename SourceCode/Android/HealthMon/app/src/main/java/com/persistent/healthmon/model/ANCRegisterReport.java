package com.persistent.healthmon.model;

/**
 * Created by khyati_shah on 6/7/2016.
 */
public class ANCRegisterReport {
    String ashaId;
    String patientId;
    String patientFirstName;
    String patientMiddleName;
    String patientLastName;
    String LMPDate;
    String regDtae;
    int villageId;
    String ward;
    String age;
    String EDD;
    String deliveryNum;

    public int getVillageId() {
        return villageId;
    }

    public void setVillageId(int villageId) {
        this.villageId = villageId;
    }

    public String getPatientLastName() {
        return patientLastName;
    }

    public void setPatientLastName(String patientLastName) {
        this.patientLastName = patientLastName;
    }

    public String getPatientMiddleName() {
        return patientMiddleName;
    }

    public void setPatientMiddleName(String patientMiddleName) {
        this.patientMiddleName = patientMiddleName;
    }

    public String getAshaId() {
        return ashaId;
    }

    public void setAshaId(String ashaId) {
        this.ashaId = ashaId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }


    public String getPatientFirstName() {
        return patientFirstName;
    }

    public void setPatientFirstName(String patientFirstName) {
        this.patientFirstName = patientFirstName;
    }

    public String getLMPDate() {
        return LMPDate;
    }

    public void setLMPDate(String LMPDate) {
        this.LMPDate = LMPDate;
    }

    public String getRegDtae() {
        return regDtae;
    }

    public void setRegDtae(String regDtae) {
        this.regDtae = regDtae;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getEDD() {
        return EDD;
    }

    public void setEDD(String EDD) {
        this.EDD = EDD;
    }

    public String getDeliveryNum() {
        return deliveryNum;
    }

    public void setDeliveryNum(String deliveryNum) {
        this.deliveryNum = deliveryNum;
    }
}
