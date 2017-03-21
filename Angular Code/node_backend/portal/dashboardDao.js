var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoPortal+'dashboardDao.js';

var dashboardDao = {
    
    getPatientsHbStatus : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM  `hm_patients_device_reading` t1 WHERE t1.Created_Date = (SELECT MAX(t2.Created_Date) FROM `hm_patients_device_reading` t2 WHERE t2.Patient_id = t1.Patient_id) AND Devices_id = 4 AND t1.Created_Date BETWEEN DATE(?) AND DATE(?)";

        if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsHbStatus');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {     
					//console.log(query);                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getPatientsHbStatusForVillage : function(villageId, fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT t1.*, hm_p.Village_id FROM `hm_patients_device_reading` t1 , `hm_patient` hm_p WHERE t1.Patient_id = hm_p.Patient_id AND hm_p.Village_id=? AND t1.Devices_id = 4 AND t1.Created_Date BETWEEN DATE(?) AND DATE(?) AND t1.Created_Date = ( SELECT MAX(t2.Created_Date) FROM `hm_patients_device_reading` t2 WHERE t2.Patient_id = t1.Patient_id )";

        if(connection){
           var query = connection.query(sqlStatement, [villageId, fromDate, toDate], function(err,result){
                if(err){
					
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsHbStatusForVillage');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {     
					           
                    callback(result);
				}
            });
			
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getAllVillagesForPatientsHbStatus : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT DISTINCT hm_p.village_id as village ,hmv.village_name as villageName FROM `hm_patients_device_reading` t1 , `hm_patient` hm_p , hm_villages hmv WHERE t1.Patient_id = hm_p.Patient_id AND hm_p.Village_id=hmv.Village_id AND t1.Devices_id = 4 AND t1.Created_Date BETWEEN DATE(?) AND DATE(?) AND t1.Created_Date = ( SELECT MAX(t2.Created_Date) FROM `hm_patients_device_reading` t2 WHERE t2.Patient_id = t1.Patient_id )";

        if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
					
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAllVillagesForPatientsHbStatus');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {     
					                
                    callback(result);
				}
            });
			
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    getPatientsEDDForDuration : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT MONTH(`Program_item_value`) as eddMonth, COUNT(*) as totalPatients FROM `hm_program_details_transactions` WHERE  	Program_item_id = 2 AND Program_item_value BETWEEN DATE(?) AND DATE(?) GROUP BY MONTH(`Program_item_value`)";
 
        if(connection){
           var query = connection.query(sqlStatement,[fromDate, toDate],function(err,result){
                if(err){
					
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsEDDForDuration');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
				
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getPatientsEDDPerVillage : function(villageId, fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT MONTH(`Program_item_value`) as eddMonth,  COUNT(*) as totalPatients FROM `hm_program_details_transactions` hm_pdt, `hm_patient` hm_p WHERE hm_pdt.Patient_id = hm_p.Patient_id AND Program_item_id = 2 AND hm_p.Village_id=? AND Program_item_value BETWEEN DATE(?) AND DATE(?) GROUP BY MONTH(`Program_item_value`)";
 
        if(connection){
           var query = connection.query(sqlStatement,[villageId, fromDate, toDate],function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsEDDPerVillage');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
				
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getAllVillagesOfEDDPatients : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT DISTINCT hm_p.village_id as village ,hmv.village_name as villageName FROM `hm_program_details_transactions` hm_pdt, `hm_patient` hm_p  join hm_villages hmv on hm_p.Village_id=hmv.Village_id WHERE hm_pdt.Patient_id = hm_p.Patient_id AND Program_item_id = 2 AND Program_item_value BETWEEN DATE(?) AND DATE(?) GROUP BY MONTH(`Program_item_value`)";
 
        if(connection){
           var query = connection.query(sqlStatement,[fromDate, toDate],function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAllVillagesOfEDDPatients');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getAppointments : function(userId,callback){
        var connection = connectionProvider.getMysqlConnection();
        //var sqlStatement = "SELECT CONCAT( b.firstName, ' ', b.middleName, ' ', b.lastName ) AS HM_Patient_name, b.tal AS HM_Patient_taluka,b.patient_image as patient_image, a . *, DATE_FORMAT( `appointment_date_time` , '%e-%M, %Y, %h:%i %p' ) as appntDateTime FROM patient_personal_info b, hm_appointments a WHERE a.HM_User_id =? AND a.HM_Patient_id = b.patient_id and DATE(`appointment_date_time`)= CURDATE() order by appointment_date_time";
		var sqlStatement = "SELECT CONCAT( b.Patient_FName, ' ', b.Patient_MName, ' ', b.Patient_LName ) AS HM_Patient_name, c.City_name AS HM_Patient_taluka,b.Patient_Image as patient_image, a.*, DATE_FORMAT( `Appointment_Date` , '%e-%M, %Y, %h:%i %p' ) as appntDateTime,d.OverallFlag as patient_severity ,d.OverAllStatus as OverAllStatus,e.Program_item_value as lmpDate FROM hm_patient b, hm_appointments a, hm_city c,hm_severity d,hm_program_details_transactions e WHERE a.User_id =? AND a.Patient_id = b.patient_id and b.City_id =c.City_id and a.Patient_id = d.patient_id and a.Patient_id = e.patient_id and e.Program_item_id =1 and DATE(`Appointment_Date`)= CURDATE() order by Appointment_Date";
        if(connection){
           var query = connection.query(sqlStatement,userId,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAppointments');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	setAppointmentAccepted : function(appointmentId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "UPDATE hm_appointments SET AcceptedFlag = '1' WHERE Appointment_id = ? ";

        if(connection){
           var query = connection.query(sqlStatement,appointmentId,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'setAppointmentAccepted');
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

    getPatientsEnrollmentData : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
       // var sqlStatement = "SELECT  MONTH(`Created_Date`) as enrollmentMonth, COUNT(*) as totalPatients,village_id as village FROM `hm_patient` WHERE `Created_Date` BETWEEN ? AND ? GROUP BY MONTH(`Created_Date`)";
		var sqlStatement = "SELECT  count(hmp.village_id) as totalPatients, hmp.village_id as village ,hmv.village_name as villageName FROM hm_patient as hmp join hm_villages hmv on  hmp.Village_id=hmv.Village_id WHERE hmp.Created_Date BETWEEN ? AND ?  GROUP BY (hmp.village_id)";
		
		if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsEnrollmentData');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {   
                     callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getPatientsEnrollmentDataForVillage : function(fromDate, toDate, villageid, callback){
        var connection = connectionProvider.getMysqlConnection();
       
		var sqlStatement = "SELECT count(hmp.village_id) as totalPatients, hmp.village_id as village ,hmv.village_name as villageName FROM hm_patient as hmp join hm_villages hmv on hmp.Village_id=hmv.Village_id WHERE hmp.Created_Date BETWEEN ? AND ? GROUP BY (hmp.village_id) HAVING hmp.village_id=?";
		
		if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate, villageid], function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientsEnrollmentDataForVillage');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {   
                     callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getAllVillagesOfEnrolledPatients : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
       
		var sqlStatement = "SELECT DISTINCT hmp.village_id as village ,hmv.village_name as villageName FROM hm_patient as hmp join hm_villages hmv on hmp.Village_id=hmv.Village_id WHERE hmp.Created_Date BETWEEN ? AND ? GROUP BY (hmp.village_id)";
		
		if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAllVillagesOfEnrolledPatients');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {   
                     callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getHighRiskPatients : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT OverallFlag, count(*) AS totalPatients FROM `hm_severity` WHERE ExaminationDate BETWEEN ? AND ? GROUP BY OverallFlag";

        if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHighRiskPatients');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getHighRiskPatientsForVillage : function(villageId, fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT hms.OverallFlag, count(*) AS totalPatients FROM `hm_severity`as hms, `hm_patient` as hmp WHERE hms.Patient_id = hmp.Patient_id AND hmp.Village_id=? AND hms.ExaminationDate BETWEEN ? AND ? GROUP BY hms.OverallFlag";

        if(connection){
           var query = connection.query(sqlStatement, [villageId, fromDate, toDate], function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHighRiskPatientsForVillage');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getAllVillagesForHighRiskPatients : function(fromDate, toDate, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT DISTINCT hm_p.village_id as village ,hmv.village_name as villageName FROM `hm_severity`as hms, `hm_patient` hm_p  join hm_villages hmv on hm_p.Village_id=hmv.Village_id WHERE hms.Patient_id = hm_p.Patient_id AND hms.ExaminationDate BETWEEN ? AND ? GROUP BY hms.OverallFlag";

        if(connection){
           var query = connection.query(sqlStatement, [fromDate, toDate], function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAllVillagesForHighRiskPatients');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
	getPatientVisitHistory : function(patientId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT DATE_FORMAT( `Appointment_Date` , '%e-%M, %Y, %h:%i %p' ) as appntDateTime,(select b.User_Name from hm_user_details b where b.User_id = a.User_id) as investigator,(select c.User_Name from hm_user_details c where c.User_id = a.Created_By) as ASHA_ANM_NAME,(select d.Patient_Contact from hm_patient d where d.Patient_id = a.Patient_id) as contact,(SELECT e. `PHC_NAME` FROM `hm_phc` e WHERE e.`PHC_ID`=(select f.PHC_ID from hm_phc_user f where f.User_id = a.User_id)) as place, (SELECT g.Actor_desc FROM `hm_actor` g WHERE g.`Actor_id` = (select h.Actor_id from hm_user_actor h where h.User_id = a.Created_By)) as createdByRole from  hm_appointments a WHERE a.Patient_id = ? order by Appointment_Date";
        if(connection){
           var query = connection.query(sqlStatement,patientId,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPatientVisitHistory');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
}
module.exports = dashboardDao;