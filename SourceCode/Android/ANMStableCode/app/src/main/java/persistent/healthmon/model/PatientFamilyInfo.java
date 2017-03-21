package persistent.healthmon.model;

/**
 * Created by khyati_shah on 3/17/2016.
 */
public class PatientFamilyInfo {
    String ashaId;
    String patient_id;
    String family_member_id;
    String name;
    int genderId;
    String dob;
    int age;
    String relation_to_patient;
    String marrital_status;
    String education;
    int idCardTypeId;
    String idCardNumber;
    int categoryId;
    String contact;
    String timestamp;
    boolean is_Submitted;
    boolean is_Uploaded;


    public String getIdCardNumber() {
        return idCardNumber;
    }

    public void setIdCardNumber(String idCardNumber) {
        this.idCardNumber = idCardNumber;
    }

    public String getFamily_member_id() {
        return family_member_id;
    }

    public void setFamily_member_id(String family_member_id) {
        this.family_member_id = family_member_id;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getRelation_to_patient() {
        return relation_to_patient;
    }

    public void setRelation_to_patient(String relation_to_patient) {
        this.relation_to_patient = relation_to_patient;
    }


    public String getMarrital_status() {
        return marrital_status;
    }

    public void setMarrital_status(String marrital_status) {
        this.marrital_status = marrital_status;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
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

    public int getGenderId() {
        return genderId;
    }

    public void setGenderId(int genderId) {
        this.genderId = genderId;
    }

    public int getIdCardTypeId() {
        return idCardTypeId;
    }

    public void setIdCardTypeId(int idCardTypeId) {
        this.idCardTypeId = idCardTypeId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public String getAshaId() {
        return ashaId;
    }

    public void setAshaId(String ashaId) {
        this.ashaId = ashaId;
    }

    @Override
    public String toString() {
        String firstName = "", middleName = "", lstName = "";
        String[] nameSplit = this.name.split("\\s+");
        for (int i = 0; i < nameSplit.length; i++) {
            switch (i) {
                case 0:
                    firstName = nameSplit[0];
                    break;
                case 1:
                    middleName = nameSplit[1];
                    break;
                case 2:
                    lstName = nameSplit[2];
                    break;
            }
        }
        // return this.family_member_id + "," + this.patient_id + "," + this.name + "," + this.dob + "," + this.age + "," + this.genderId + "," + this.education + "," + this.relation_to_patient + "," + this.idCardTypeId + "," + this.idCardNumber + "," + this.category + "," + this.marrital_status + "," + this.contact;
       /* return this.family_member_id + "," + this.patient_id + "," + this.idCardTypeId + "," + this.genderId + "," + this.categoryId + ", \\u0020" +
                firstName + "\\u0020 , \\u0020" + middleName + "\\u0020 , \\u0020" + lstName + "\\u0020 ," + this.dob + "," + this.age + "," + this.education + "," +                this.relation_to_patient + "," + this.idCardNumber + "," + this.marrital_status + "," + this.contact + "," + this.timestamp + "," +
                this.ashaId + "," + this.timestamp + "," + this.ashaId;*/
        return this.family_member_id + "," + this.patient_id + "," + this.idCardTypeId + "," + this.genderId + "," + this.categoryId + "," + firstName + "," + middleName + "," + lstName + "," + this.dob + "," + this.age + "," + this.education + "," + this.relation_to_patient + "," + this.idCardNumber + "," + this.marrital_status + "," + this.contact + "," + this.timestamp + "," + this.ashaId + "," + this.ashaId + "," + this.timestamp;

    }
}
