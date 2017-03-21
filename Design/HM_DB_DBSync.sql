CREATE TABLE HM_Gender (
  Gender_Id INTEGER   NOT NULL ,
  Gender_Name CHAR(15)    ,
  Gender_Short_NM CHAR(1)      ,
PRIMARY KEY(Gender_Id));




CREATE TABLE HM_Country (
  Country_ID INTEGER   NOT NULL ,
  Country_NM VARCHAR(50)    ,
  Country_Desc VARCHAR(50)      ,
PRIMARY KEY(Country_ID));



CREATE TABLE HM_DrugMaster (
  DrugId INTEGER   NOT NULL ,
  DrugName VARCHAR(100)    ,
  DrugForm VARCHAR(20)    ,
  Route VARCHAR(20)    ,
  Units VARCHAR(20)    ,
  DrugType INTEGER    ,
  DrugDescription VARCHAR(100)      ,
PRIMARY KEY(DrugId));




CREATE TABLE HM_Devices (
  Devices_id INTEGER   NOT NULL ,
  Device_long_Name VARCHAR(100)    ,
  Device_Short_Name VARCHAR(50)      ,
PRIMARY KEY(Devices_id));




CREATE TABLE HM_Programs (
  Programs_id INTEGER   NOT NULL ,
  Program_desc VARCHAR(50)    ,
  Program_start_date DATE    ,
  Program_end_date DATE      ,
PRIMARY KEY(Programs_id));








CREATE TABLE HM_Cast_Category (
  Cast_Category_Id INTEGER   NOT NULL ,
  Cast_Category_NM VARCHAR(50)    ,
  Cast_Category_Desc VARCHAR(50)      ,
PRIMARY KEY(Cast_Category_Id));




CREATE TABLE HM_Vitals (
  Vitals_id INTEGER   NOT NULL ,
  Vital_Name VARCHAR(50)    ,
  Vital_Unit VARCHAR(50)      ,
PRIMARY KEY(Vitals_id));




CREATE TABLE HM_Program_Details (
  Program_Details_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Program_item_id INTEGER   NOT NULL ,
  Program_item_name VARCHAR(50)    ,
  Program_item_description VARCHAR(50)    ,
  Program_item_data_type VARCHAR(50)    ,
  Created_By  VARCHAR(50)    ,
  Updated_By  VARCHAR(50)    ,
  Created_Date  DATETIME    ,
  Updated_Date  DATETIME      ,
PRIMARY KEY(Program_Details_id, Programs_id)  ,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id));


CREATE INDEX HM_Program_Details_FKIndex1 ON HM_Program_Details (Programs_id);


CREATE INDEX IFK_Rel_30 ON HM_Program_Details (Programs_id);





CREATE TABLE HM_User (
  User_id VARCHAR(50)   NOT NULL ,
  Programs_id INTEGER   NOT NULL   ,
PRIMARY KEY(User_id)  ,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id));


CREATE INDEX HM_User_FKIndex1 ON HM_User (Programs_id);


CREATE INDEX IFK_Rel_31 ON HM_User (Programs_id);


CREATE TABLE HM_States (
  State_ID INTEGER   NOT NULL ,
  Country_ID INTEGER   NOT NULL ,
  State_NM VARCHAR(50)    ,
  State_Desc VARCHAR(50)      ,
PRIMARY KEY(State_ID, Country_ID)  ,
  FOREIGN KEY(Country_ID)
    REFERENCES HM_Country(Country_ID));


CREATE INDEX HM_States_FKIndex1 ON HM_States (Country_ID);

CREATE TABLE HM_Districts (
  District_id INTEGER   NOT NULL ,
  Country_ID INTEGER   NOT NULL ,
  State_ID INTEGER   NOT NULL ,
  District_name VARCHAR(50)      ,
PRIMARY KEY(District_id, Country_ID, State_ID)  ,
  FOREIGN KEY(Country_ID, State_ID)
    REFERENCES HM_States(Country_ID, State_ID));


CREATE INDEX HM_Districts_FKIndex1 ON HM_Districts (Country_ID, State_ID);


