var util = require('util');
var path = require('path');
var encrypt=require('crypto');
var jwt= require('jsonwebtoken');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoApp+'userDao.js';

var userDao = {    
    getUser : function(user_name,password,callback) {
        var connection = connectionProvider.getMysqlConnection();
        var encrypt=require('crypto');
		   var hash = encrypt
			.createHash("md5")
			.update(password)
			.digest('hex');	
	    
		var sqlStatement = "select User_id,User_Name,User_Password from hm_user_details where   User_Name=\'"+user_name+"\' and User_Password=\'"+password+"\'";
		if(connection){          
			connection.query(sqlStatement, function(err,rows,fields){
				if(err){
					console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
					errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'getUser');
					logger.log('node','error',errorMsg);
				}                 
			
				if(rows.length>0){
						
					if(rows[0].User_Name.toLowerCase() ==user_name.toLowerCase() && 
                       rows[0].User_Password==password){
						var HM_User_id=rows[0].User_id;
						//var user_role = rows[0].User_role;
						var user={Token_id : Math.random(),User_id: HM_User_id};
						var token=jwt.sign(user,'secret',{
									expiresIn:10800,
									alg : 'HS256',
									'typ': 'jwt'
							});
								
						var connection1 = connectionProvider.getMysqlConnection();
                        if(connection1){
						connection1.query('insert into hm_user_token set ?',user,function(err,rows,fields) {
							if (err) {
								console.log('in error...'+err);
                                connectionProvider.closeMysqlConnection(connection1);
							}
                            else
                                connectionProvider.closeMysqlConnection(connection1);
						});
                      }
						callback({result : {authorized : true, language : 'English', HM_User_id : 
                                            HM_User_id, token : token}});
					} else
						callback({result : {authorized : false}});
				} else
					callback({result : {authorized : false}});
				
			});
			 
			connectionProvider.closeMysqlConnection(connection);
		}
         
    },
    logout : function(tokenId){
        var connection = connectionProvider.getMysqlConnection();
        var sqlStatement = "delete from hm_user_token where Token_id=\'"+tokenId+"\'";
         
        if(connection){          
			connection.query(sqlStatement, function(err,rows,fields){  
				if(err){
					console.log(err);
					var errorMsg = util.inspect(err, {showHidden: false, depth: null});
					errorMsg = logger.concatPathInError(errorMsg, currentFilePath, 'logout');
					logger.log('node','error',errorMsg);
				}                 
            });
            connectionProvider.closeMysqlConnection(connection);
        }
      
    } 
}
module.exports = userDao;