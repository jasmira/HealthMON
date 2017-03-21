package persistent.healthmon.model;

/**
 * Created by khyati_shah on 4/7/2016.
 */
public class ProgramInfo {
    String ashaId;
    String patientId;
    String program_id;
    String program_name;
    String LMPDate;
    String EDD;
    boolean isFirstPregnancy;
    String notes;
    String gravida;
    String parity;
    String pastAbortions;
    String pastStillBirths;
    String livingChildren;
    String natureofPreviousDelivery;
    String previousDeliveryDate;
    String timeStamp;
    boolean is_Submitted;
    boolean is_Uploaded;


    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

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

    public String getProgram_id() {
        return program_id;
    }

    public void setProgram_id(String program_id) {
        this.program_id = program_id;
    }

    public String getProgram_name() {
        return program_name;
    }

    public void setProgram_name(String program_name) {
        this.program_name = program_name;
    }

    public String getLMPDate() {
        return LMPDate;
    }

    public void setLMPDate(String LMPDate) {
        this.LMPDate = LMPDate;
    }

    public String getEDD() {
        return EDD;
    }

    public void setEDD(String EDD) {
        this.EDD = EDD;
    }

    public boolean isFirstPregnancy() {
        return isFirstPregnancy;
    }

    public void setIsFirstPregnancy(boolean isFirstPregnancy) {
        this.isFirstPregnancy = isFirstPregnancy;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getGravida() {
        return gravida;
    }

    public void setGravida(String gravida) {
        this.gravida = gravida;
    }

    public String getParity() {
        return parity;
    }

    public void setParity(String parity) {
        this.parity = parity;
    }

    public String getPastAbortions() {
        return pastAbortions;
    }

    public void setPastAbortions(String pastAbortions) {
        this.pastAbortions = pastAbortions;
    }

    public String getPastStillBirths() {
        return pastStillBirths;
    }

    public void setPastStillBirths(String pastStillBirths) {
        this.pastStillBirths = pastStillBirths;
    }

    public String getLivingChildren() {
        return livingChildren;
    }

    public void setLivingChildren(String livingChildren) {
        this.livingChildren = livingChildren;
    }

    public String getNatureofPreviousDelivery() {
        return natureofPreviousDelivery;
    }

    public void setNatureofPreviousDelivery(String natureofPreviousDelivery) {
        this.natureofPreviousDelivery = natureofPreviousDelivery;
    }

    public String getPreviousDeliveryDate() {
        return previousDeliveryDate;
    }

    public void setPreviousDeliveryDate(String previousDeliveryDate) {
        this.previousDeliveryDate = previousDeliveryDate;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getAshaId() {
        return ashaId;
    }

    public void setAshaId(String ashaId) {
        this.ashaId = ashaId;
    }

    @Override
    public String toString() {
        // return this.patientId + "," + this.program_name + "," + this.program_id + "," + this.LMPDate + "," + this.EDD + "," + ((this.isFirstPregnancy) ? 1 : 0) + "," + this.notes + "," + this.gravida + "," + this.parity + "," + this.pastAbortions + "," + this.pastStillBirths + "," + this.livingChildren + "," + this.natureofPreviousDelivery + "," + this.previousDeliveryDate;
        return this.patientId + "," + this.LMPDate + "," + this.EDD + "," + this.isFirstPregnancy + "," + this.gravida + "," + this.parity + "," + this.pastAbortions + "," + this.pastStillBirths + "," + this.livingChildren + "," + this.natureofPreviousDelivery + "," + this.previousDeliveryDate + "," + this.notes + "," + this.timeStamp + "," + this.ashaId + "," + this.timeStamp + "," + this.ashaId;
    }

}