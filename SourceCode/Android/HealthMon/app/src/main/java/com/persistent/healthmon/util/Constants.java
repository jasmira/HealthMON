package com.persistent.healthmon.util;

import android.os.Environment;

import com.persistent.healthmon.R;

/**
 * Created by harshal_patil on 2/23/2016.
 */
public class Constants {

    public static final String DB_FILE_PATH = Environment.getExternalStorageDirectory() + "/App_Images/";
    //public static final String BASE_URL = "http://10.80.32.191:4400/";
    //public static final String BASE_URL = "http://10.88.45.184:4300/";
    //public static final String BASE_URL = "http://10.51.232.175:4300/";
   // public static final String BASE_URL = "http://10.80.32.191:4400/";
    public static final String BASE_URL = "http://10.244.49.234:8080/";
    //public static final String BASE_URL2 = "http://10.80.32.191:4300/";

    //public static final String BASE_URL = "http://10.88.34.211:4300/";
    public static final String BASE_URL_45_177 = "http://10.88.45.177:4400/";
    public static final String AUTHORIZATION_URL = "Authorization";
    public static final String LOGIN_URL = "login";
    //public static final String INSERT_PERSONAL_INFO_URL = "patient/patient_personal_Info";
    public static final String INSERT_PERSONAL_INFO_URL = "patient/addPatientPersonalInfo";
    //public static final String INSERT_FAMILY_INFO_URL = "patient/patient_family_Info";
    public static final String INSERT_FAMILY_INFO_URL = "patient/addPatientFamilyInfo";
    public static final String INSERT_PROGRAM_INFO_URL = "patient/addPatientProgramInfo";
    public static final String GET_ALL_TASKS_URL = "common/getHmTaskAlerts/";
    public static final String GET_ALL_ACTIVITY_URL = "common/getActivities/";
    public static final String GET_ALL_PATIENTS_URL = "common/getPatientList/";
    public static final String GET_ALL_ACTIVITY_URL2 = "http://10.88.34.211:4300/common/getActivities/ASHA1";
    public static final String GET_ASHA_DETAILS_URL = "common/getUserProfileInfo/";
    public static final String GET_PATIENT_VITALS_URL = "patient/getPatientVitals/1";
    public static final String GET_PATIENT_BP_URL = "patient/getPatientVitals/1";
    public static final String INSERT_PATIENT_VITAL_URL = "patient/addPatientsVitals/";
    public static final String INSERT_PATIENT_BP_URL = "patient/addPatientsBPInfo/";
    public static final String INSERT_MY_ACTIVITY_URL = "common/addMyActivities/";
    public static final String UPDATE_MY_ACTIVITY_ANDROID_ID_URL = "common/setAndriodUserTasksid/";
    public static final String UPDATE_MY_ACTIVITY_STATUS_URL = "common/editMyActivity/";
    public static final String GET_MY_ACTIVITY_URL = "common/getMyActivities/";
    public static final String INSERT_PATIENT_HB_URL = "patient/addPatientsHB/";
    public static final String INSERT_PATIENT_ECG_URL = "patient/addPatientsECGInfo/";
    public static final String INSERT_PATIENT_OXI_URL = "patient/addPatientsPulseOximeterInfo/";
    public static final String INSERT_PATIENT_FEEDBACK_RESULT_URL = "patient/addPatientsSurvey/";
    public static final String INSERT_PATIENT_FEEDBACK_RESULT_URL2 = "http://10.80.32.191:4300/patient/addPatientsSurvey/";
    public static final String GET_FEEDBACK_QUESTIONS_URL = "patient/getSurveyTemplate/1/feedback/ASHA";
    public static final String GET_FEEDBACK_QUESTIONS_URL2 = "http://10.80.32.191:4300/patient/getSurveyTemplate/1/feedback/ASHA";
    public static final String GET_HRA_URL2 = "http://10.80.32.191:4300/patient/getSurveyTemplate/1/hra/ASHA";
    public static final String GET_HRA_URL = "patient/getSurveyTemplate/1/hra/ASHA";
    public static final String INSERT_REFERAL_URL = "patient/referPatients";
    public static final String INSERT_REFERAL_URL2 = "http://10.88.45.184:4300/patient/referPatients";
    public static final String GET_CARE_PLAN_URL = "common/getPatientCareplan/";
    public static final String INSERT_MEDICATION_URL = "patient/addPatientsMedications/";
    public static final String INSERT_PATIENT_SEVERITY_URL = "patient/addPatientSeverity/";
    public static final String GET_PATIENT_SEVERITY_URL = "patient/getPatientSeverity/";
        public static final String GET_PATIENT_PROGRAM_URL = "patient/getPatientProgramInfo/";

