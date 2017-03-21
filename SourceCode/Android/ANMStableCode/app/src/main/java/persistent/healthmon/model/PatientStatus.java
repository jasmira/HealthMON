package persistent.healthmon.model;

/**
 * Created by khyati_shah on 6/30/2016.
 */
public class PatientStatus {
    String patientId;
    int hbFlag;
    double hbValue;
    int bpSysFlag;
    int bpSysValue;
    int bpDiaFlag;
    int bpDiaValue;
    int bpPulseFlag;
    int bpPulseValue;
    int weightFlag;
    double weightValue;
    int oxiPulseFlag;
    int oxiPulseValue;
    int oxiSpO2Flag;
    int oxiSpO2Value;
    int overallFlag;
    String statusMsg;

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public int getHbFlag() {
        return hbFlag;
    }

    public void setHbFlag(int hbFlag) {
        this.hbFlag = hbFlag;
    }

    public double getHbValue() {
        return hbValue;
    }

    public void setHbValue(double hbValue) {
        this.hbValue = hbValue;
    }

    public int getBpSysFlag() {
        return bpSysFlag;
    }

    public void setBpSysFlag(int bpSysFlag) {
        this.bpSysFlag = bpSysFlag;
    }

    public int getBpSysValue() {
        return bpSysValue;
    }

    public void setBpSysValue(int bpSysValue) {
        this.bpSysValue = bpSysValue;
    }

    public int getBpDiaFlag() {
        return bpDiaFlag;
    }

    public void setBpDiaFlag(int bpDiaFlag) {
        this.bpDiaFlag = bpDiaFlag;
    }

    public int getBpDiaValue() {
        return bpDiaValue;
    }

    public void setBpDiaValue(int bpDiaValue) {
        this.bpDiaValue = bpDiaValue;
    }

    public int getBpPulseFlag() {
        return bpPulseFlag;
    }

    public void setBpPulseFlag(int bpPulseFlag) {
        this.bpPulseFlag = bpPulseFlag;
    }

    public int getBpPulseValue() {
        return bpPulseValue;
    }

    public void setBpPulseValue(int bpPulseValue) {
        this.bpPulseValue = bpPulseValue;
    }

    public int getWeightFlag() {
        return weightFlag;
    }

    public void setWeightFlag(int weightFlag) {
        this.weightFlag = weightFlag;
    }

    public double getWeightValue() {
        return weightValue;
    }

    public void setWeightValue(double weightValue) {
        this.weightValue = weightValue;
    }

    public int getOxiPulseFlag() {
        return oxiPulseFlag;
    }

    public void setOxiPulseFlag(int oxiPulseFlag) {
        this.oxiPulseFlag = oxiPulseFlag;
    }

    public int getOxiPulseValue() {
        return oxiPulseValue;
    }

    public void setOxiPulseValue(int oxiPulseValue) {
        this.oxiPulseValue = oxiPulseValue;
    }

    public int getOxiSpO2Flag() {
        return oxiSpO2Flag;
    }

    public void setOxiSpO2Flag(int oxiSpO2Flag) {
        this.oxiSpO2Flag = oxiSpO2Flag;
    }

    public int getOxiSpO2Value() {
        return oxiSpO2Value;
    }

    public void setOxiSpO2Value(int oxiSpO2Value) {
        this.oxiSpO2Value = oxiSpO2Value;
    }

    public int getOverallFlag() {
        return overallFlag;
    }

    public void setOverallFlag(int overallFlag) {
        this.overallFlag = overallFlag;
    }

    public String getStatusMsg() {
        return statusMsg;
    }

    public void setStatusMsg(String statusMsg) {
        this.statusMsg = statusMsg;
    }
}
