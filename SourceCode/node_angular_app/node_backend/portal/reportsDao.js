var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoPortal+'reportsDao.js';

var reportsDao = {
    getAnemiaPatientTrends : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT a.Patient_id, a.Pname as Patient, b.Device_Attributes_value as HB_Value,c.Program_item_value as EDD, a.Created_Date FROM ( SELECT hp.Patient_id, hp.Village_id, COncat(Patient_FName,' ',Patient_MName,' ',Patient_LName) Pname, hp.Created_Date FROM hm_patient hp WHERE hp.Village_id IN (SELECT `Village_id` FROM `hm_phcdetails` WHERE `PHC_ID` = 1) ) a LEFT JOIN ( SELECT DISTINCT t1.Patient_id, Device_Attributes_value , t1.Created_Date FROM `hm_patients_device_reading` t1 WHERE t1.Devices_id = 4 AND t1.Created_Date = ( SELECT MAX(t2.Created_Date) FROM `hm_patients_device_reading` t2 WHERE t2.Patient_id = t1.Patient_id ) ) b ON b.Patient_id = a.Patient_id LEFT JOIN ( SELECT `Patient_id`, `Program_item_value` FROM `hm_program_details_transactions` WHERE Program_item_id = 2 ) c on b.Patient_id = c.Patient_id";
        if(connection){
           var query = connection.query(sqlStatement, function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getAnemiaPatientTrends');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                  
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
    getPHCNameAndAddress : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT hm_phc.phc_name, CONCAT(hm_villages.Village_Name,', ', hm_city.City_name,', ', hm_states.State_NM,', ', hm_country.Country_NM,'.') as phc_address FROM hm_phc JOIN hm_villages ON hm_villages.Village_id = hm_phc.SelfLocationVillage JOIN hm_city ON hm_city.City_id = hm_villages.`City_id` JOIN hm_states ON hm_states.State_id = hm_city.`State_id` JOIN hm_country ON hm_country.Country_ID = hm_states.Country_ID";
        if(connection){
           var query = connection.query(sqlStatement, function(err,result){
                if(err){
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getPHCNameAndAddress');
                    logger.log('node','error',errorMsg);
					callback({status: 'fail'});
				}else {                  
                    callback(result);
				}
            });
			connectionProvider.closeMysqlConnection(connection);
        }
    },
    
}
module.exports = reportsDao;