    public static String FILE_NAME;


    // Master data URLS
    public static final String GET_COUNTRY_MASTER = "masterData/getHmCountry/";
    public static final String GET_CITY_MASTER = "masterData/getHmCities/";
    public static final String GET_DISTRICT_MASTER = "masterData/getHmDistricts/";
    public static final String GET_STATE_MASTER = "masterData/getHmStates/";
    public static final String GET_VILLAGE_MASTER = "masterData/getHMVillages/";
    public static final String GET_PIN_MASTER = "masterData/getHmPincode/";
    public static final String GET_CAST_CATEGORY_MASTER = "masterData/getHmCastCategory/";
    public static final String GET_GENDER_MASTER = "masterData/getHmGender/";
    public static final String GET_ID_CARD_MASTER = "masterData/getHmIdentityCards/";
    public static final String GET_MEDICATION_MASTER = "masterData/getHmDrugsInfo";

    //File names for serial no
    public static final String DIR_HEALTH_MON = "HealthMon";
    public static final String FILE_PATIENT_SR_NO = "PatientSrNo";
    public static final String FILE_ACTIVITY_SR_NO = "ActivitySrNo";
    public static final String FILE_REFERAL_SR_NO = "ReferalSrNo";

    //constant for my activity
    public static final String ACTIVITY_STATUS_DUE = "Due";
    public static final String ACTIVITY_STATUS_DONE = "Done";
    public static final String ACTIVITY_STATUS_DELETE = "Delete";
    public static final String ACTIVITY_CREATEDBY_SELF = "self";

    //key name constants for login webservice
    public static final String LOGIN_KEY_USERNAME = "username";
    public static final String LOGIN_KEY_PASSWORD = "password";
    public static final String LOGIN_KEY_USERTYPE = "user_type";
    public static final String LOGIN_KEY_LANGUAGE = "language";
    public static final String LOGIN_RESPONSE_USER_ID = "HM_User_id";
    public static final String KEY_LOGIN_RESPONSE_USER_ID = "KEY_HM_User_id";
    public static final String TOKEN = "token";
    public static final String KEY_TOKEN = "token";

    //key name constants for insert personal info webservice
    public static final String PERSONALINFO_KEY_AHSHAID = "asha_id";
    public static final String PERSONALINFO_KEY_PATIENT_ID = "patient_id";
    public static final String PERSONALINFO_KEY_PATIENT_IMAGE = "patient_image";
    public static final String PERSONALINFO_KEY_PATIENT_SALUTATION = "salutation";
    public static final String PERSONALINFO_KEY_FIRST_NAME = "firstName";
    public static final String PERSONALINFO_KEY_MIDDLE_NAME = "middleName";
    public static final String PERSONALINFO_KEY_LAST_NAME = "lastName";
    public static final String PERSONALINFO_KEY_GENDER = "gender";
    public static final String PERSONALINFO_KEY_LANGUAGE = "language";
    public static final String PERSONALINFO_KEY_BIRTH_PLACE = "place_of_birth";
    public static final String PERSONALINFO_KEY_DOB = "dob";
    public static final String PERSONALINFO_KEY_AGE = "age";
    public static final String PERSONALINFO_KEY_CATEGORY = "category";
    public static final String PERSONALINFO_KEY_EDUCATION = "education";
    public static final String PERSONALINFO_KEY_BPL = "bpl";
    public static final String PERSONALINFO_KEY_MARRITAL_STATUS = "marrital_status";
    public static final String PERSONALINFO_KEY_CONTACT = "contact";
    public static final String PERSONALINFO_KEY_ADD1 = "addr1";
    public static final String PERSONALINFO_KEY_ADD2 = "addr2";
    public static final String PERSONALINFO_KEY_DISTRICT = "district";
    public static final String PERSONALINFO_KEY_TAL = "tal";
    public static final String PERSONALINFO_KEY_VILLAGE = "village";
    public static final String PERSONALINFO_KEY_WARD = "ward";
    public static final String PERSONALINFO_KEY_PIN = "pin";
    public static final String PERSONALINFO_KEY_EM_CONTACT = "em_contact";
    public static final String PERSONALINFO_KEY_IDCARD_TYPE = "idCardType";
    public static final String PERSONALINFO_KEY_IDCARD_NUMBER = "idCardNumber";

