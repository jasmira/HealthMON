var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var commonFunctions = require(rootPath+env.paths.utils+"commonFunctions.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var userDaoObj = require(env.paths.root+env.paths.daoApp+'userDao.js');
var express = require("express");
var bodyparser = require('body-parser');
var jwt= require('jsonwebtoken');

var router = express.Router();
router.use(bodyparser.urlencoded({extended : true}));
router.use(bodyparser.json());

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

router.get("/getHmTaskAlerts/:userId",function(req, res){
	
   // console.log('token information username... '+req.token.username);
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getHmTaskAlerts(req.params.userId,
	   function(result){
        
            for (var i = 0; i < result.length; i++) {
                // convert date string to date format mm/dd/YYYY
                var finalDate = commonFunctions.convertDate(result[i].User_Task_Date);
                var timeFromTaskCreation = commonFunctions.convertDate(result[i].Created_Date);

                // 1. calculate difference in task date and current date
                // 2. identify if task date is past, today or future
                var taskDateInfo = commonFunctions.calculateDateDiff(finalDate);
                 var timeFromTaskCreation1 = commonFunctions.calculateDateDiff(timeFromTaskCreation);

                // add all information related to task date
                //result[i]['Modified_User_Task_Date'] = Array();
                //result[i]['Modified_User_Task_Date'].push({'diffInDays' : taskDateInfo['diffInDays'],  
                //'isPastDate' : 
                 //taskDateInfo['pastDate'],  
                 //'isFutureDate' : taskDateInfo['futureDate'], 'isToday' : taskDateInfo['todayDate']});
                result[i]['Modified_User_Task_Date'] = new Object();
                result[i]['Modified_User_Task_Date'] = {'diffInDays' : taskDateInfo['diffInDays'], 
                                                        'isPastDate' : 
                                                        taskDateInfo['pastDate'], 'isFutureDate' :  
                                                        taskDateInfo['futureDate'], 'isToday' :  
                                                        taskDateInfo['todayDate'],
                                                       'hoursFromTaskCreation' :  
                                                        timeFromTaskCreation1['hoursFromTaskCreation'],
                                                        'daysFromTaskCreation' : 
                                                        timeFromTaskCreation1['daysFromTaskCreation']};
                
            }
        	
            res.json(result);
	   });    
});


router.get("/getMOTaskAlertsNotifications/:userId",function(req, res){
    
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getMOTaskAlertsNotifications(req.params.userId,
	   function(result){
        
            for (var i = 0; i < result.length; i++) {
                // convert date string to date format mm/dd/YYYY
                var finalDate = commonFunctions.convertDate(result[i].User_Task_Date);
                var timeFromTaskCreation = commonFunctions.convertDate(result[i].Created_Date);

                // 1. calculate difference in task date and current date
                // 2. identify if task date is past, today or future
                var taskDateInfo = commonFunctions.calculateDateDiff(finalDate);
                 var timeFromTaskCreation1 = commonFunctions.calculateDateDiff(timeFromTaskCreation);

                // add all information related to task date
                //result[i]['Modified_User_Task_Date'] = Array();
                //result[i]['Modified_User_Task_Date'].push({'diffInDays' : taskDateInfo['diffInDays'],  
                //'isPastDate' : 
                 //taskDateInfo['pastDate'],  
                 //'isFutureDate' : taskDateInfo['futureDate'], 'isToday' : taskDateInfo['todayDate']});
                /*result[i]['task_id']=result[i].User_Tasks_Id;
                console.log(result);*/
                result[i]['Modified_User_Task_Date'] = new Object();
                result[i]['Modified_User_Task_Date'] = {'diffInDays' : taskDateInfo['diffInDays'], 
                                                        'isPastDate' : 
                                                        taskDateInfo['pastDate'], 'isFutureDate' :  
                                                        taskDateInfo['futureDate'], 'isToday' :  
                                                        taskDateInfo['todayDate'],
                                                       'hoursFromTaskCreation' :  
                                                        timeFromTaskCreation1['hoursFromTaskCreation'],
                                                        'daysFromTaskCreation' : 
                                                        timeFromTaskCreation1['daysFromTaskCreation']};
                
            }
        	
            res.json(result);
	   });    
});


router.get("/getUserProfileInfo/:userId",function(req, res){
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	  commonApisDaoObj.getUserProfileInfo(req.params.userId,function(result){
	    res.send(result);
    });
});

router.get("/getPatientList/:userId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getPatientList(req.params.userId,function(result){
	   
	   res.send(result);
    });
});

router.get("/getReferredPatientList/:userId",function(req, res){  
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getReferredPatientList(req.params.userId,function(result){
	   
	   res.send(result);
    });
});

router.get("/getUserList",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getUserList(function(result){
	   
	   res.send(result);
    });
});

router.get("/getAshaAnmUserList",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getAshaAnmUserList(function(result){
	   
	   res.send(result);
    });
});
router.get("/getMoUserList",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getMoUserList(function(result){
	   
	   res.send(result);
    });
});

