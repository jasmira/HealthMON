package com.persistent.healthmon.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;

import com.persistent.healthmon.communication.WebserviceManager;
import com.persistent.healthmon.model.ANCRegisterReport;
import com.persistent.healthmon.model.AshaDetails;
import com.persistent.healthmon.model.Feedback;
import com.persistent.healthmon.model.Medication;
import com.persistent.healthmon.model.MyActivity;
import com.persistent.healthmon.model.MyImmunizations;
import com.persistent.healthmon.model.PatientAddressDetail;
import com.persistent.healthmon.model.PatientFamilyInfo;
import com.persistent.healthmon.model.PatientPersonalInfo;
import com.persistent.healthmon.model.PatientStatus;
import com.persistent.healthmon.model.PatientVitals;
import com.persistent.healthmon.model.ProgramInfo;
import com.persistent.healthmon.model.Referal;
import com.persistent.healthmon.model.SpinerIdValue;
import com.persistent.healthmon.model.Tasks;
import com.persistent.healthmon.model.TrainingDetails;
import com.persistent.healthmon.util.Constants;
import com.persistent.healthmon.util.HealthMonLog;
import com.persistent.healthmon.util.PreferanceManager;

import org.json.JSONArray;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by harshal_patil on 2/22/2016.
 */
public class DatabaseHelper extends SQLiteOpenHelper {
    private static final String TAG = DatabaseHelper.class.getSimpleName();
    public SQLiteDatabase DB;
    public String DBPath;
    public static String DBName = "HealthMon.db";
    public static final int version = '2';
    public static Context currentContext;
    private static DatabaseHelper sInstance;


    public DatabaseHelper(Context context) {
        super(context, DBName, null, version);
        currentContext = context;
    }

    public static synchronized DatabaseHelper getInstance(Context context) {

        if (sInstance == null) {
            sInstance = new DatabaseHelper(context.getApplicationContext());
        }
        return sInstance;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // TODO Auto-generated method stub
        db.execSQL(
                "create table userInfo " +
                        "(asha_id text primary key, user_name text, isFirstLogin BOOLEAN NOT NULL CHECK (isFirstLogin IN (0,1) ))"
        );
        db.execSQL(
                "create table personalInfo " +
                        "(asha_id text, patient_id text primary key, patient_image text, salutation text, firstName text, middleName text, lastName text, genderId integer, dob text, age integer, place_of_birth text, marrital_status text, categoryId integer, bpl BOOLEAN NOT NULL CHECK (bpl IN (0,1)), language text, education text, idCardTypeId integer, idCardNumber text, contact text, addr1 text, addr2 text, districtId integer, talId integer, villageId integer, ward text, pin text, em_contact text, time_stemp text, is_Submitted BOOLEAN NOT NULL CHECK (is_Submitted IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)))"
        );

        db.execSQL(
                "create table myActivity " +
                        "(asha_id text, activity_id text primary key, server_task_id text unique, activity_name text, comments text, taskType text, taskSeverity text,taskDate text,task_actionable text, task_action text, createdDate text, task_venue text, start_time text, end_time text, reminder_interval text, created_by text, task_status text, created_by_name text, event_URI text, reminder_URI text, is_Edited BOOLEAN NOT NULL CHECK (is_Edited IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)))"
        );
        db.execSQL(
                "create table familyInfo " +
                        "(patient_id text, family_member_id integer, name text, genderId integer, dob text, age integer,  relation_to_patient text, marrital_status text, education text,  idCardTypeId integer, idCardNumber text, category text,  contact text, categoryId integer,is_Submitted BOOLEAN NOT NULL CHECK (is_Submitted IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)),PRIMARY KEY (patient_id,family_member_id))"
        );

        db.execSQL(
                "create table programInfo " +
                        "(patient_id text, program_id text, program_name text, LMPDate text, EDD text, isFirstPregnancy BOOLEAN NOT NULL CHECK (isFirstPregnancy IN (0,1) ), notes text, gravida text, parity text, pastAbortions text, pastStillBirths text, livingChildren text,  natureofPreviousDelivery text, previousDeliveryDate text, is_Submitted BOOLEAN NOT NULL CHECK (is_Submitted IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)),PRIMARY KEY (patient_id,program_id))"
        );
        db.execSQL(
                "create table hra " +
                        "(patient_id text, hra_sr_no text,  q_Edema text, q_headache text, q_stomache_pain text, sp_how_offen text, sp_times_per text, breathlessness text, pale_skin text, fever text, vomitings text, vo_how_offen text, vo_times_per text, convulsions text, con_how_offen text, con_times_per text, rash_skin text, family_history text, substance_use text, if_yes text, is_Submitted BOOLEAN NOT NULL CHECK (is_Submitted IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)), PRIMARY KEY (patient_id,hra_sr_no))"
        );
        db.execSQL(
                "create table notifications " +
                        "(asha_id text primary key, notification text)"
        );
        db.execSQL(
                "create table myImmunizations " +
                        "(asha_id text, patient_id text, immunization_name text primary key, frequency text, due_date text, done_date text, given_by text, role text, location text)"
        );

        db.execSQL(
                "create table referals " +
                        "(Referal_id text, User_id text, Patient_id text, PHC_ID text, Village_id text, Referal_Notes text, Referal_Reason text, Ref_Date text, Created_By text, Created_Date text, is_Edited BOOLEAN NOT NULL CHECK (is_Edited IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)), Patient_Name text)"
        );
        //Master tables creation
        //city table
        String table = "create table " + Constants.DbConstants.TABLE_CITY +
                "(" + Constants.DbConstants.CITY_ID + " INTEGER primary key," +
                Constants.DbConstants.STATE_ID + " INTEGER ," +
                Constants.DbConstants.COUNTRY_ID + " INTEGER," +
                Constants.DbConstants.DISTRICT_ID + " INTEGER," +
                Constants.DbConstants.CITY_NAME + " text " +
                ")";
        db.execSQL(table);

        //country table
        table = "create table " + Constants.DbConstants.TABLE_COUNTRY +
                "(" + Constants.DbConstants.COUNTRY_ID + " INTEGER primary key," +
                Constants.DbConstants.COUNTRY_NAME + " text," +
                Constants.DbConstants.COUNTRY_DESC + " text " +
                ")";
        db.execSQL(table);

        //District table
        table = "create table " + Constants.DbConstants.TABLE_DISTRICT +
                "(" + Constants.DbConstants.DISTRICT_ID + " INTEGER primary key," +
                Constants.DbConstants.STATE_ID + " INTEGER ," +
                Constants.DbConstants.COUNTRY_ID + " INTEGER," +
                Constants.DbConstants.DISTRICT_NAME + " text " +
                ")";
        db.execSQL(table);

        //Pincode table
        table = "create table " + Constants.DbConstants.TABLE_PINCODE +
                "(" + Constants.DbConstants.DISTRICT_ID + " INTEGER," +
                Constants.DbConstants.STATE_ID + " INTEGER ," +
                Constants.DbConstants.COUNTRY_ID + " INTEGER," +
                Constants.DbConstants.CITY_ID + " INTEGER," +
                Constants.DbConstants.PIN_CODE + " text," +
                Constants.DbConstants.AREA_NAME + " text " +
                ")";
        db.execSQL(table);

        //State table
        table = "create table " + Constants.DbConstants.TABLE_STATE +
                "(" + Constants.DbConstants.STATE_ID + " INTEGER primary key," +
                Constants.DbConstants.COUNTRY_ID + " INTEGER," +
                Constants.DbConstants.STATE_NAME + " text," +
                Constants.DbConstants.STATE_DESC + " text " +
                ")";
        db.execSQL(table);

        //Village table
        table = "create table " + Constants.DbConstants.TABLE_VILLAGE +
                "(" + Constants.DbConstants.VILLAGE_ID + " INTEGER primary key," +
                Constants.DbConstants.COUNTRY_ID + " INTEGER," +
                Constants.DbConstants.CITY_ID + " INTEGER," +
                Constants.DbConstants.STATE_ID + " INTEGER," +
                Constants.DbConstants.DISTRICT_ID + " INTEGER," +
                Constants.DbConstants.VILLAGE_NAME + " text " +
                ")";
        db.execSQL(table);

        //Cast Category table
        table = "create table " + Constants.DbConstants.TABLE_CAST_CATEGORY +
                "(" + Constants.DbConstants.CATEGORY_ID + " INTEGER primary key," +
                Constants.DbConstants.CATEGORY_NAME + " text, " +
                Constants.DbConstants.CATEGORY_DESC + " text " +
                ")";
        db.execSQL(table);

        //Gender Table
        table = "create table " + Constants.DbConstants.TABLE_GENDER +
                "(" + Constants.DbConstants.GENDER_ID + " INTEGER primary key," +
                Constants.DbConstants.GENDER_NAME + " text," +
                Constants.DbConstants.GENDER_SHORT_NAME + " text " +
                ")";
        db.execSQL(table);

        //Identity Card Table
        table = "create table " + Constants.DbConstants.TABLE_IDENTITY_CARD +
                "(" + Constants.DbConstants.CARD_TYPE_ID + " INTEGER primary key," +
                Constants.DbConstants.CARD_TYPE + " text," +
                Constants.DbConstants.CARD_DESC + " text " +
                ")";
        db.execSQL(table);


        //end of master tables

        String tablePatientStatus = "create table " + Constants.DbConstants.TABLE_PATIENT_SEVERITY_STATUS +
                "(" + Constants.DbConstants.COLUMN_PATIENT_ID_STATUS + " text primary key," +
                Constants.DbConstants.COLUMN_HB_FLAG + " INTEGER ," +
                Constants.DbConstants.COLUMN_HB_VALUE + " real ," +
                Constants.DbConstants.COLUMN_BP_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_BP_SYS_VALUE + " INTEGER," +
                Constants.DbConstants.COLUMN_BP_DIA_VALUE + " INTEGER," +
                Constants.DbConstants.COLUMN_BP_PULSE_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_BP_PULSE_VALUE + " INTEGER," +
                Constants.DbConstants.COLUMN_WEIGHT_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_WEIGHT_VALUE + " real," +
                Constants.DbConstants.COLUMN_OXI_PULSE_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_OXI_PULSE_VALUE + " INTEGER," +
                Constants.DbConstants.COLUMN_OXI_SPO2_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_OXI_SPO2_VALUE + " INTEGER," +
                Constants.DbConstants.COLUMN_OVERALL_FLAG + " INTEGER," +
                Constants.DbConstants.COLUMN_STATUS_MSG + " text, " +
                "is_Edited BOOLEAN NOT NULL CHECK (is_Edited IN (0,1)), is_Uploaded BOOLEAN NOT NULL CHECK (is_Uploaded IN (0,1)))";
        db.execSQL(tablePatientStatus);

        table = "create table " + Constants.DbConstants.TABLE_TASK_ALERTS +
                "(" + Constants.DbConstants.COLUMN_TASK_ALERTS_ID + " INTEGER ," +
                Constants.DbConstants.COLUMN_USERTASK_ID + " INTEGER ," +
                Constants.DbConstants.COLUMN_USERPROGRAM_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_USER_ID + " text," +
                Constants.DbConstants.COLUMN_TASK_NAME + " text," +
                Constants.DbConstants.COLUMN_TASK_DESCRIPTION + " text," +
                Constants.DbConstants.COLUMN_TASK_TYPE + " text," +
                Constants.DbConstants.COLUMN_TASK_SEVERITY + " INTEGER," +
                Constants.DbConstants.COLUMN_TASK_DATE + " text," +
                Constants.DbConstants.COLUMN_TASK_ACTIONABLE + " INTEGER," +
                Constants.DbConstants.COLUMN_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_TASK_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_PATIENT_NAME + " text," +
                Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE + " INTEGER," +
                Constants.DbConstants.COLUMN_TASK_TO_SHOW + " boolean," +
                "PRIMARY KEY(" + Constants.DbConstants.COLUMN_USERTASK_ID + ", " +
                Constants.DbConstants.COLUMN_USERPROGRAM_ID + ", " +
                Constants.DbConstants.COLUMN_USER_ID + ")" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");

        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_ASHA_DETAILS +
                "(" + Constants.DbConstants.COLUMN_ASHA_ID + " text PRIMARY KEY," +
                Constants.DbConstants.COLUMN_ASHA_NAME + " text," +
                Constants.DbConstants.COLUMN_ASHA_PIC + " text," +
                Constants.DbConstants.COLUMN_QUALIFICATION + " text," +
                Constants.DbConstants.COLUMN_EMERGENCY_CONTACT + " text," +
                Constants.DbConstants.COLUMN_ADDRESS + " text," +
                Constants.DbConstants.COLUMN_ADDRESS2 + " text," +
                Constants.DbConstants.COLUMN_CONTACT + " text" +
                Constants.DbConstants.COLUMN_LAST_SYNC + " text" +
                Constants.DbConstants.COLUMN_NOTIFICATION_COUNT + " INTEGER" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);