    //key name constants for insert family info webservice
    public static final String FAMILY_INFO_NO = "family_info_";

    //key name constant for program info service
    public static final String PROGRAMINFO_KEY_PROGRAM_ID = "program_id";
    public static final String PROGRAMINFO_KEY_PROGRAM_NAME = "program_name";
    public static final String PROGRAMINFO_KEY_LMPDATE = "LMPDate";
    public static final String PROGRAMINFO_KEY_EDD = "EDD";
    public static final String PROGRAMINFO_KEY_FIRST_PRENGNACY_FLAG = "isFirstPregnancy";
    public static final String PROGRAMINFO_KEY_NOTES = "notes";
    public static final String PROGRAMINFO_KEY_GRAVIDA = "gravida";
    public static final String PROGRAMINFO_KEY_PARITY = "parity";
    public static final String PROGRAMINFO_KEY_PAST_ABORTIONS = "pastAbortions";
    public static final String PROGRAMINFO_KEY_PAST_STILL_BIRTHS = "pastStillBirths";
    public static final String PROGRAMINFO_KEY_LIVING_CHILDREN = "livingChildren";
    public static final String PROGRAMINFO_KEY_NATURE_OF_DELIVERY = "natureofPreviousDelivery";

    //const for All patient screen
    public static final int PRIORITY_HIGH_RISK_PATIENT = 2;
    public static final int PRIORITY_MODERATE_RISK_PATIENT = 1;
    public static final int PRIORITY_NORMAL_PATIENT = 0;
    public static final String SELECTED_PATIENT_ID = "patient_id";
    public static final String RL_TAB_CONTAINER = "rlTabContainer";
    public static final String STATUS_HIGH_RISK_PATIENT = "Critical";
    public static final String STATUS_MODERATE_RISK_PATIENT = "Need Attention";
    public static final String STATUS_NORMAL_PATIENT = "Normal";


    //Consts for reports
    public static final String REPORT_TO_DATE = "to_date";
    public static final String REPORT_FROM_DATE = "from_date";
    public static final String REPORT_SELECTED_PATIENT = "selected_patient";
    public static final String REPORT_BP_SELECTED_FLAG = "BPselected";
    public static final String REPORT_HP_SELECTED_FLAG = "HBselected";
    public static final String REPORT_GLUCO_SELECTED_FLAG = "GLUCOselected";

    //HRA
    public static final String HRAYes = "Yes";
    public static final String HRANo = "No";

    //Content Uris
    public static final String TASK_TABLE_URI = "tasks";
    public static final String PROVIDER_NAME = "com.persistent.healthmon";
    public static final String URL = "content://" + PROVIDER_NAME + "/" + Constants.TASK_TABLE_URI + "";

    //Database constants
    public class DbConstants {

            public static final String DATABASE_NAME = "HealthMonitor";

