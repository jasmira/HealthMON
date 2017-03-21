package com.persistent.healthmon.Comparators;

import com.persistent.healthmon.model.PatientPersonalInfo;

import java.util.Comparator;

/**
 * Created by khyati_shah on 5/12/2016.
 */
public class PatientLocalityComparator implements Comparator<PatientPersonalInfo> {

    @Override
    public int compare(PatientPersonalInfo patient1, PatientPersonalInfo patient2) {
        return patient1.getLocation().compareTo(patient2.getLocation());
    }
}