CREATE TABLE HM_City (
  District_id INTEGER   NOT NULL ,
  City_id INTEGER   NOT NULL ,
  State_ID INTEGER   NOT NULL ,
  Country_ID INTEGER   NOT NULL ,
  City_name VARCHAR(50)      ,
PRIMARY KEY(District_id, City_id, State_ID, Country_ID)  ,
  FOREIGN KEY(District_id, Country_ID, State_ID)
    REFERENCES HM_Districts(District_id, Country_ID, State_ID));


CREATE INDEX HM_City_FKIndex1 ON HM_City (District_id, Country_ID, State_ID);


CREATE TABLE HM_Villages (
  Village_id INTEGER   NOT NULL ,
  Country_ID INTEGER   NOT NULL ,
  State_ID INTEGER   NOT NULL ,
  District_id INTEGER   NOT NULL ,
  Village_Name VARCHAR(50)    ,
  City_id INTEGER   NOT NULL   ,
PRIMARY KEY(Village_id)  ,
  FOREIGN KEY(District_id, City_id, State_ID, Country_ID)
    REFERENCES HM_City(District_id, City_id, State_ID, Country_ID));


CREATE INDEX HM_Villages_FKIndex1 ON HM_Villages (District_id, City_id, State_ID, Country_ID);

CREATE TABLE HM_Survey_Template (
  Survey_template_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Survey_Template_Name VARCHAR(50)    ,
  Survey_Template_Description VARCHAR(100)    ,
  Survey_Template_Type VARCHAR(50)      ,
PRIMARY KEY(Survey_template_id, Programs_id)  ,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id));


CREATE INDEX HM_Survey_Template_FKIndex1 ON HM_Survey_Template (Programs_id);


CREATE INDEX IFK_Rel_33 ON HM_Survey_Template (Programs_id);


CREATE TABLE HM_Device_Attributes (
  Device_Attributes_id INTEGER   NOT NULL ,
  Devices_id INTEGER   NOT NULL ,
  Device_Attribute_Name VARCHAR(100)    ,
  Device_Attribute_short_Name VARCHAR(50)    ,
  Device_Attribute_Datatype VARCHAR(50)      ,
PRIMARY KEY(Device_Attributes_id, Devices_id)  ,
  FOREIGN KEY(Devices_id)
    REFERENCES HM_Devices(Devices_id));


CREATE INDEX HM_Device_Attributes_FKIndex1 ON HM_Device_Attributes (Devices_id);


CREATE INDEX IFK_Rel_30 ON HM_Device_Attributes (Devices_id);


CREATE TABLE HM_Learning_content (
  Learning_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Program_Details_id INTEGER   NOT NULL ,
  Learning_user_type VARCHAR(50)    ,
  Learning_type VARCHAR(50)    ,
  Learning_description VARCHAR(100)    ,
  Learning_ext_int BOOL    ,
  learning_content_type VARCHAR(50)    ,
  learning_link VARCHAR(100)    ,
  learning_created_date DATETIME    ,
  learning_created_by VARCHAR(50)      ,
PRIMARY KEY(Learning_id)  ,
  FOREIGN KEY(Program_Details_id, Programs_id)
    REFERENCES HM_Program_Details(Program_Details_id, Programs_id));


CREATE INDEX HM_Learning_content_FKIndex1 ON HM_Learning_content (Program_Details_id, Programs_id);


CREATE INDEX IFK_Rel_43 ON HM_Learning_content (Program_Details_id, Programs_id);


CREATE TABLE HM_Actor (
  Actor_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Actor_desc VARCHAR(50)      ,
PRIMARY KEY(Actor_id, Programs_id)  ,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id));


CREATE INDEX HM_Actor_FKIndex1 ON HM_Actor (Programs_id);


CREATE TABLE HM_User_Actor (
  Programs_id INTEGER   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Actor_id INTEGER   NOT NULL     ,
  FOREIGN KEY(Programs_id, Actor_id)
    REFERENCES HM_Actor(Programs_id, Actor_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));


CREATE INDEX HM_User_Actor_FKIndex1 ON HM_User_Actor (Programs_id, Actor_id);
CREATE INDEX HM_User_Actor_FKIndex2 ON HM_User_Actor (User_id);