        // Tasks details table
        public static final String TABLE_ASHA_DETAILS = "HM_User";
        public static final String TABLE_TASK_ALERTS = "HmTaskAlerts";
        public static final String TABLE_PATIENT_BP = "HM_Patients_BP";
        public static final String TABLE_PATIENT_VITALS = "HM_Patients_VITALS";
        public static final String TABLE_EDUCATION_CONTENT_DETAILS = "HM_Education_Content_Details";
        public static final String TABLE_PATIENT_ECG = "HM_Patients_ECG";
        public static final String TABLE_PATIENT_OXI = "HM_Patients_PulseOximeter";
        public static final String TABLE_PATIENT_HB = "HM_Patients_Hb";
        public static final String TABLE_PATIENT_FEEDBACK = "HM_Patients_Feedback";
        public static final String TABLE_PATIENT_SURVEY_RESULTS = "HM_Survey_Results";
        public static final String TABLE_PATIENT_Medication = "HM_Medication";
        public static final String TABLE_PATIENT_Medication_DRUG_NAMES = "HM_Medication_Drug_Names";
        public static final String TABLE_PATIENT_Medication_DRUG_MASTER = "hm_drugmaster";

        public static final String COLUMN_ASHA_NAME = "User_Name";
        public static final String COLUMN_ASHA_ID = "User_id";
        public static final String COLUMN_QUALIFICATION = "User_qualification";
        public static final String COLUMN_EMERGENCY_CONTACT = "User_Emergency_contact";
        public static final String COLUMN_ADDRESS = "User_Address1";
        public static final String COLUMN_ADDRESS2 = "User_Address2";
        public static final String COLUMN_CONTACT = "User_contact_number";
        public static final String COLUMN_ASHA_PIC = "HM_User_photo";
        public static final String COLUMN_NOTIFICATION_COUNT = "HM_User_Notification_Count";
        public static final String COLUMN_LAST_SYNC = "HM_User_Last_Sync";

        public static final String COLUMN_TASK_ALERTS_ID = "_id";     // a column named "_id" is required for cursor
        public static final String COLUMN_USERTASK_ID = "User_Tasks_id";
        public static final String COLUMN_USERPROGRAM_ID = "HM_User_HM_Programs_Programs_id";
        public static final String COLUMN_USER_ID = "User_id";
        public static final String COLUMN_TASK_NAME = "User_Task_Name";
        public static final String COLUMN_TASK_DESCRIPTION = "User_Task_Description";
        public static final String COLUMN_TASK_TYPE = "User_Task_Type";
        public static final String COLUMN_TASK_SEVERITY = "User_Task_Severity";
        public static final String COLUMN_TASK_DATE = "User_Task_Date";
        public static final String COLUMN_TASK_CREATED_DATE = "Created_Date";
        public static final String COLUMN_TASK_ACTIONABLE = "User_Task_Actionable";
        public static final String COLUMN_PATIENT_ID = "Patient_id";
        public static final String COLUMN_TASK_ID = "HM_Task_id";
        public static final String COLUMN_PATIENT_NAME = "patient_full_name";
        public static final String COLUMN_TASK_DATE_IN_DATE = "task_date_in_date";
        public static final String COLUMN_TASK_TO_SHOW = "task_to_show";
        public static final int TASK_TO_SHOW = 1;
        public static final int TASK_NOT_TO_SHOW = 0;

        public static final String DATABASE_DATE_FORMAT = "dd/MM/yyyy HH:mm:ss";
        //HH 24hr
        public static final String DATABASE_DATE_FORMAT_VITALS_STRING = "dd-MM-yyyy HH:mm:ss";
        public static final String UI_DATE_FORMAT_VITALS_STRING = "dd-MM-yyyy";
        public static final String DATE_FORMAT_DASHBOARD = "dd-MMM-yy";
        public static final String SERVER_DATABASE_INSERT_DATE_FORMAT = "yyyy-MM-dd HH:mm:SS";
        public static final String SERVER_DATABASE_INSERT_DATE_FORMAT2 = "yyyy-MM-dd";
        public static final String SERVER_DATABASE_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:SS";
        public static final String SERVER_TASK_TYPE_NOTIFICATION = "notification";
        public static final String SERVER_TASK_TYPE_ACTIVITY = "activity";
        public static final String SERVER_TASK_TYPE_TASK = "task";

