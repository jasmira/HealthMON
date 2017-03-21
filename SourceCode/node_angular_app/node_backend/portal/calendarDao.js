var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoPortal+'calendarDao.js';

var calendarDao = {
  	getCalendarActivities : function(userId,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "SELECT * FROM hm_user_tasks WHERE User_id =? AND User_Task_Type = 'activity'";

        if(connection){
           var query = connection.query(sqlStatement,userId,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getCalendarActivities');
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
	editSelfActivity : function(data,User_Tasks_id,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "UPDATE hm_user_tasks set ? WHERE User_Tasks_id = ? ";
        if(connection){
           var query = connection.query(sqlStatement,[data,User_Tasks_id], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'editSelfActivity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback({status: true});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	addSelfActivity : function(data,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_user_tasks` (User_id,User_Task_Name,User_Task_Description,User_Task_Type,User_task_Venue,User_start_time,User_end_time,User_Reminder_interval,All_Day,Set_Reminder,Created_by,Created_Date,Programs_id) VALUES (?)";
        if(connection){
           var query = connection.query(sqlStatement,[data], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'addSelfActivity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback({status: true});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	deleteSelfActivity : function(data,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "Delete from `hm_user_tasks` WHERE User_Tasks_id = ?";
        if(connection){
           var query = connection.query(sqlStatement,data,function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'deleteSelfActivity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback({status: true});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	addInvites : function(data,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_user_tasks` (User_id,User_Task_Name,User_Task_Description,User_Task_Type,User_task_Venue,User_start_time,User_end_time,User_Reminder_interval,All_Day,Set_Reminder,Created_by,Created_Date,Programs_id,User_Task_Date) VALUES ? ";
        if(connection){
           var query = connection.query(sqlStatement,[data], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'addInvites');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback({status: true});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	addPushActivity : function(data,callback){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "INSERT INTO `hm_user_tasks` (User_id,User_Task_Name,User_Task_Description,User_Task_Type,User_task_Venue,User_start_time,User_end_time,User_Reminder_interval,All_Day,Set_Reminder,Created_by,Created_Date,Programs_id,User_Task_Date) VALUES ? ";
        if(connection){
           var query = connection.query(sqlStatement,[data], function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'addPushActivity');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback({status: true});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
    },
	checkEventOverlapping : function(userId,startTime,endTime,callback) {
	//console.log(userId+""+startTime+"-----"+endTime);
		var connection = connectionProvider.getMysqlConnection();
		var sqlStatement = "Select count(User_Tasks_id) as cnt from `hm_user_tasks` where User_id ='"+ userId+"' and User_Task_Type='activity' and ((User_start_time <="+"'"+ startTime+"'"+" AND User_end_time >="+"'"+startTime+"'"+") OR (User_start_time <="+" '"+endTime+"'" +"AND User_end_time >="+"'"+endTime+"'"+") OR (User_start_time >="+ "'"+startTime+"'"+" AND User_end_time <="+"'"+endTime+"'"+")) ";
        
		if(connection){
           var query = connection.query(sqlStatement, function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'checkEventOverlapping');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                    
                    callback(result);
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
	},
	getUsersProgramId : function(userId,callback) {
	
		var connection = connectionProvider.getMysqlConnection();
		var sqlStatement = "Select Programs_id from `hm_user_actor` where User_id =?";
        
		if(connection){
           var query = connection.query(sqlStatement,userId, function(err,result){
                if(err){
					//throw err;
                    console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getUsersProgramId');
                    //console.log("errorMsg=================:" + errorMsg);
                    logger.log('node','error',errorMsg);
					callback({status: false});
				}else {                      
                    callback({Programs_id:result[0].Programs_id});
				}
            });
			//console.log(query.sql);
			connectionProvider.closeMysqlConnection(connection);
        }
	}
 
}
module.exports = calendarDao;