CREATE TABLE HM_PHC (
  PHC_ID INTEGER   NOT NULL ,
  PHC_NAME VARCHAR(50)    ,
  SelfLocationVillage INTEGER      ,
PRIMARY KEY(PHC_ID));

CREATE TABLE HM_PhcDetails (
  idHM_PhcDetails INTEGER   NOT NULL ,
  Village_id INTEGER   NOT NULL ,
  PHC_ID INTEGER      ,
PRIMARY KEY(idHM_PhcDetails)    ,
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID),
  FOREIGN KEY(Village_id)
    REFERENCES HM_Villages(Village_id));


CREATE INDEX HM_PhcDetails_FKIndex1 ON HM_PhcDetails (PHC_ID);
CREATE INDEX HM_PhcDetails_FKIndex2 ON HM_PhcDetails (Village_id);

CREATE TABLE HM_PHC_User (
  PHC_id INTEGER   NOT NULL ,
  User_id VARCHAR(50) NOT NULL   ,
PRIMARY KEY(PHC_id)  ,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID));


CREATE INDEX HM_PHC_User_FKIndex1 ON HM_PHC_User (User_id);

CREATE TABLE HM_Identity_Cards (
  Card_Type_id INTEGER   NOT NULL ,
  Card_Type VARCHAR(50)    ,
  Card_Description VARCHAR(100)      ,
PRIMARY KEY(Card_Type_id));


CREATE TABLE HM_Patient (
  Patient_id VARCHAR(50)   NOT NULL ,
  Card_Type_id INTEGER    ,
  Gender_Id INTEGER   NOT NULL ,
  Cast_Category_Id INTEGER   NOT NULL ,
  Patient_Salutation CHAR(5)    ,
  Patient_FName VARCHAR(50)    ,
  Patient_MName VARCHAR(50)    ,
  Patient_LName VARCHAR(50)    ,
  Patient_DOB DATE    ,
  Patient_Age INTEGER    ,
  Patient_Language VARCHAR(50)    ,
  Patient_POB VARCHAR(50)    ,
  Education VARCHAR(50)    ,
  Patient_BPL INTEGER    ,
  Patient_Marital_Status VARCHAR(50)    ,
  Patient_Contact INTEGER    ,
  Address_line1 VARCHAR(50)    ,
  Address_line2 VARCHAR(50)    ,
  Patient_Emergency_number INTEGER    ,
  Patient_District VARCHAR(50)    ,
  Patient_Taluka VARCHAR(50)    ,
  Patient_Village VARCHAR(50)    ,
  Patient_Ward VARCHAR(50)    ,
  Patient_Pin VARCHAR(50)    ,
  Patient_Image LONGTEXT    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME    ,
  Card_Number VARCHAR(50)      ,
PRIMARY KEY(Patient_id)      ,
  FOREIGN KEY(Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id),
  FOREIGN KEY(Gender_Id)
    REFERENCES HM_Gender(Gender_Id),
  FOREIGN KEY(Card_Type_id)
    REFERENCES HM_Identity_Cards(Card_Type_id));


CREATE INDEX HM_Patient_FKIndex1 ON HM_Patient (Cast_Category_Id);
CREATE INDEX HM_Patient_FKIndex2 ON HM_Patient (Gender_Id);
CREATE INDEX HM_Patient_FKIndex3 ON HM_Patient (Card_Type_id);



CREATE TABLE HM_CP_Templates (
  Template_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  User_id  VARCHAR(50) NOT NULL ,
  Template_Name VARCHAR(100)    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME      ,
PRIMARY KEY(Template_id)    ,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));


CREATE INDEX HM_CP_Templates_FKIndex1 ON HM_CP_Templates (Programs_id);
CREATE INDEX HM_CP_Templates_FKIndex2 ON HM_CP_Templates (User_id);


CREATE INDEX IFK_Rel_46 ON HM_CP_Templates (Programs_id);
CREATE INDEX IFK_Rel_47 ON HM_CP_Templates (User_id);


