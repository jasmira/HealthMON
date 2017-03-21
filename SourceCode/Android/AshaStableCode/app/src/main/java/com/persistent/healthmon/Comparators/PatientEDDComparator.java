package com.persistent.healthmon.Comparators;

import com.persistent.healthmon.model.PatientPersonalInfo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

/**
 * Created by khyati_shah on 5/12/2016.
 */
public class PatientEDDComparator implements Comparator<PatientPersonalInfo> {

    @Override
    public int compare(PatientPersonalInfo patient1, PatientPersonalInfo patient2) {
        Date d1 = null;
        Date d2 = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            d1 = dateFormat.parse(patient1.getEDD());
            d2 = dateFormat.parse(patient2.getEDD());
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // return (d1.getTime() > d2.getTime() ? -1 : 1);     //descending
        return (d1.getTime() > d2.getTime() ? 1 : -1);     //ascending
    }
}
