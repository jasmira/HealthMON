package com.persistent.healthmon.util;

import android.content.Context;
import android.content.SharedPreferences;

import com.google.gson.Gson;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.model.PatientFamilyInfo;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.ProgramInfo;

import java.util.ArrayList;

/**
 * Created by khyati_shah on 4/5/2016.
 */
public class PreferanceManager {

    private static final String PREF_HEATHMON = "HealthMonPref";
    private static final String KEY_USERNAME = "user_";
    private static final String KEY_IS_REGISTRATION_SESSION_STORED = "sessionStored";
    private static final String KEY_PATIENT_PERSONAL_INFO = "patientPersonalInfo";
    private static final String KEY_PATIENT_ADDRESS_INFO = "patientAddressInfo";
    private static final String KEY_PATIENT_PROGRAM_INFO = "patientProgramInfo";
    private static final String KEY_PATIENT_FAMILY_INFO = "patientFamilyInfo";
    private static final String KEY_PATIENT_FAMILY_NUMBER_INFO = "patientFamilyNumber";
    private static final String KEY_ASHA_ID = "ashaId";

    public static void setIsRegistrationSessionStored(Context context, boolean val) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putBoolean(KEY_IS_REGISTRATION_SESSION_STORED, val);
        editor.commit();
    }

    public static boolean getIsRegistrationSessionStored(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        Gson gson = new Gson();
        return pref.getBoolean(KEY_IS_REGISTRATION_SESSION_STORED, false);
    }

    public static ArrayList<String> getLoginCredentials(Context context, String userName) {
        ArrayList<String> arrCredentials = new ArrayList<String>();
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        if (!pref.getString(KEY_USERNAME + userName, "").equalsIgnoreCase("")) {
            arrCredentials.add(pref.getString(KEY_USERNAME + userName, ""));
            arrCredentials.add(pref.getString(pref.getString(KEY_USERNAME + userName, ""), ""));
        }
        return arrCredentials;
    }

    public static void setLoginCredentials(Context context, String userName, String password) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString(KEY_USERNAME + userName, userName);
        editor.putString(userName, password);
        editor.commit();
    }

    public static void setAshaId(Context context, String userName) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString(KEY_ASHA_ID, userName);
        editor.commit();
    }

    public static String getAshaId(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        return pref.getString(KEY_ASHA_ID, "");
    }

    public static void setPatientPersonalInfo(Context context, PatientPersonalInfo patientPersonalInfo) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor prefsEditor = pref.edit();
        Gson gson = new Gson();
        String json = gson.toJson(patientPersonalInfo);
        prefsEditor.putString(KEY_PATIENT_PERSONAL_INFO, json);
        prefsEditor.commit();
        setIsRegistrationSessionStored(context, true);
    }

    public static PatientPersonalInfo getPatientPersonalInfo(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        Gson gson = new Gson();
        String json = pref.getString(KEY_PATIENT_PERSONAL_INFO, "");
        PatientPersonalInfo patientPersonalInfo = gson.fromJson(json, PatientPersonalInfo.class);
        return patientPersonalInfo;
    }

    public static void setPatientAddressInfo(Context context, PatientAddressDetail addressDetail) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor prefsEditor = pref.edit();
        Gson gson = new Gson();
        String json = gson.toJson(addressDetail);
        prefsEditor.putString(KEY_PATIENT_ADDRESS_INFO, json);
        prefsEditor.commit();
        setIsRegistrationSessionStored(context, true);
    }

    public static PatientAddressDetail getPatientAddressInfo(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        Gson gson = new Gson();
        String json = pref.getString(KEY_PATIENT_ADDRESS_INFO, "");
        PatientAddressDetail patientAddressDetail = gson.fromJson(json, PatientAddressDetail.class);
        return patientAddressDetail;
    }


    public static void setPatientProgramInfo(Context context, ProgramInfo programInfo) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor prefsEditor = pref.edit();
        Gson gson = new Gson();
        String json = gson.toJson(programInfo);
        prefsEditor.putString(KEY_PATIENT_PROGRAM_INFO, json);
        prefsEditor.commit();
        setIsRegistrationSessionStored(context, true);
    }

    public static ProgramInfo getPatientProgramInfo(Context context) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        Gson gson = new Gson();
        String json = pref.getString(KEY_PATIENT_PROGRAM_INFO, "");
        ProgramInfo programInfo = gson.fromJson(json, ProgramInfo.class);
        return programInfo;
    }

    public static void setPatientFamilyInfo(Context context, ArrayList<PatientFamilyInfo> familyInfos) {
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor prefsEditor = pref.edit();
        prefsEditor.putInt(KEY_PATIENT_FAMILY_NUMBER_INFO, familyInfos.size());
        for (int i = 0; i < familyInfos.size(); i++) {
            Gson gson = new Gson();
            String json = gson.toJson(familyInfos.get(i));
            prefsEditor.putString(KEY_PATIENT_FAMILY_INFO + i, json);
        }
        prefsEditor.commit();
        setIsRegistrationSessionStored(context, true);
    }

    public static ArrayList<PatientFamilyInfo> getPatientFamilyInfo(Context context) {
        ArrayList<PatientFamilyInfo> familyInfos = new ArrayList<PatientFamilyInfo>();
        SharedPreferences pref = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        int numOfFamily = pref.getInt(KEY_PATIENT_FAMILY_NUMBER_INFO, 0);
        for (int i = 0; i < numOfFamily; i++) {
            Gson gson = new Gson();
            String json = pref.getString(KEY_PATIENT_FAMILY_INFO + i, "");
            PatientFamilyInfo patientFamilyInfo = gson.fromJson(json, PatientFamilyInfo.class);
            familyInfos.add(patientFamilyInfo);
        }
        return familyInfos;
    }

    public static void clearPatientRegistrationPreferances(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor prefsEditor = preferences.edit();
        //removing personl info
        preferences.edit().remove(KEY_PATIENT_PERSONAL_INFO).commit();
        //removing address info
        preferences.edit().remove(KEY_PATIENT_ADDRESS_INFO).commit();
        //removing program info
        preferences.edit().remove(KEY_PATIENT_PROGRAM_INFO).commit();
        //removing family info
        int numOfFamily = preferences.getInt(KEY_PATIENT_FAMILY_NUMBER_INFO, 0);
        for (int i = 0; i < numOfFamily; i++) {
            preferences.edit().remove(KEY_PATIENT_FAMILY_INFO + i).commit();
        }
        //removing family count
        preferences.edit().remove(KEY_PATIENT_FAMILY_NUMBER_INFO).commit();
        //removing session maintanace flag
        preferences.edit().remove(KEY_IS_REGISTRATION_SESSION_STORED).commit();

    }


    public static void setStringPreferences(String key, String value, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static String getStringPreferences(String key, String defaultValue, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        return preferences.getString(key, defaultValue);
    }

    public static void setIntegerPreferences(String key, int value, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public static int getIntegerPreferences(String key, int defaultValue, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        return preferences.getInt(key, defaultValue);
    }

    public static void setBooleanPreferences(String key, boolean value, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        editor.putBoolean(key, value);
        editor.commit();
    }

    public static boolean getBooleanPreferences(String key, boolean defaultValue, Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREF_HEATHMON, context.MODE_PRIVATE);
        return preferences.getBoolean(key, defaultValue);
    }


}