CREATE TABLE HM_Patient_Family (
  Family_Id INTEGER   NOT NULL ,
  Patient_id VARCHAR(50)   NOT NULL ,
  Card_Type_id INTEGER   NOT NULL ,
  Gender_Id INTEGER   NOT NULL ,
  Cast_Category_Id INTEGER   NOT NULL ,
  Family_First_NM VARCHAR(50)    ,
  Family_Middle_NM VARCHAR(50)    ,
  Family_Last_NM VARCHAR(50)    ,
  Date_Of_Birth DATE    ,
  Age INTEGER   NOT NULL ,
  Education VARCHAR(50)    ,
  Relation VARCHAR(50)    ,
  Card_Number VARCHAR(50)    ,
  Marital_Status VARCHAR(50)    ,
  Contact INTEGER    ,
  Created_Date DATETIME    ,
  Created_By VARCHAR(50)    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME      ,
PRIMARY KEY(Family_Id, Patient_id)        ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id),
  FOREIGN KEY(Gender_Id)
    REFERENCES HM_Gender(Gender_Id),
  FOREIGN KEY(Card_Type_id)
    REFERENCES HM_Identity_Cards(Card_Type_id));


CREATE INDEX Patient_Family_FKIndex1 ON HM_Patient_Family (Patient_id);
CREATE INDEX Patient_Family_FKIndex2 ON HM_Patient_Family (Cast_Category_Id);
CREATE INDEX Patient_Family_FKIndex3 ON HM_Patient_Family (Gender_Id);
CREATE INDEX HM_Patient_Family_FKIndex4 ON HM_Patient_Family (Card_Type_id);







CREATE TABLE HM_Medication (
  HM_MedicationId INTEGER   NOT NULL ,
  Patient_id VARCHAR(50)NOT NULL ,
  DrugId INTEGER   NOT NULL ,
  Medicine_Qty VARCHAR(30)    ,
  Created_by INTEGER    ,
  Created_Date DATETIME    ,
  Updated_by INTEGER    ,
  Updated_Date DATETIME    ,
  Duration_In_Days INTEGER    ,
  PHC_ID INTEGER   NOT NULL   ,
PRIMARY KEY(HM_MedicationId, PHC_ID)      ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(DrugId)
    REFERENCES HM_DrugMaster(DrugId),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID));


CREATE INDEX Table_43_FKIndex1 ON HM_Medication (Patient_id);
CREATE INDEX HM_Immunization_FKIndex2 ON HM_Medication (DrugId);
CREATE INDEX HM_Medication_FKIndex3 ON HM_Medication (PHC_ID);


CREATE INDEX IFK_Rel_45 ON HM_Medication (Patient_id);
CREATE INDEX IFK_Rel_53 ON HM_Medication (DrugId);
CREATE INDEX IFK_Rel_52 ON HM_Medication (PHC_ID);


CREATE TABLE HM_Referral_Reason (
  Referral_Reason_Id INTEGER   NOT NULL ,
  Referral_Reason_Description VARCHAR(100)      ,
PRIMARY KEY(Referral_Reason_Id));

CREATE TABLE HM_Referals (
  Referal_id INTEGER   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Patient_id VARCHAR(50)   NOT NULL ,
  PHC_ID INTEGER   NOT NULL ,
  Village_id INTEGER   NOT NULL ,
  Referral_Reason_Id INTEGER   NOT NULL ,
  Referal_Notes VARCHAR(100)    ,
  Ref_Date DATETIME    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME      ,
PRIMARY KEY(Referal_id, User_id, Patient_id, PHC_ID, Village_id)          ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID),
  FOREIGN KEY(Village_id)
    REFERENCES HM_Villages(Village_id),
  FOREIGN KEY(Referral_Reason_Id)
    REFERENCES HM_Referral_Reason(Referral_Reason_Id));


CREATE INDEX HM_Referals_FKIndex1 ON HM_Referals (Patient_id);
CREATE INDEX HM_Referals_FKIndex2 ON HM_Referals (User_id);
CREATE INDEX HM_Referals_FKIndex3 ON HM_Referals (PHC_ID);
CREATE INDEX HM_Referals_FKIndex4 ON HM_Referals (Village_id);
CREATE INDEX HM_Referals_FKIndex5 ON HM_Referals (Referral_Reason_Id);