        //below 2 parameters can be resued by removing vitals of that as they are already defined
        public static final String COLUMN_VITALS_PATIENT_ID = "Patient_id";
        public static final String COLUMN_VITALS_ASHA_ID = "HM_userId";
        public static final String COLUMN_VITALS_DEVICE_ID = "HM_DeviceID";
        public static final String COLUMN_VITALS_BP_SYS = "HM_systolic";
        public static final String COLUMN_VITALS_BP_DIA = "HM_diastolic";
        public static final String COLUMN_VITALS_BP_PULSE = "HM_pulseRate";
        public static final String COLUMN_VITALS_BP_TIMESTAMP = "HM_timestamp";

        //for Vitals
        public static final String COLUMN_VITALS_Vital_ASHA_ID = "UserId";
        public static final String COLUMN_VITALS_TEMPERATURE = "Temperature";
        public static final String COLUMN_VITALS_WEIGHT = "Weight";
        public static final String COLUMN_VITALS_HEIGHT = "Height";
        public static final String COLUMN_VITALS_BMI = "Bmi";
        public static final String COLUMN_VITALS_GIRTH = "Girth";
        public static final String COLUMN_VITALS_FUNDAL = "Fundal_Heights";

        public static final String COLUMN_LEARNING_ID = "Learning_id";
        public static final String COLUMN_PROGRAM_id = "Programs_id";
        public static final String COLUMN_LEARNING_TTPE = "Learning_type";
        public static final String COLUMN_LEARNING_DESCRIPTION = "Learning_description";
        public static final String COLUMN_CONTENT_TYPE = "learning_content_type";
        public static final String COLUMN_CREATION_DATE = "hm_learning_created_date";
        public static final String COLUMN_LEARNING_LINK = "learning_link";
        public static final String COLUMNN_USER_ID = "user_id";
        public static final String COLUMN_USER_TYPE = "Learning_user_type";
        public static final String COLUMN_LEARNING_IS_INTERNAL = "Learning_ext_int";
        public static final String COLUMN_PROGRAM_DESC = "program_desc";
        public static final String COLUMN_ACTIVE = "learning_active";

        //for ECG
        public static final String COLUMN_VITALS_ECG_WAVEPOINTS = "ECGWavepoints";

        //for OXI
        public static final String COLUMN_VITALS_OXI_SPO = "SpO2";
        public static final String COLUMN_VITALS_OXI_PI = "PerfusionIndex";
        public static final String COLUMN_VITALS_OXI_PULSE = "PulseRate";
        public static final String COLUMN_VITALS_OXI_WAVE_POINTS = "PulseOxWavePoints";
        public static final String COLUMN_VITALS_OXI_BEAT_POINTS = "PulseBeatsPoints";
        public static final String COLUMN_VITALS_OXI_DEVICE_ID = "DeviceID";

        //for HB
        public static final String COLUMN_VITALS_HB = "hb";

        //for Feedback
        public static final String COLUMN_FEEDBACK_NEWARRKEY1 = "categoryKey";
        public static final String COLUMN_FEEDBACK_DATA = "data";
        public static final String COLUMN_VITALS_FEEDBACK_QUESTION = "FeedbackQuestion";
        public static final String COLUMN_FEEDBACK_SURVEY_PARENT_QUESTION_ID = "Parent_Qid";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTION_Image = "Survey_Questionair_Image";

        public static final int FEEDBACK_SURVEY_TEMPLATE_ID = 2;
        public static final int HRA_SURVEY_TEMPLATE_ID = 1;
        //Survey Result
        public static final String COLUMN_FEEDBACK_RESULT_ID = "Survey_Result_id";
        public static final String COLUMN_FEEDBACK_OPTION_ANSWER = "Survey_Option_Answer";

