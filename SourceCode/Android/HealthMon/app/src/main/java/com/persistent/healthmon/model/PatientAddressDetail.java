package com.persistent.healthmon.model;

/**
 * Created by khyati_shah on 4/7/2016.
 */
public class PatientAddressDetail {

    String addr1;
    String addr2;
    int districtId;
    int talId;
    int villageId;
    String ward;
    String pin;
    boolean is_Submitted;
    boolean is_Uploaded;

    public boolean is_Submitted() {
        return is_Submitted;
    }

    public void setIs_Submitted(boolean is_Submitted) {
        this.is_Submitted = is_Submitted;
    }

    public boolean is_Uploaded() {
        return is_Uploaded;
    }

    public void setIs_Uploaded(boolean is_Uploaded) {
        this.is_Uploaded = is_Uploaded;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public int getTalId() {
        return talId;
    }

    public void setTalId(int talId) {
        this.talId = talId;
    }

    public int getVillageId() {
        return villageId;
    }

    public void setVillageId(int villageId) {
        this.villageId = villageId;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    @Override
    public String toString() {
        // return this.addr1 + "," + this.addr2 + "," + this.district + "," + this.tal + "," + this.villageId + "," + this.ward + "," + this.pin;
        return this.addr1 + "," + this.addr2;
    }
}
