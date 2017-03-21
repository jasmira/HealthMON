var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var express = require("express");
var bodyparser = require('body-parser');
var jwt= require('jsonwebtoken');
var cron = require('node-cron');

var router = express.Router();
router.use(bodyparser.urlencoded({extended : true}));
router.use(bodyparser.json());

cron.schedule('0 59 23 * * *', function(){
    var connection = connectionProvider.getMysqlConnection();
    var sqlStatement = "UPDATE `hm_user_tasks` SET `Task_Viewed` = '2' WHERE `Task_Viewed` = 1 AND `User_Task_Type` = 'notification'";
    
    if(connection){
           var query = connection.query(sqlStatement,function(err,result){
                if(err){
					console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
                    errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'UpdateNotificationStatusByCron');
                    logger.log('node','error',errorMsg);
                    connectionProvider.closeMysqlConnection(connection);
					callback(result);
				}else {         
                    connectionProvider.closeMysqlConnection(connection);
				}
            });                                                     
        }  
});
module.exports = router;