        //Medication
        public static final String COLUMN_MEDICATION_DRUG_ID = "DrugId";
        public static final String COLUMN_MEDICATION_MEDICINE_QNTY = "Medicine_Qty";
        public static final String COLUMN_MEDICATION_CREATED_BY = "Created_by";
        public static final String COLUMN_MEDICATION_CREATED_DATE = "Created_Date";
        public static final String COLUMN_MEDICATION_UPDATED_BY = "Updated_by";
        public static final String COLUMN_MEDICATION_UPDATED_DATE = "Updated_Date";
        public static final String COLUMN_MEDICATION_DURATION_IN_DAYS = "Duration_In_Days";
        public static final String COLUMN_MEDICATION_DRUG_NAME = "DrugName";
        public static final String COLUMN_MEDICATION_DUE_DATE = "DueDate";
        public static final String COLUMN_MEDICATION_GIVEN_BY = "GivenBy";
        public static final String COLUMN_MEDICATION_ROLE = "Role";
        public static final String COLUMN_MEDICATION_LOCATION = "Location";
        public static final String COLUMN_MEDICATION_USER_ID = "medication_user_id";

        //Medication Drug Name
        public static final String COLUMN_MEDICATION_ROW_DRUG_NAME = "Medication_Drug_Name";
        public static final String COLUMN_MEDICATION_DRUG_TYPE = "Medication_Drug_Type";

        public static final String COLUMN_MEDICATION_DRUG_FORM = "DrugForm";
        public static final String COLUMN_MEDICATION_DRUG_ROUTE = "Route";
        public static final String COLUMN_MEDICATION_DRUG_UNITS = "Units";
        public static final String COLUMN_MEDICATION_DRUG_SERVER_TYPE = "DrugType";
        public static final String COLUMN_MEDICATION_DRUG_DESCRIPTION = "DrugDescription";
        public static final String COLUMN_MEDICATION_DRUG_SERVER_CATEGORY = "DrugCategory";

        public static final String COLUMN_VITALS_FEEDBACK_S1Q2 = "Feedback";
        public static final String COLUMN_VITALS_FEEDBACK_S1Q3 = "Feedback";
        public static final String COLUMN_VITALS_FEEDBACK_S1Q4 = "Feedback";
        public static final String COLUMN_VITALS_FEEDBACK_S2Q1 = "Feedback";
        public static final String COLUMN_VITALS_FEEDBACK_S2Q2 = "Feedback";
        public static final String COLUMN_VITALS_FEEDBACK_S3Q1 = "Feedback";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTIONAIR_ID = "Survey_Questionair_id";
        public static final String COLUMN_FEEDBACK_PROGRAM_ID = "Programs_id";
        public static final String TABLE_PATIENT_HRA_RESULTS = "HM_HRA_Results";
        public static final String COLUMN_FEEDBACK_SURVEY_TEMPLATE_ID = "Survey_template_id";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTION_CATEGORY = "Survey_Question_Category";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTION_NUMBER = "Survey_Question_no";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTION_DESCRIPTION = "Survey_Question_Description";
        public static final String COLUMN_FEEDBACK_SURVEY_QUESTION_OPTION = "Survey_Question_Options";

        //Table patient status
        public static final String TABLE_PATIENT_SEVERITY_STATUS = "patientSeverityStatus";
        public static final String COLUMN_PATIENT_ID_STATUS = "patient_id";
        public static final String COLUMN_HB_FLAG = "hbFlag";
        public static final String COLUMN_HB_VALUE = "hbValue";
        public static final String COLUMN_BP_FLAG = "bpFlag";
        public static final String COLUMN_BP_SYS_VALUE = "bpSysValue";
        public static final String COLUMN_BP_DIA_VALUE = "bpDiaValue";
        public static final String COLUMN_BP_PULSE_FLAG = "bpPulseFlag";
        public static final String COLUMN_BP_PULSE_VALUE = "bpPulseValue";
        public static final String COLUMN_WEIGHT_FLAG = "weightFlag";
        public static final String COLUMN_WEIGHT_VALUE = "weightValue";
        public static final String COLUMN_OXI_PULSE_FLAG = "oxiPulseFlag";
        public static final String COLUMN_OXI_PULSE_VALUE = "oxiPulseValue";
        public static final String COLUMN_OXI_SPO2_FLAG = "oxiSpO2Flag";
        public static final String COLUMN_OXI_SPO2_VALUE = "oxiPulseO2Value";
        public static final String COLUMN_OVERALL_FLAG = "overallFlag";
        public static final String COLUMN_STATUS_MSG = "statusMsg";


