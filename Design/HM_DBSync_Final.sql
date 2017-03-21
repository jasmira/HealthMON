CREATE TABLE HM_Gender (
  Gender_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Gender_Name CHAR(15)  NULL  ,
  Gender_Short_NM CHAR(1)  NULL    ,
PRIMARY KEY(Gender_Id));



CREATE TABLE HM_DrugMaster (
  DrugId INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  DrugName VARCHAR(100)  NULL  ,
  DrugForm VARCHAR(20)  NULL  ,
  Route VARCHAR(20)  NULL  ,
  Units VARCHAR(20)  NULL  ,
  DrugType INTEGER UNSIGNED  NULL  ,
  DrugDescription VARCHAR(100)  NULL    ,
   DrugCategory VARCHAR(30)  NULL    ,
PRIMARY KEY(DrugId));



CREATE TABLE HM_Devices (
  Devices_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Device_long_Name VARCHAR(100)  NULL  ,
  Device_Short_Name VARCHAR(50)  NULL    ,
PRIMARY KEY(Devices_id));



CREATE TABLE HM_Identity_Cards (
  Card_Type_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Card_Type VARCHAR(50)  NULL  ,
  Card_Description VARCHAR(100)  NULL    ,
PRIMARY KEY(Card_Type_id));



CREATE TABLE HM_Referral_Reason (
  Referral_Reason_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Referral_Reason_Description VARCHAR(100)  NULL    ,
PRIMARY KEY(Referral_Reason_Id));



CREATE TABLE HM_Programs (
  Programs_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Program_desc VARCHAR(50)  NULL  ,
  Program_start_date DATE  NULL  ,
  Program_end_date DATE  NULL    ,
PRIMARY KEY(Programs_id));



CREATE TABLE HM_PHC (
  PHC_ID INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PHC_NAME VARCHAR(50)  NULL  ,
  SelfLocationVillage INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(PHC_ID),
INDEX HM_PHC_FKIndex1(PHC_ID)
);



CREATE TABLE HM_Country (
  Country_ID INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Country_NM VARCHAR(50)  NULL  ,
  Country_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(Country_ID));



CREATE TABLE HM_Cast_Category (
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Cast_Category_NM VARCHAR(50)  NULL  ,
  Cast_Category_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(Cast_Category_Id));



CREATE TABLE HM_Vitals (
  Vitals_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Vital_Name VARCHAR(50)  NULL  ,
  Vital_Unit VARCHAR(50)  NULL    ,
PRIMARY KEY(Vitals_id));