CREATE TABLE HM_User_Details (
  User_Details_id INTEGER   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  PHC_ID INTEGER   NOT NULL ,
  User_Name VARCHAR(50)    ,
  User_Password VARCHAR(50)    ,
  User_qualification VARCHAR(50)    ,
  User_reg_id VARCHAR(50)    ,
  User_contact_number INTEGER    ,
  User_Emergency_contact INTEGER   NOT NULL ,
  User_Address1 VARCHAR(50)    ,
  User_Address2 VARCHAR(50)    ,
  User_email_id VARCHAR(50)    ,
  User_Place_ofWork VARCHAR(30)    ,
  User_Profile_Image LONGTEXT      ,
PRIMARY KEY(User_Details_id)      ,
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));


CREATE INDEX HM_User_Details_FKIndex1 ON HM_User_Details (PHC_ID);
CREATE INDEX HM_User_Details_FKIndex2 ON HM_User_Details (Programs_id);
CREATE INDEX HM_User_Details_FKIndex3 ON HM_User_Details (User_id);

CREATE TABLE HM_User_Tasks (
  User_Tasks_id VARCHAR(50)   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  User_Task_Name VARCHAR(50)    ,
  User_Task_Description VARCHAR(50)    ,
  User_Task_Type VARCHAR(50)    ,
  User_Task_Severity INTEGER    ,
  User_Task_Date DATETIME    ,
  User_Task_Actionable BOOL    ,
  User_Task_Action VARCHAR(255)    ,
  Created_Date DATETIME    ,
  User_task_Venue VARCHAR(50)    ,
  User_start_time DATETIME    ,
  User_end_time DATETIME    ,
  User_Reminder_interval INTEGER    ,
  Task_Status  VARCHAR(20)    ,
  Created_by VARCHAR(50)    ,
  Task_Viewed BOOL    ,
  All_Day BOOL    ,
  Set_Reminder BOOL      ,
PRIMARY KEY(User_Tasks_id, User_id)    ,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id));


CREATE INDEX HM_User_Tasks_FKIndex1 ON HM_User_Tasks (User_id);
CREATE INDEX HM_User_Tasks_FKIndex2 ON HM_User_Tasks (Programs_id);


CREATE TABLE HM_User_Token (
  Token_id DOUBLE   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(Token_id)  ,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));


CREATE INDEX HM_User_Token_FKIndex1 ON HM_User_Token (User_id);




CREATE TABLE HM_Survey_Questionair (
  Survey_Questionair_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Survey_template_id INTEGER   NOT NULL ,
  Survey_Question_Category VARCHAR(50)    ,
  Survey_Question_no INTEGER    ,
  Survey_Question_Description VARCHAR(100)    ,
  Survey_Question_Options VARCHAR(100)    ,
  Parent_Qid INTEGER      ,
PRIMARY KEY(Survey_Questionair_id)  ,
  FOREIGN KEY(Survey_template_id, Programs_id)
    REFERENCES HM_Survey_Template(Survey_template_id, Programs_id));


CREATE INDEX HM_Survey_Questionair_FKIndex1 ON HM_Survey_Questionair (Survey_template_id, Programs_id);


CREATE INDEX IFK_Rel_44 ON HM_Survey_Questionair (Survey_template_id, Programs_id);






CREATE TABLE HM_Actor_Tasks (
  Programs_id INTEGER   NOT NULL ,
  Actor_id INTEGER   NOT NULL ,
  Actor_Tasks_id INTEGER   NOT NULL ,
  Actor_Task_Name VARCHAR(100)    ,
  Actor_Description VARCHAR(250)      ,
PRIMARY KEY(Programs_id, Actor_id)  ,
  FOREIGN KEY(Programs_id, Actor_id)
    REFERENCES HM_Actor(Programs_id, Actor_id));


CREATE INDEX HM_Actor_Tasks_FKIndex1 ON HM_Actor_Tasks (Programs_id, Actor_id);


CREATE TABLE HM_CP_Tasks (
  Template_id INTEGER   NOT NULL ,
  Template_Task_id INTEGER   NOT NULL ,
  Template_Task_Desc VARCHAR(100)    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME    ,
  Role VARCHAR(20)      ,
PRIMARY KEY(Template_id, Template_Task_id)  ,
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id));