        table = "create table " + Constants.DbConstants.TABLE_PATIENT_BP +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_ASHA_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_DEVICE_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_BP_SYS + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_BP_DIA + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_BP_PULSE + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_VITALS +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_TEMPERATURE + " real," +
                Constants.DbConstants.COLUMN_VITALS_WEIGHT + " real," +
                Constants.DbConstants.COLUMN_VITALS_HEIGHT + " real," +
                Constants.DbConstants.COLUMN_VITALS_BMI + " real," +
                Constants.DbConstants.COLUMN_VITALS_GIRTH + " real," +
                Constants.DbConstants.COLUMN_VITALS_FUNDAL + " real," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_EDUCATION_CONTENT_DETAILS +
                "(" + Constants.DbConstants.COLUMN_LEARNING_ID + " text," +
                Constants.DbConstants.COLUMN_PROGRAM_id + " text," +
                Constants.DbConstants.COLUMNN_USER_ID + " text," +
                Constants.DbConstants.COLUMN_USER_TYPE + " text," +
                Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION + " text," +
                Constants.DbConstants.COLUMN_LEARNING_TTPE + " text," +
                Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL + " text," +
                Constants.DbConstants.COLUMN_CONTENT_TYPE + " text," +
                Constants.DbConstants.COLUMN_LEARNING_LINK + " text," +
                Constants.DbConstants.COLUMN_CREATION_DATE + " text," +
                Constants.DbConstants.COLUMN_ACTIVE + " text," +
                Constants.DbConstants.COLUMN_PROGRAM_DESC + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_ECG +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_DEVICE_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_ECG_WAVEPOINTS + " blob," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_OXI +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_DEVICE_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_OXI_SPO + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_OXI_PI + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_OXI_PULSE + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_OXI_WAVE_POINTS + " blob," +
                Constants.DbConstants.COLUMN_VITALS_OXI_BEAT_POINTS + " blob," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_HB +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID + " text," +
                Constants.DbConstants.COLUMN_VITALS_HB + " real," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_FEEDBACK +
                "(" + Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + " INTEGER PRIMARY KEY," +
                Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY + " text," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION + " text," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION + " text," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image + " text," +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID + " INTEGER" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS +
                "(" + Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER + " text," +
                "PRIMARY KEY(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + ", " +
                Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + ")" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_HRA_RESULTS +
                "(" + Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER + " text," +
                Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP + " text " +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_Medication +
                "(" + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID + " INTEGER," +
                Constants.DbConstants.COLUMN_MEDICATION_MEDICINE_QNTY + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_CREATED_BY + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_CREATED_DATE + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_UPDATED_BY + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_UPDATED_DATE + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DURATION_IN_DAYS + " INTEGER," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DUE_DATE + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_GIVEN_BY + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_ROLE + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_LOCATION + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_USER_ID + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_NAMES +
                "(" + Constants.DbConstants.COLUMN_MEDICATION_ROW_DRUG_NAME + " INTEGER  PRIMARY KEY," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);

        table = "create table " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER +
                "(" + Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID + " Integer  PRIMARY KEY," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_FORM + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_ROUTE + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_UNITS + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_TYPE + " Integer," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_DESCRIPTION + " text," +
                Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY + " text" +
                ")";
        HealthMonLog.i(TAG, "onCreate(): " + table + " query executed");
        db.execSQL(table);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

        db.execSQL("DROP TABLE IF EXISTS userInfo");
        db.execSQL("DROP TABLE IF EXISTS personalInfo");
        db.execSQL("DROP TABLE IF EXISTS familyInfo");
        db.execSQL("DROP TABLE IF EXISTS hra");
        db.execSQL("DROP TABLE IF EXISTS notifications");
        db.execSQL("DROP TABLE IF EXISTS myActivity");
        db.execSQL("DROP TABLE IF EXISTS patientStatus");
        db.execSQL("DROP TABLE IF EXISTS referals");
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_TASK_ALERTS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_ASHA_DETAILS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_BP);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_VITALS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_EDUCATION_CONTENT_DETAILS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_ECG);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_OXI);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_HB);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_FEEDBACK);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_HRA_RESULTS);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_Medication);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_NAMES);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_CAST_CATEGORY);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_DISTRICT);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PINCODE);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_CITY);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_COUNTRY);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_STATE);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_VILLAGE);
        db.execSQL("DROP TABLE IF EXISTS " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER);
        db.execSQL("DROP TABLE IF EXISTS myImmunizations");

        onCreate(db);
    }

    private void open(final boolean readOnly) throws SQLException {
        try {
            if (readOnly) {
                DB = sInstance.getReadableDatabase();
            } else {
                DB = sInstance.getWritableDatabase();
            }
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.e(TAG, "open(): Error while opening database");
        }

    }

    public boolean createDatabase() {

        int count = 0;
        byte[] buffer = new byte[8192];
        FileOutputStream fileOutputStream = null;
        FileInputStream fileInputStream = null;
        File SourceInputFile = null;
        boolean filecreated = false;

        try {
            File file = new File("data/data/com.persistent.healthmon/", "databases");
            if (!file.exists()) {
                file.mkdir();
            }

            file = new File("data/data/com.persistent.healthmon/databases/", "HealthMon.db");

            if (!file.exists()) {

                file.createNewFile();

            }
            SourceInputFile = new File(Constants.DB_FILE_PATH, "HealthMon.sqlite");
            fileOutputStream = new FileOutputStream(file);
            fileInputStream = new FileInputStream(SourceInputFile);

            while ((count = fileInputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, count);
            }

            fileInputStream.close();
            fileOutputStream.flush();
            fileOutputStream.close();
            filecreated = true;

        } catch (MalformedURLException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
        return filecreated;

    }

    /* public boolean insertPatientPersonalInfo(String name, String phone, String email, String place)
     {
         SQLiteDatabase db = this.getWritableDatabase();
         ContentValues contentValues = new ContentValues();
         contentValues.put("name", name);
         contentValues.put("phone", phone);
         contentValues.put("street", street);
         contentValues.put("place", place);
         db.insert("personalInfo", null, contentValues);
         return true;
     }*/
    public PatientStatus getPatientStatus(String patientId) {
        PatientStatus patientStatus = new PatientStatus();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from patientSeverityStatus where patient_id ='" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            patientStatus.setPatientId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_PATIENT_ID_STATUS)));
            patientStatus.setHbFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_HB_FLAG)));
            patientStatus.setHbValue(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_HB_VALUE)));
            patientStatus.setBpSysFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_BP_FLAG)));
            patientStatus.setBpSysValue(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_BP_SYS_VALUE)));
            patientStatus.setBpDiaValue(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_BP_DIA_VALUE)));
            patientStatus.setBpPulseFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_BP_PULSE_FLAG)));
            patientStatus.setBpPulseValue(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_BP_PULSE_VALUE)));
            patientStatus.setWeightFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_WEIGHT_FLAG)));
            patientStatus.setWeightValue(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_WEIGHT_VALUE)));
            patientStatus.setOxiPulseFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OXI_PULSE_FLAG)));
            patientStatus.setOxiPulseValue(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OXI_PULSE_VALUE)));
            patientStatus.setOxiSpO2Flag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OXI_SPO2_FLAG)));
            patientStatus.setOxiSpO2Value(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OXI_SPO2_VALUE)));
            patientStatus.setOverallFlag(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OVERALL_FLAG)));
            patientStatus.setStatusMsg(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_STATUS_MSG)));
        }
        cursor.close();
        return patientStatus;
    }

    public void updatePatientStatus(String patientId, int status, String statusColumnName, double valueParam, String valueColumName) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            ContentValues cv = new ContentValues();
            cv.put(statusColumnName, status);
            cv.put(valueColumName, valueParam);
            cv.put("is_Edited", "0");
            cv.put("is_Uploaded", "0");
            int value = database.update(Constants.DbConstants.TABLE_PATIENT_SEVERITY_STATUS, cv, Constants.DbConstants.COLUMN_PATIENT_ID_STATUS + " = '" + patientId + "'", null);
            if (value <= 0) {
                cv.put(Constants.DbConstants.COLUMN_PATIENT_ID_STATUS, patientId);
                database.insert(Constants.DbConstants.TABLE_PATIENT_SEVERITY_STATUS, null, cv);
            }
            updateOverallStatus(patientId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateOverallStatus(String patientId) {
        int overAllflag = Constants.PRIORITY_NORMAL_PATIENT;
        String statusMsg = Constants.STATUS_NORMAL_PATIENT;
        PatientStatus patientStatus = getPatientStatus(patientId);
        if (patientStatus.getHbFlag() > overAllflag)
            overAllflag = patientStatus.getHbFlag();
        if (patientStatus.getBpSysFlag() > overAllflag)
            overAllflag = patientStatus.getBpSysFlag();
        if (patientStatus.getBpDiaFlag() > overAllflag)
            overAllflag = patientStatus.getBpDiaFlag();
        if (patientStatus.getBpPulseFlag() > overAllflag)
            overAllflag = patientStatus.getBpPulseFlag();
        if (patientStatus.getWeightFlag() > overAllflag)
            overAllflag = patientStatus.getWeightFlag();
        if (patientStatus.getOxiPulseFlag() > overAllflag)
            overAllflag = patientStatus.getOxiPulseFlag();
        if (patientStatus.getOxiSpO2Flag() > overAllflag)
            overAllflag = patientStatus.getOxiSpO2Flag();

        switch (overAllflag) {
            case Constants.PRIORITY_HIGH_RISK_PATIENT:
                statusMsg = Constants.STATUS_HIGH_RISK_PATIENT;
                break;
            case Constants.PRIORITY_MODERATE_RISK_PATIENT:
                statusMsg = Constants.STATUS_MODERATE_RISK_PATIENT;
                break;
            case Constants.PRIORITY_NORMAL_PATIENT:
                statusMsg = Constants.STATUS_NORMAL_PATIENT;
                break;
        }
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues cv = new ContentValues();
        cv.put(Constants.DbConstants.COLUMN_OVERALL_FLAG, overAllflag);
        cv.put(Constants.DbConstants.COLUMN_STATUS_MSG, statusMsg);
        int val = database.update(Constants.DbConstants.TABLE_PATIENT_SEVERITY_STATUS, cv, Constants.DbConstants.COLUMN_PATIENT_ID_STATUS + " = '" + patientId + "'", null);
        if (val <= 0) {
            cv.put(Constants.DbConstants.COLUMN_PATIENT_ID_STATUS, patientId);
            cv.put("is_Edited", "0");
            cv.put("is_Uploaded", "0");
            database.insert(Constants.DbConstants.TABLE_PATIENT_SEVERITY_STATUS, null, cv);
        }
        //Adding webservice call for each status update
        PatientStatus patientStatusTemp = getPatientStatus(patientId);
        //WebserviceManager.setAllPatientSeverity(currentContext, patientStatusTemp.toString());
        WebserviceManager.setAllPatientSeverity(currentContext, patientStatusTemp);
    }


    public void insertReferal(Referal referal) {

        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("Referal_id", referal.getRefId());
        values.put("User_id", referal.getUserId());
        values.put("Patient_id", referal.getPatientId());
        values.put("PHC_ID", referal.getPHC_id());
        values.put("Village_id", referal.getVillageId());
        values.put("Referal_Notes", referal.getReferalNotes());
        values.put("Referal_Reason", referal.getReferalReason());
        values.put("Ref_Date", referal.getRefDate());
        values.put("Created_By", referal.getCreatedBy());
        values.put("Created_Date", referal.getCreatedDate());
        values.put("is_Edited", referal.isEdited());
        values.put("is_Uploaded", referal.isUploaded());
        values.put("Patient_Name", referal.getPatientName());
        database.insert("referals", null, values);
    }

    public ArrayList<Referal> getAllReferalForPatient(String patientId) {
        ArrayList<Referal> referals = new ArrayList<Referal>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from referals where Patient_id ='" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            do {
                Referal referal = new Referal();
                referal.setRefId(cursor.getString(cursor.getColumnIndex("Referal_id")));
                referal.setUserId(cursor.getString(cursor.getColumnIndex("User_id")));
                referal.setPatientId(cursor.getString(cursor.getColumnIndex("Patient_id")));
                referal.setPHC_id(cursor.getString(cursor.getColumnIndex("PHC_ID")));
                referal.setVillageId(cursor.getString(cursor.getColumnIndex("Village_id")));
                referal.setReferalNotes(cursor.getString(cursor.getColumnIndex("Referal_Notes")));
                referal.setReferalReason(cursor.getString(cursor.getColumnIndex("Referal_Reason")));
                referal.setRefDate(cursor.getString(cursor.getColumnIndex("Ref_Date")));
                referal.setCreatedBy(cursor.getString(cursor.getColumnIndex("Created_By")));
                referal.setCreatedDate(cursor.getString(cursor.getColumnIndex("Created_Date")));
                referal.setPatientName(cursor.getString(cursor.getColumnIndex("Patient_Name")));
                referals.add(referal);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return referals;
    }

    public void insertMyActivity(MyActivity myActivity) {

        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("asha_id", myActivity.getAshaId());
        values.put("server_task_id", myActivity.getServer_task_id());
        values.put("activity_id", myActivity.getTaskId());
        values.put("activity_name", myActivity.getActivityName());
        values.put("comments", myActivity.getComments());
        values.put("taskType", myActivity.getTaskType());
        values.put("taskSeverity", myActivity.getTaskSeverity());
        values.put("taskDate", myActivity.getTaskDate());
        values.put("task_actionable", myActivity.getTaskActionable());
        values.put("task_action", myActivity.getTaskAction());
        values.put("createdDate", myActivity.getTaskCreatedDate());
        values.put("task_venue", myActivity.getTaskVenue());
        values.put("start_time", myActivity.getTaskCreatedTime());
        values.put("end_time", myActivity.getTaskEndTime());
        values.put("reminder_interval", myActivity.getReminderInterval());
        values.put("task_status", myActivity.getTaskStatus());
        values.put("created_by_name", myActivity.getCreatedByName());
        values.put("event_URI", myActivity.getEvent_URI());
        values.put("reminder_URI", myActivity.getReminder_URI());
        values.put("is_Edited", myActivity.getIs_Edited());
        values.put("is_Uploaded", myActivity.getIs_Uploaded());
        database.insert("myActivity", null, values);
    }

    public void updateActivityStatus(String taskId, String status) {
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues cv = new ContentValues();
        cv.put("task_status", status);
        database.update("myActivity", cv, "activity_id ='" + taskId + "'", null);
    }

    public ArrayList<MyActivity> getAllMyActivityForStatus(String status) {
        ArrayList<MyActivity> myActivities = new ArrayList<MyActivity>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from myActivity where task_status = '" + status + "'", null);
        if (cursor.moveToFirst()) {
            do {
                MyActivity myActivity = new MyActivity();
                myActivity.setTaskId(cursor.getString(cursor.getColumnIndex("activity_id")));
                myActivity.setActivityName(cursor.getString(cursor.getColumnIndex("activity_name")));
                myActivity.setAshaId(cursor.getString(cursor.getColumnIndex("asha_id")));
                myActivity.setComments(cursor.getString(cursor.getColumnIndex("comments")));
                myActivity.setTaskType(cursor.getString(cursor.getColumnIndex("taskType")));
                myActivity.setTaskSeverity(cursor.getString(cursor.getColumnIndex("taskSeverity")));
                myActivity.setTaskDate(cursor.getString(cursor.getColumnIndex("taskDate")));
                myActivity.setTaskActionable(cursor.getString(cursor.getColumnIndex("task_actionable")));
                myActivity.setTaskAction(cursor.getString(cursor.getColumnIndex("task_action")));
                myActivity.setTaskCreatedDate(cursor.getString(cursor.getColumnIndex("createdDate")));
                myActivity.setTaskVenue(cursor.getString(cursor.getColumnIndex("task_venue")));
                myActivity.setTaskCreatedTime(cursor.getString(cursor.getColumnIndex("start_time")));
                myActivity.setTaskEndTime(cursor.getString(cursor.getColumnIndex("end_time")));
                myActivity.setReminderInterval(cursor.getString(cursor.getColumnIndex("reminder_interval")));
                myActivity.setCreatedBy(cursor.getString(cursor.getColumnIndex("created_by")));
                myActivity.setTaskStatus(cursor.getString(cursor.getColumnIndex("task_status")));
                myActivity.setCreatedByName(cursor.getString(cursor.getColumnIndex("created_by_name")));
                myActivity.setIs_Edited(cursor.getString(cursor.getColumnIndex("is_Edited")));
                myActivity.setIs_Uploaded(cursor.getString(cursor.getColumnIndex("is_Uploaded")));
                myActivity.setEvent_URI(cursor.getString(cursor.getColumnIndex("event_URI")));
                myActivity.setReminder_URI(cursor.getString(cursor.getColumnIndex("reminder_URI")));
                myActivities.add(myActivity);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return myActivities;
    }


    public void insertImmunization(MyImmunizations myImmunizations) {

        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        //values.put("asha_id", myImmunizations.getAshaId());
        values.put("patient_id", myImmunizations.getPatientId());
        values.put("immunization_name", myImmunizations.getImmunizationName());
        values.put("frequency", myImmunizations.getFreqDesc());

        values.put("due_date", myImmunizations.getDueDate());
        values.put("done_date", myImmunizations.getDoneDate());
        values.put("given_by", myImmunizations.getGivenBy());
        values.put("role", myImmunizations.getRole());
        values.put("location", myImmunizations.getGivenAt());

//        values.put("is_Uploaded", myImmunizations.getIs_Uploaded());
        database.insertWithOnConflict("myImmunizations", null, values, SQLiteDatabase.CONFLICT_REPLACE);

    }

    public ArrayList<MyImmunizations> getImmunizations(String patientId) {
        ArrayList<MyImmunizations> myImmunizations = new ArrayList<MyImmunizations>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from myImmunizations where patient_id = '" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            do {
                MyImmunizations myImmunization = new MyImmunizations();
                myImmunization.setPatientId(cursor.getString(cursor.getColumnIndex("patient_id")));
                myImmunization.setImmunizationName(cursor.getString(cursor.getColumnIndex("immunization_name")));
                myImmunization.setFreqDesc(cursor.getString(cursor.getColumnIndex("frequency")));
                myImmunization.setDueDate(cursor.getString(cursor.getColumnIndex("due_date")));
                myImmunization.setDoneDate(cursor.getString(cursor.getColumnIndex("done_date")));
                myImmunization.setGivenBy(cursor.getString(cursor.getColumnIndex("given_by")));
                myImmunization.setRole(cursor.getString(cursor.getColumnIndex("role")));
                myImmunization.setGivenAt(cursor.getString(cursor.getColumnIndex("location")));
                //myImmunization.setIs_Uploaded(cursor.getString(cursor.getColumnIndex("is_Uploaded")));
                myImmunizations.add(myImmunization);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return myImmunizations;
    }


    public ArrayList<ANCRegisterReport> getANCRegistrationReport() {
        ArrayList<ANCRegisterReport> ancRegisterReports = new ArrayList<ANCRegisterReport>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from personalInfo INNER JOIN programInfo ON personalInfo.patient_id = programInfo.patient_id AND personalInfo.asha_id = '" + PreferanceManager.getAshaId(currentContext) + "'", null);
        if (cursor.moveToFirst()) {
            do {
                ANCRegisterReport ancRegisterReport = new ANCRegisterReport();
                ancRegisterReport.setAshaId(cursor.getString(cursor.getColumnIndex("asha_id")));
                ancRegisterReport.setPatientId(cursor.getString(cursor.getColumnIndex("patient_id")));
                ancRegisterReport.setPatientFirstName(cursor.getString(cursor.getColumnIndex("firstName")));
                ancRegisterReport.setPatientMiddleName(cursor.getString(cursor.getColumnIndex("middleName")));
                ancRegisterReport.setPatientLastName(cursor.getString(cursor.getColumnIndex("lastName")));
                ancRegisterReport.setAge(String.valueOf(cursor.getInt(cursor.getColumnIndex("age"))));
                ancRegisterReport.setRegDtae(cursor.getString(cursor.getColumnIndex("time_stemp")));
                ancRegisterReport.setVillageId(cursor.getInt(cursor.getColumnIndex("villageId")));
                ancRegisterReport.setWard(cursor.getString(cursor.getColumnIndex("ward")));
                ancRegisterReport.setLMPDate(cursor.getString(cursor.getColumnIndex("LMPDate")));
                ancRegisterReport.setDeliveryNum(cursor.getString(cursor.getColumnIndex("gravida")));
                ancRegisterReport.setEDD(cursor.getString(cursor.getColumnIndex("EDD")));
                ancRegisterReports.add(ancRegisterReport);

            } while (cursor.moveToNext());

        }
        return ancRegisterReports;
    }

    public void insertPatientPersonalInfo(PatientPersonalInfo patientPersonalInfo, PatientAddressDetail addressDetail) {
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("asha_id", patientPersonalInfo.getAsha_id());
        values.put("patient_id", patientPersonalInfo.getPatient_id());
        values.put("patient_image", patientPersonalInfo.getPatient_image_string());
        values.put("salutation", patientPersonalInfo.getSalutation());
        values.put("firstName", patientPersonalInfo.getFirstName());
        values.put("middleName", patientPersonalInfo.getMiddleName());
        values.put("lastName", patientPersonalInfo.getLastName());
        values.put("genderId", patientPersonalInfo.getGenderId());
        values.put("dob", patientPersonalInfo.getDob());
        values.put("age", patientPersonalInfo.getAge());
        values.put("place_of_birth", patientPersonalInfo.getPlace_of_birth());
        values.put("marrital_status", patientPersonalInfo.getMarrital_status());
        values.put("categoryId", patientPersonalInfo.getCategoryId());
        values.put("bpl", patientPersonalInfo.isBpl());
        values.put("language", patientPersonalInfo.getLanguage());
        values.put("education", patientPersonalInfo.getEducation());
        values.put("idCardTypeId", patientPersonalInfo.getIdCardTypeId());
        values.put("idCardNumber", patientPersonalInfo.getIdCardNumber());
        values.put("contact", patientPersonalInfo.getContact());
        values.put("addr1", addressDetail.getAddr1());
        values.put("addr2", addressDetail.getAddr2());
        values.put("districtId", addressDetail.getDistrictId());
        values.put("talId", addressDetail.getTalId());
        values.put("villageId", addressDetail.getVillageId());
        values.put("ward", addressDetail.getWard());
        values.put("pin", addressDetail.getPin());
        values.put("em_contact", patientPersonalInfo.getEm_contact());
        values.put("time_stemp", patientPersonalInfo.getTimeStamp());
        values.put("is_Submitted", patientPersonalInfo.is_Submitted());
        values.put("is_Uploaded", patientPersonalInfo.is_Uploaded());

        database.insert("personalInfo", null, values);
    }

    public void insertPatientFamilyInfo(PatientFamilyInfo patientFamilyInfo) {
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("patient_id", patientFamilyInfo.getPatient_id());
        values.put("family_member_id", patientFamilyInfo.getFamily_member_id());
        values.put("name", patientFamilyInfo.getName());
        values.put("genderId", patientFamilyInfo.getGenderId());
        values.put("dob", patientFamilyInfo.getDob());
        values.put("age", patientFamilyInfo.getAge());
        values.put("relation_to_patient", patientFamilyInfo.getRelation_to_patient());
        values.put("marrital_status", patientFamilyInfo.getMarrital_status());
        values.put("education", patientFamilyInfo.getEducation());
        values.put("idCardTypeId", patientFamilyInfo.getIdCardTypeId());
        values.put("idCardNumber", patientFamilyInfo.getIdCardNumber());
        values.put("categoryId", patientFamilyInfo.getCategoryId());
        values.put("contact", patientFamilyInfo.getContact());
        values.put("is_Submitted", patientFamilyInfo.is_Submitted());
        values.put("is_Uploaded", patientFamilyInfo.is_Uploaded());

        database.insert("familyInfo", null, values);
    }

    public void insertPatientProgramInfo(ProgramInfo programInfo) {
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("patient_id", programInfo.getPatientId());
        values.put("program_id", programInfo.getProgram_id());
        values.put("program_name", programInfo.getProgram_name());
        values.put("LMPDate", programInfo.getLMPDate());
        values.put("EDD", programInfo.getEDD());
        values.put("isFirstPregnancy", programInfo.isFirstPregnancy());
        values.put("notes", programInfo.getNotes());
        values.put("gravida", programInfo.getGravida());
        values.put("parity", programInfo.getParity());
        values.put("pastAbortions", programInfo.getPastAbortions());
        values.put("pastStillBirths", programInfo.getPastStillBirths());
        values.put("livingChildren", programInfo.getLivingChildren());
        values.put("natureofPreviousDelivery", programInfo.getNatureofPreviousDelivery());
        values.put("previousDeliveryDate", programInfo.getPreviousDeliveryDate());
        values.put("is_Submitted", programInfo.is_Submitted());
        values.put("is_Uploaded", programInfo.is_Uploaded());
        database.insert("programInfo", null, values);
    }

    public void insertPatientHRA(HashMap<String, String> queryValues) {
        SQLiteDatabase database = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("Name", queryValues.get("Name"));
        database.insert("hra", null, values);
    }

    public PatientPersonalInfo getPatient(String id) {
        PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from personalInfo where patient_id = '" + id + "'", null);
        if (cursor.moveToFirst()) {
            do {
                patientPersonalInfo.setAsha_id(cursor.getString(cursor.getColumnIndex("asha_id")));
                patientPersonalInfo.setPatient_id(cursor.getString(cursor.getColumnIndex("patient_id")));
                patientPersonalInfo.setPatient_image_string(cursor.getString(cursor.getColumnIndex("patient_image")));
                patientPersonalInfo.setFirstName(cursor.getString(cursor.getColumnIndex("firstName")));
                patientPersonalInfo.setMiddleName(cursor.getString(cursor.getColumnIndex("middleName")));
                patientPersonalInfo.setLastName(cursor.getString(cursor.getColumnIndex("lastName")));
                // patientPersonalInfo.setGender(cursor.getString(cursor.getColumnIndex("gender")));
                patientPersonalInfo.setDob(cursor.getString(cursor.getColumnIndex("dob")));
                patientPersonalInfo.setAge(cursor.getInt(cursor.getColumnIndex("age")));
                patientPersonalInfo.setPlace_of_birth(cursor.getString(cursor.getColumnIndex("place_of_birth")));
                patientPersonalInfo.setMarrital_status(cursor.getString(cursor.getColumnIndex("marrital_status")));
                //patientPersonalInfo.setCategory(cursor.getString(cursor.getColumnIndex("category")));
                String isBPL = cursor.getString(cursor.getColumnIndex("bpl"));
                patientPersonalInfo.setLanguage(cursor.getString(cursor.getColumnIndex("language")));
                patientPersonalInfo.setEducation(cursor.getString(cursor.getColumnIndex("education")));
                //patientPersonalInfo.setIdCardType(cursor.getString(cursor.getColumnIndex("idCardType")));
                patientPersonalInfo.setIdCardNumber(cursor.getString(cursor.getColumnIndex("idCardNumber")));
                patientPersonalInfo.setContact(cursor.getString(cursor.getColumnIndex("contact")));
                //patientPersonalInfo.setPriority(Integer.parseInt(cursor.getString(cursor.getColumnIndex("priority"))));
                patientPersonalInfo.setSalutation(cursor.getString(cursor.getColumnIndex("salutation")));
                patientPersonalInfo.setEm_contact(cursor.getString(cursor.getColumnIndex("em_contact")));
                patientPersonalInfo.setTimeStamp(cursor.getString(cursor.getColumnIndex("time_stemp")));
                //patientPersonalInfo.setBpl(cursor.get(cursor.getColumnIndex("bpl")));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return patientPersonalInfo;
    }

    public Cursor getAllPatients() {
        SQLiteDatabase db = this.getReadableDatabase();

        return db.query("personalInfo", new String[]{"patient_id", "selected_program", "name", "contact"},
                null, null, null, null,
                "name" + " asc ");
    }

    public Boolean addTaskDetails(final Tasks tasks) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_USERTASK_ID, tasks.getUser_Tasks_id());
            values.put(Constants.DbConstants.COLUMN_USERPROGRAM_ID, tasks.getHM_User_HM_Programs_Programs_id());
            values.put(Constants.DbConstants.COLUMN_USER_ID, tasks.getHM_User_id());
            values.put(Constants.DbConstants.COLUMN_TASK_NAME, tasks.getUser_Task_Name());
            values.put(Constants.DbConstants.COLUMN_TASK_DESCRIPTION, tasks.getUser_Task_Description());
            values.put(Constants.DbConstants.COLUMN_TASK_TYPE, tasks.getUser_Task_Type());
            values.put(Constants.DbConstants.COLUMN_TASK_SEVERITY, tasks.getUser_Task_Severity());
            values.put(Constants.DbConstants.COLUMN_TASK_DATE, tasks.getUser_Task_Date());
            values.put(Constants.DbConstants.COLUMN_TASK_ACTIONABLE, tasks.getUser_Task_Actionable());
            values.put(Constants.DbConstants.COLUMN_PATIENT_ID, tasks.getHM_Patient_id());
            values.put(Constants.DbConstants.COLUMN_TASK_ID, tasks.getUser_Tasks_id());
            values.put(Constants.DbConstants.COLUMN_PATIENT_NAME, tasks.getPatient_full_name());
            values.put(Constants.DbConstants.COLUMN_TASK_DATE_IN_DATE, tasks.getDate());
            values.put(Constants.DbConstants.COLUMN_TASK_TO_SHOW, tasks.getTask_to_show());
            Uri uri = currentContext.getContentResolver().insert(
                    DatabaseProvider.CONTENT_URI, values);
/*
            long inserted = DB.insert(Constants.DbConstants.TABLE_TASK_ALERTS, null, values);
            if (inserted == -1) {
                return result = false;
            }*/


            HealthMonLog.i(TAG, "addTaskDetails(): Tasks details inserted- " + tasks.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addTaskDetails(): Tasks details" + tasks.toString());
            result = false;

        } finally {
            this.closeDB();
        }

        return result;

    }

    public Boolean addAshaDetails(final AshaDetails AshaDetails) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_ASHA_NAME, AshaDetails.getAsha_name());
            values.put(Constants.DbConstants.COLUMN_ASHA_ID, AshaDetails.getAsha_id());
            values.put(Constants.DbConstants.COLUMN_QUALIFICATION, AshaDetails.getQualification());
            values.put(Constants.DbConstants.COLUMN_EMERGENCY_CONTACT, AshaDetails.getEmergencyContact());
            values.put(Constants.DbConstants.COLUMN_ADDRESS, AshaDetails.getAddress());
            values.put(Constants.DbConstants.COLUMN_ADDRESS2, AshaDetails.getAddress2());
            values.put(Constants.DbConstants.COLUMN_CONTACT, AshaDetails.getContact());
            values.put(Constants.DbConstants.COLUMN_ASHA_PIC, AshaDetails.getAsha_pic());

            long inserted = DB.insert(Constants.DbConstants.TABLE_ASHA_DETAILS, null, values);
            if (inserted == -1) {
                return result = false;
            }
            HealthMonLog.i(TAG, "addAshaDetails(): Asha details inserted- " + AshaDetails.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addAshaDetails(): Asha details details" + AshaDetails.toString());
            result = false;
        } finally {
            this.closeDB();
        }

        return result;

    }

    public AshaDetails getAshaDetails(String user_id) {
        SQLiteDatabase db = this.getReadableDatabase();
        AshaDetails ashaDetails = null;
        Cursor cursor = null;
        try {
            cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_ASHA_DETAILS
                            + " where " + Constants.DbConstants.COLUMN_ASHA_ID + " = '" + user_id + "' ",
                    null);
            if (cursor.moveToFirst()) {
                do {
                    ashaDetails = new AshaDetails();
                    ashaDetails.setAsha_name(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ASHA_NAME)));
                    ashaDetails.setAsha_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ASHA_ID)));
                    ashaDetails.setQualification(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_QUALIFICATION)));
                    ashaDetails.setEmergencyContact(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_EMERGENCY_CONTACT)));
                    ashaDetails.setAddress(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ADDRESS)));
                    ashaDetails.setAddress2(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ADDRESS2)));
                    ashaDetails.setContact(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_CONTACT)));
                    //ashaDetails.setAsha_pic(cursor.getBlob(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ASHA_PIC)));
                    HealthMonLog.i(TAG, "getAshaDetails()" + ashaDetails.toString());
                } while (cursor.moveToNext());
                HealthMonLog.i(TAG, "getAshaDetails()" + cursor.toString());
                cursor.close();

            }
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAshaDetails()");
        }


        this.closeDB();
        return ashaDetails;

    }

    public ArrayList<Tasks> getNotificaitons() {
        try {
            SQLiteDatabase db = this.getReadableDatabase();
            ArrayList<Tasks> notifications = new ArrayList<>();
            Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_TASK_ALERTS + " where ("
                            + Constants.DbConstants.COLUMN_TASK_TYPE + " = '" + Constants.DbConstants.SERVER_TASK_TYPE_NOTIFICATION + "' OR "
                            + Constants.DbConstants.COLUMN_TASK_TYPE + " = '" + Constants.DbConstants.SERVER_TASK_TYPE_ACTIVITY + "') AND "
                            + Constants.DbConstants.COLUMN_USER_ID + " = '" + PreferanceManager.getStringPreferences(Constants.KEY_LOGIN_RESPONSE_USER_ID, "", currentContext) + "'",
                    null);
            HealthMonLog.i(TAG, "getNotificationDetails()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    if (cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_TASK_TO_SHOW)) ==
                            Constants.DbConstants.TASK_TO_SHOW) {
                        Tasks notification = new Tasks();
                        notification.setUser_Task_Name(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_TASK_NAME)));
                        notification.setUser_Task_Description(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_TASK_DESCRIPTION)));
                        String date = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_TASK_DATE));
                        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT);
                        Date formatedDate = sdf.parse(date);
                        SimpleDateFormat sdfShow = new SimpleDateFormat(Constants.DbConstants.DATE_FORMAT_DASHBOARD);
                        notification.setUser_Task_Date(sdfShow.format(formatedDate));
                        notification.setTask_to_show(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_TASK_TO_SHOW)));
                        //Primary keys-use for deletion
                        notification.setUser_Tasks_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_USERTASK_ID)));
                        notification.setHM_User_HM_Programs_Programs_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_USERPROGRAM_ID)));
                        notification.setHM_User_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_USER_ID)));
                        notifications.add(notification);
                        HealthMonLog.i(TAG, "getNotificationDetails()" + notification.toString());
                    }
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
            return notifications;
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getNotificationDetails()");
        }
        return null;

    }

    public boolean removeNotificaiton(Tasks notification) {
        int rows = 0;
        this.open(false);
        final String whereClause = Constants.DbConstants.COLUMN_USERTASK_ID
                + "=? AND " + Constants.DbConstants.COLUMN_USERPROGRAM_ID
                + "=? AND " + Constants.DbConstants.COLUMN_USER_ID
                + "=? ";
        final String[] whereArgs = {String.valueOf(notification.getUser_Tasks_id()),
                String.valueOf(notification.getHM_User_HM_Programs_Programs_id()),
                (notification.getHM_User_id())};
        SQLiteDatabase database = this.getWritableDatabase();
        try {
/*            rows = database.delete(Constants.DbConstants.TABLE_TASK_ALERTS,
                    whereClause, whereArgs);*/
            final ContentValues values = new ContentValues();
            values.put(Constants.DbConstants.COLUMN_TASK_TO_SHOW, Constants.DbConstants.TASK_NOT_TO_SHOW);

            database.update(Constants.DbConstants.TABLE_TASK_ALERTS, values,
                    whereClause,
                    whereArgs);
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - removeNotificaiton()");
        } finally {
            this.close();
            database.close();
        }
        if (rows == 1) {
            return true;
        }

        return false;
    }

    public PatientAddressDetail getPatientAddress(String patientId) {
        PatientAddressDetail patientAddressDetail = new PatientAddressDetail();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from personalInfo where patient_id ='" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            do {
                patientAddressDetail.setAddr1(cursor.getString(cursor.getColumnIndex("addr1")));
                patientAddressDetail.setAddr2(cursor.getString(cursor.getColumnIndex("addr2")));
               /* patientAddressDetail.setDistrict(cursor.getString(cursor.getColumnIndex("district")));
                patientAddressDetail.setTal(cursor.getString(cursor.getColumnIndex("tal")));
                patientAddressDetail.setVillageId(cursor.getString(cursor.getColumnIndex("village")));
                patientAddressDetail.setWard(cursor.getInt(cursor.getColumnIndex("ward")));
                patientAddressDetail.setPin(cursor.getString(cursor.getColumnIndex("pin")));
               */ // patientAddressDetail.setEm_contact(cursor.getString(cursor.getColumnIndex("em_contact")));

            } while (cursor.moveToNext());
        }
        cursor.close();
        return patientAddressDetail;
    }

    public ArrayList<PatientFamilyInfo> getPatientFamilyInfo(String patientId) {
        ArrayList<PatientFamilyInfo> patientFamilyInfos = new ArrayList<PatientFamilyInfo>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from familyInfo where patient_id ='" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            do {
                PatientFamilyInfo patientFamilyInfo = new PatientFamilyInfo();
                patientFamilyInfo.setPatient_id(cursor.getString(cursor.getColumnIndex("patient_id")));
                patientFamilyInfo.setFamily_member_id(cursor.getString(cursor.getColumnIndex("family_member_id")));
                patientFamilyInfo.setName(cursor.getString(cursor.getColumnIndex("name")));
                patientFamilyInfo.setGenderId(cursor.getInt(cursor.getColumnIndex("genderId")));
                patientFamilyInfo.setDob(cursor.getString(cursor.getColumnIndex("dob")));
                patientFamilyInfo.setAge(Integer.parseInt(cursor.getString(cursor.getColumnIndex("age"))));
                patientFamilyInfo.setRelation_to_patient(cursor.getString(cursor.getColumnIndex("relation_to_patient")));
                patientFamilyInfo.setMarrital_status(cursor.getString(cursor.getColumnIndex("marrital_status")));
                patientFamilyInfo.setEducation(cursor.getString(cursor.getColumnIndex("education")));
                patientFamilyInfo.setIdCardTypeId(cursor.getInt(cursor.getColumnIndex("idCardTypeId")));
                patientFamilyInfo.setIdCardNumber(cursor.getString(cursor.getColumnIndex("idCardNumber")));
                patientFamilyInfo.setCategoryId(cursor.getInt(cursor.getColumnIndex("categoryId")));
                patientFamilyInfo.setContact(cursor.getString(cursor.getColumnIndex("contact")));
                patientFamilyInfos.add(patientFamilyInfo);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return patientFamilyInfos;
    }


    public ProgramInfo getPatientProgramInfo(String patientId) {
        ProgramInfo programInfo = new ProgramInfo();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from programInfo where patient_id ='" + patientId + "'", null);
        if (cursor.moveToFirst()) {
            do {
                programInfo.setProgram_id(cursor.getString(cursor.getColumnIndex("program_id")));
                programInfo.setProgram_name(cursor.getString(cursor.getColumnIndex("program_name")));
                programInfo.setLMPDate(cursor.getString(cursor.getColumnIndex("LMPDate")));
                programInfo.setEDD(cursor.getString(cursor.getColumnIndex("EDD")));
                //programInfo.setIsFirstPregnancy(Boolean.valueOf(cursor.getString(cursor.getColumnIndex("isFirstPregnancy"))));
                if (cursor.getString(cursor.getColumnIndex("isFirstPregnancy")).equals("0")) {
                    programInfo.setIsFirstPregnancy(false);
                } else {
                    programInfo.setIsFirstPregnancy(true);
                }
                programInfo.setNotes(cursor.getString(cursor.getColumnIndex("notes")));
                programInfo.setGravida(cursor.getString(cursor.getColumnIndex("gravida")));
                programInfo.setParity(cursor.getString(cursor.getColumnIndex("parity")));
                programInfo.setPastAbortions(cursor.getString(cursor.getColumnIndex("pastAbortions")));
                programInfo.setPastStillBirths(cursor.getString(cursor.getColumnIndex("pastStillBirths")));
                programInfo.setLivingChildren(cursor.getString(cursor.getColumnIndex("livingChildren")));
                programInfo.setPreviousDeliveryDate(cursor.getString(cursor.getColumnIndex("previousDeliveryDate")));
                programInfo.setNatureofPreviousDelivery(cursor.getString(cursor.getColumnIndex("natureofPreviousDelivery")));
                programInfo.setIs_Submitted(Boolean.valueOf(cursor.getString(cursor.getColumnIndex("is_Submitted"))));
                programInfo.setIs_Uploaded(Boolean.valueOf(cursor.getString(cursor.getColumnIndex("is_Uploaded"))));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return programInfo;
    }

    // closing database
    public void closeDB() {
        SQLiteDatabase db = this.getReadableDatabase();
        if (db != null && db.isOpen())
            db.close();
    }

    public ArrayList<PatientPersonalInfo> getAllPatients(int priority) {
        ArrayList<PatientPersonalInfo> patientPersonalInfos = new ArrayList<PatientPersonalInfo>();
        SQLiteDatabase db = this.getReadableDatabase();
        //Cursor cursor = db.rawQuery("select * from personalInfo INNER JOIN programInfo ON personalInfo.patient_id = programInfo.patient_id ", null);
        Cursor cursor = db.rawQuery("select * from personalInfo INNER JOIN programInfo ON personalInfo.patient_id = programInfo.patient_id INNER JOIN patientSeverityStatus ON personalInfo.patient_id = patientSeverityStatus.patient_id where patientSeverityStatus.overallFlag = " + priority, null);
        if (cursor.moveToFirst()) {

            do {
                PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();
                patientPersonalInfo.setAsha_id(cursor.getString(cursor.getColumnIndex("asha_id")));
                patientPersonalInfo.setPatient_id(cursor.getString(cursor.getColumnIndex("patient_id")));
                patientPersonalInfo.setPatient_image_string(cursor.getString(cursor.getColumnIndex("patient_image")));
                patientPersonalInfo.setFirstName(cursor.getString(cursor.getColumnIndex("firstName")));
                patientPersonalInfo.setMiddleName(cursor.getString(cursor.getColumnIndex("middleName")));
                patientPersonalInfo.setLastName(cursor.getString(cursor.getColumnIndex("lastName")));
                patientPersonalInfo.setGenderId(cursor.getInt(cursor.getColumnIndex("genderId")));
                patientPersonalInfo.setDob(cursor.getString(cursor.getColumnIndex("dob")));
                patientPersonalInfo.setAge(cursor.getInt(cursor.getColumnIndex("age")));
                patientPersonalInfo.setPlace_of_birth(cursor.getString(cursor.getColumnIndex("place_of_birth")));
                patientPersonalInfo.setMarrital_status(cursor.getString(cursor.getColumnIndex("marrital_status")));
                patientPersonalInfo.setCategoryId(cursor.getInt(cursor.getColumnIndex("categoryId")));
                String isBPL = cursor.getString(cursor.getColumnIndex("bpl"));
                patientPersonalInfo.setLanguage(cursor.getString(cursor.getColumnIndex("language")));
                patientPersonalInfo.setEducation(cursor.getString(cursor.getColumnIndex("education")));
                patientPersonalInfo.setIdCardTypeId(cursor.getInt(cursor.getColumnIndex("idCardTypeId")));
                patientPersonalInfo.setIdCardNumber(cursor.getString(cursor.getColumnIndex("idCardNumber")));
                patientPersonalInfo.setContact(cursor.getString(cursor.getColumnIndex("contact")));
                patientPersonalInfo.setPriority(Integer.parseInt(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_OVERALL_FLAG))));
                patientPersonalInfo.setTimeStamp(cursor.getString(cursor.getColumnIndex("time_stemp")));
                patientPersonalInfo.setLocation(getVillage(cursor.getInt(cursor.getColumnIndex("villageId"))));
                patientPersonalInfo.setEDD(cursor.getString(cursor.getColumnIndex("EDD")));
                patientPersonalInfos.add(patientPersonalInfo);

            } while (cursor.moveToNext());
        }
        return patientPersonalInfos;
    }

    public ArrayList<PatientPersonalInfo> getAllPatientsList() {
        ArrayList<PatientPersonalInfo> patientPersonalInfos = new ArrayList<PatientPersonalInfo>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from personalInfo where asha_id ='" + PreferanceManager.getAshaId(currentContext) + "'", null);
        if (cursor.moveToFirst()) {

            do {
                PatientPersonalInfo patientPersonalInfo = new PatientPersonalInfo();
                patientPersonalInfo.setAsha_id(cursor.getString(cursor.getColumnIndex("asha_id")));
                patientPersonalInfo.setPatient_id(cursor.getString(cursor.getColumnIndex("patient_id")));
                patientPersonalInfo.setPatient_image_string(cursor.getString(cursor.getColumnIndex("patient_image")));
                patientPersonalInfo.setFirstName(cursor.getString(cursor.getColumnIndex("firstName")));
                patientPersonalInfo.setMiddleName(cursor.getString(cursor.getColumnIndex("middleName")));
                patientPersonalInfo.setLastName(cursor.getString(cursor.getColumnIndex("lastName")));
                //patientPersonalInfo.setGender(cursor.getString(cursor.getColumnIndex("gender")));
                patientPersonalInfo.setDob(cursor.getString(cursor.getColumnIndex("dob")));
                patientPersonalInfo.setAge(cursor.getInt(cursor.getColumnIndex("age")));
                patientPersonalInfo.setPlace_of_birth(cursor.getString(cursor.getColumnIndex("place_of_birth")));
                patientPersonalInfo.setMarrital_status(cursor.getString(cursor.getColumnIndex("marrital_status")));
                //patientPersonalInfo.setCategory(cursor.getString(cursor.getColumnIndex("category")));
                String isBPL = cursor.getString(cursor.getColumnIndex("bpl"));
                patientPersonalInfo.setLanguage(cursor.getString(cursor.getColumnIndex("language")));
                patientPersonalInfo.setEducation(cursor.getString(cursor.getColumnIndex("education")));
                /// patientPersonalInfo.setIdCardType(cursor.getString(cursor.getColumnIndex("idCardType")));
                patientPersonalInfo.setIdCardNumber(cursor.getString(cursor.getColumnIndex("idCardNumber")));
                patientPersonalInfo.setContact(cursor.getString(cursor.getColumnIndex("contact")));
                // patientPersonalInfo.setPriority(Integer.parseInt(cursor.getString(cursor.getColumnIndex("priority"))));
                patientPersonalInfo.setTimeStamp(cursor.getString(cursor.getColumnIndex("time_stemp")));
                // patientPersonalInfo.setLocation(cursor.getString(cursor.getColumnIndex("village")));
                patientPersonalInfos.add(patientPersonalInfo);

            } while (cursor.moveToNext());
        }
        return patientPersonalInfos;
    }

    public Boolean addPatientBP(final PatientVitals patientVitals) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, patientVitals.getPatient_id());
            values.put(Constants.DbConstants.COLUMN_VITALS_ASHA_ID, patientVitals.getHM_userId());
            values.put(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID, patientVitals.getHM_DeviceID());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_SYS, patientVitals.getHM_systolic());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_DIA, patientVitals.getHM_diastolic());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_PULSE, patientVitals.getHM_pulseRate());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, patientVitals.getHM_timestamp());

            long inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_BP, null, values);
            if (inserted == -1) {
                return result = false;
            }
            HealthMonLog.i(TAG, "BP details inserted- " + patientVitals.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addPatientBP() BP details = " + patientVitals.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<PatientVitals> getAllPatientBP(String patient_ID) {
        SQLiteDatabase db = this.getReadableDatabase();
        PatientVitals patientVitals = null;
        ArrayList<PatientVitals> patientsVital = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patient_ID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_BP + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patient_ID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_BP,
                        null);
            }
            HealthMonLog.i(TAG, "getPatientBP()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    patientVitals = new PatientVitals();
                    patientVitals.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    patientVitals.setHM_userId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_ASHA_ID)));
                    patientVitals.setHM_DeviceID(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID)));
                    patientVitals.setHM_systolic(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_SYS)));
                    patientVitals.setHM_diastolic(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_DIA)));
                    patientVitals.setHM_pulseRate(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_PULSE)));

                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    patientVitals.setHM_timestamp(strDate);
                    String strdate1 = null;
                    Date date = null;
                    try {
                        date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                        HealthMonLog.i(TAG, "getAllPatientBP Date1" + date);
                        //TODO for testing changes in date format
                        strdate1 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT).format(date);
                        HealthMonLog.i(TAG, "getAllPatientBP String Date" + strdate1);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    patientVitals.setHM_timestamp_in_DATE(date);
                    patientVitals.setDateInsertServer(strdate1);

                    patientsVital.add(patientVitals);
                    HealthMonLog.i(TAG, "getAllPatientBP()" + patientVitals.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientBP()");
        }

        return patientsVital;

    }

    public Boolean addPatientVital(final PatientVitals patientVitals) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, patientVitals.getPatient_id());
            values.put(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID, patientVitals.getHM_userId());
            values.put(Constants.DbConstants.COLUMN_VITALS_TEMPERATURE, patientVitals.getTemperature());
            values.put(Constants.DbConstants.COLUMN_VITALS_WEIGHT, patientVitals.getWeight());
            values.put(Constants.DbConstants.COLUMN_VITALS_HEIGHT, patientVitals.getHeight());
            values.put(Constants.DbConstants.COLUMN_VITALS_BMI, patientVitals.getBmi());
            values.put(Constants.DbConstants.COLUMN_VITALS_GIRTH, patientVitals.getGirth());
            values.put(Constants.DbConstants.COLUMN_VITALS_FUNDAL, patientVitals.getFundalHeight());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, patientVitals.getHM_timestamp());

            long inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_VITALS, null, values);
            if (inserted == -1) {
                //Show pop up previous values will override
                // DB.update(Constants.DbConstants.TABLE_PATIENT_VITALS, values, Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = ?",
                //         new String[] { String.valueOf(patientVitals.getPatient_id()) });
                return result = false;
            }
            HealthMonLog.i(TAG, "addPatientVital(): Vital details inserted- " + patientVitals.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addPatientVital(): Vital details " + patientVitals.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<PatientVitals> getAllPatientVital(String patientID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<PatientVitals> patientsVital = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patientID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_VITALS + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patientID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_VITALS,
                        null);
            }
            HealthMonLog.i(TAG, "getAllPatientVital()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    PatientVitals patientVitals = new PatientVitals();
                    patientVitals = new PatientVitals();
                    patientVitals.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    patientVitals.setHM_userId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID)));
                    patientVitals.setTemperature(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_TEMPERATURE)));
                    patientVitals.setWeight(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_WEIGHT)));
                    patientVitals.setHeight(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_HEIGHT)));
                    patientVitals.setBmi(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BMI)));
                    patientVitals.setGirth(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_GIRTH)));
                    patientVitals.setFundalHeight(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_FUNDAL)));
                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    patientVitals.setHM_timestamp(strDate);
                    Date date = null;
                    String strdate1 = null;
                    try {
                        date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                        HealthMonLog.i(TAG, "getAllPatientVital Date1" + date);
                        //TODO for testing changes in date format
                        strdate1 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT).format(date);
                        HealthMonLog.i(TAG, "getAllPatientVital String Date" + strdate1);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    patientVitals.setHM_timestamp_in_DATE(date);
                    patientVitals.setDateInsertServer(strdate1);

                    patientsVital.add(patientVitals);
                    HealthMonLog.i(TAG, "getAllPatientVital " + patientVitals.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientVital ");
        }
        return patientsVital;
    }

    public ArrayList<TrainingDetails> getTrainingDetails(String user_id) {
        SQLiteDatabase db = this.getReadableDatabase();
        TrainingDetails trainingDetails = null;
        ArrayList<TrainingDetails> trnDetails = new ArrayList<>();
        Cursor cursor = null;
        try {
            cursor = db.rawQuery("select * from " +
                    Constants.DbConstants.TABLE_EDUCATION_CONTENT_DETAILS + " where " + Constants.DbConstants.COLUMN_USER_ID + " = '" + user_id + "'", null);
            //HealthMonLog.i(TAG, "getPatientBP()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    trainingDetails = new TrainingDetails();
                    trainingDetails.setLearning_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_ID)));
                    trainingDetails.setProgram_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_PROGRAM_id)));
                    trainingDetails.setUser_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMNN_USER_ID)));
                    trainingDetails.setLearning_internal(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL)));

                    trainingDetails.setUser_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_USER_TYPE)));
                    trainingDetails.setLearning_description(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION)));

                    trainingDetails.setLearing_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_TTPE)));
                    trainingDetails.setUser_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL)));

                    trainingDetails.setContent_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_CONTENT_TYPE)));
                    trainingDetails.setLearning_link(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_LINK)));

                    trainingDetails.setCreation_date(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_CREATION_DATE)));
                    trainingDetails.setActive(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ACTIVE)));
                    trainingDetails.setActive(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_PROGRAM_DESC)));
                    trnDetails.add(trainingDetails);


                    HealthMonLog.i(TAG, "getContentDetails()" + trainingDetails.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientVital ");
        }
        return trnDetails;


    }

    public TrainingDetails getTrainingDetails(int user_id) {
        SQLiteDatabase db = this.getReadableDatabase();
        TrainingDetails trainingDetails = null;

        Cursor cursor = db.rawQuery("select * from " +
                Constants.DbConstants.TABLE_EDUCATION_CONTENT_DETAILS + " where " + Constants.DbConstants.COLUMN_USER_ID + " = '" + user_id + "'", null);

        if (cursor.moveToFirst()) {
            do {
                trainingDetails = new TrainingDetails();
                trainingDetails.setLearning_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_ID)));
                trainingDetails.setProgram_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_PROGRAM_id)));
                trainingDetails.setUser_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMNN_USER_ID)));
                trainingDetails.setLearning_internal(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL)));

                trainingDetails.setUser_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_USER_TYPE)));
                trainingDetails.setLearning_description(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION)));

                trainingDetails.setLearing_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_TTPE)));
                trainingDetails.setUser_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL)));

                trainingDetails.setContent_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_CONTENT_TYPE)));
                trainingDetails.setLearning_link(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_LEARNING_LINK)));

                trainingDetails.setCreation_date(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_CREATION_DATE)));
                trainingDetails.setActive(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_ACTIVE)));
                trainingDetails.setActive(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_PROGRAM_DESC)));


                HealthMonLog.i(TAG, "getContentDetails()" + trainingDetails.toString());
            } while (cursor.moveToNext());

        }
        cursor.close();
        this.closeDB();
        return trainingDetails;

    }

    public Boolean addEducationContentDetails(final TrainingDetails trainingDetails) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_LEARNING_ID, trainingDetails.getLearning_id());
            values.put(Constants.DbConstants.COLUMN_PROGRAM_id, trainingDetails.getProgram_id());
            values.put(Constants.DbConstants.COLUMNN_USER_ID, trainingDetails.getUser_id());
            values.put(Constants.DbConstants.COLUMN_USER_TYPE, trainingDetails.getUser_type());
            values.put(Constants.DbConstants.COLUMN_LEARNING_DESCRIPTION, trainingDetails.getLearning_description());
            values.put(Constants.DbConstants.COLUMN_LEARNING_TTPE, trainingDetails.getLearing_type());
            values.put(Constants.DbConstants.COLUMN_LEARNING_IS_INTERNAL, trainingDetails.getLearning_internal());
            values.put(Constants.DbConstants.COLUMN_CONTENT_TYPE, trainingDetails.getContent_type());
            values.put(Constants.DbConstants.COLUMN_LEARNING_LINK, trainingDetails.getLearning_link());
            values.put(Constants.DbConstants.COLUMN_CREATION_DATE, trainingDetails.getCreation_date());
            values.put(Constants.DbConstants.COLUMN_ACTIVE, trainingDetails.getActive());
            values.put(Constants.DbConstants.COLUMN_PROGRAM_DESC, trainingDetails.getProgram_desc());

            long inserted = DB.insert(Constants.DbConstants.TABLE_EDUCATION_CONTENT_DETAILS, null, values);
            if (inserted == -1) {
                return result = false;
            }
            HealthMonLog.i(TAG, "addEducationDetails(): details inserted- " + trainingDetails.toString());
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        } finally {
            this.closeDB();
        }

        return result;

    }


    public boolean insertECGNRTDetails(PatientVitals patientVitals) {
        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, patientVitals.getPatient_id());
            values.put(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID,
                    patientVitals.getHM_DeviceID());
            values.put(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID,
                    patientVitals.getHM_userId());
            values.put(Constants.DbConstants.COLUMN_VITALS_ECG_WAVEPOINTS,
                    patientVitals.getEcgWavePoints());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, patientVitals.getHM_timestamp());

            long longVal = DB.insert(
                    Constants.DbConstants.TABLE_PATIENT_ECG, null,
                    values);
            HealthMonLog.i(TAG, "insertECGNRTDetails() - Inserted = " + longVal + " Data = " + patientVitals.toString());
            if (longVal == -1)
                return false;
            else
                return true;
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - insertECGNRTDetails " + patientVitals.toString());
            return false;
        } finally {
            this.close();
        }

    }

    public ArrayList<PatientVitals> getAllPatientECG(String patient_ID) {
        SQLiteDatabase db = this.getReadableDatabase();
        PatientVitals patientVitals = null;
        ArrayList<PatientVitals> patientsVital = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patient_ID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_ECG + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patient_ID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_ECG,
                        null);
            }
            HealthMonLog.i(TAG, "getPatientECG()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    patientVitals = new PatientVitals();
                    patientVitals.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    patientVitals.setHM_userId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID)));
                    patientVitals.setHM_DeviceID(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID)));
                    patientVitals.setEcgWavePoints(cursor.getBlob(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_ECG_WAVEPOINTS)));
                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    patientVitals.setHM_timestamp(strDate);
                    Date date = null;
                    String strdate1 = null;
                    try {
                        date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                        HealthMonLog.i(TAG, "getAllPatientECG Date1" + date);
                        //TODO for testing changes in date format
                        strdate1 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT).format(date);
                        HealthMonLog.i(TAG, "getAllPatientECG String Date" + strdate1);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    patientVitals.setHM_timestamp_in_DATE(date);
                    patientVitals.setDateInsertServer(strdate1);