        //master table fields
        //City table
        public static final String DISTRICT_ID = "districtId";
        public static final String CITY_ID = "cityId";
        public static final String STATE_ID = "stateId";
        public static final String COUNTRY_ID = "countryId";
        public static final String VILLAGE_ID = "villageId";
        public static final String CITY_NAME = "cityName";
        public static final String TABLE_CITY = "cityMaster";
        public static final String TABLE_COUNTRY = "countryMaster";
        public static final String COUNTRY_NAME = "countryName";
        public static final String COUNTRY_DESC = "countryDesc";
        public static final String TABLE_DISTRICT = "districtMaster";
        public static final String DISTRICT_NAME = "districtName";
        public static final String TABLE_PINCODE = "pincodeMaster";
        public static final String PIN_CODE = "pincode";
        public static final String AREA_NAME = "areaName";
        public static final String TABLE_STATE = "stateMaster";
        public static final String STATE_NAME = "stateName";
        public static final String STATE_DESC = "stateDesc";
        public static final String TABLE_VILLAGE = "villageMaster";
        public static final String VILLAGE_NAME = "villageName";
        public static final String TABLE_CAST_CATEGORY = "castCategory";
        public static final String CATEGORY_ID = "categoryId";
        public static final String CATEGORY_NAME = "categoryName";
        public static final String CATEGORY_DESC = "categoryDesc";
        public static final String TABLE_GENDER = "genderMaster";
        public static final String GENDER_ID = "genderId";
        public static final String GENDER_NAME = "genderName";
        public static final String GENDER_SHORT_NAME = "genderShortName";
        public static final String TABLE_IDENTITY_CARD = "identityCard";
        public static final String CARD_TYPE_ID = "cardTypeId";
        public static final String CARD_TYPE = "cardType";
        public static final String CARD_DESC = "cardDesc";

    }


    //Tasks
    //For Task search
    public static final String KEY_SEARCH_WORD = "Search Keyword in sms list";
    public static final String KEY_BUNDLE_UPCOMING_TASK_SEARCH = "UPCOMING_TASK_SEARCH";
    public static final String KEY_BUNDLE_DUE_TASK_SEARCH = "DUE_TASK_SEARCH";

    //Task Category
    public static final int CATEGORY_DUETASK = 0;
    public static final int CATEGORY_UPCOMINGTASK = 1;
    public static final String KEY_FRAGMENT_TYPE = "com.healthmon.fragment.type";

    public static String KEY_LASTSYNCTEXT = "KEY_LASTSYNCTEXT";
    public static String KEY_LASTSYNC = "KEY_LASTSYNC";
    public static String KEY_NOTIFICATION_COUNT = "KEY_NOTIFICATION_COUNT";
    public static String KEY_NOTI_COUNT = "KEY_NOTIN_COUNT";

    //Medication
    public static final String MEDICATION_DRUG_IFA = "IFA";
    public static final String MEDICATION_DRUG_CA = "Calcium";
    public static final String MEDICATION_DRUG_OTHER = "Other";
    //BroadCast Receiver
    public static String BROADcAST_CONNECTED = "INTERNET_CONNECTED";
    public static String BROADcAST_DISCONNECTED = "INTERNET_LOST";
    public static String KEY_BROADCAST_CONNECTED = "KEY_BROADCAST_CONNECTED";
    public static String KEY_BROADCAST_DISCONNECTED = "KEY_BROADCAST_DISCONNECTED";

    public static String LOG_OUT = "log_out";

    //Bluetooth Connection status
    public static final int CONNECTION_LOST = 1000;
    public static final int SHOW_PAIRED_DEVICES = 1001;
    public static final int SHOW_DEVICES = 1002;
    public static final int CONNECTED = 1003;
    public static final int CONNECTING = 1004;
    public static final String DEVICE_ID = "deviceId";