CREATE INDEX HM_CP_Tasks_FKIndex1 ON HM_CP_Tasks (Template_id);


CREATE TABLE HM_CP_Frequency (
  Template_id INTEGER   NOT NULL ,
  Frequency_id INTEGER   NOT NULL ,
  Frequency_Desc VARCHAR(50)    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME      ,
PRIMARY KEY(Template_id, Frequency_id)  ,
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id));


CREATE INDEX HM_CP_Frequency_FKIndex1 ON HM_CP_Frequency (Template_id);


CREATE INDEX IFK_Rel_49 ON HM_CP_Frequency (Template_id);


CREATE TABLE HM_CP_Category (
  Template_id INTEGER   NOT NULL ,
  Category_id VARCHAR(100)   NOT NULL ,
  Category_Desc VARCHAR(150)    ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME      ,
PRIMARY KEY(Template_id, Category_id)  ,
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id));


CREATE INDEX HM_CP_Category_FKIndex1 ON HM_CP_Category (Template_id);


CREATE TABLE HM_Patient_Vitals (
  Vitals_id INTEGER   NOT NULL ,
  Patient_id VARCHAR(50) NOT NULL ,
  Vital_value INTEGER    ,
  Created_Date DATETIME    ,
  Created_By INTEGER      ,
PRIMARY KEY(Vitals_id)    ,
  FOREIGN KEY(Vitals_id)
    REFERENCES HM_Vitals(Vitals_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id));


CREATE INDEX Patient_Vitals_FKIndex1 ON HM_Patient_Vitals (Vitals_id);
CREATE INDEX Patient_Vitals_FKIndex2 ON HM_Patient_Vitals (Patient_id);



CREATE TABLE HM_Appointments (
  Appointment_id INTEGER   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Patient_id VARCHAR(50)   NOT NULL ,
  Appointment_Date DATETIME    ,
  Appointment_new_old_flag BOOL    ,
  Appointment_accepted_by BOOL    ,
  Created_Date DATETIME    ,
  Created_By INTEGER    ,
  Referred BOOL    ,
  AcceptedFlag BOOL      ,
PRIMARY KEY(Appointment_id)    ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));

CREATE INDEX HM_Appointment_FKIndex1 ON HM_Appointments (Patient_id);
CREATE INDEX HM_Appointment_FKIndex2 ON HM_Appointments (User_id);

CREATE TABLE HM_Patients_Device_Reading (
  Patient_id VARCHAR(50) NOT NULL ,
  Devices_id INTEGER   NOT NULL ,
  Device_Attributes_id INTEGER   NOT NULL ,
  Device_Attributes_value VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Created_By VARCHAR(50)      ,
PRIMARY KEY(Patient_id)    ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(Device_Attributes_id, Devices_id)
    REFERENCES HM_Device_Attributes(Device_Attributes_id, Devices_id));


CREATE INDEX Patients_Vitals_FKIndex3 ON HM_Patients_Device_Reading (Patient_id);
CREATE INDEX Patients_Vitals_FKIndex2 ON HM_Patients_Device_Reading (Device_Attributes_id, Devices_id);


CREATE TABLE HM_Program_details_Transactions (
  Program_details_Transactions_id INTEGER   NOT NULL ,
  Programs_id INTEGER   NOT NULL ,
  Program_Details_id INTEGER   NOT NULL ,
  Patient_id VARCHAR(50)   NOT NULL ,
  Program_item_id INTEGER    ,
  Program_item_value VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_Date DATETIME    ,
  Created_By  VARCHAR(50)    ,
  Updated_By VARCHAR(50)      ,
PRIMARY KEY(Program_details_Transactions_id, Programs_id, Program_Details_id)    ,
  FOREIGN KEY(Program_Details_id, Programs_id)
    REFERENCES HM_Program_Details(Program_Details_id, Programs_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id));


CREATE INDEX HM_Program_details_Transactions_FKIndex1 ON HM_Program_details_Transactions (Program_Details_id, Programs_id);
CREATE INDEX HM_Program_details_Transactions_FKIndex2 ON HM_Program_details_Transactions (Patient_id);



