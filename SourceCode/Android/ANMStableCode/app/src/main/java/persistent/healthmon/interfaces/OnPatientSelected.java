package persistent.healthmon.interfaces;


import persistent.healthmon.model.PatientPersonalInfo;

/**
 * Created by khyati_shah on 5/10/2016.
 */
public interface OnPatientSelected {
    void onPatientSelected(PatientPersonalInfo patientPersonalInfo);

    void onMarkVisitSelected(PatientPersonalInfo patientPersonalInfo);
}
