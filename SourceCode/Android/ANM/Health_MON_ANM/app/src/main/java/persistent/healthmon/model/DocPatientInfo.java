package persistent.healthmon.model;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 6/15/2016.
 */
public class DocPatientInfo {

    String docName;
    String docId;
    ArrayList<PatientPersonalInfo> patientPersonalInfos;

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public ArrayList<PatientPersonalInfo> getPatientPersonalInfos() {
        return patientPersonalInfos;
    }

    public void setPatientPersonalInfos(ArrayList<PatientPersonalInfo> patientPersonalInfos) {
        this.patientPersonalInfos = patientPersonalInfos;
    }

    public String getDocId() {
        return docId;
    }

    public void setDocId(String docId) {
        this.docId = docId;
    }
}
