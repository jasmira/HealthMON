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

router.get("/getCalendarActivities/:userId",function(req, res){
		
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
	calendarDaoObj.getCalendarActivities(req.params.userId,
	   function(result){
		   res.json(result);
	   });    
});
router.post("/deleteSelfSchedule",function(req, res){
		
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
	calendarDaoObj.deleteSelfActivity(req.body.eventID,
	   function(result){
		   res.json(result);
	   });    
});
router.post("/addEditSelfSchedule",function(req, res){
		
	var data = req.body;
	
	if(data.EventID > 0) {
		
		var editSelfActivityData = {
                    User_Task_Name : data.Title,
                    User_Task_Description : data.Description,
                    User_task_Venue   : data.Venue,
                    User_start_time   : data.StartAt, 
                    User_end_time    : data.EndAt,
                    User_Reminder_interval : data.ReminderInterval,
                    All_Day   : data.allDayEvent,
                    Set_Reminder   : data.setReminder
                };
	
		var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
		calendarDaoObj.editSelfActivity(editSelfActivityData,data.EventID,
		   function(result){
			   res.json(result);
		   });  
	} else {
		
		var addSelfActivityData = [data.userId,data.Title,data.Description,'activity',data.Venue,data.StartAt,data.EndAt,data.ReminderInterval,data.allDayEvent,data.setReminder,data.userId,data.currentdate,data.programId];
       	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
		calendarDaoObj.addSelfActivity(addSelfActivityData,
		   function(result){
			   res.json(result);
		   });  
	}
	
});

router.post("/addInvites",function(req, res){
		
	var data = req.body;
	//console.log(data);
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
		calendarDaoObj.checkEventOverlapping(data.selectedUsers[0],data.start,data.end,
		    function(result){
				if(result[0].cnt>0){
					res.json({'message':'Cannot send invite as you have a confilcting appointment.'});
					//console.log("record found"+result[0].cnt);
				}else{
					var addInviteData = [];
					for (var i = 0; i < data.selectedUsers.length; i++) {
						var userId = data.selectedUsers[i];
						var programId = data.usersProgramIds[i]; 
						//console.log(i+ "---"+ programId);
						var singleArray = [userId,data.subject,data.message,'activity',data.venue,data.start,data.end,data.ReminderInterval,data.allDayBooked,data.setReminder,data.Created_by,data.Created_Date,programId,data.User_Task_Date];
						addInviteData.push(singleArray);
					}
					//console.log("addInviteData======"+addInviteData);	
					//console.log(" no record found"+result[0].cnt);
					calendarDaoObj.addInvites(addInviteData,
						function(result1){
							if(result1.status){
								res.json({'message':'Record saved successfully.'});
							}else{
								res.json({'message':'There is some error in saving record please try again.'});
							}
						});
				}
			});
	
});
router.post("/addSelfSchedule",function(req, res){
		
	var data = req.body;
	//console.log(data);
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
		calendarDaoObj.checkEventOverlapping(data.userId,data.start,data.end,
		    function(result){
				if(result[0].cnt>0){
					res.json({'message':'Cannot save self activity you have a confilcting appointment.','status':'app_exists'});
					//console.log("record found"+result[0].cnt);
				}else{
					var addSelfActivityData = [data.userId,data.subject,data.message,'activity',data.venue,data.start,data.end,data.ReminderInterval,data.allDayBooked,data.setReminder,data.Created_by,data.Created_Date,data.programId];
					var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
					calendarDaoObj.addSelfActivity(addSelfActivityData,
					    function(result1){
							if(result1.status){
								res.json({'message':'Record saved successfully.','status':'success'});
							}else{
								res.json({'message':'There is some error in saving record please try again.','status':'fail'});
							}
						}); 
				}
			});
	
});
router.post("/addPushActivity",function(req, res){
		
	var data = req.body;
	//console.log(data);
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
	var addaddPushActivityData = [];
	for (var i = 0; i < data.selectedUsers.length; i++) {
		var userId = data.selectedUsers[i];
		var programId = data.usersProgramIds[i]; 
		//console.log(i+ "---"+ programId);
		var singleArray = [userId,data.subject,data.message,'myactivity',data.venue,data.start,data.end,data.ReminderInterval,data.allDayBooked,data.setReminder,data.Created_by,data.Created_Date,programId,data.User_Task_Date];
		addaddPushActivityData.push(singleArray);
	}
	//console.log("addInviteData======"+addInviteData);	
	//console.log(" no record found"+result[0].cnt);
	calendarDaoObj.addPushActivity(addaddPushActivityData,
		function(result1){
			if(result1.status){
				res.json({'message':'Record saved successfully.'});
			}else{
				res.json({'message':'There is some error in saving record please try again.'});
			}
		});
				
			
	
});
router.get("/getUsersProgramId/:userId",function(req, res){
		
	var calendarDaoObj = require(env.paths.root+env.paths.daoPortal+'calendarDao.js');
	calendarDaoObj.getUsersProgramId(req.params.userId,
	   function(result){
		   res.json(result);
	   });    
});

module.exports = router;