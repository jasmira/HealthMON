CREATE TABLE HM_Programs (
  Programs_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Program_desc VARCHAR(50)  NULL  ,
  Program_start_date DATE  NULL  ,
  Program_end_date DATE  NULL    ,
PRIMARY KEY(Programs_id));


CREATE TABLE HM_Programs (
  Programs_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Program_desc VARCHAR(50)  NULL  ,
  Program_start_date DATE  NULL  ,
  Program_end_date DATE  NULL    ,
PRIMARY KEY(Programs_id));


CREATE TABLE HM_Programs (
  Programs_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Program_desc VARCHAR(50)  NULL  ,
  Program_start_date DATE  NULL  ,
  Program_end_date DATE  NULL    ,
PRIMARY KEY(Programs_id));


CREATE TABLE HM_Programs (
  Programs_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Program_desc VARCHAR(50)  NULL  ,
  Program_start_date DATE  NULL  ,
  Program_end_date DATE  NULL    ,
PRIMARY KEY(Programs_id));


CREATE TABLE HM_Gender (
  Gender_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Gender_Name CHAR(15)  NULL  ,
  Gender_Short_NM CHAR(1)  NULL    ,
PRIMARY KEY(Gender_Id));


CREATE TABLE HM_Gender (
  Gender_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Gender_Name CHAR(15)  NULL  ,
  Gender_Short_NM CHAR(1)  NULL    ,
PRIMARY KEY(Gender_Id));


CREATE TABLE User_contact (
  idUser_contact INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(idUser_contact));


CREATE TABLE User_contact (
  idUser_contact INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(idUser_contact));


CREATE TABLE User_contact (
  idUser_contact INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(idUser_contact));


CREATE TABLE User_contact (
  idUser_contact INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(idUser_contact));


CREATE TABLE HM_Cast_Category (
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Cast_Category_NM VARCHAR(50)  NULL  ,
  Cast_Category_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(Cast_Category_Id));


CREATE TABLE HM_Cast_Category (
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Cast_Category_NM VARCHAR(50)  NULL  ,
  Cast_Category_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(Cast_Category_Id));


CREATE TABLE HM_Cast_Category (
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Cast_Category_NM VARCHAR(50)  NULL  ,
  Cast_Category_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(Cast_Category_Id));


CREATE TABLE HM_Country (
  HM_Country_ID INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  HM_Country_NM VARCHAR(50)  NULL  ,
  HM_Country_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(HM_Country_ID));


CREATE TABLE HM_Country (
  HM_Country_ID INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  HM_Country_NM VARCHAR(50)  NULL  ,
  HM_Country_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(HM_Country_ID));


CREATE TABLE HM_User (
  HM_User_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_User_id, Programs_id)  ,