    //Devic IDs
    public static final String BPM_STR_DEVICE_ID = "10";
    public static final String OXI_STR_DEVICE_ID = "11";
    public static final String ECG_STR_DEVICE_ID = "12";

    public static final int NUMBER_OF_POINTS_IN_A_PULSE_PACKET = 5;
    public static final int NUMBER_OF_POINTS_IN_A_ECG_PACKET = 25;

    private static int BPM_DEVICE_ID;
    private static int ECG_DEVICE_ID;
    private static int PULSE_OXI_DEVICE_ID;

    public static String BPM_DEVICE = "BPM";
    public static String ECG_DEVICE = "ECG";
    public static String PULSE_OXI = "OXI";
    public static String PULSE_OXI_GRAPH = "OXI_GRAPH";
    public static String NO_DEVICE = "NO_DEVICE";

    //ECG graph points file
    public static final String FILE_ECG_WAVE_POINTS = "ECGwavePoints.txt";

    public static int getBPM_DEVICE_ID() {
        return BPM_DEVICE_ID;
    }

    public static void setBPM_DEVICE_ID(int bPM_DEVICE_ID) {
        BPM_DEVICE_ID = bPM_DEVICE_ID;
    }

    public static int getECG_DEVICE_ID() {
        return ECG_DEVICE_ID;
    }

    public static void setECG_DEVICE_ID(int eCG_DEVICE_ID) {
        ECG_DEVICE_ID = eCG_DEVICE_ID;
    }

    public static int getPULSE_OXI_DEVICE_ID() {
        return PULSE_OXI_DEVICE_ID;
    }

    public static void setPULSE_OXI_DEVICE_ID(int pULSE_OXI_DEVICE_ID) {
        PULSE_OXI_DEVICE_ID = pULSE_OXI_DEVICE_ID;
    }


    public static final String ACTION_PULSE_WAVE_SERVICE_DESTROYED = "com.psl.bluetoothdemo.pulsewave.destroyed";
    public static final String ACTION_ECG_WAVE_SERVICE_DESTROYED = "com.psl.bluetoothdemo.ecgwave.destroyed";
    public static final String GET_EDUCATION_CONTEN_URL = "common/getLearningContents/asha/1";
    //Education
    public static final String ANC = "ANTE NATAL CARE (ANC)";
    public static final String PNC = "POST NATAL CARE (PNC)";
    public static final String FP = "FAMILY PLANNING (FP)";
    public static final String CH = "CHILD HEALTH (CH)";
    public static String webUrl = "";
    public static final String QUC = "M1 - Quality Antenatal Care";
    public static final String ACI = "M2 - Antenatal Care Interventions";
    public static final String PNA = "M1 - Post Natal Assessment";
    public static final String AB = "M2 - Asha Booklet";
    public static final String ITF = "M1 - Introduction To FP";
    public static final String SS = "M2 - Safe Sex";
    public static final String Vasecotomy = "M3 - Vasectomy";
    public static final String CO = "M1 - Child Overview";
    public static final String Dirhea = "M2 - Diarhea";
    public static final String ONLINE_TRAINING_FRAGMENT = "OnlineTrainingsFragment";
    public static final String VIDEO_FRAGMENT = "VideoFragment";

    //Feedback Result
    public static final String StronglyAgree = "StronglyAgree";
    public static final String Agree = "Agree";
    public static final String DisAgree = "DisAgree";
    public static final String StronglyDisAgree = "StronglyDisAgree";

    //Images in Education
    public static final int[] ancImages = new int[]{R.drawable.img_danger_signs, R.drawable.img_dos_and_donts_01, R.drawable.img_health_and_hygeine_01};

    public static final int[] pncImages = new int[]{R.drawable.img_dos_and_donts_02, R.drawable.img_introduction_to_pnc, R.drawable.img_dos_and_donts_03};

    public static final int[] fpImages = new int[]{R.drawable.img_intro_family_planning, R.drawable.img_intro_family_planning, R.drawable.img_safe_sex};

    public static final int[] chImages = new int[]{R.drawable.img_child_overview, R.drawable.img_diarrhea, R.drawable.img_vasectomy};


}



