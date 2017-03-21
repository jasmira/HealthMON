var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoApp+'patientDao.js';

var patientFamilyInfoDao = {
    
    getPatientsDetailsList : function(createdBy,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmp`.* FROM `hm_patient` AS `hmp`  WHERE `hmp`.`Created_By`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[createdBy],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsDetailsList');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    insertPatientFamilyInfo : function(familyMemberIinfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_patient_family` VALUES ?";
        if(connection){
           var query = connection.query(sqlStatement,[familyMemberIinfo], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientFamilyInfo');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                    
                    callback({status: 'success'});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientFamilyInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmpf`.*, `hmic`.`Card_Description`, `hmg`.`Gender_Short_NM` FROM `hm_patient` AS `hmp` JOIN `hm_patient_family` AS `hmpf` ON `hmpf`.`Patient_id` = `hmp`.`Patient_id` JOIN `hm_gender` AS `hmg` ON `hmg`.`Gender_Id` = `hmpf`.`Gender_Id` JOIN `hm_identity_cards` AS `hmic` ON `hmic`.`Card_Type_id` = `hmpf`.`Card_Type_id` WHERE `hmp`.`Patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientFamilyInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	insertPatientpersonalInfo : function(personalInfo,callback){
		//console.log(personalInfo);
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = 'INSERT INTO `hm_patient` VALUES ?';
		
        if(connection){
            var query =connection.query(sqlStatement,[personalInfo], function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientpersonalInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback({status: 'success'});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientPersonalInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmp`.*, `hmic`.`Card_Description`, `hmv`.`Village_Name`, `hmc`.`City_name`, `hmd`.`District_name`, `hmg`.`Gender_Short_NM`, `hmcc`.`Cast_Category_NM` FROM `hm_patient` AS `hmp` JOIN `hm_gender` AS `hmg` ON `hmg`.`Gender_Id` = `hmp`.`Gender_Id` JOIN `hm_identity_cards` AS `hmic` ON `hmic`.`Card_Type_id` = `hmp`.`Card_Type_id` JOIN `hm_villages` AS `hmv` ON `hmv`.`Village_id` = `hmp`.`Village_id` JOIN `hm_city` AS `hmc` ON `hmc`.`City_id` = `hmp`.`City_id` JOIN `hm_districts` AS `hmd` ON `hmd`.`District_id` = `hmp`.`District_id` JOIN `hm_cast_category` AS `hmcc` ON `hmcc`.`Cast_Category_Id`=`hmp`.`Cast_Category_Id` WHERE `Patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientPersonalInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	insertPatientprogramInfo : function(programInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = 'INSERT INTO `hm_program_details_transactions` VALUES ?';
		
        if(connection){
            var query =connection.query(sqlStatement,[programInfo], function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientprogramInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback({status: 'success'});
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientProgramInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmpdt`.*, `hmpr`.`Program_desc` FROM `hm_program_details_transactions` AS `hmpdt` JOIN `hm_programs` AS `hmpr` ON `hmpr`.`Programs_id`=`hmpdt`.`Programs_id` WHERE `Patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientProgramInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    insertPatientVitals : function(vitalsInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = 'INSERT INTO `hm_patient_vitals` VALUES ?';
		
        if(connection){
            var query =connection.query(sqlStatement,[vitalsInfo],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientVitals');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback({status: 'success'});
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientVitals : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmpv`.*, `hmv`.`Vital_Name` FROM `hm_patient_vitals` AS `hmpv` JOIN `hm_vitals` AS `hmv` ON `hmpv`.`Vitals_id`=`hmv`.`Vitals_id` WHERE patient_id=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientVitals');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    insertPatientDeviceReadings : function(patientDeviceReadings,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = 'INSERT INTO `hm_patients_device_reading` VALUES ?';
		
        if(connection){
            var query =connection.query(sqlStatement,[patientDeviceReadings],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientDeviceReadings');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback({status: 'success'});
				}
            });
            //console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientBPInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmdr`.`patient_id`, `hmdr`.`Created_Date`, `hmdr`.`Created_By`, `hmdr`.`Created_By`, `hmdr`.`Device_Attributes_value`, `hmda`.`Device_Attribute_Name` FROM `hm_patients_device_reading` AS hmdr JOIN `hm_device_attributes` AS hmda ON  `hmdr`.`Device_Attributes_id`=`hmda`.`Device_Attributes_id` WHERE `hmda`.`Devices_id` = 1 AND `patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientBPInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientECGInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmdr`.`patient_id`, `hmdr`.`Created_Date`, `hmdr`.`Created_By`, `hmdr`.`Created_By`, `hmdr`.`Device_Attributes_value`, `hmda`.`Device_Attribute_Name` FROM `hm_patients_device_reading` AS hmdr JOIN `hm_device_attributes` AS hmda ON  `hmdr`.`Device_Attributes_id`=`hmda`.`Device_Attributes_id` WHERE `hmda`.`Devices_id` = 2 AND `patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientECGInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientsPulseOximeterInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmdr`.`patient_id`, `hmdr`.`Created_Date`, `hmdr`.`Created_By`, `hmdr`.`Created_By`, `hmdr`.`Device_Attributes_value`, `hmda`.`Device_Attribute_Name` FROM `hm_patients_device_reading` AS hmdr JOIN `hm_device_attributes` AS hmda ON  `hmdr`.`Device_Attributes_id`=`hmda`.`Device_Attributes_id` WHERE `hmda`.`Devices_id` = 3 AND `patient_id`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsPulseOximeterInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientHBInfo : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmdr`.`patient_id`, `hmdr`.`Created_Date`, `hmdr`.`Created_By`, `hmdr`.`Created_By`, `hmdr`.`Device_Attributes_value`, `hmda`.`Device_Attribute_Name` FROM `hm_patients_device_reading` AS hmdr JOIN `hm_device_attributes` AS hmda ON  `hmdr`.`Device_Attributes_id`=`hmda`.`Device_Attributes_id` WHERE `hmda`.`Devices_id` = 4 AND `patient_id`=? ORDER BY `Created_Date` desc LIMIT 1";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientHBInfo');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getSurveyTemplate : function(programId, templateType, userType, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT hst.`Survey_template_id`, hst.`Programs_id`, hsq.`Survey_Questionair_id`, hsq.`Survey_Question_Category`, hsq.`Survey_Question_no`, hsq.`Survey_Question_Description`, hsq.`Survey_Question_Options`, hsq.`Parent_Qid`, hsq.`Survey_Questionair_Image` FROM `hm_survey_template` as `hst` JOIN `hm_survey_questionair` as `hsq` ON hsq.`Survey_template_id` = hst.`Survey_template_id` JOIN `hm_actor` AS `hma` ON `hsq`.`Actor_id` = `hma`.`Actor_id` WHERE hst.Programs_id=? AND hst.Survey_Template_Type=? AND `hma`.`Actor_desc`=?";
		
        if(connection){
            var query =connection.query(sqlStatement,[programId, templateType, userType],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getSurveyTemplate');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    insertPatientsSurvey : function(patientsSurveyInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_survey_results` (`Survey_Questionair_id`, `Patient_id`, `Survey_Option_Answer`) VALUES ?";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientsSurveyInfo],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertPatientsSurvey');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback({status: 'success'});
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientHRA : function(patientId,programId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT hsr.*, hsq.`Survey_Question_Description` FROM `hm_survey_results` hsr INNER JOIN `hm_survey_questionair` hsq ON hsq.`Survey_Questionair_id` = hsr.`Survey_Questionair_id` WHERE hsr.patient_id=? AND hsq.`Survey_template_id`=1 AND hsq.`Programs_id`=?;";
		
        if(connection){
            var query =connection.query(sqlStatement,[patientId,programId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientHRA');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientFeedback : function(patientId,programId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT hsr.*, hsq.`Survey_Question_Description`, hsq.`Survey_Question_Category`,hsq.`Survey_Question_Options` FROM `hm_survey_results` hsr INNER JOIN `hm_survey_questionair` hsq ON hsq.`Survey_Questionair_id` = hsr.`Survey_Questionair_id` WHERE hsr.patient_id=? AND hsq.`Survey_template_id`=2 AND hsq.`Programs_id`=?;";
          
        if(connection){
            var query =connection.query(sqlStatement,[patientId, programId],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientFeedback');
                    logger.log('node','error',errorMsg);
                   
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			//console.log("query----------"+query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    insertReferPatientsInfo : function(referPatientsInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_referals` (`User_id`, `Patient_id`, `PHC_ID`, `Village_id`, `Referral_Reason_Id`, `Referal_Notes`, `Ref_Date`, `Created_By`, `Created_Date`) VALUES ?";
		
        if(connection){
            var query =connection.query(sqlStatement,[referPatientsInfo],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertReferPatientsInfo');
                    logger.log('node','error',errorMsg);
                     connectionProvider.closeMysqlConnection(connection);
					callback({status: 'fail'});
				} else {
              
        for(var i in referPatientsInfo)  {
             var query="select Patient_FName,Patient_LName from hm_patient where Patient_id=?";
            
             var query =connection.query(query,[referPatientsInfo[i][1]],function(err,result){
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'insertReferPatientsInfo');
                    logger.log('node','error',errorMsg);
                     connectionProvider.closeMysqlConnection(connection);
					callback({status: 'fail'});
				} else {
			
                    
            if(referPatientsInfo[i][5]=='Low HB')
                 var data=["MO1",1,"Patient is referred","Patient "+result[0].Patient_FName+" "+result[0].Patient_LName+" (PID: "+referPatientsInfo[i][1]+
        ") is severely anemic","task",1,referPatientsInfo[i][8],1,null,referPatientsInfo[i][8],
                  referPatientsInfo[i][7]];
               
            else{
                
                if(referPatientsInfo[i][5]=='Under Weight' || referPatientsInfo[i][5]=='Over Weight' )
        var data=["MO1",1,"Patient is referred","Patient "+result[0].Patient_FName+" "+result[0].Patient_LName+" (PID: "+referPatientsInfo[i][1]+
        ") is "+referPatientsInfo[i][5],"task",1,referPatientsInfo[i][8],1,null,referPatientsInfo[i][8],
                  referPatientsInfo[i][7]];
                else
                       var data=["MO1",1,"Patient is referred","Patient "+result[0].Patient_FName+" "+result[0].Patient_LName+" (PID: "+referPatientsInfo[i][1]+
        ") has "+referPatientsInfo[i][5],"task",1,referPatientsInfo[i][8],1,null,referPatientsInfo[i][8],
                  referPatientsInfo[i][7]];
            }
                    
             var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	      commonApisDaoObj.addMoTaskAlertNotification(data,function(result){
	   
          });
         }
    
         
        
            });
          
          }
                    connectionProvider.closeMysqlConnection(connection);
                    callback(result);
        }
         });
			
        
        
    }
        
  },

    getPatientReferalReasons : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM hm_referal_reasons";
		
        if(connection) {
            var query =connection.query(sqlStatement,function(err,result) {
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientReferalReasons');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	getAllReferalData : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM hm_referals";
		
        if(connection) {
            var query =connection.query(sqlStatement,function(err,result) {
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAllReferalData');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    addPatientsMedications : function(patientsMedicationInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_medication` (`Patient_id`, `DrugId`, `Medicine_Qty`, `Created_by`, `Created_Date`, `Duration_In_Days`, `DrugCategory`) VALUES ?";

        if(connection){
           var query = connection.query(sqlStatement,[patientsMedicationInfo], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'addPatientsMedications');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                    
                    callback({status: 'success'});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    addPatientSeverity : function(patientSeverityInfo,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_severity` (`Patient_id`, `HBFlag`, `HBValue`, `BPSysFlag`, `BPSysValue`, `BPDiaFlag`, `BPDiaValue`, `BPPulseFlag`, `BPPulseValue`, `WeightFlag`, `WeightValue`, `OxyPulseFlag`, `OxyPulseValue`, `OxiSpO2Flag`, `OxiPulseO2Value`, `OverallFlag`, `OverAllStatus`, `ExaminationDate`) VALUES ?";

        if(connection){
           var query = connection.query(sqlStatement,[patientSeverityInfo], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'addPatientSeverity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                    
                    callback({status: 'success'});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientSeverity : function(patientId, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_severity` WHERE `Patient_id`=?";
		
        if(connection) {
            var query =connection.query(sqlStatement,[patientId],function(err,result) {
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientSeverity');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getPatientAllergies : function(patientId, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmpa`.`Start_Date`, `hmpa`.`Resolved_Date`, `hmpa`.`Severity_type`, `hai`.`AllergyItemName`, `hat`.`AllergyTypeName` FROM `hm_patientallergies` AS `hmpa` JOIN `hm_allergy_item` AS `hai` ON `hai`.`Allergy_Item_id`=`hmpa`.`Allergy_Item_id` JOIN `hm_allergy_type` AS `hat` ON `hat`.`Allergy_Type_id`=`hmpa`.`Allergy_Type_id` WHERE `Patient_id`=?";
		
        if(connection) {
            var query =connection.query(sqlStatement,[patientId],function(err,result) {
                if(err){
					//throw err;
					console.log(err);
                    var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientAllergies');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				} else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    updatePatientSeverity : function(data, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "UPDATE `hm_severity` SET `HBFlag`='"+data.HBFlag+"', `HBValue`='"+data.HBValue+"', `BPSysFlag`='"+data.BPSysFlag+"', `BPSysValue`='"+data.BPSysValue+"', `BPDiaFlag`='"+data.BPDiaFlag+"', `BPDiaValue`='"+data.BPDiaValue+"', `BPPulseFlag`='"+data.BPPulseFlag+"', `BPPulseValue`='"+data.BPPulseValue+"', `WeightFlag`='"+data.WeightFlag+"', `WeightValue`='"+data.WeightValue+"', `OxyPulseFlag`='"+data.OxyPulseFlag+"', `OxyPulseValue`='"+data.OxyPulseValue+"', `OxiSpO2Flag`='"+data.OxiSpO2Flag+"', `OxiPulseO2Value`='"+data.OxiPulseO2Value+"', `OverallFlag`='"+data.OverallFlag+"', `OverAllStatus`='"+data.OverAllStatus+"', `ExaminationDate`='"+data.ExaminationDate+"' WHERE `Patient_id`='"+data.Patient_id+"'";

        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'updatePatientSeverity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                    
                    callback({status: 'success'});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
}
module.exports = patientFamilyInfoDao;