/*                String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                patientVitals.setHM_timestamp(strDate);
                Date date = null;
                try {
                    date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                patientVitals.setHM_timestamp_in_DATE(date);  */
                    patientsVital.add(patientVitals);
                    HealthMonLog.i(TAG, "getPatientECG()" + patientVitals.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getPatientECG()");
        }
        return patientsVital;

    }

    public boolean insertOXIDetails(PatientVitals patientVitals) {
        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, patientVitals.getPatient_id());
            values.put(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID,
                    patientVitals.getHM_DeviceID());
            values.put(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID, patientVitals.getHM_userId());
            values.put(Constants.DbConstants.COLUMN_VITALS_OXI_SPO, patientVitals.getOxiSPO());
            values.put(Constants.DbConstants.COLUMN_VITALS_OXI_PI, patientVitals.getOxiPI());
            values.put(Constants.DbConstants.COLUMN_VITALS_OXI_PULSE, patientVitals.getOxiPulse());
            values.put(Constants.DbConstants.COLUMN_VITALS_OXI_WAVE_POINTS, patientVitals.getOxiWavePoints());
            values.put(Constants.DbConstants.COLUMN_VITALS_OXI_BEAT_POINTS, patientVitals.getOxiBeatPoints());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, patientVitals.getHM_timestamp());

            long longVal = DB.insert(
                    Constants.DbConstants.TABLE_PATIENT_OXI, null,
                    values);
            HealthMonLog.i(TAG, "insertOXIDetails() - Inserted = " + longVal + " Data = " + patientVitals.toString());
            if (longVal == -1)
                return false;
            else
                return true;
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - insertECGNRTDetails " + patientVitals.toString());
            return false;
        } finally {
            this.close();
        }

    }

    public ArrayList<PatientVitals> getAllPatientOXI(String patient_ID) {
        SQLiteDatabase db = this.getReadableDatabase();
        PatientVitals patientVitals = null;
        ArrayList<PatientVitals> patientsVital = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patient_ID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_OXI + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patient_ID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_OXI,
                        null);
            }
            HealthMonLog.i(TAG, "getAllPatientOXI()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    patientVitals = new PatientVitals();
                    patientVitals.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    patientVitals.setHM_userId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID)));
                    patientVitals.setHM_DeviceID(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_DEVICE_ID)));
                    patientVitals.setOxiSPO(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_OXI_SPO)));
                    patientVitals.setOxiPI(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_OXI_PI)));
                    patientVitals.setOxiPulse(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_OXI_PULSE)));
                    patientVitals.setOxiWavePoints(cursor.getBlob(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_OXI_WAVE_POINTS)));
                    patientVitals.setOxiBeatPoints(cursor.getBlob(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_OXI_BEAT_POINTS)));
                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    patientVitals.setHM_timestamp(strDate);
                    Date date = null;
                    String strdate1 = null;
                    try {
                        date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                        HealthMonLog.i(TAG, "getAllPatientOXI Date1" + date);
                        //TODO for testing changes in date format
                        strdate1 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT).format(date);
                        HealthMonLog.i(TAG, "getAllPatientOXI String Date" + strdate1);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    patientVitals.setHM_timestamp_in_DATE(date);
                    patientVitals.setDateInsertServer(strdate1);
                    patientsVital.add(patientVitals);
                    HealthMonLog.i(TAG, "getAllPatientOXI()" + patientVitals.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientOXI()");
        }
        return patientsVital;

    }

    public Boolean addPatientHB(final PatientVitals patientVitals) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, patientVitals.getPatient_id());
            values.put(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID, patientVitals.getHM_userId());
            values.put(Constants.DbConstants.COLUMN_VITALS_HB, patientVitals.getHb());
            values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, patientVitals.getHM_timestamp());

            long inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_HB, null, values);
            if (inserted == -1) {
                //Show pop up previous values will override
                // DB.update(Constants.DbConstants.TABLE_PATIENT_VITALS, values, Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = ?",
                //         new String[] { String.valueOf(patientVitals.getPatient_id()) });
                return result = false;
            }
            HealthMonLog.i(TAG, "addPatientHB(): Vital details inserted- " + patientVitals.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addPatientHB(): Vital details " + patientVitals.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<PatientVitals> getAllPatientHB(String patientID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<PatientVitals> patientsVital = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patientID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_HB + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patientID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_HB,
                        null);
            }
            HealthMonLog.i(TAG, "getAllPatientVital()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    PatientVitals patientVitals = new PatientVitals();
                    patientVitals = new PatientVitals();
                    patientVitals.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    patientVitals.setHM_userId(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_Vital_ASHA_ID)));
                    patientVitals.setHb(cursor.getDouble(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_HB)));
                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    patientVitals.setHM_timestamp(strDate);
                    Date date = null;
                    String strdate1 = null;
                    try {
                        date = new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).parse(strDate);
                        HealthMonLog.i(TAG, "getAllPatientHB Date1" + date);
                        //TODO for testing changes in date format
                        strdate1 = new SimpleDateFormat(Constants.DbConstants.SERVER_DATABASE_INSERT_DATE_FORMAT).format(date);
                        HealthMonLog.i(TAG, "getAllPatientHB String Date" + strdate1);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    patientVitals.setHM_timestamp_in_DATE(date);
                    patientVitals.setDateInsertServer(strdate1);

                    patientsVital.add(patientVitals);
                    HealthMonLog.i(TAG, "getAllPatientHB " + patientVitals.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientHB ");
        }
        return patientsVital;
    }


    public Boolean addFeedbackQuestionsFromServer(final Feedback feedback) {
        boolean result = true;

        try {
            this.open(false);
            final ContentValues values = new ContentValues();

            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID, feedback.getSurvey_Questionair_id());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID, feedback.getPrograms_id());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID, feedback.getSurvey_template_id());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY, feedback.getSurvey_Question_Category());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER, feedback.getSurvey_Question_no());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION, feedback.getSurvey_Question_Description());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION, feedback.getSurvey_Question_Options());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID, feedback.getParent_Qid());
            values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image, feedback.getQueImageString());

            long inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_FEEDBACK, null, values);
            if (inserted == -1) {
                //Show pop up previous values will override
                // DB.update(Constants.DbConstants.TABLE_PATIENT_VITALS, values, Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = ?",
                //         new String[] { String.valueOf(patientVitals.getPatient_id()) });
                return result = false;
            }
            HealthMonLog.i(TAG, "addPatientFeedback(): Feedback details inserted- " + feedback.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addPatientFeedback(): Feedback details " + feedback.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<Feedback> getAllFeedbackQuestions(int programID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<Feedback> lstFeedback = new ArrayList<>();
        Cursor cursor = null;
        try {
/*            if (!(programID == -1)) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_FEEDBACK + " where " + Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID + " = '" + programID + "'",
                        null);
            } else {*/
            cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_FEEDBACK + " where " + Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID + " = " + programID + "",
                    null);
            cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_FEEDBACK + " where " + Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID + " = '" + programID + "'",
                    null);
            //}
            HealthMonLog.i(TAG, "getAllPatientFeedback()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    Feedback feedback = new Feedback();
                    feedback.setSurvey_Questionair_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID)));
                    feedback.setPrograms_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_PROGRAM_ID)));
                    feedback.setSurvey_template_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID)));
                    feedback.setSurvey_Question_Category(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY)));
                    feedback.setSurvey_Question_no(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER)));
                    feedback.setSurvey_Question_Description(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION)));
                    feedback.setSurvey_Question_Options(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION)));
                    feedback.setParent_Qid(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID)));
                    feedback.setQueImageString(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTION_Image)));

                    lstFeedback.add(feedback);
                    HealthMonLog.i(TAG, "" +
                            "" + feedback.toString());
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getAllPatientFeedback ");
        }
        return lstFeedback;
    }

    public Boolean addFeedbackResult(final ArrayList<Feedback> FeedbackList) {
        boolean result = true;

        try {
            long inserted = -1;
            this.open(false);
            final ContentValues values = new ContentValues();
            for (Feedback feedback : FeedbackList) {
                if (!feedback.isHeader()) {
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID, feedback.getSurvey_Questionair_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID, feedback.getResult_id());
                    values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, feedback.getPatient_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER, feedback.getAnswer());

                    inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS, null, values);
                }
            }
            //Update feedback use this code