CREATE TABLE HM_Survey_Template (
  Survey_template_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Survey_Template_Name VARCHAR(50)  NULL  ,
  Survey_Template_Description VARCHAR(100)  NULL  ,
  Survey_Template_Type VARCHAR(50)  NULL    ,
PRIMARY KEY(Survey_template_id)  ,
INDEX HM_Survey_Template_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_User (
  User_id VARCHAR(50)  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(User_id)  ,
INDEX HM_User_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Program_Details (
  Program_Details_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Program_item_id INTEGER UNSIGNED  NOT NULL  ,
  Program_item_name VARCHAR(50)  NULL  ,
  Program_item_description VARCHAR(50)  NULL  ,
  Program_item_data_type VARCHAR(50)  NULL  ,
  Created_By  VARCHAR(50)  NULL  ,
  Updated_By  VARCHAR(50)  NULL  ,
  Created_Date  DATETIME  NULL  ,
  Updated_Date  DATETIME  NULL    ,
PRIMARY KEY(Program_Details_id)  ,
INDEX HM_Program_Details_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_States (
  State_ID INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  State_NM VARCHAR(50)  NULL  ,
  State_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(State_ID)  ,
INDEX HM_States_FKIndex1(Country_ID),
  FOREIGN KEY(Country_ID)
    REFERENCES HM_Country(Country_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Actor (
  Actor_id INTEGER UNSIGNED  NOT NULL AUTO_INCREMENT,
  Actor_desc VARCHAR(50) NULL,
PRIMARY KEY(Actor_id));

CREATE TABLE HM_Survey_Questionair (
  Survey_Questionair_id INTEGER  NOT NULL   AUTO_INCREMENT,
  Actor_id INTEGER UNSIGNED ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Survey_template_id INTEGER UNSIGNED  NOT NULL  ,
  Survey_Question_Category VARCHAR(50)  NULL  ,
  Survey_Question_no INTEGER UNSIGNED  NULL  ,
  Survey_Question_Description VARCHAR(100)  NULL  ,
  Survey_Question_Options VARCHAR(100)  NULL  ,
  Parent_Qid INTEGER UNSIGNED  NULL    ,
  Survey_Questionair_Image TEXT  NULL  ,
 
PRIMARY KEY(Survey_Questionair_id)  ,
INDEX HM_Survey_Questionair_FKIndex1(Programs_id,Survey_template_id ),
  FOREIGN KEY( Programs_id,Survey_template_id)
    REFERENCES HM_Survey_Template(Programs_id,Survey_template_id),
	  FOREIGN KEY( Actor_id)
    REFERENCES HM_Actor(Actor_id));


CREATE TABLE HM_Device_Attributes (
  Device_Attributes_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Devices_id INTEGER UNSIGNED  NOT NULL  ,
  Device_Attribute_Name VARCHAR(100)  NULL  ,
  Device_Attribute_short_Name VARCHAR(50)  NULL  ,
  Device_Attribute_Datatype VARCHAR(50)  NULL    ,
PRIMARY KEY(Device_Attributes_id)  ,
INDEX HM_Device_Attributes_FKIndex1(Devices_id),
  FOREIGN KEY(Devices_id)
    REFERENCES HM_Devices(Devices_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Districts (
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  State_ID INTEGER UNSIGNED  NOT NULL  ,
  District_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  District_name VARCHAR(50)  NULL    ,
PRIMARY KEY(District_id)  ,
INDEX HM_Districts_FKIndex1(Country_ID, State_ID),
  FOREIGN KEY(Country_ID, State_ID)
    REFERENCES HM_States(Country_ID, State_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);






CREATE TABLE HM_Learning_content (
  Learning_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Program_Details_id INTEGER UNSIGNED  NOT NULL  ,
  Learning_user_type VARCHAR(50)  NULL  ,
  Learning_type VARCHAR(50)  NULL  ,
  Learning_description VARCHAR(100)  NULL  ,
  Learning_ext_int BOOLEAN  NULL  ,
  learning_content_type VARCHAR(50)  NULL  ,
  learning_link VARCHAR(100)  NULL  ,
  learning_created_date DATETIME  NULL  ,
  learning_created_by VARCHAR(50)  NULL    ,
PRIMARY KEY(Learning_id)  ,
INDEX HM_Learning_content_FKIndex1( Programs_id,Program_Details_id),
  FOREIGN KEY( Programs_id,Program_Details_id)
    REFERENCES HM_Program_Details( Programs_id,Program_Details_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_User_Token (
  Token_id DOUBLE  NOT NULL  ,
  User_id VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Token_id)  ,
INDEX HM_User_Token_FKIndex1(User_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_City (
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  State_ID INTEGER UNSIGNED  NOT NULL  ,
  District_id INTEGER UNSIGNED  NOT NULL  ,
  City_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  City_name VARCHAR(50)  NULL    ,
PRIMARY KEY(City_id)  ,
INDEX HM_City_FKIndex1(Country_ID, State_ID, District_id),
  FOREIGN KEY(Country_ID, State_ID, District_id)
    REFERENCES HM_Districts(Country_ID, State_ID, District_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_User_Actor (
  User_actor_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  User_id VARCHAR(50)  NOT NULL  ,
  Actor_id INTEGER UNSIGNED  NOT NULL    ,
  PRIMARY KEY(User_actor_id)  ,
INDEX HM_User_Actor_FKIndex1(User_id)  ,
INDEX HM_User_Actor_FKIndex2(Programs_id),
INDEX HM_User_Actor_FKIndex3( Actor_id),
  FOREIGN KEY(Actor_id)
    REFERENCES HM_Actor(Actor_id)
	  ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
	  ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);

CREATE TABLE HM_User_Tasks (
  User_Tasks_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Andriod_User_Tasks_id VARCHAR(20)  NULL ,
  User_id VARCHAR(50)  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  User_Task_Name VARCHAR(100)  NULL  ,
  User_Task_Description TEXT  NULL  ,
  User_Task_Type VARCHAR(50)  NULL  ,
  User_Task_Severity INTEGER UNSIGNED  NULL  ,
  User_Task_Date DATETIME  NULL  ,
  User_Task_Actionable BOOLEAN  NULL  ,
  User_Task_Action VARCHAR(255) BINARY  NULL  ,
  Created_Date DATETIME  NULL  ,
  User_task_Venue VARCHAR(50)  NULL  ,
  User_start_time DATETIME  NULL  ,
  User_end_time DATETIME  NULL  ,
  User_Reminder_interval INTEGER UNSIGNED  NULL  ,
  Task_Status  VARCHAR(20)  NULL  ,
  Created_by VARCHAR(50)  NULL  ,
  Task_Viewed BOOLEAN  NULL  ,
  All_Day BOOLEAN  NULL  ,
  Set_Reminder BOOLEAN  NULL    ,
PRIMARY KEY(User_Tasks_id)  ,
INDEX HM_User_Tasks_FKIndex1(User_id)  ,
INDEX HM_User_Tasks_FKIndex2(Programs_id),
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_CP_Templates (
  Template_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  User_id VARCHAR(50)  NOT NULL  ,
  Template_Name VARCHAR(100)  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY(Template_id)  ,
INDEX HM_CP_Templates_FKIndex1(Programs_id)  ,
INDEX HM_CP_Templates_FKIndex2(User_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);

    CREATE TABLE HM_CP_Category (
      Template_id INTEGER UNSIGNED  NOT NULL  ,
      Category_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
      Category_Desc VARCHAR(150)  NULL  ,
      Created_By VARCHAR(50)  NULL  ,
      Created_Date DATETIME  NULL  ,
      Updated_By VARCHAR(50)  NULL  ,
      Updated_Date DATETIME  NULL    ,
    PRIMARY KEY(Category_id)  ,
    INDEX HM_CP_Category_FKIndex1(Template_id),
      FOREIGN KEY(Template_id)
        REFERENCES HM_CP_Templates(Template_id)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION);


CREATE TABLE HM_CP_Tasks (
  Template_Task_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Template_id INTEGER UNSIGNED  NOT NULL  ,
  Category_id INTEGER UNSIGNED  NOT NULL ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Actor_id INTEGER UNSIGNED  NOT NULL  ,
  Template_Task_Desc VARCHAR(100)  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY( Template_Task_id)  ,
INDEX HM_CP_Tasks_FKIndex1(Template_id)  ,
INDEX HM_CP_Tasks_FKIndex2(Programs_id),
INDEX HM_CP_Tasks_FKIndex3(Actor_id),
INDEX HM_CP_Tasks_FKIndex4(Category_id),
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Actor_id)
    REFERENCES HM_Actor(Actor_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
 FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
 FOREIGN KEY(Category_id)
    REFERENCES HM_CP_Category(Category_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_CP_frequency_details (
  frequency_detail_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  frequency_Desc VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(frequency_detail_id));

  


CREATE TABLE HM_CP_Frequency (
  Frequency_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Template_id INTEGER UNSIGNED  NOT NULL  ,
  Category_id INTEGER UNSIGNED  NOT NULL ,
  Template_Task_id INTEGER UNSIGNED  NOT NULL ,
  frequency_detail_id INTEGER UNSIGNED  NOT NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY(Frequency_id)  ,
INDEX HM_CP_Frequency_FKIndex1(Template_id),
INDEX HM_CP_Frequency_FKIndex2(Category_id),
INDEX HM_CP_Frequency_FKIndex3(Template_Task_id),
INDEX HM_CP_Frequency_FKIndex4(frequency_detail_id),
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
FOREIGN KEY(Category_id)
    REFERENCES HM_CP_Category(Category_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
FOREIGN KEY(Template_Task_id)
    REFERENCES HM_CP_Tasks(Template_Task_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
FOREIGN KEY(frequency_detail_id)
    REFERENCES HM_CP_frequency_details(frequency_detail_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);







CREATE TABLE HM_PHC_User (
  PHC_User_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PHC_ID INTEGER UNSIGNED,
  User_id VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(PHC_User_id)  ,
INDEX HM_PHC_User_FKIndex1(PHC_ID),
INDEX HM_PHC_User_FKIndex2(User_id),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_User_Details (
  User_Details_id INTEGER UNSIGNED NOT NULL   AUTO_INCREMENT,
  User_id VARCHAR(50)  NOT NULL  ,
  PHC_ID INTEGER UNSIGNED  NOT NULL  ,
  User_Name VARCHAR(50)  NULL  ,
  User_Password VARCHAR(50)  NULL  ,
  User_qualification VARCHAR(50)  NULL  ,
  User_reg_id VARCHAR(50)  NULL  ,
  User_contact_number INTEGER UNSIGNED  NULL  ,
  User_Emergency_contact INTEGER  NOT NULL  ,
  User_Address1 VARCHAR(50)  NULL  ,
  User_Address2 VARCHAR(50)  NULL  ,
  User_email_id VARCHAR(50)  NULL  ,
  User_Place_ofWork VARCHAR(30)  NULL  ,
  User_Profile_Image LONGTEXT  NULL    ,
PRIMARY KEY(User_Details_id)  ,
INDEX HM_User_Details_FKIndex1(PHC_ID)  ,
INDEX HM_User_Details_FKIndex3(User_id),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Actor_Tasks (
  Actor_Tasks_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Actor_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Actor_Task_Name VARCHAR(100)  NULL  ,
  Actor_Task_Description VARCHAR(250)  NULL ,
PRIMARY KEY(Actor_Tasks_id)  ,
INDEX HM_Actor_Tasks_FKIndex1(Programs_id),
INDEX HM_Actor_Tasks_FKIndex2(Actor_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Actor_id)
    REFERENCES HM_Actor(Actor_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
	  );


CREATE TABLE HM_Pincode (
  District_id INTEGER UNSIGNED  NOT NULL  ,
  City_id INTEGER UNSIGNED  NOT NULL  ,
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  State_ID INTEGER UNSIGNED  NOT NULL  ,
  PinCode VARCHAR(20)  NOT NULL  ,
  AreaName VARCHAR(45)  NULL    ,
PRIMARY KEY(PinCode)  ,
INDEX HM_Pincode_FKIndex1(Country_ID, State_ID, District_id, City_id),
  FOREIGN KEY(Country_ID, State_ID, District_id, City_id)
    REFERENCES HM_City(Country_ID, State_ID, District_id, City_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Villages (
  Village_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  State_ID INTEGER UNSIGNED  NOT NULL  ,
  District_id INTEGER UNSIGNED  NOT NULL  ,
  Village_Name VARCHAR(50)  NULL  ,
  City_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Village_id)  ,
INDEX HM_Villages_FKIndex1(Country_ID, State_ID, District_id, City_id),
  FOREIGN KEY(Country_ID, State_ID, District_id, City_id)
    REFERENCES HM_City(Country_ID, State_ID, District_id, City_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_PhcDetails (
  PhcDetailsId INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Village_id INTEGER UNSIGNED  NOT NULL  ,
  PHC_ID INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(PhcDetailsId)  ,
INDEX HM_PhcDetails_FKIndex1(PHC_ID)  ,
INDEX HM_PhcDetails_FKIndex2(Village_id),
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Village_id)
    REFERENCES HM_Villages(Village_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Patient (
  Patient_id VARCHAR(50)  NOT NULL,
  PinCode VARCHAR(20)  NOT NULL  ,
  Village_id INTEGER UNSIGNED  NOT NULL  ,
  City_id INTEGER UNSIGNED  NOT NULL  ,
  District_id INTEGER UNSIGNED  NOT NULL  ,
  State_ID INTEGER UNSIGNED  NOT NULL  ,
  Country_ID INTEGER UNSIGNED  NOT NULL  ,
  Card_Type_id INTEGER UNSIGNED  NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Patient_Salutation CHAR(5)  NULL  ,
  Patient_FName VARCHAR(50)  NULL  ,
  Patient_MName VARCHAR(50)  NULL  ,
  Patient_LName VARCHAR(50)  NULL  ,
  Patient_DOB DATE  NULL  ,
  Patient_Age INTEGER UNSIGNED  NULL  ,
  Patient_Language VARCHAR(50)  NULL  ,
  Patient_POB VARCHAR(50)  NULL  ,
  Education VARCHAR(50)  NULL  ,
  Patient_BPL INTEGER UNSIGNED  NULL  ,
  Patient_Marital_Status VARCHAR(50)  NULL  ,
  Patient_Contact INTEGER UNSIGNED  NULL  ,
  Address_line1 VARCHAR(50)  NULL  ,
  Address_line2 VARCHAR(50)  NULL  ,
  Patient_Emergency_number INTEGER UNSIGNED  NULL  ,
  Patient_Ward VARCHAR(50)  NULL  ,
  Patient_Image LONGTEXT  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL  ,
  Card_Number VARCHAR(50)  NULL    ,
PRIMARY KEY(Patient_id)  ,
INDEX HM_Patient_FKIndex1(Cast_Category_Id)  ,
INDEX HM_Patient_FKIndex2(Gender_Id)  ,
INDEX HM_Patient_FKIndex3(Card_Type_id)  ,
INDEX HM_Patient_FKIndex4(Country_ID, State_ID, District_id)  ,
INDEX HM_Patient_FKIndex5(Country_ID, State_ID, District_id, City_id)  ,
INDEX HM_Patient_FKIndex6(Village_id)  ,
INDEX HM_Patient_FKIndex7(District_id, City_id, Country_ID, State_ID, PinCode),
  FOREIGN KEY(Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Gender_Id)
    REFERENCES HM_Gender(Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Card_Type_id)
    REFERENCES HM_Identity_Cards(Card_Type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Country_ID, State_ID, District_id)
    REFERENCES HM_Districts(Country_ID, State_ID, District_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Country_ID, State_ID, District_id, City_id)
    REFERENCES HM_City(Country_ID, State_ID, District_id, City_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Village_id)
    REFERENCES HM_Villages(Village_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Country_ID, State_ID, District_id, City_id, PinCode)
    REFERENCES HM_Pincode(Country_ID, State_ID, District_id, City_id, PinCode)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_severity (
  Severity_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Patient_id VARCHAR(50)  NOT NULL  ,
  HBFlag INTEGER UNSIGNED  NULL  ,
  HBValue DECIMAL(3,1)  NULL  ,
  BPSysFlag SMALLINT(3) UNSIGNED  NULL  ,
  BPSysValue SMALLINT(3) UNSIGNED  NULL ,
  BPDiaFlag SMALLINT(3) UNSIGNED  NULL  ,
  BPDiaValue SMALLINT(3) UNSIGNED  NULL  ,
  BPPulseFlag SMALLINT(3) UNSIGNED  NULL  ,
  BPPulseValue SMALLINT(3) UNSIGNED  NULL  ,
  WeightFlag SMALLINT(3) UNSIGNED  NULL  ,
  WeightValue SMALLINT(3) UNSIGNED  NULL  ,
  OxyPulseFlag SMALLINT(3) UNSIGNED  NULL  ,
  OxyPulseValue SMALLINT(3) UNSIGNED  NULL  ,
  OxiSpO2Flag SMALLINT(3) UNSIGNED  NULL  ,
  OxiPulseO2Value SMALLINT(3) UNSIGNED  NULL  ,
  OverallFlag SMALLINT(3) UNSIGNED  NULL  ,
  OverAllStatus VARCHAR(100)  NULL  ,
  ExaminationDate DATETIME  NULL    ,
  PRIMARY KEY(Severity_id)  ,
INDEX HM_severity_FKIndex1(Patient_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Allergy_Type (
  Allergy_Type_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  AllergyTypeName VARCHAR(20)  NULL ,
   PRIMARY KEY(Allergy_Type_id) 
  ); 
  
 CREATE TABLE HM_Allergy_Item (
  Allergy_Item_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  Allergy_Type_id INTEGER UNSIGNED,
  AllergyItemName VARCHAR(20)  NULL ,
  PRIMARY KEY(Allergy_Item_id),
 FOREIGN KEY(Allergy_Type_id)
    REFERENCES HM_Allergy_Type(Allergy_Type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);
 
   CREATE TABLE HM_PatientAllergies (
   Patient_Allergies_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
   Patient_Id VARCHAR(20)  NULL,
   Allergy_Type_id INTEGER UNSIGNED,
   Allergy_Item_id INTEGER UNSIGNED,
   Start_Date DATETIME  NULL  ,
   Resolved_Date DATETIME  NULL  ,
   Severity_type VARCHAR(15) ,
   Comments VARCHAR(100) ,
    PRIMARY KEY(Patient_Allergies_id),
   FOREIGN KEY(Allergy_Type_id)
    REFERENCES HM_Allergy_Type(Allergy_Type_id),
	FOREIGN KEY(Allergy_Item_id)
    REFERENCES HM_Allergy_Item(Allergy_Item_id),
	FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id));

  CREATE TABLE HM_Diagnosis (
  Diagnosis_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  DiagnosisType  VARCHAR(20)  NOT NULL ,
  PRIMARY KEY(Diagnosis_id)
  	);
	
  CREATE TABLE HM_PatientDiagnosis (
  Patient_id VARCHAR(50) NOT NULL,
  Diagnosis_id INTEGER UNSIGNED  ,
  Comments VARCHAR(100),
  User_id VARCHAR(50) ,
  FOREIGN KEY(Diagnosis_id)
  REFERENCES HM_Diagnosis(Diagnosis_id),
  FOREIGN KEY(User_id)
  REFERENCES HM_User(User_id));
  
  CREATE TABLE HM_Procedures (
  Procedure_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  ProcedureType  VARCHAR(20)  NOT NULL ,
  PRIMARY KEY(Procedure_id)
  	);
	
  CREATE TABLE HM_PatientProcedure (
  Patient_id VARCHAR(50) NOT NULL,
  Procedure_id INTEGER UNSIGNED  ,
  Comments VARCHAR(100),
  User_id VARCHAR(50) ,
  Resolved_Date DATETIME  NULL  ,
  UploadReportPath VARCHAR(100),
  FOREIGN KEY(Patient_id)
  REFERENCES HM_Patient(Patient_id),
  FOREIGN KEY(User_id)
  REFERENCES HM_User(User_id));
  
  CREATE TABLE HM_InvestigationTest (
  InvestigationTest_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  InvestigationTestType  VARCHAR(20)  NOT NULL ,
  PRIMARY KEY(InvestigationTest_id)
  	);
	
  CREATE TABLE HM_PatientInvestigationTest (
  Patient_id VARCHAR(50) NOT NULL,
  InvestigationTest_id INTEGER UNSIGNED  ,
  Quantity INTEGER,
  Comments VARCHAR(100),
  Status VARCHAR(50) ,
  Resolved_Date DATETIME  NULL  ,
  UploadReportPath VARCHAR(100),
  FOREIGN KEY(Patient_id)
  REFERENCES HM_Patient(Patient_id)
  );
  

CREATE TABLE HM_Survey_Results (
  Survey_Result_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT ,
  Survey_Questionair_id INTEGER  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Survey_Option_Answer VARCHAR(100)  NULL    ,
PRIMARY KEY(Survey_Result_id)  ,
INDEX HM_Survey_Results_FKIndex1(Patient_id)  ,
INDEX HM_Survey_Results_FKIndex2(Survey_Questionair_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Survey_Questionair_id)
    REFERENCES HM_Survey_Questionair(Survey_Questionair_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Tasks_Patient (
  Tasks_Patient_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Patient_id VARCHAR(50)  NOT NULL  ,
  User_tasks_id INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(Tasks_Patient_id)  ,
INDEX HM_Tasks_Patient_FKIndex1(Patient_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Patients_Device_Reading (
  Patients_Device_Reading_id INTEGER UNSIGNED  NOT NULL  AUTO_INCREMENT,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Devices_id INTEGER UNSIGNED  NOT NULL  ,
  Device_Attributes_id INTEGER UNSIGNED  NOT NULL  ,
  Device_Attributes_value VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Created_By VARCHAR(50)  NULL    ,
PRIMARY KEY(Patients_Device_Reading_id)  ,
INDEX Patients_Vitals_FKIndex3(Patient_id)  ,
INDEX Patients_Vitals_FKIndex2(Devices_id, Device_Attributes_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Devices_id, Device_Attributes_id)
    REFERENCES HM_Device_Attributes(Devices_id, Device_Attributes_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Appointments (
  Appointment_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  User_id VARCHAR(50)  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Appointment_Date DATETIME  NULL  ,
  Appointment_new_old_flag BOOLEAN  NULL  ,
  Appointment_accepted_by BOOLEAN  NULL  ,
  Created_Date DATETIME  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Referred BOOLEAN  NULL  ,
  AcceptedFlag BOOLEAN  NULL    ,
PRIMARY KEY(Appointment_id)  ,
INDEX HM_Appointment_FKIndex1(Patient_id)  ,
INDEX HM_Appointment_FKIndex2(User_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Patient_Vitals (
  id_Patient_Vitals INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Vitals_id INTEGER UNSIGNED  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Vital_value INTEGER UNSIGNED  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Examination_Date DATETIME  NULL    ,
PRIMARY KEY(id_Patient_Vitals)  ,
INDEX Patient_Vitals_FKIndex1(Vitals_id)  ,
INDEX Patient_Vitals_FKIndex2(Patient_id),
  FOREIGN KEY(Vitals_id)
    REFERENCES HM_Vitals(Vitals_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Program_details_Transactions (
  Program_details_Transactions_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Program_Details_id INTEGER UNSIGNED  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Program_item_id INTEGER UNSIGNED  NULL  ,
  Program_item_value VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_Date DATETIME  NULL  ,
  Created_By  VARCHAR(50)  NULL  ,
  Updated_By VARCHAR(50)  NULL    ,
PRIMARY KEY(Program_details_Transactions_id)  ,
INDEX HM_Program_details_Transactions_FKIndex1(Programs_id, Program_Details_id)  ,
INDEX HM_Program_details_Transactions_FKIndex2(Patient_id),
  FOREIGN KEY(Programs_id, Program_Details_id )
    REFERENCES HM_Program_Details(Programs_id, Program_Details_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Medication (
  HM_MedicationId INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PHC_ID INTEGER UNSIGNED  NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  DrugId INTEGER UNSIGNED  NOT NULL  ,
  Medicine_Qty VARCHAR(30)  NULL  ,
  Created_by VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_by VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL  ,
  Duration_In_Days INTEGER UNSIGNED  NULL  ,
  DrugCategory VARCHAR(30)  NULL    ,
PRIMARY KEY(HM_MedicationId)  ,
INDEX Table_43_FKIndex1(Patient_id)  ,
INDEX HM_Immunization_FKIndex2(DrugId)  ,
INDEX HM_Medication_FKIndex3(PHC_ID),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(DrugId)
    REFERENCES HM_DrugMaster(DrugId)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Patient_Family (
  Family_Id INTEGER  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  Card_Type_id INTEGER UNSIGNED  NOT NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Family_First_NM VARCHAR(50)  NULL  ,
  Family_Middle_NM VARCHAR(50)  NULL  ,
  Family_Last_NM VARCHAR(50)  NULL  ,
  Date_Of_Birth DATE  NULL  ,
  Age INTEGER UNSIGNED  NOT NULL  ,
  Education VARCHAR(50)  NULL  ,
  Relation VARCHAR(50)  NULL  ,
  Card_Number VARCHAR(50)  NULL  ,
  Marital_Status VARCHAR(50)  NULL  ,
  Contact INTEGER UNSIGNED  NULL  ,
  Created_Date DATETIME  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY(Patient_id,Family_Id)  ,
INDEX Patient_Family_FKIndex1(Patient_id)  ,
INDEX Patient_Family_FKIndex2(Cast_Category_Id)  ,
INDEX Patient_Family_FKIndex3(Gender_Id)  ,
INDEX HM_Patient_Family_FKIndex4(Card_Type_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Gender_Id)
    REFERENCES HM_Gender(Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Card_Type_id)
    REFERENCES HM_Identity_Cards(Card_Type_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_Referals (
  Referal_id INTEGER  NOT NULL   AUTO_INCREMENT,
  User_id VARCHAR(50)  NOT NULL  ,
  Patient_id VARCHAR(50)  NOT NULL  ,
  PHC_ID INTEGER UNSIGNED  NOT NULL  ,
  Village_id INTEGER UNSIGNED  NOT NULL  ,
  Referral_Reason_Id INTEGER UNSIGNED  NOT NULL  ,
  Referal_Notes VARCHAR(100)  NULL  ,
  Ref_Date DATETIME  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL    ,
PRIMARY KEY(Referal_id)  ,
INDEX HM_Referals_FKIndex1(Patient_id)  ,
INDEX HM_Referals_FKIndex2(User_id)  ,
INDEX HM_Referals_FKIndex3(PHC_ID)  ,
INDEX HM_Referals_FKIndex4(Village_id)  ,
INDEX HM_Referals_FKIndex5(Referral_Reason_Id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PHC_ID)
    REFERENCES HM_PHC(PHC_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Village_id)
    REFERENCES HM_Villages(Village_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Referral_Reason_Id)
    REFERENCES HM_Referral_Reason(Referral_Reason_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE HM_CP_Patient (
  Patient_id VARCHAR(50)  NOT NULL  ,
  Template_id INTEGER UNSIGNED  NOT NULL  ,
  Category_id INTEGER UNSIGNED  NOT NULL  ,
  Template_Task_id INTEGER UNSIGNED  NOT NULL  ,
  Frequency_id INTEGER UNSIGNED  NULL  ,
  frequency_detail_id INTEGER UNSIGNED  NOT NULL  ,

  User_id VARCHAR(50)   NULL  ,
  role VARCHAR(50)   NULL ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL  ,
  Approved BOOLEAN  NULL    ,
PRIMARY KEY(Patient_id,Template_id, Category_id,Template_Task_id,frequency_detail_id, role)  ,
INDEX HM_CP_Patient_FKIndex1(Patient_id)  ,
INDEX HM_CP_Patient_FKIndex2(Template_id)  ,
INDEX HM_CP_Patient_FKIndex3(Category_id)  ,
INDEX HM_CP_Patient_FKIndex4(Template_Task_id)  ,
INDEX HM_CP_Patient_FKIndex5(Frequency_id)  ,
INDEX HM_CP_Patient_FKIndex6(frequency_detail_id)  ,
INDEX HM_CP_Patient_FKIndex7(User_id),
  FOREIGN KEY(Patient_id)
    REFERENCES HM_Patient(Patient_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Template_id)
    REFERENCES HM_CP_Templates(Template_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
   FOREIGN KEY(Category_id)
    REFERENCES HM_CP_Category(Category_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Template_Task_id)
    REFERENCES HM_CP_Tasks(Template_Task_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Frequency_id)
    REFERENCES HM_CP_Frequency(Frequency_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(frequency_detail_id)
    REFERENCES HM_CP_frequency_details(frequency_detail_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(User_id)
    REFERENCES HM_User(User_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);

ALTER TABLE `hm_investigationtest` CHANGE `InvestigationTestType` `InvestigationTestType` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `hm_procedures` CHANGE `ProcedureType` `ProcedureType` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `hm_diagnosis` CHANGE `DiagnosisType` `DiagnosisType` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE `hm_patientdiagnosis` ADD `PatientDiagnosisId` INT(10) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`PatientDiagnosisId`);
ALTER TABLE `hm_patientprocedure` ADD `PatientProcedureId` INT(10) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`PatientProcedureId`);
ALTER TABLE `hm_patientinvestigationtest` ADD `PatientinvestigationtestId` INT(10) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (`PatientinvestigationtestId`);