var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoCommon+'masterTableDao.js';

var masterTableDao = {
    
    getHmGender : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_gender`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmGender');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmPrograms : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_programs`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmPrograms');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmProgramDetails : function(programId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `hmp`.`Programs_id`, `hmp`.`Program_desc`, `hmpd`.`Program_Details_id`, `hmpd`.`Program_item_id`, `hmpd`.`Program_item_name`, `hmpd`.`Program_item_data_type`, `hmpd`.`Created_By` FROM `hm_programs` AS `hmp` JOIN `hm_program_details` AS `hmpd` ON `hmp`.`programs_id` = `hmpd`.`programs_id` WHERE `hmp`.`Programs_id`=?";

        if(connection){
           var query = connection.query(sqlStatement,[programId],function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmProgramDetails');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmCountry : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_Country`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmCountry');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmCastCategory : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "Select * from `HM_Cast_Category`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmCastCategory');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmStates : function(countryId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_States`";
        
        if(countryId > 0) {
            var condition = " WHERE `Country_ID` = ?"; // add condition for getting states for specific country
            sqlStatement = sqlStatement.concat(condition);
        }

        if(connection){
           var query = connection.query(sqlStatement,[countryId],function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmStates');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmDistricts : function(countryId,stateId,callback){
        var conditions = Array();
        var queryParams = Array();
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_districts` ";

        if(countryId > 0) {
            conditions.push("`Country_ID` = ?");
            queryParams.push(countryId);
        }

        if(stateId > 0) {
            conditions.push("`State_ID` = ?");
            queryParams.push(stateId);
        }

        if(conditions.length > 0) {
            conditions = conditions.join(" AND ");
            conditions = "WHERE "+conditions;
            sqlStatement = sqlStatement.concat(conditions);
        }

        if(connection){
           var query = connection.query(sqlStatement,queryParams,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmDistricts');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmCities : function(countryId,stateId,districtId,callback){
        var conditions = Array();
        var queryParams = Array();
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_City` ";

        if(countryId > 0) {
            conditions.push("`Country_ID` = ?");
            queryParams.push(countryId);
        }

        if(stateId > 0) {
            conditions.push("`State_ID` = ?");
            queryParams.push(stateId);
        }

        if(districtId > 0) {
            conditions.push("`District_id` = ?");
            queryParams.push(districtId);
        }

        if(conditions.length > 0) {
            conditions = conditions.join(" AND ");
            conditions = "WHERE "+conditions;
            sqlStatement = sqlStatement.concat(conditions);
        }

        if(connection){
           var query = connection.query(sqlStatement,queryParams,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmCities');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmPincode : function(countryId,stateId,districtId,cityId,callback){
        var conditions = Array();
        var queryParams = Array();
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_pincode` ";

        if(countryId > 0) {
            conditions.push("`Country_ID` = ?");
            queryParams.push(countryId);
        }

        if(stateId > 0) {
            conditions.push("`State_ID` = ?");
            queryParams.push(stateId);
        }

        if(districtId > 0) {
            conditions.push("`District_id` = ?");
            queryParams.push(districtId);
        }

        if(cityId > 0) {
            conditions.push("`City_id` = ?");
            queryParams.push(cityId);
        }

        if(conditions.length > 0) {
            conditions = conditions.join(" AND ");
            conditions = "WHERE "+conditions;
            sqlStatement = sqlStatement.concat(conditions);
        }

        if(connection){
           var query = connection.query(sqlStatement,queryParams,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmPincode');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getHmVillages : function(countryId,stateId,districtId,cityId,callback){
        var conditions = Array();
        var queryParams = Array();
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_villages` ";

        if(countryId > 0) {
            conditions.push("Country_ID = ?");
            queryParams.push(countryId);
        }

        if(stateId > 0) {
            conditions.push("State_ID = ?");
            queryParams.push(stateId);
        }

        if(districtId > 0) {
            conditions.push("District_id = ?");
            queryParams.push(districtId);
        }

        if(cityId > 0) {
            conditions.push("City_id = ?");
            queryParams.push(cityId);
        }

        if(conditions.length > 0) {
            conditions = conditions.join(" AND ");
            conditions = "WHERE "+conditions;
            sqlStatement = sqlStatement.concat(conditions);
        }

        if(connection){
           var query = connection.query(sqlStatement,queryParams,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmVillages');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getDeviceAttributes : function(deviceName,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_device_attributes` AS `hmda` JOIN `hm_devices` AS `hmd` ON `hmd`.`Devices_id` = `hmda`.`Devices_id` WHERE `hmd`.`Device_Short_Name` = ?";

        if(connection){
           var query = connection.query(sqlStatement,[deviceName],function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getDeviceAttributes');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

	getVitalDetails : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_vitals`";

        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getVitalDetails');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getHmIdentityCards : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_identity_cards`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmIdentityCards');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getHmDrugsInfo : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_drugmaster`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'hm_drugmaster');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },

    getUserPHCCenterId : function(userId, callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT `PHC_ID` FROM `hm_phc_user` WHERE `User_id` = ?";
        if(connection){
           var query = connection.query(sqlStatement,[userId],function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getUserPHCCenterId');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	getHmInvestigationtestInfo : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_investigationtest`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmInvestigationtestInfo');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	getHmDiagnosisInfo : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_diagnosis`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmDiagnosisInfo');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	getHmProceduresInfo : function(callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM `hm_procedures`";
        if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getHmProceduresInfo');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback(result);
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
}
module.exports = masterTableDao;