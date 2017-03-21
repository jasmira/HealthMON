var mysql = require('mysql');
var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var mysqlConnectionConfig = require('./mysqlConnectionConfig.js');

var mysqlConnectionProvider = {
    
    getMysqlConnection : function () {
        var connection = mysql.createConnection(mysqlConnectionConfig.connectionString.dev);
        connection.connect(function(error){
            if(error){ 
				 console.log(error);
				 var errorMsg = util.inspect(error, {showHidden: false, depth: null});
				 logger.log('node','error',errorMsg);
			}
            //console.log("Connection Successful");
        });
        return connection;
        
    },
    closeMysqlConnection : function (currentConnection) {
        if(currentConnection){
            currentConnection.end(function (error){
                if(error){
					console.log(error);
					var errorMsg = util.inspect(error, {showHidden: false, depth: null});
					logger.log('node','error',errorMsg);
				}
                //console.log("Connection end successfully")
            });
        
        }
        
    }
        
    
};
module.exports = mysqlConnectionProvider;