CREATE TABLE HM_Survey_Results (
  Survey_Result_id INTEGER   NOT NULL ,
  Survey_Questionair_id INTEGER   NOT NULL ,
  Patient_id VARCHAR(50) NOT NULL ,
  Survey_Option_Answer VARCHAR(100)      ,
PRIMARY KEY(Survey_Result_id)    ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(Survey_Questionair_id)
    REFERENCES HM_Survey_Questionair(Survey_Questionair_id));


CREATE INDEX HM_Survey_Results_FKIndex1 ON HM_Survey_Results (Patient_id);
CREATE INDEX HM_Survey_Results_FKIndex2 ON HM_Survey_Results (Survey_Questionair_id);

CREATE TABLE HM_CP_Patient (
  Patient_id VARCHAR(50)   NOT NULL ,
  Template_id INTEGER   NOT NULL ,
  Template_Task_id INTEGER   NOT NULL ,
  Frequency_id INTEGER   NOT NULL ,
  Category_id VARCHAR(100)   NOT NULL ,
  User_id VARCHAR(50)   NOT NULL ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME    ,
  Approved BOOL      ,
PRIMARY KEY(Patient_id, Template_id, Template_Task_id, Frequency_id, Category_id)            ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id),
  FOREIGN KEY(Template_id, Template_Task_id)
    REFERENCES HM_CP_Tasks(Template_id, Template_Task_id),
  FOREIGN KEY(Template_id, Frequency_id)
    REFERENCES HM_CP_Frequency(Template_id, Frequency_id),
  FOREIGN KEY(Template_id, Category_id)
    REFERENCES HM_CP_Category(Template_id, Category_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id));


CREATE INDEX HM_CP_Patient_FKIndex1 ON HM_CP_Patient (Patient_id);
CREATE INDEX HM_CP_Patient_FKIndex2 ON HM_CP_Patient (Template_id);
CREATE INDEX HM_CP_Patient_FKIndex3 ON HM_CP_Patient (Template_id, Template_Task_id);
CREATE INDEX HM_CP_Patient_FKIndex4 ON HM_CP_Patient (Template_id, Frequency_id);
CREATE INDEX HM_CP_Patient_FKIndex5 ON HM_CP_Patient (Template_id, Category_id);
CREATE INDEX HM_CP_Patient_FKIndex6 ON HM_CP_Patient (User_id);


CREATE TABLE HM_Pincode (
  District_id INTEGER   NOT NULL ,
  City_id INTEGER   NOT NULL ,
  Country_ID INTEGER   NOT NULL ,
  State_ID INTEGER   NOT NULL ,
  PinCode VARCHAR(20)    ,
  AreaName VARCHAR(45)      ,
PRIMARY KEY(District_id, City_id, Country_ID, State_ID)  ,
  FOREIGN KEY(District_id, City_id, State_ID, Country_ID)
    REFERENCES HM_City(District_id, City_id, State_ID, Country_ID));


CREATE INDEX HM_Pincode_FKIndex1 ON HM_Pincode (District_id, City_id, State_ID, Country_ID);



CREATE TABLE HM_severity (
  Patient_id VARCHAR(50)   NOT NULL ,
  HBFlag INTEGER    ,
  HBValue DECIMAL(3,1)    ,
  BPSysFlag SMALLINT(3)    ,
  BPSysValue SMALLINT(3)    ,
  BPDiaFlag SMALLINT(3)    ,
  BPDiaValue SMALLINT(3)    ,
  BPPulseFlag SMALLINT(3)    ,
  BPPulseValue SMALLINT(3)    ,
  WeightFlag SMALLINT(3)    ,
  WeightValue SMALLINT(3)    ,
  OxyPulseFlag SMALLINT(3)    ,
  OxyPulseValue SMALLINT(3)    ,
  OxiSpO2Flag SMALLINT(3)    ,
  OxiPulseO2Value SMALLINT(3)    ,
  OverallFlag SMALLINT(3)    ,
  OverAllStatus VARCHAR(100)      ,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id));


CREATE INDEX HM_severity_FKIndex1 ON HM_severity (Patient_id);



