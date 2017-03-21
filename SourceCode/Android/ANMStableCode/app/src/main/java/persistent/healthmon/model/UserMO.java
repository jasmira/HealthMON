package persistent.healthmon.model;

/**
 * Created by khyati_shah on 7/27/2016.
 */
public class UserMO {
    String MoId;
    String MOName;
    String PHCId;
    String MOQualification;

    public String getMoId() {
        return MoId;
    }

    public void setMoId(String moId) {
        MoId = moId;
    }

    public String getMOName() {
        return MOName;
    }

    public void setMOName(String MOName) {
        this.MOName = MOName;
    }

    public String getPHCId() {
        return PHCId;
    }

    public void setPHCId(String PHCId) {
        this.PHCId = PHCId;
    }

    public String getMOQualification() {
        return MOQualification;
    }

    public void setMOQualification(String MOQualification) {
        this.MOQualification = MOQualification;
    }
}
