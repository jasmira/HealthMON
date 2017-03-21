package persistent.healthmon.model;

/**
 * Created by gaurav_polekar on 7/20/2016.
 */
public class CarePlanRow implements Comparable<CarePlanRow>{
    String activity,task,frequency,role;
    String id,templateName;
    String patientId;

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    int type;

    public CarePlanRow(){
        this.type = 1;
    }
    public CarePlanRow(int Type,String templateName){
        this.type = type;
        this.templateName = templateName;
    }
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public int compareTo(CarePlanRow another) {
        return this.getActivity().compareTo(another.getActivity());
    }

    @Override
    public boolean equals(Object o) {
        CarePlanRow object = (CarePlanRow)o;
        return this.getTemplateName().equals(object.getTemplateName());
    }

    @Override
    public int hashCode() {
        return 1;
    }
}
