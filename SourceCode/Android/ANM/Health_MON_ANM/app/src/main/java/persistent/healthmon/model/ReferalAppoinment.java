package persistent.healthmon.model;

/**
 * Created by khyati_shah on 7/28/2016.
 */
public class ReferalAppoinment {
    String MO_Id;
    String patientId;
    String appoinmentDate;
    String appoinmentFlag;
    String createdDate;
    String createdBy;
    String reffred;
    String acceptedFlag;

    public String getMO_Id() {
        return MO_Id;
    }

    public void setMO_Id(String MO_Id) {
        this.MO_Id = MO_Id;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getAppoinmentDate() {
        return appoinmentDate;
    }

    public void setAppoinmentDate(String appoinmentDate) {
        this.appoinmentDate = appoinmentDate;
    }

    public String getAppoinmentFlag() {
        return appoinmentFlag;
    }

    public void setAppoinmentFlag(String appoinmentFlag) {
        this.appoinmentFlag = appoinmentFlag;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getReffred() {
        return reffred;
    }

    public void setReffred(String reffred) {
        this.reffred = reffred;
    }

    public String getAcceptedFlag() {
        return acceptedFlag;
    }

    public void setAcceptedFlag(String acceptedFlag) {
        this.acceptedFlag = acceptedFlag;
    }
}