router.get("/getPatientCareplan/:patientId",function(req, res){
    
    var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.getPatientCareplan(req.params.patientId,function(result){
	 res.send(result);
    });
});
router.get("/getAllPatientsMedicationInfo",function(req, res){
   
    var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.getAllPatientsMedicationInfo(function(result){
	 res.send(result);
    });
});

router.get("/getCareplanTemplate/:Template_Name/",function(req, res){
     
   var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.getCareplanTemplate(req.params.Template_Name,function(result){
	 res.send(result);
    });
    
});

router.get("/getAllCareplanTemplates/",function(req, res){
     
   var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.getAllCareplanTemplates(function(result){
	 res.send(result);
    });
    
});

router.post("/setPatientCareplan/:patientId/",function(req, res){
      var data = req.body;
   
     var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.setPatientCareplan(req.params.patientId,data,function(result){
	 res.send(result);
    });
    
});
router.post("/setMedicationGivenBy/",function(req, res){
      var data = req.body;
     var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
        commonApisDaoObj.setMedicationGivenBy(data,function(result){
	    res.send(result);
    });
    
});

router.get("/getTasksAccordingTocategory/:Category_Desc",function(req, res){
    
    var commonApisDaoObj=require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    commonApisDaoObj.getTasksAccordingTocategory(req.params.Category_Desc,function(result){
	    res.send(result);
    });
    
});

router.get("/getLearningContents/:userType/:userId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getLearningContents(req.params.userType, req.params.userId, function(result){
	   
	   res.send(result);
    });
});

router.get("/getMyActivities/:userId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getMyActivities(req.params.userId,function(result){
	    res.send(result);
    });
});

router.post("/addMyActivities",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var MyActivities = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addMyActivities(MyActivities,function(result){
	    res.send(result);
    });
});
router.post("/editMyActivity",function(req, res){  
    	
    var data = req.body;
	var dataArray = data[0].split(",");
	//console.log(dataArray);
	var Andriod_User_Tasks_id = dataArray[0];
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	var editMyActivityData = {
                  	Task_Status:dataArray[1]
              }
	/*var editMyActivityData = {
				User_Task_Name : data.activityName,
				User_Task_Description : data.comments,
				User_Task_Date   : data.taskDate,
				Created_Date   : data.taskCreatedDate, 
				Set_Reminder    : data.SetReminder,
				User_Reminder_interval : data.reminderInterval,
				Created_by:createdBy,
				Task_Status:taskStatus
			   };*/
    commonApisDaoObj.editMyActivity(editMyActivityData,Andriod_User_Tasks_id,function(result){
	    res.send(result);
    });
});

router.get("/setAndriodUserTasksid/:Andriod_User_Tasks_id/:User_Tasks_id",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.setAndriodUserTasksid(req.params.Andriod_User_Tasks_id,req.params.User_Tasks_id,function(result){
	    res.send(result);
    });
});

router.get("/setTaskViewedForHMUserTasks/:User_Tasks_id",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.setTaskViewedForHMUserTasks(req.params.User_Tasks_id,function(result){
	    res.send(result);
    });
});

router.post("/addAppointments",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var appointments = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addAppointments(appointments,function(result){
	    res.send(result);
    });
});
router.post("/addMoTaskAlertNotification",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var dataMoTaskAlertNotification = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addMoTaskAlertNotification(dataMoTaskAlertNotification,function(result){
	    res.send(result);
    });
});
router.get("/getActivities/:userId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getActivities(req.params.userId,function(result){
	    res.send(result);
    });
});
router.post("/logout",function(req, res){
    userDaoObj.logout(req.token.id,function(result){
        res.send(result);
    });
});

router.post("/addPatientinvestigationtestData",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var dataPatientinvestigationtest = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addPatientinvestigationtestData(dataPatientinvestigationtest,function(result){
	    res.send(result);
    });
});
router.post("/addPatientdiagnosisData",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var dataPatientdiagnosis = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addPatientdiagnosisData(dataPatientdiagnosis,function(result){
	    res.send(result);
    });
});
router.post("/addPatientprocedureData",function(req, res){  
    	
    var data = req.body;
    var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
    var dataPatientprocedure = commonFunctions.multiInsert(data,1);
    commonApisDaoObj.addPatientprocedureData(dataPatientprocedure,function(result){
	    res.send(result);
    });
});
router.get("/getPatientMedications/:patientId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getPatientMedications(req.params.patientId,function(result){
	    res.send(result);
    });
});
router.get("/getPatientdiagnosis/:patientId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getPatientdiagnosis(req.params.patientId,function(result){
	    res.send(result);
    });
});
router.get("/getPatientinvestigationtest/:patientId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getPatientinvestigationtest(req.params.patientId,function(result){
	    res.send(result);
    });
});
router.get("/getPatientprocedure/:patientId",function(req, res){  
    	
	var commonApisDaoObj = require(env.paths.root+env.paths.daoCommon+'commonApisDao.js');
	commonApisDaoObj.getPatientprocedure(req.params.patientId,function(result){
	    res.send(result);
    });
});
module.exports = router;