/*            if (inserted == -1) {
                //Show pop up previous values will override
                for(Feedback feedback : FeedbackList) {
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID, feedback.getSurvey_Questionair_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID, feedback.getResult_id());
                    values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, feedback.getPatient_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER, feedback.getAnswer());

                    DB.update(Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS, values,
                            Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + " = ? " +
                                    "and "+Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = ? ",
                            new String[] { String.valueOf(feedback.getSurvey_Questionair_id()),feedback.getPatient_id() });
                }

                //return result = false;
            }*/
            HealthMonLog.i(TAG, "addFeedbackResult(): Feedback Results inserted- " + FeedbackList.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addFeedbackResult(): Feedback details " + FeedbackList.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<Feedback> getFeedbackResults(String patientID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<Feedback> lstFeedback = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patientID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patientID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS,
                        null);
            }
            HealthMonLog.i(TAG, "getAllPatientFeedback()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    //if(!cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER)).equalsIgnoreCase("null")) {
                    Feedback feedback = new Feedback();
                    //Questionair_ID = RESULT_ID
                    feedback.setSurvey_Questionair_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID)));
                    feedback.setResult_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID)));
                    feedback.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    feedback.setAnswer(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER)));
                    lstFeedback.add(feedback);
                    HealthMonLog.i(TAG, "getFeedbackResults " + feedback.toStringFeedbackResult());
                    //}
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getFeedbackResults ");
        }
        return lstFeedback;
    }

    public Boolean addHRAResult(final ArrayList<Feedback> FeedbackList) {
        boolean result = true;

        try {
            long inserted = -1;
            this.open(false);
            final ContentValues values = new ContentValues();
            for (Feedback feedback : FeedbackList) {
                values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID, feedback.getSurvey_Questionair_id());
                values.put(Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID, feedback.getResult_id());
                values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, feedback.getPatient_id());
                values.put(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER, feedback.getAnswer());
                values.put(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP, new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));

                inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_HRA_RESULTS, null, values);
            }
            //Update feedback use this code
