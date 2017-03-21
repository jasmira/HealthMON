package persistent.healthmon.model;

/**
 * Created by pushkar_bhadle on 4/12/2016.
 */
public class Tasks {

    public int User_Tasks_id;
    public int HM_User_HM_Programs_Programs_id;
    public int HM_User_id;
    public String User_Task_Name;
    public String User_Task_Description;
    public String User_Task_Type;
    public int User_Task_Severity;
    public String User_Task_Date;
    public int User_Task_Actionable;
    public String HM_Patient_id;
    public int HM_Task_id;
    public String patient_full_name;
    String date;

    public Tasks() {
    }

    public Tasks(int user_Tasks_id, int HM_User_HM_Programs_Programs_id, int HM_User_id,
                 String user_Task_Name, String user_Task_Description, String user_Task_Type,
                 int user_Task_Severity, String user_Task_Date, int user_Task_Actionable,
                 String HM_Patient_id, int HM_Task_id, String patient_full_name, String date) {
        User_Tasks_id = user_Tasks_id;
        this.patient_full_name = patient_full_name;
        this.HM_Task_id = HM_Task_id;
        this.HM_Patient_id = HM_Patient_id;
        User_Task_Actionable = user_Task_Actionable;
        User_Task_Severity = user_Task_Severity;
        User_Task_Date = user_Task_Date;
        User_Task_Type = user_Task_Type;
        User_Task_Description = user_Task_Description;
        User_Task_Name = user_Task_Name;
        this.HM_User_HM_Programs_Programs_id = HM_User_HM_Programs_Programs_id;
        this.HM_User_id = HM_User_id;
        this.date = date;
    }


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUser_Tasks_id() {
        return User_Tasks_id;
    }

    public void setUser_Tasks_id(int user_Tasks_id) {
        User_Tasks_id = user_Tasks_id;
    }

    public String getPatient_full_name() {
        return patient_full_name;
    }

    public void setPatient_full_name(String patient_full_name) {
        this.patient_full_name = patient_full_name;
    }

    public int getHM_Task_id() {
        return HM_Task_id;
    }

    public void setHM_Task_id(int HM_Task_id) {
        this.HM_Task_id = HM_Task_id;
    }

    public String getHM_Patient_id() {
        return HM_Patient_id;
    }

    public void setHM_Patient_id(String HM_Patient_id) {
        this.HM_Patient_id = HM_Patient_id;
    }

    public int getUser_Task_Actionable() {
        return User_Task_Actionable;
    }

    public void setUser_Task_Actionable(int user_Task_Actionable) {
        User_Task_Actionable = user_Task_Actionable;
    }

    public String getUser_Task_Date() {
        return User_Task_Date;
    }

    public void setUser_Task_Date(String user_Task_Date) {
        User_Task_Date = user_Task_Date;
    }

    public int getHM_User_HM_Programs_Programs_id() {
        return HM_User_HM_Programs_Programs_id;
    }

    public void setHM_User_HM_Programs_Programs_id(int HM_User_HM_Programs_Programs_id) {
        this.HM_User_HM_Programs_Programs_id = HM_User_HM_Programs_Programs_id;
    }

    public int getHM_User_id() {
        return HM_User_id;
    }

    public void setHM_User_id(int HM_User_id) {
        this.HM_User_id = HM_User_id;
    }

    public String getUser_Task_Name() {
        return User_Task_Name;
    }

    public void setUser_Task_Name(String user_Task_Name) {
        User_Task_Name = user_Task_Name;
    }

    public String getUser_Task_Description() {
        return User_Task_Description;
    }

    public void setUser_Task_Description(String user_Task_Description) {
        User_Task_Description = user_Task_Description;
    }

    public String getUser_Task_Type() {
        return User_Task_Type;
    }

    public void setUser_Task_Type(String user_Task_Type) {
        User_Task_Type = user_Task_Type;
    }

    public int getUser_Task_Severity() {
        return User_Task_Severity;
    }

    public void setUser_Task_Severity(int user_Task_Severity) {
        User_Task_Severity = user_Task_Severity;
    }

    @Override
    public String toString() {
        return "Tasks{" +
                "User_Tasks_id=" + User_Tasks_id +
                ", HM_User_HM_Programs_Programs_id=" + HM_User_HM_Programs_Programs_id +
                ", HM_User_id=" + HM_User_id +
                ", User_Task_Name='" + User_Task_Name + '\'' +
                ", User_Task_Description='" + User_Task_Description + '\'' +
                ", User_Task_Type='" + User_Task_Type + '\'' +
                ", User_Task_Severity=" + User_Task_Severity +
                ", User_Task_Date='" + User_Task_Date + '\'' +
                ", User_Task_Actionable=" + User_Task_Actionable +
                ", HM_Patient_id=" + HM_Patient_id +
                ", HM_Task_id=" + HM_Task_id +
                ", patient_full_name='" + patient_full_name + '\'' +
                ", date=" + date +
                '}';
    }
}
