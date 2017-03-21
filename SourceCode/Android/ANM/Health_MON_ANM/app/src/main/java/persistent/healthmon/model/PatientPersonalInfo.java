package persistent.healthmon.model;

/**
 * Created by khyati_shah on 3/17/2016.
 */
public class PatientPersonalInfo {

    String asha_id;
    String patient_id;
    byte[] patient_image;
    String patient_image_string;
    String salutation;
    String firstName;
    String middleName;
    String lastName;
    //String gender;
    int genderId;
    String dob;
    int age;
    String place_of_birth;
    String marrital_status;
    //String category;
    int categoryId;
    boolean bpl;
    String language;
    String education;
    //String idCardType;
    int idCardTypeId;
    String idCardNumber;
    String contact;
    String em_contact;
    int priority;
    String timeStamp;
    boolean is_Submitted;
    boolean is_Uploaded;
    String patient_image_path;
    String EDD;
    String Location;

    public String getEDD() {
        return EDD;
    }

    public void setEDD(String EDD) {
        this.EDD = EDD;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    public String getPatient_image_path() {
        return patient_image_path;
    }

    public void setPatient_image_path(String patient_image_path) {
        this.patient_image_path = patient_image_path;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getEm_contact() {
        return em_contact;
    }

    public void setEm_contact(String em_contact) {
        this.em_contact = em_contact;
    }

    public String getSalutation() {
        return salutation;
    }

    public void setSalutation(String salutation) {
        this.salutation = salutation;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

  /*  public String getIdCardType() {
        return idCardType;
    }

    public void setIdCardType(String idCardType) {
        this.idCardType = idCardType;
    }
*/
    public String getIdCardNumber() {
        return idCardNumber;
    }

    public void setIdCardNumber(String idCardNumber) {
        this.idCardNumber = idCardNumber;
    }

    public String getAsha_id() {
        return asha_id;
    }

    public void setAsha_id(String asha_id) {
        this.asha_id = asha_id;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public byte[] getPatient_image() {
        return patient_image;
    }

    public void setPatient_image(byte[] patient_image) {
        this.patient_image = patient_image;
    }

    public String getPatient_image_string() {
        return patient_image_string;
    }

    public void setPatient_image_string(String patient_image_string) {
        this.patient_image_string = patient_image_string;
    }
    /*public void setPatient_image_string(String patient_image_path) {
        this.patient_image_path = patient_image_path;
    }*/

/*
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
*/

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getPlace_of_birth() {
        return place_of_birth;
    }

    public void setPlace_of_birth(String place_of_birth) {
        this.place_of_birth = place_of_birth;
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

/*
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
*/

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public boolean isBpl() {
        return bpl;
    }

    public void setBpl(boolean bpl) {
        this.bpl = bpl;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getIdCardTypeId() {
        return idCardTypeId;
    }

    public void setIdCardTypeId(int idCardTypeId) {
        this.idCardTypeId = idCardTypeId;
    }

    @Override
    public String toString() {
        // return this.asha_id + "," + this.patient_id + "," + this.patient_image_string + "," + this.salutation + "," + this.firstName + "," + this.middleName + "," + this.lastName + "," + genderId + "," + this.language + "," + this.place_of_birth + "," + this.dob + "," + this.age + "," + this.categoryId + "," + this.education + "," + ((this.bpl) ? 1 : 0) + "," + this.marrital_status + "," + this.contact + "," + this.idCardType + "," + this.idCardNumber + "," + this.em_contact + ",";
        return this.patient_id + "," + this.idCardTypeId + "," + this.genderId + "," + this.categoryId + "," + this.salutation + "," + this.firstName + "," + this.middleName + "," + this.lastName + "," + this.dob + "," + this.age + "," + this.language + "," + this.place_of_birth + "," + this.education + "," + this.bpl + "," + this.marrital_status + "," + this.contact + "," + this.patient_image_string + "," + this.em_contact + ",";
    }
}

