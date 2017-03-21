package com.persistent.healthmon.model;

/**
 * Created by khyati_shah on 6/17/2016.
 */
public class Referal {

    String refId;
    String userId;
    String patientId;
    String PHC_id;
    String villageId;
    String referalReason;
    String referalNotes;
    String refDate;
    String createdBy;
    String createdDate;
    String patientName;
    boolean isEdited;
    boolean isUploaded;

    public boolean isEdited() {
        return isEdited;
    }

    public void setIsEdited(boolean isEdited) {
        this.isEdited = isEdited;
    }

    public boolean isUploaded() {
        return isUploaded;
    }

    public void setIsUploaded(boolean isUploaded) {
        this.isUploaded = isUploaded;
    }

    public String getRefId() {
        return refId;
    }

    public void setRefId(String refId) {
        this.refId = refId;
    }

    public String getUserId() {
        return userId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getPHC_id() {
        return PHC_id;
    }

    public void setPHC_id(String PHC_id) {
        this.PHC_id = PHC_id;
    }

    public String getVillageId() {
        return villageId;
    }

    public void setVillageId(String villageId) {
        this.villageId = villageId;
    }

    public String getReferalReason() {
        return referalReason;
    }

    public void setReferalReason(String referalReason) {
        this.referalReason = referalReason;
    }

    public String getReferalNotes() {
        return referalNotes;
    }

    public void setReferalNotes(String referalNotes) {
        this.referalNotes = referalNotes;
    }

    public String getRefDate() {
        return refDate;
    }

    public void setRefDate(String refDate) {
        this.refDate = refDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return /*this.refId + "," + */this.userId + "," + this.patientId + "," + this.PHC_id + "," + this.villageId + "," + this.referalNotes + "," + this.referalReason + "," + this.refDate + "," + this.createdBy + "," + this.createdDate;// +","+this.patientName;
    }
}