INDEX HM_User_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_User_Details (
  User_Details_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  HM_User_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  User_Name VARCHAR(50)  NULL  ,
  User_Password VARCHAR(50)  NULL  ,
  User_qualification VARCHAR(50)  NULL  ,
  User_contact_number INTEGER UNSIGNED  NULL  ,
  User_Emergency_contact INTEGER  NOT NULL  ,
  User_Address1 VARCHAR(50)  NULL  ,
  User_Address2 VARCHAR(50)  NULL    ,
PRIMARY KEY(User_Details_id, HM_User_id, Programs_id)  ,
INDEX HM_User_Details_FKIndex1(HM_User_id, Programs_id),
  FOREIGN KEY(HM_User_id, Programs_id)
    REFERENCES HM_User(HM_User_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Actor (
  HM_Actor_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Actor_desc VARCHAR(50)  NULL    ,
PRIMARY KEY(HM_Actor_id, Programs_id)  ,
INDEX HM_Actor_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_User_Tasks (
  User_Tasks_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  HM_User_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  User_Task_Name VARCHAR(50)  NULL  ,
  User_Task_Description VARCHAR(50)  NULL  ,
  User_Task_Type VARCHAR(50)  NULL  ,
  User_Task_Severity INTEGER UNSIGNED  NULL  ,
  User_Task_Date DATETIME  NULL  ,
  User_Task_Actionable BOOL  NULL    ,
PRIMARY KEY(User_Tasks_id, HM_User_id, Programs_id)  ,
INDEX HM_User_Tasks_FKIndex1(HM_User_id, Programs_id),
  FOREIGN KEY(HM_User_id, Programs_id)
    REFERENCES HM_User(HM_User_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_User_Token (
  HM_User_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Token_Timestamp DATETIME  NULL  ,
  Token_expiry_flag BOOL  NULL    ,
PRIMARY KEY(HM_User_id, Programs_id)  ,
INDEX HM_User_Time_FKIndex1(HM_User_id, Programs_id),
  FOREIGN KEY(HM_User_id, Programs_id)
    REFERENCES HM_User(HM_User_id, Programs_id)
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
PRIMARY KEY(Program_Details_id, Programs_id)  ,
INDEX HM_Program_Details_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_States (
  HM_State_ID INTEGER UNSIGNED  NOT NULL  ,
  HM_Country_ID INTEGER UNSIGNED  NOT NULL  ,
  HM_State_NM VARCHAR(50)  NULL  ,
  HM_State_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(HM_State_ID, HM_Country_ID)  ,
INDEX HM_States_FKIndex1(HM_Country_ID),
  FOREIGN KEY(HM_Country_ID)
    REFERENCES HM_Country(HM_Country_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Survey_Template (
  Programs_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Programs_id)  ,
INDEX HM_Survey_Template_FKIndex1(Programs_id),
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_User_Actor (
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  HM_User_id INTEGER UNSIGNED  NOT NULL  ,
  HM_Actor_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Programs_id, HM_User_id)  ,
INDEX HM_User_Actor_FKIndex2(HM_Actor_id, Programs_id)  ,
INDEX HM_User_Actor_FKIndex2(HM_User_id, Programs_id),
  FOREIGN KEY(HM_Actor_id, Programs_id)
    REFERENCES HM_Actor(HM_Actor_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(HM_User_id, Programs_id)
    REFERENCES HM_User(HM_User_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Patient (
  Patient_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
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
  Patient_Adhar_No INTEGER UNSIGNED  NULL  ,
  Patient_Ration_Card_No INTEGER UNSIGNED  NULL  ,
  Patient_District VARCHAR(50)  NULL  ,
  Patient_Taluka VARCHAR(50)  NULL  ,
  Patient_Village VARCHAR(50)  NULL  ,
  Patient_Ward VARCHAR(50)  NULL  ,
  Patient_Pin VARCHAR(50)  NULL  ,
  Patient_Image BIT  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY(Patient_id, Cast_Category_Id, Gender_Id)  ,
INDEX HM_Patient_FKIndex2(Cast_Category_Id)  ,
INDEX HM_Patient_FKIndex2(Gender_Id),
  FOREIGN KEY(Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Gender_Id)
    REFERENCES HM_Gender(Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Patient_Family (
  Family_Id INTEGER UNSIGNED  NOT NULL  ,
  HM_Patient_Patient_id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  HM_Cast_Category_Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  HM_Gender_Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  Family_First_NM VARCHAR(50)  NULL  ,
  Family_Middle_NM VARCHAR(50)  NULL  ,
  Family_Last_NM VARCHAR(50)  NULL  ,
  Date_Of_Birth DATE  NULL  ,
  Age INTEGER UNSIGNED  NULL  ,
  Education VARCHAR(50)  NULL  ,
  Relation VARCHAR(50)  NULL  ,
  Adhar_Card_No VARCHAR(50)  NULL  ,
  Marital_Status VARCHAR(50)  NULL  ,
  Contact INTEGER UNSIGNED  NULL  ,
  Created_Date DATETIME  NULL  ,
  Created_By VARCHAR(50)  NULL  ,
  Updated_By VARCHAR(50)  NULL  ,
  Updated_Date DATETIME  NULL    ,
PRIMARY KEY(Family_Id, HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)  ,
INDEX Patient_Family_FKIndex1(HM_Gender_Gender_Id)  ,
INDEX Patient_Family_FKIndex2(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)  ,
INDEX Patient_Family_FKIndex3(HM_Cast_Category_Cast_Category_Id),
  FOREIGN KEY(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)
    REFERENCES HM_Patient(Patient_id, Cast_Category_Id, Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(HM_Gender_Gender_Id)
    REFERENCES HM_Gender(Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(HM_Cast_Category_Cast_Category_Id)
    REFERENCES HM_Cast_Category(Cast_Category_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Patients_Vitals (
  HM_Patient_Patient_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_Patient_Patient_id, Programs_id, Cast_Category_Id, Gender_Id)  ,
INDEX Patients_Vitals_FKIndex3(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)  ,
INDEX Patients_Vitals_FKIndex2(Programs_id),
  FOREIGN KEY()
    REFERENCES HM_Vitals()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)
    REFERENCES HM_Patient(Patient_id, Cast_Category_Id, Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Programs_id)
    REFERENCES HM_Programs(Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_CP_Templates (
  HM_Actor_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_Actor_id, Programs_id)  ,
INDEX HM_CP_Templates_FKIndex4(HM_Actor_id, Programs_id),
  FOREIGN KEY()
    REFERENCES HM_CP_Tasks()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES HM_CP_Frequency()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY()
    REFERENCES HM_CP_Category()
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(HM_Actor_id, Programs_id)
    REFERENCES HM_Actor(HM_Actor_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Actor_Tasks (
  HM_Actor_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Actor_Tasks_id INTEGER UNSIGNED  NOT NULL  ,
  Actor_Name VARCHAR(50)  NULL  ,
  Actor_Desc VARCHAR(50)  NULL    ,
PRIMARY KEY(HM_Actor_id, Programs_id)  ,
INDEX HM_Actor_Tasks_FKIndex1(HM_Actor_id, Programs_id),
  FOREIGN KEY(HM_Actor_id, Programs_id)
    REFERENCES HM_Actor(HM_Actor_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Districts (
  HM_States_HM_State_ID INTEGER UNSIGNED  NOT NULL  ,
  HM_States_HM_Country_ID INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_States_HM_State_ID, HM_States_HM_Country_ID)  ,
INDEX HM_Districts_FKIndex1(HM_States_HM_State_ID, HM_States_HM_Country_ID),
  FOREIGN KEY(HM_States_HM_State_ID, HM_States_HM_Country_ID)
    REFERENCES HM_States(HM_State_ID, HM_Country_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_CP_Patient (
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Patient_id INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Gender_Id, Cast_Category_Id, Patient_id)  ,
INDEX HM_CP_Patient_FKIndex1(Patient_id, Cast_Category_Id, Gender_Id),
  FOREIGN KEY(Patient_id, Cast_Category_Id, Gender_Id)
    REFERENCES HM_Patient(Patient_id, Cast_Category_Id, Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Program_details_Transactions (
  Program_details_Transactions_id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  HM_Patient_Patient_id INTEGER UNSIGNED  NOT NULL  ,
  Programs_id INTEGER UNSIGNED  NOT NULL  ,
  Program_Details_id INTEGER UNSIGNED  NOT NULL  ,
  Cast_Category_Id INTEGER UNSIGNED  NOT NULL  ,
  Gender_Id INTEGER UNSIGNED  NOT NULL  ,
  Program_item_id INTEGER UNSIGNED  NULL  ,
  Program_item_value VARCHAR(50)  NULL  ,
  Created_Date DATETIME  NULL  ,
  Updated_Date DATETIME  NULL  ,
  Created_By  VARCHAR(50)  NULL  ,
  Updated_By VARCHAR(50)  NULL    ,
PRIMARY KEY(Program_details_Transactions_id, HM_Patient_Patient_id, Programs_id, Program_Details_id, Cast_Category_Id, Gender_Id)  ,
INDEX HM_Program_details_Transactions_FKIndex2(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)  ,
INDEX HM_Program_details_Transactions_FKIndex2(Program_Details_id, Programs_id),
  FOREIGN KEY(HM_Patient_Patient_id, Cast_Category_Id, Gender_Id)
    REFERENCES HM_Patient(Patient_id, Cast_Category_Id, Gender_Id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Program_Details_id, Programs_id)
    REFERENCES HM_Program_Details(Program_Details_id, Programs_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_City (
  HM_Districts_HM_States_HM_State_ID INTEGER UNSIGNED  NOT NULL  ,
  HM_Districts_HM_States_HM_Country_ID INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_Districts_HM_States_HM_State_ID, HM_Districts_HM_States_HM_Country_ID)  ,
INDEX HM_City_FKIndex1(HM_Districts_HM_States_HM_State_ID, HM_Districts_HM_States_HM_Country_ID),
  FOREIGN KEY(HM_Districts_HM_States_HM_State_ID, HM_Districts_HM_States_HM_Country_ID)
    REFERENCES HM_Districts(HM_States_HM_State_ID, HM_States_HM_Country_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE HM_Pincode (
  HM_City_HM_Districts_HM_States_HM_State_ID INTEGER UNSIGNED  NOT NULL  ,
  HM_City_HM_Districts_HM_States_HM_Country_ID INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(HM_City_HM_Districts_HM_States_HM_State_ID, HM_City_HM_Districts_HM_States_HM_Country_ID)  ,
INDEX HM_Pincode_FKIndex1(HM_City_HM_Districts_HM_States_HM_State_ID, HM_City_HM_Districts_HM_States_HM_Country_ID),
  FOREIGN KEY(HM_City_HM_Districts_HM_States_HM_State_ID, HM_City_HM_Districts_HM_States_HM_Country_ID)
    REFERENCES HM_City(HM_Districts_HM_States_HM_State_ID, HM_Districts_HM_States_HM_Country_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


