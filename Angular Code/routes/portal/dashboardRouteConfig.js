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

router.get("/getPatientsHbStatus/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getPatientsHbStatus(req.params.fromDate, req.params.toDate,
	   function(result){
           var patientHbGroups = Array();
           var normalGroup = Array();
           var moderateGroup = Array();
           var severeGroup = Array();
           var normal = 0;
           var moderate = 0;
           var severe = 0;
            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                   if((result[i].Device_Attributes_value >= 11) && (result[i].Device_Attributes_value <= 15)) {
                      normal++;
                   }else if((result[i].Device_Attributes_value >= 8) && (result[i].Device_Attributes_value <= 11)) {
                       moderate++;
                   }else {
                       severe++;
                   }
                }
                if(normal > 0) normalGroup.push('normal', normal);
                if(moderate > 0) moderateGroup.push('moderate', moderate);
                if(severe > 0) severeGroup.push('severe', severe);

                patientHbGroups.push(normalGroup, moderateGroup, severeGroup);
            }
           res.json(patientHbGroups);
	   });    
});

router.get("/getPatientsHbStatusForVillage/:villageId/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getPatientsHbStatusForVillage(req.params.villageId, req.params.fromDate, req.params.toDate,
	   function(result){
           var patientHbGroups = Array();
           var normalGroup = Array();
           var moderateGroup = Array();
           var severeGroup = Array();
           var normal = 0;
           var moderate = 0;
           var severe = 0;
            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                   if((result[i].Device_Attributes_value >= 11) && (result[i].Device_Attributes_value <= 15)) {
                      normal++;
                   }else if((result[i].Device_Attributes_value >= 8) && (result[i].Device_Attributes_value <= 11)) {
                       moderate++;
                   }else {
                       severe++;
                   }
                }
                if(normal > 0) normalGroup.push('normal', normal);
                if(moderate > 0) moderateGroup.push('moderate', moderate);
                if(severe > 0) severeGroup.push('severe', severe);

                patientHbGroups.push(normalGroup, moderateGroup, severeGroup);
            }
           res.json(patientHbGroups);
	   });    
});

router.get("/getAllVillagesForPatientsHbStatus/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getAllVillagesForPatientsHbStatus(req.params.fromDate, req.params.toDate,
	   function(result){
            res.json(result);
	   });
});

router.get("/getPatientsEDDForDuration/:fromDate/:toDate",function(req, res){ // returns data in format EDD month => number of patients
		//console.log("getPatientsEDDForDuration" +req.params.fromDate + req.params.toDate);
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getPatientsEDDForDuration(req.params.fromDate, req.params.toDate,
	   function(result){
	  // console.log("here " +result);
            var monthNames = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
            var finalResult = Array();
            var eddData = Array();
            var countData = Array();

            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                    eddData.push(monthNames[result[i]['eddMonth'] - 1]);
                    countData.push(result[i]['totalPatients']);
                }
                if(countData.length > 0) {// in case of mysql error, result is not empty but no data is there, so this additional check
                    countData.unshift('EDD count');
                    finalResult.push(eddData,countData);
                }
            }
		    res.json(finalResult);
	   });    
});

router.get("/getPatientsEDDPerVillage/:villageId/:fromDate/:toDate",function(req, res){ 
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getPatientsEDDPerVillage(req.params.villageId, req.params.fromDate, req.params.toDate,
	   function(result){
            var monthNames = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
            var finalResult = Array();
            var eddData = Array();
            var countData = Array();

            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                    eddData.push(monthNames[result[i]['eddMonth'] - 1]);
                    countData.push(result[i]['totalPatients']);
                }
                if(countData.length > 0) {
                    countData.unshift('EDD count');
                    finalResult.push(eddData,countData);
                }
            }
		    res.json(finalResult);
	   });    
});

router.get("/getAllVillagesOfEDDPatients/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getAllVillagesOfEDDPatients(req.params.fromDate, req.params.toDate,
	   function(result){
            res.json(result);
	   });
});

router.get("/getAppointments/:userId",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
	dashboardDaoObj.getAppointments(req.params.userId,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getPatientsEnrollmentData/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    var finalResult = Array();
    //res.json(finalResult);
	dashboardDaoObj.getPatientsEnrollmentData(req.params.fromDate, req.params.toDate,
	   function(result){
	   
          //  var monthNames = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
            var finalResult = Array();
            var enrollmentMonths = Array();
            var patientCount = Array();
			var villages = Array();

            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                    //enrollmentMonths.push(monthNames[result[i]['enrollmentMonth'] - 1]);
                    patientCount.push(result[i]['totalPatients']);
					villages.push("V"+result[i]['village']);
                }
                if(patientCount.length > 0) {// in case of mysql error, result is not empty but no data is there, so this additional check
                    patientCount.unshift('Patients enrolled');
                    finalResult.push(villages,patientCount);
                }
            }
            res.json(finalResult);
	   });
});

router.get("/getPatientsEnrollmentDataForVillage/:fromDate/:toDate/:villageId",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    var finalResult = Array();
	dashboardDaoObj.getPatientsEnrollmentDataForVillage(req.params.fromDate, req.params.toDate, req.params.villageId,
	   function(result){
            var finalResult = Array();
            var enrollmentMonths = Array();
            var patientCount = Array();
			var villages = Array();

            if(!commonFunctions.isObjEmpty(result)) {
                for (var i = 0; i < result.length; i++) {
                    patientCount.push(result[i]['totalPatients']);
					villages.push(result[i]['villageName']);
                }
                if(patientCount.length > 0) {
                    patientCount.unshift('Patients enrolled');
                    finalResult.push(villages,patientCount);
                }
            }
            res.json(finalResult);
	   });
});

router.get("/getAllVillagesOfEnrolledPatients/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    var finalResult = Array();
	dashboardDaoObj.getAllVillagesOfEnrolledPatients(req.params.fromDate, req.params.toDate,
	   function(result){
            res.json(result);
	   });
});

router.get("/getHighRiskPatients/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    dashboardDaoObj.getHighRiskPatients(req.params.fromDate, req.params.toDate,
	   function(result){
		   res.json(result);
	   });
});

router.get("/getHighRiskPatientsForVillage/:villageId/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    dashboardDaoObj.getHighRiskPatientsForVillage(req.params.villageId, req.params.fromDate, req.params.toDate,
	   function(result){
		   res.json(result);
	   });
});

router.get("/getAllVillagesForHighRiskPatients/:fromDate/:toDate",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    dashboardDaoObj.getAllVillagesForHighRiskPatients(req.params.fromDate, req.params.toDate,
	   function(result){
		   res.json(result);
	   });
});

router.get("/getPatientVisitHistory/:patientId",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    dashboardDaoObj.getPatientVisitHistory(req.params.patientId,
	   function(result){
		   res.json(result);
	   });
});
router.post("/setAppointmentAccepted/:appointmentId",function(req, res){
		
	var dashboardDaoObj = require(env.paths.root+env.paths.daoPortal+'dashboardDao.js');
    dashboardDaoObj.setAppointmentAccepted(req.params.appointmentId,
	   function(result){
		   res.json(result);
	   });
});
module.exports = router;