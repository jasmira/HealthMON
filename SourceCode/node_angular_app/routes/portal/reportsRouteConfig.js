var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var commonFunctions = require(rootPath+env.paths.utils+"commonFunctions.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var express = require("express");
var router = express.Router();
var jwt= require('jsonwebtoken');


router.use(function(req, res, next) {
    // check header or url parameters or post parameters for token
     
    var token =req.get('Authorization');
    var connection = connectionProvider.getMysqlConnection();
    // decode token
 
    if (token) {

    // verifies secret and checks exp
    jwt.verify(token,'secret', function(err, decoded) {      
        if (err) {
        console.log('error...'+err);
       // return res.json({ success: false, message: 'Failed to authenticate token.' }); 
             return res.status(498).send({ 
              success: false, 
              message: 'Failed to authenticate token.' 
              });
        } else {
        // if everything is good, save to request for use in other routes
        
        connection.query('select * from hm_user_token where Token_id='+decoded['Token_id'],
                     function(err,rows,fields){
          
        if(err){
            return res.json({ success: false, message: 'Failed to authenticate token.' }); 
         }
       
         if(rows.length>0){
            req.token = decoded;   
             next();
        }
        else 
            return res.json({ success: false, message: 'Failed to authenticate token.' }); 
        }); 
        connectionProvider.closeMysqlConnection(connection);  
        
        }
    });

    } else {

    // if there is no token
    // return an error
    return res.status(403).send({ 
        success: false, 
        message: 'No token provided.' 
    });
    res.redirect('/');
  }
});


router.get("/getAnemiaPatientTrends",function(req, res){
	var reportsDaoObj = require(env.paths.root+env.paths.daoPortal+'reportsDao.js');
	reportsDaoObj.getAnemiaPatientTrends(function(result){
		   res.json(result);
	   });    
});

router.get("/getPHCNameAndAddress",function(req, res){
	var reportsDaoObj = require(env.paths.root+env.paths.daoPortal+'reportsDao.js');
	reportsDaoObj.getPHCNameAndAddress(function(result){
		   res.json(result);
	   });    
});
module.exports = router;