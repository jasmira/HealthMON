ALTER TABLE `hm_patients_bp` CHANGE `Patient_id` `Patient_id` VARCHAR( 50 ) NOT NULL; 
ALTER TABLE `hm_patients_vitals` CHANGE `Patient_id` `Patient_id` VARCHAR( 50 ) NOT NULL;
ALTER TABLE `hm_patients_bp` ADD `examination_date` DATETIME NULL;
ALTER TABLE `hm_patients_vitals` ADD `examination_date` DATETIME NULL;
ALTER TABLE `HM_Patients_ECG` ADD `examination_date` DATETIME NULL;
ALTER TABLE `hm_patient` ADD `enrollment_date` DATETIME NULL;

CREATE TABLE IF NOT EXISTS `hm_appointments` (
  `HM_Appointment_id` int(10) NOT NULL AUTO_INCREMENT,
  `HM_User_id` int(10) NOT NULL,
  `HM_Patient_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `appointment_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `appointment_details` text COLLATE utf8_unicode_ci NOT NULL,
  `referred_patient` tinyint(1) NOT NULL,
  `is_new_patient` tinyint(1) NOT NULL,
  `patient_severity` int(2) NOT NULL,
  PRIMARY KEY (`HM_Appointment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT;

CREATE TABLE IF NOT EXISTS `hm_learning_content` (
  `hm_learning_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hm_program_id` int(10) unsigned DEFAULT NULL,
  `hm_user_id` int(10) unsigned DEFAULT NULL,
  `hm_learning_for_user_type` varchar(15) DEFAULT NULL,
  `hm_learning_description` varchar(50) DEFAULT NULL,
  `hm_learning_type` enum('education','training') DEFAULT NULL,
  `hm_learning_is_internal` tinyint(1) NOT NULL DEFAULT '1',
  `hm_learning_content_type` enum('audio','video','pdf','word','ppt') DEFAULT NULL,
  `hm_learning_link` varchar(150) DEFAULT NULL,
  `hm_learning_created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hm_learning_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hm_learning_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT ;

CREATE TABLE IF NOT EXISTS `hm_user_tasks` (
  `User_Tasks_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HM_User_HM_Programs_Programs_id` int(10) unsigned NOT NULL,
  `HM_User_id` int(10) unsigned NOT NULL,
  `User_Task_Name` varchar(50) DEFAULT NULL,
  `User_Task_Description` varchar(50) DEFAULT NULL,
  `User_Task_Type` varchar(15) DEFAULT NULL,
  `User_Task_Severity` int(10) unsigned DEFAULT NULL,
  `User_Task_CreatedTime` datetime NOT NULL,
  `User_Task_Date` datetime DEFAULT NULL,
  `User_Task_Actionable` tinyint(1) DEFAULT NULL,
  `User_task_Action` varchar(200) NOT NULL,
  PRIMARY KEY (`User_Tasks_id`,`HM_User_HM_Programs_Programs_id`,`HM_User_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENTx ;


 -- User_role ,User_email_id,User_Place_ofWork is added into hm_user_details table 

 ALTER TABLE  `hm_user_details` ADD  `User_role` VARCHAR( 10 ) NOT NULL AFTER  `User_Password`;

 ALTER TABLE  `hm_user_details` ADD  `User_email_id` VARCHAR( 25 ) NOT NULL AFTER  `User_qualification`;

 ALTER TABLE  `hm_user_details` ADD  `User_Place_ofWork` VARCHAR( 20 ) NOT NULL;


--  Changing field name 'user_type' to 'user_role' in token table to maintain same nameing convention

 ALTER TABLE  `token` CHANGE  `user_type`  `user_role` VARCHAR( 15 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;


-- field HM_User_id added in token table.

 ALTER TABLE  `token` ADD  `HM_User_id` INT NOT NULL AFTER  `id`;


-- created table HM_Patients_PulseOximeter

CREATE TABLE HM_Patients_PulseOximeter (
Patient_id INTEGER UNSIGNED NOT NULL,
DeviceID INTEGER,
UserId VARCHAR(50),
PulseRate INTEGER,
PerfusionIndex INTEGER, 
SpO2 INTEGER,
PulseOxWavePoints VARBINARY(1000),
PulseBeatsPoints VARBINARY(1000),
DiagnosisTimestamp DATETIME   NULL,
 
FOREIGN KEY(Patient_id)
REFERENCES HM_Patient(HM_Patient_id)
 
      ON DELETE NO ACTION
      ON UPDATE NO ACTION); 


-- added PHC and User_reg_id attributes to table hm_user_details


ALTER TABLE  `hm_user_details` ADD  `User_PlaceOfWorkVillage` VARCHAR( 20 ) NOT NULL

ALTER TABLE `hm_user_details` CHANGE `User_PlaceOfWorkVillage` `PHC` VARCHAR( 50 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL 

ALTER TABLE `hm_user_details` ADD `User_reg_id` VARCHAR( 50 ) NOT NULL AFTER `User_qualification`

-- Added some attributes to Hm_User-Task table 02/06/2016
-- Added attributes- User_Task_Actionable,User_Task_Action,Created_Date,Created_by,User_Task_Venue,User_End_Time,
-- User_Start_Time,User_Reminder_Interval

ALTER TABLE `hm_user_tasks` ADD `User_Task_Action` VARCHAR(50) NULL DEFAULT NULL AFTER `User_Task_Actionable`;
ALTER TABLE `hm_user_tasks` ADD `Created_by` INT NULL DEFAULT NULL AFTER `User_Task_Action`, ADD `Created_Date` DATETIME NULL 

DEFAULT NULL AFTER `Created_by`, ADD `User_Task_Venue` VARCHAR(30) NULL DEFAULT NULL AFTER `Created_Date`, ADD `User_Start_Time` 

DATETIME NULL DEFAULT NULL AFTER `User_Task_Venue`, ADD `User_End_Time` DATETIME NULL DEFAULT NULL AFTER `User_Start_Time`, ADD 

`User_Reminder_Interval` INT NOT NULL AFTER `User_End_Time`;
ALTER TABLE `hm_user_tasks` ADD `Task_Status` VARCHAR(10) NULL DEFAULT NULL AFTER `User_Reminder_Interval`;

--Added 2 more calendar related columns in table hm_user_tasks
ALTER TABLE `hm_user_tasks` ADD `All_Day_Booked` BOOLEAN NOT NULL AFTER `Task_Status`, ADD `Set_Reminder` BOOLEAN NOT NULL AFTER `All_Day_Booked`;

--Changes done in Null and default value constraint 20-06-2016
ALTER TABLE `hm_user_tasks` CHANGE `HM_User_HM_Programs_Programs_id` `HM_User_HM_Programs_Programs_id` INT( 10 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `hm_user_tasks` CHANGE `User_Task_CreatedTime` `User_Task_CreatedTime` DATETIME NULL DEFAULT NULL ;
ALTER TABLE `hm_user_tasks` CHANGE `User_Reminder_Interval` `User_Reminder_Interval` INT( 11 ) NULL DEFAULT NULL ;
ALTER TABLE `hm_user_tasks` CHANGE `All_Day_Booked` `All_Day_Booked` TINYINT( 1 ) NULL DEFAULT '0';
ALTER TABLE `hm_user_tasks` CHANGE `Set_Reminder` `Set_Reminder` TINYINT( 1 ) NOT NULL DEFAULT '0';

-- datatype patient_id is changed to varchar(50) , role field is added in hm_cp_tasks on 20/06/2016
ALTER TABLE `hm_cp_patient` CHANGE `Patient_id` `Patient_id` VARCHAR(50) NULL;

ALTER TABLE `hm_cp_tasks` ADD `role` VARCHAR(20) NOT NULL AFTER `Updated_Date`;


-- table is created with 'Medicines_givenBy' new attribute 22/06/2016
CREATE TABLE HM_CP_Patient (
  Patient_id varchar(50)   NOT NULL,
  Template_id INTEGER   NOT NULL ,
  Template_Task_id INTEGER   NOT NULL ,
  Frequency_id INTEGER   NOT NULL ,
  Category_id VARCHAR(100)   NOT NULL ,
  Medicines_givenBy varchar(50) NOT NULL ,
  Created_By VARCHAR(50)    ,
  Created_Date DATETIME    ,
  Updated_By VARCHAR(50)    ,
  Updated_Date DATETIME);
 
--appointment_accepted field added in hm_appointments table 23-06-2016
ALTER TABLE `hm_appointments` ADD `appointment_accepted` BOOLEAN NOT NULL DEFAULT FALSE AFTER `patient_severity`;
ALTER TABLE `hm_appointments` CHANGE `appointment_date_time` `appointment_date_time` TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE `hm_user_tasks` CHANGE `Set_Reminder` `Set_Reminder` TINYINT(1) NULL DEFAULT '0';
-- view trend related changes added by sheetal 23-06-2016
ALTER TABLE `hm_patients_vitals` ADD `examination_date` DATETIME NOT NULL AFTER `Fundal_Heights`;
ALTER TABLE `hm_survey_results` CHANGE `Patient_id` `Patient_id` VARCHAR(50) NOT NULL;
ALTER TABLE `hm_medication` CHANGE `Patient_id` `Patient_id` VARCHAR(50) NOT NULL;