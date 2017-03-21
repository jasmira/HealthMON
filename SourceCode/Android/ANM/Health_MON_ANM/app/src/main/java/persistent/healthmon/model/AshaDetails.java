package persistent.healthmon.model;

import java.util.Arrays;

/**
 * Created by pushkar_bhadle on 4/26/2016.
 */
public class AshaDetails {

    byte[] asha_pic;
    String asha_name;
    String asha_id;
    String qualification;
    String EmergencyContact;
    String Address;
    String Address2;
    String Contact;
    String lastSync;
    int notificationCount;

    public AshaDetails(byte[] asha_pic, String asha_name, String asha_id, String qualification, String emergencyContact, String address, String address2, String contact) {
        this.asha_pic = asha_pic;
        this.asha_name = asha_name;
        this.asha_id = asha_id;
        this.qualification = qualification;
        EmergencyContact = emergencyContact;
        Address = address;
        Address2 = address2;
        Contact = contact;
    }

    public AshaDetails(String lastSync, int notificationCount) {
        this.lastSync = lastSync;
        this.notificationCount = notificationCount;
    }

    public AshaDetails() {

    }

    public byte[] getAsha_pic() {
        return asha_pic;
    }

    public void setAsha_pic(byte[] asha_pic) {
        this.asha_pic = asha_pic;
    }

    public String getAddress2() {
        return Address2;
    }

    public void setAddress2(String address2) {
        Address2 = address2;
    }

    public String getAsha_name() {
        return asha_name;
    }

    public void setAsha_name(String asha_name) {
        this.asha_name = asha_name;
    }

    public String getAsha_id() {
        return asha_id;
    }

    public void setAsha_id(String asha_id) {
        this.asha_id = asha_id;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getContact() {
        return Contact;
    }

    public void setContact(String contact) {
        Contact = contact;
    }

    public String getEmergencyContact() {
        return EmergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        EmergencyContact = emergencyContact;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getLastSync() {
        return lastSync;
    }

    public void setLastSync(String lastSync) {
        this.lastSync = lastSync;
    }

    public int getNotificationCount() {
        return notificationCount;
    }

    public void setNotificationCount(int notificationCount) {
        this.notificationCount = notificationCount;
    }

    @Override
    public String toString() {
        return "AshaDetails{" +
                "asha_pic=" + Arrays.toString(asha_pic) +
                ", asha_name='" + asha_name + '\'' +
                ", asha_id=" + asha_id +
                ", qualification='" + qualification + '\'' +
                ", EmergencyContact='" + EmergencyContact + '\'' +
                ", Address='" + Address + '\'' +
                ", Address2='" + Address2 + '\'' +
                ", Contact='" + Contact + '\'' +
                ", lastSync='" + lastSync + '\'' +
                ", notificationCount=" + notificationCount +
                '}';
    }
}
