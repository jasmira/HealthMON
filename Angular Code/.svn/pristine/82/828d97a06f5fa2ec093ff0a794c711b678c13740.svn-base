var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var jwt= require('jsonwebtoken');

var express = require("express");
var router = express.Router();

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

router.get("/getHmGender",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmGender(
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmPrograms",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmPrograms(
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmProgramDetails/:programId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmProgramDetails(req.params.programId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmCountry",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmCountry(
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmCastCategory",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmCastCategory(
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmStates/:countryId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmStates(req.params.countryId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmDistricts/:countryId/:stateId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmDistricts(req.params.countryId,req.params.stateId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmCities/:countryId/:stateId/:districtId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmCities(req.params.countryId,req.params.stateId,req.params.districtId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmPincode/:countryId/:stateId/:districtId/:cityId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmPincode(req.params.countryId,req.params.stateId,req.params.districtId,req.params.cityId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getHmVillages/:countryId/:stateId/:districtId/:cityId",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmVillages(req.params.countryId,req.params.stateId,req.params.districtId,req.params.cityId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getDeviceAttributes/:deviceName",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getDeviceAttributes(req.params.deviceName,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getVitalDetails/",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getVitalDetails(function(result){
		   res.json(result);
	   });    
});
router.get("/getHmIdentityCards",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmIdentityCards(
	   function(result){
		   res.json(result);
	   });    
});
router.get("/getHmDrugsInfo",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmDrugsInfo(
	   function(result){
		   res.json(result);
	   });    
});
router.get("/getHmInvestigationtestInfo",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmInvestigationtestInfo(
	   function(result){
		   res.json(result);
	   });    
});
router.get("/getHmDiagnosisInfo",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmDiagnosisInfo(
	   function(result){
		   res.json(result);
	   });    
});
router.get("/getHmProceduresInfo",function(req, res){
		
	var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');
	masterTableDaoObj.getHmProceduresInfo(
	   function(result){
		   res.json(result);
	   });    
});
module.exports = router;