/*            if (inserted == -1) {
                //Show pop up previous values will override
                for(Feedback feedback : FeedbackList) {
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID, feedback.getSurvey_Questionair_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_RESULT_ID, feedback.getResult_id());
                    values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, feedback.getPatient_id());
                    values.put(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER, feedback.getAnswer());

                    DB.update(Constants.DbConstants.TABLE_PATIENT_SURVEY_RESULTS, values,
                            Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID + " = ? " +
                                    "and "+Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = ? ",
                            new String[] { String.valueOf(feedback.getSurvey_Questionair_id()),feedback.getPatient_id() });
                }

                //return result = false;
            }*/
            HealthMonLog.i(TAG, "addHRAResult(): HRA Results inserted- " + FeedbackList.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addHRAResult(): HRA details " + FeedbackList.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<Feedback> getHRAResults(String patientID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<Feedback> lstFeedback = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patientID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_HRA_RESULTS + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patientID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_HRA_RESULTS,
                        null);
            }
            HealthMonLog.i(TAG, "getHRAResults()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    //if(!cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER)).equalsIgnoreCase("null")) {
                    Feedback feedback = new Feedback();
                    //Questionair_ID = RESULT_ID
                    feedback.setSurvey_Questionair_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID)));
                    feedback.setResult_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID)));
                    feedback.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    feedback.setAnswer(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER)));
                    String strDate = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_BP_TIMESTAMP));
                    feedback.setTimeStampInString(strDate);
                    lstFeedback.add(feedback);
                    HealthMonLog.i(TAG, "getHRAResults " + feedback.toStringFeedbackResult());
                    //}
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getHRAResults ");
        }
        return lstFeedback;
    }

    public Boolean addMedicationDetails(final ArrayList<Medication> medicationList) {
        boolean result = true;

        try {
            long inserted = -1;
            this.open(false);
            final ContentValues values = new ContentValues();
            for (Medication medication : medicationList) {
                values.put(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID, medication.getPatient_id());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID, medication.getDrug_id());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_MEDICINE_QNTY, medication.getMedicine_qty());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_CREATED_BY, medication.getCreated_by());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_CREATED_DATE, new SimpleDateFormat(Constants.DbConstants.DATABASE_DATE_FORMAT_VITALS_STRING).format(new Date()));
                values.put(Constants.DbConstants.COLUMN_MEDICATION_UPDATED_BY, medication.getUpdated_by());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_UPDATED_DATE, medication.getUpdated_date());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DURATION_IN_DAYS, medication.getDuration_in_days());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME, medication.getDrug_name());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DUE_DATE, medication.getDue_date());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE, medication.getDrug_type());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_GIVEN_BY, medication.getGiven_by());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_ROLE, medication.getRole());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_LOCATION, medication.getLocation());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_USER_ID, medication.getUser_ID());

                inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_Medication, null, values);
            }
            HealthMonLog.i(TAG, "addMedicationDetails(): inserted- " + medicationList.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addMedicationDetails(): details " + medicationList.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<Medication> getMedicationDetails(String patientID) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<Medication> lstmedication = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (!patientID.equals("-1")) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication + " where " + Constants.DbConstants.COLUMN_VITALS_PATIENT_ID + " = '" + patientID + "'",
                        null);
            } else {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication,
                        null);
            }
            HealthMonLog.i(TAG, "getMedicationDetails()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    //if(!cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_FEEDBACK_OPTION_ANSWER)).equalsIgnoreCase("null")) {
                    Medication medication = new Medication();
                    //Questionair_ID = RESULT_ID

                    medication.setPatient_id(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_VITALS_PATIENT_ID)));
                    medication.setDrug_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID)));
                    medication.setMedicine_qty(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_MEDICINE_QNTY)));
                    medication.setCreated_by(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_CREATED_BY)));
                    medication.setCreated_date(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_CREATED_DATE)));
                    medication.setUpdated_by(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_UPDATED_BY)));
                    medication.setUpdated_date(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_UPDATED_DATE)));
                    medication.setDuration_in_days(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DURATION_IN_DAYS)));
                    medication.setDrug_name(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME)));
                    medication.setDue_date(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DUE_DATE)));
                    medication.setDrug_type(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE)));
                    medication.setGiven_by(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_GIVEN_BY)));
                    medication.setRole(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_ROLE)));
                    medication.setLocation(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_LOCATION)));
                    medication.setUser_ID(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_USER_ID)));
                    lstmedication.add(medication);
                    HealthMonLog.i(TAG, "getMedicationDetails " + medication.toString());
                    //}
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getFeedbackResults ");
        }
        return lstmedication;
    }

    public Boolean addDrugNameList(final ArrayList<Medication> medicationList) {
        boolean result = true;

        try {
            long inserted = -1;
            this.open(false);
            final ContentValues values = new ContentValues();
            for (Medication medication : medicationList) {
                values.put(Constants.DbConstants.COLUMN_MEDICATION_ROW_DRUG_NAME, medication.getSpinner_drug_name());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_TYPE, medication.getDrug_type());
                HealthMonLog.i(TAG, "medication :" + medication.toStringSpinner());
                inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_NAMES, null, values);
            }
            HealthMonLog.i(TAG, "addDrugNameList(): inserted- " + medicationList.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addDrugNameList(): details " + medicationList.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public Boolean addServerDrugNameList(final ArrayList<Medication> medicationList) {
        boolean result = true;

        try {
            long inserted = -1;
            this.open(false);
            final ContentValues values = new ContentValues();
            for (Medication medication : medicationList) {
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID, medication.getDrug_id());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME, medication.getDrug_name());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_FORM, medication.getDrug_form());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ROUTE, medication.getRoutes());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_UNITS, medication.getUnits());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_TYPE, medication.getServer_drug_type());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_DESCRIPTION, medication.getServer_drug_description());
                values.put(Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY, medication.getDrug_type());
                HealthMonLog.i(TAG, "medication :" + medication.toString());
                inserted = DB.insert(Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER, null, values);
                HealthMonLog.i(TAG, "addServerDrugNameList(): inserted- " + medication.toString());
            }
            HealthMonLog.i(TAG, "addServerDrugNameList(): inserted- " + medicationList.toString());
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - addServerDrugNameList(): details " + medicationList.toString());
            result = false;
        } finally {
            this.closeDB();
        }
        return result;
    }

    public ArrayList<String> getDrugNameList(String type) {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<String> lstMedication = new ArrayList<>();
        Cursor cursor = null;
        try {
            if (type.equals(Constants.MEDICATION_DRUG_IFA)) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER + " where " + Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY + " = '" + type + "'",
                        null);
            } else if (type.equals(Constants.MEDICATION_DRUG_CA)) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER + " where " + Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY + " = '" + type + "'",
                        null);
            } else if (type.equals(Constants.MEDICATION_DRUG_OTHER)) {
                cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER + " where " + Constants.DbConstants.COLUMN_MEDICATION_DRUG_SERVER_CATEGORY + " = '" + type + "'",
                        null);
            }
            HealthMonLog.i(TAG, "getMedicationDetails()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    Medication medication = new Medication();
                    //Questionair_ID = RESULT_ID
                    lstMedication.add(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME)));
                    HealthMonLog.i(TAG, "getMedicationDetails " + medication.toStringSpinner());
                    //}
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getFeedbackResults ");
        }
        return lstMedication;
    }

    public ArrayList<Medication> getDrugNameWithID() {
        SQLiteDatabase db = this.getReadableDatabase();
        ArrayList<Medication> lstMedication = new ArrayList<>();
        Cursor cursor = null;
        try {
            cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PATIENT_Medication_DRUG_MASTER,
                    null);

            HealthMonLog.i(TAG, "getMedicationDetails()" + cursor.toString());
            if (cursor.moveToFirst()) {
                do {
                    Medication medication = new Medication();
                    //Questionair_ID = RESULT_ID
                    medication.setDrug_id(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_ID)));
                    medication.setDrug_name(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.COLUMN_MEDICATION_DRUG_NAME)));
                    lstMedication.add(medication);
                    HealthMonLog.i(TAG, "getMedicationDetails " + lstMedication.toString());
                    //}
                } while (cursor.moveToNext());

            }
            cursor.close();
            this.closeDB();
        } catch (Exception e) {
            e.printStackTrace();
            HealthMonLog.i(TAG, "Catch - getFeedbackResults ");
        }
        return lstMedication;
    }

    public void insertCountryMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                values.put(Constants.DbConstants.COUNTRY_NAME, countryList.getJSONObject(i).getString("Country_NM"));
                values.put(Constants.DbConstants.COUNTRY_DESC, countryList.getJSONObject(i).getString("Country_Desc"));

                database.insert(Constants.DbConstants.TABLE_COUNTRY, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertCityyMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.CITY_ID, countryList.getJSONObject(i).getInt("City_id"));
                values.put(Constants.DbConstants.CITY_NAME, countryList.getJSONObject(i).getString("City_name"));
                values.put(Constants.DbConstants.DISTRICT_ID, countryList.getJSONObject(i).getInt("District_id"));
                values.put(Constants.DbConstants.STATE_ID, countryList.getJSONObject(i).getInt("State_ID"));
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                database.insert(Constants.DbConstants.TABLE_CITY, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertDistrictMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.DISTRICT_ID, countryList.getJSONObject(i).getInt("District_id"));
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                values.put(Constants.DbConstants.STATE_ID, countryList.getJSONObject(i).getInt("State_ID"));
                values.put(Constants.DbConstants.DISTRICT_NAME, countryList.getJSONObject(i).getString("District_name"));
                database.insert(Constants.DbConstants.TABLE_DISTRICT, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<SpinerIdValue> getDistrictForSpinner() {
        ArrayList<SpinerIdValue> districtLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_DISTRICT, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.DISTRICT_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.DISTRICT_NAME)));
                districtLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return districtLst;
    }

    public String getDistrict(int id) {
        String district = "";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_DISTRICT + " where " + Constants.DbConstants.DISTRICT_ID + " = " + id, null);
        if (cursor.moveToFirst()) {
            do {
                district = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.DISTRICT_NAME));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return district;
    }

    public ArrayList<SpinerIdValue> getCityForSpinner(int districId) {
        ArrayList<SpinerIdValue> districtLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_CITY + " where " + Constants.DbConstants.DISTRICT_ID + " = " + districId, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.CITY_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CITY_NAME)));
                districtLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return districtLst;
    }

    public String getCity(int id) {
        String district = "";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_CITY + " where " + Constants.DbConstants.CITY_ID + " = " + id, null);
        if (cursor.moveToFirst()) {
            do {
                district = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CITY_NAME));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return district;
    }

    public void
    insertStateMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.STATE_ID, countryList.getJSONObject(i).getInt("State_ID"));
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                values.put(Constants.DbConstants.STATE_NAME, countryList.getJSONObject(i).getString("State_NM"));
                values.put(Constants.DbConstants.STATE_DESC, countryList.getJSONObject(i).getString("State_Desc"));
                database.insert(Constants.DbConstants.TABLE_STATE, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertVillageMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.VILLAGE_ID, countryList.getJSONObject(i).getInt("Village_id"));
                values.put(Constants.DbConstants.STATE_ID, countryList.getJSONObject(i).getInt("State_ID"));
                values.put(Constants.DbConstants.DISTRICT_ID, countryList.getJSONObject(i).getInt("District_id"));
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                values.put(Constants.DbConstants.CITY_ID, countryList.getJSONObject(i).getInt("City_id"));
                values.put(Constants.DbConstants.VILLAGE_NAME, countryList.getJSONObject(i).getString("Village_Name"));
                database.insert(Constants.DbConstants.TABLE_VILLAGE, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<SpinerIdValue> getVillageForSpinner(int cityId) {
        ArrayList<SpinerIdValue> districtLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_VILLAGE + " where " + Constants.DbConstants.CITY_ID + " = " + cityId, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.VILLAGE_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.VILLAGE_NAME)));
                districtLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return districtLst;
    }

    public String getVillage(int id) {
        String district = "";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_VILLAGE + " where " + Constants.DbConstants.VILLAGE_ID + " = " + id, null);
        if (cursor.moveToFirst()) {
            do {
                district = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.VILLAGE_NAME));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return district;
    }

    public ArrayList<SpinerIdValue> getPinForSpinner(int cityId) {
        ArrayList<SpinerIdValue> districtLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_PINCODE + " where " + Constants.DbConstants.CITY_ID + " = " + cityId, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                //spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.VILLAGE_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.PIN_CODE)));
                districtLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return districtLst;
    }


    public void insertCastCategoryMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.CATEGORY_ID, countryList.getJSONObject(i).getInt("Cast_Category_Id"));
                values.put(Constants.DbConstants.CATEGORY_NAME, countryList.getJSONObject(i).getString("Cast_Category_NM"));
                values.put(Constants.DbConstants.CATEGORY_DESC, countryList.getJSONObject(i).getString("Cast_Category_Desc"));
                database.insert(Constants.DbConstants.TABLE_CAST_CATEGORY, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertPinMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.DISTRICT_ID, countryList.getJSONObject(i).getInt("District_id"));
                values.put(Constants.DbConstants.STATE_ID, countryList.getJSONObject(i).getInt("State_ID"));
                values.put(Constants.DbConstants.COUNTRY_ID, countryList.getJSONObject(i).getInt("Country_ID"));
                values.put(Constants.DbConstants.CITY_ID, countryList.getJSONObject(i).getInt("City_id"));
                values.put(Constants.DbConstants.PIN_CODE, countryList.getJSONObject(i).getString("PinCode"));
                values.put(Constants.DbConstants.AREA_NAME, countryList.getJSONObject(i).getString("AreaName"));
                database.insert(Constants.DbConstants.TABLE_PINCODE, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertGenderMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.GENDER_ID, countryList.getJSONObject(i).getInt("Gender_Id"));
                values.put(Constants.DbConstants.GENDER_NAME, countryList.getJSONObject(i).getString("Gender_Name"));
                values.put(Constants.DbConstants.GENDER_SHORT_NAME, countryList.getJSONObject(i).getString("Gender_Short_NM"));
                database.insert(Constants.DbConstants.TABLE_GENDER, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertIdentityCardMaster(String rawResponse) {
        try {
            SQLiteDatabase database = this.getWritableDatabase();
            JSONArray countryList = new JSONArray(rawResponse);
            for (int i = 0; i < countryList.length(); i++) {
                ContentValues values = new ContentValues();
                values.put(Constants.DbConstants.CARD_TYPE_ID, countryList.getJSONObject(i).getInt("Card_Type_id"));
                values.put(Constants.DbConstants.CARD_TYPE, countryList.getJSONObject(i).getString("Card_Type"));
                values.put(Constants.DbConstants.CARD_DESC, countryList.getJSONObject(i).getString("Card_Description"));
                database.insert(Constants.DbConstants.TABLE_IDENTITY_CARD, null, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<SpinerIdValue> getCastCategory() {
        ArrayList<SpinerIdValue> categoryLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_CAST_CATEGORY, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.CATEGORY_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CATEGORY_NAME)));
                categoryLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return categoryLst;
    }

    public String getCastCategory(int id) {
        String category = "";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_CAST_CATEGORY + " where " + Constants.DbConstants.CATEGORY_ID + " = " + id, null);
        if (cursor.moveToFirst()) {
            do {
                category = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CATEGORY_NAME));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return category;
    }

    public ArrayList<SpinerIdValue> getCardTypeForSpinner() {
        ArrayList<SpinerIdValue> categoryLst = new ArrayList<SpinerIdValue>();
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_IDENTITY_CARD, null);
        if (cursor.moveToFirst()) {
            do {
                SpinerIdValue spinerIdValue = new SpinerIdValue();
                spinerIdValue.setId(cursor.getInt(cursor.getColumnIndex(Constants.DbConstants.CARD_TYPE_ID)));
                spinerIdValue.setValue(cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CARD_TYPE)));
                categoryLst.add(spinerIdValue);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return categoryLst;
    }

    public String getCardType(int id) {
        String category = "";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("select * from " + Constants.DbConstants.TABLE_IDENTITY_CARD + " where " + Constants.DbConstants.CARD_TYPE_ID + " = " + id, null);
        if (cursor.moveToFirst()) {
            do {

                category = cursor.getString(cursor.getColumnIndex(Constants.DbConstants.CARD_TYPE));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return category;
    }
}
