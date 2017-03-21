var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var commonFunctions = require(rootPath+env.paths.utils+"commonFunctions.js");
var _und = require("underscore");
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

router.post("/addPatientPersonalInfo",function(req, res){
		
	var data = req.body;
	var personalInfo = commonFunctions.multiInsert(data,1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.insertPatientpersonalInfo(personalInfo,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getPatientsDetailsList/:createdBy",function(req, res){  
    console.log("getPatientsDetailsList");
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientsDetailsList(req.params.createdBy,
    function(result){
	   res.json(result);
    });    
});

router.get("/getPatientPersonalInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientPersonalInfo(req.params.patientId,
    function(result){
	   res.json(result);
    });    
});

router.post("/addPatientFamilyInfo",function(req, res){

	var data = req.body;
	var familyMemberIinfo = commonFunctions.multiInsert(data,1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.insertPatientFamilyInfo(familyMemberIinfo,
	   function(result){
		   res.json(result);
	   });    
});

router.get("/getPatientFamilyInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientFamilyInfo(req.params.patientId,
    function(result){
	   res.json(result);
    });    
});

router.post("/addPatientProgramInfo",function(req, res){

    var patientProgramFinalData = Array();
    var data = req.body;
    // array patientsProgramInfo has `patient_id`, `LMPDate`, `EDD`, `isFirstPregnancy`, `gravida`, `parity`, `pastAbortions`, `pastStillBirths`, `livingChildren`, `natureofPreviousDelivery`, `previousDeliveryDate`, `notes`
	var patientsProgramInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getHmProgramDetails(1,
	   function(result){
            // formattedProgramAttributes contains attributes as keys of information array. Attribute name can be used to access all related information like program id, program details id etc.
            // NOTE: program id is same for each attribute of program even if it is accessed with different attribute names
            var formattedProgramAttributes = commonFunctions.formatArray('Program_item_name', result);
        //res.json(formattedProgramAttributes);
            // iterate through patients program info and form a multi-insert array.
            for(var i = 0; i < patientsProgramInfo.length; i++) {
                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.LMPDate.Programs_id, formattedProgramAttributes.LMPDate.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.LMPDate.Program_item_id, patientsProgramInfo[i][1], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.EDD.Programs_id, formattedProgramAttributes.EDD.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.EDD.Program_item_id, patientsProgramInfo[i][2], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.isFirstPregnancy.Programs_id, formattedProgramAttributes.isFirstPregnancy.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.isFirstPregnancy.Program_item_id, patientsProgramInfo[i][3], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.gravida.Programs_id, formattedProgramAttributes.gravida.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.gravida.Program_item_id, patientsProgramInfo[i][4], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.parity.Programs_id, formattedProgramAttributes.parity.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.parity.Program_item_id, patientsProgramInfo[i][5], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.pastAbortions.Programs_id, formattedProgramAttributes.pastAbortions.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.pastAbortions.Program_item_id, patientsProgramInfo[i][6], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.pastStillBirths.Programs_id, formattedProgramAttributes.pastStillBirths.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.pastStillBirths.Program_item_id, patientsProgramInfo[i][7], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.livingChildren.Programs_id, formattedProgramAttributes.livingChildren.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.livingChildren.Program_item_id, patientsProgramInfo[i][8], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.natureofPreviousDelivery.Programs_id, formattedProgramAttributes.natureofPreviousDelivery.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.natureofPreviousDelivery.Program_item_id, patientsProgramInfo[i][9], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.previousDeliveryDate.Programs_id, formattedProgramAttributes.previousDeliveryDate.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.previousDeliveryDate.Program_item_id, patientsProgramInfo[i][10], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);

                var programInsertData = Array();
                programInsertData.push('', formattedProgramAttributes.notes.Programs_id, formattedProgramAttributes.notes.Program_Details_id, patientsProgramInfo[i][0], formattedProgramAttributes.notes.Program_item_id, patientsProgramInfo[i][11], patientsProgramInfo[i][12], patientsProgramInfo[i][14], patientsProgramInfo[i][13], patientsProgramInfo[i][15]);
                patientProgramFinalData.push(programInsertData);
            }

            // insert patient program info
            patientDaoObj.insertPatientprogramInfo(patientProgramFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
    });
});

router.get("/getPatientProgramInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientProgramInfo(req.params.patientId,
    function(result){
	   res.json(result);
    });    
});

router.post("/addPatientsVitals",function(req, res){

    var vitalsInsertFinalData = Array();
    var data = req.body;
    // array patientsVitalsInfo has 0=>patient_id, 1=>Temperature, 2=>Weight, 3=>Height, 4=>Bmi, 5=>Girth, 6=>Fundal_Heights, 7=>created_date, 8=>created_by
	var patientsVitalsInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getVitalDetails(function(result){
            // formattedBPMetaInfo contains attributes as keys of information array. Attribute name can be used to access all related information like device id, attribute id etc.
            // NOTE: device id is same for each attribute of bp device even if it is accessed with different attribute names
            var formattedVitalsMetaInfo = commonFunctions.formatArray('Vital_Name', result);
//res.json(formattedVitalsMetaInfo);
            // iterate through patients vitals info and form a multi-insert array.
            for(var i = 0; i < patientsVitalsInfo.length; i++) {
                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Temperature.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][1], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);

                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Weight.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][2], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);

                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Height.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][3], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);

                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Bmi.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][4], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);

                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Girth.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][5], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);

                var vitalsInsertData = Array();
                vitalsInsertData.push('', formattedVitalsMetaInfo.Fundal_Heights.Vitals_id, patientsVitalsInfo[i][0], patientsVitalsInfo[i][6], patientsVitalsInfo[i][8], patientsVitalsInfo[i][7]);
                vitalsInsertFinalData.push(vitalsInsertData);
            }

            // insert patient vitals readings in device transaction table
            patientDaoObj.insertPatientVitals(vitalsInsertFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
        });
});

router.get("/getPatientVitals/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientVitals(req.params.patientId,
    function(result){
        var result = _und.groupBy(result, 'Examination_Date');
        res.json(result);
    });    
});

router.post("/addPatientsBPInfo",function(req, res){  

    var bpInsertFinalData = Array();
    var data = req.body;
    // array patientBPInfo has 0=>patient_id, 1=>systolic_bp, 2=>diastolic_bp, 3=>pulse_rate, 4=>created_date, 5=>created_by
	var patientBPInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getDeviceAttributes('bp',
	   function(result){
            // formattedBPMetaInfo contains attributes as keys of information array. Attribute name can be used to access all related information like device id, attribute id etc.
            // NOTE: device id is same for each attribute of bp device even if it is accessed with different attribute names
            var formattedBPMetaInfo = commonFunctions.formatArray('Device_Attribute_Name', result);

            // iterate through patients BP info and form a multi-insert array.
            for(var i = 0; i < patientBPInfo.length; i++) {
                var bpInsertData = Array();
                bpInsertData.push('', patientBPInfo[i][0], formattedBPMetaInfo.hm_systolic.Devices_id, formattedBPMetaInfo.hm_systolic.Device_Attributes_id, patientBPInfo[i][1], patientBPInfo[i][4], patientBPInfo[i][5]);
                bpInsertFinalData.push(bpInsertData);
                var bpInsertData = Array();
                bpInsertData.push('', patientBPInfo[i][0], formattedBPMetaInfo.hm_diastolic.Devices_id, formattedBPMetaInfo.hm_diastolic.Device_Attributes_id, patientBPInfo[i][2], patientBPInfo[i][4], patientBPInfo[i][5]);
                bpInsertFinalData.push(bpInsertData);
                var bpInsertData = Array();
                bpInsertData.push('', patientBPInfo[i][0], formattedBPMetaInfo.hm_pulseRate.Devices_id, formattedBPMetaInfo.hm_pulseRate.Device_Attributes_id, patientBPInfo[i][3], patientBPInfo[i][4], patientBPInfo[i][5]);
                bpInsertFinalData.push(bpInsertData);
            }

            // insert patient BP readings in device transaction table
            patientDaoObj.insertPatientDeviceReadings(bpInsertFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
    });
});

router.get("/getPatientBPInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientBPInfo(req.params.patientId,
    function(result){
        var result = _und.groupBy(result, 'Created_Date');
        res.json(result);
    });    
});

router.post("/addPatientsECGInfo",function(req, res){

    var ecgInsertFinalData = Array();
    var data = req.body;
    // array patientsECGInfo has 0=>patient_id, 1=>ecg_wavepoints, 3=>created_date, 4=>created_by
	var patientsECGInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getDeviceAttributes('ecg',
	   function(result){
            // iterate through patients BP info and form a multi-insert array.
            for(var i = 0; i < patientsECGInfo.length; i++) {
                var ecgInsertData = Array();
                ecgInsertData.push('', patientsECGInfo[i][0], result[0].Devices_id, result[0].Device_Attributes_id, patientsECGInfo[i][1], patientsECGInfo[i][2], patientsECGInfo[i][3]);
                ecgInsertFinalData.push(ecgInsertData);
            }

            // insert patient ECG readings in device transaction table
            patientDaoObj.insertPatientDeviceReadings(ecgInsertFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
    });
});

router.get("/getPatientECGInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientECGInfo(req.params.patientId,
    function(result){
        var result = _und.groupBy(result, 'Created_Date');
        res.json(result);
    });    
});

router.post("/addPatientsPulseOximeterInfo",function(req, res){  

    var pulseOxiInsertFinalData = Array();
    var data = req.body;
    // array PatientsPulseOximeterInfo has 0=>patient_id, 1=>pulse_rate, 2=>perfusion_index, 3=>SpO2, 4=>pulseox_wave_points, 5=>pulse_beats_points, 6=>created_date, 7=>created_by
	var PatientsPulseOximeterInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getDeviceAttributes('pulse_oxi',
	   function(result){
            // formattedPulseOxiMetaInfo contains attributes as keys of information array. Attribute name can be used to access all related information like device id, attribute id etc.
            // NOTE: device id is same for each attribute of pulse oxi device even if it is accessed with different attribute names
            var formattedPulseOxiMetaInfo = commonFunctions.formatArray('Device_Attribute_Name', result);

            // iterate through patients pulse oxi info and form a multi-insert array.
            for(var i = 0; i < PatientsPulseOximeterInfo.length; i++) {
                var pulseOxiInsertData = Array();
                pulseOxiInsertData.push('', PatientsPulseOximeterInfo[i][0], formattedPulseOxiMetaInfo.pulse_rate.Devices_id, formattedPulseOxiMetaInfo.pulse_rate.Device_Attributes_id, PatientsPulseOximeterInfo[i][1], PatientsPulseOximeterInfo[i][6], PatientsPulseOximeterInfo[i][7]);
                pulseOxiInsertFinalData.push(pulseOxiInsertData);

                var pulseOxiInsertData = Array();
                pulseOxiInsertData.push('', PatientsPulseOximeterInfo[i][0], formattedPulseOxiMetaInfo.perfusion_index.Devices_id, formattedPulseOxiMetaInfo.perfusion_index.Device_Attributes_id, PatientsPulseOximeterInfo[i][2], PatientsPulseOximeterInfo[i][6], PatientsPulseOximeterInfo[i][7]);
                pulseOxiInsertFinalData.push(pulseOxiInsertData);

                var pulseOxiInsertData = Array();
                pulseOxiInsertData.push('', PatientsPulseOximeterInfo[i][0], formattedPulseOxiMetaInfo.SpO2.Devices_id, formattedPulseOxiMetaInfo.SpO2.Device_Attributes_id, PatientsPulseOximeterInfo[i][3], PatientsPulseOximeterInfo[i][6], PatientsPulseOximeterInfo[i][7]);
                pulseOxiInsertFinalData.push(pulseOxiInsertData);

                var pulseOxiInsertData = Array();
                pulseOxiInsertData.push('', PatientsPulseOximeterInfo[i][0], formattedPulseOxiMetaInfo.pulseox_wave_points.Devices_id, formattedPulseOxiMetaInfo.pulseox_wave_points.Device_Attributes_id, PatientsPulseOximeterInfo[i][4], PatientsPulseOximeterInfo[i][6], PatientsPulseOximeterInfo[i][7]);
                pulseOxiInsertFinalData.push(pulseOxiInsertData);

                var pulseOxiInsertData = Array();
                pulseOxiInsertData.push('', PatientsPulseOximeterInfo[i][0], formattedPulseOxiMetaInfo.pulse_beats_points.Devices_id, formattedPulseOxiMetaInfo.pulse_beats_points.Device_Attributes_id, PatientsPulseOximeterInfo[i][5], PatientsPulseOximeterInfo[i][6], PatientsPulseOximeterInfo[i][7]);
                pulseOxiInsertFinalData.push(pulseOxiInsertData);
            }

            // insert patient pulse oximeter readings in device transaction table
            patientDaoObj.insertPatientDeviceReadings(pulseOxiInsertFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
    });
});

router.get("/getPatientsPulseOximeterInfo/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientsPulseOximeterInfo(req.params.patientId,
    function(result){
        var result = _und.groupBy(result, 'Created_Date');
        res.json(result);
    });    
});

router.post("/addPatientsHB/",function(req, res){

    var hbInsertFinalData = Array();
    var data = req.body;
    // array patientsHBInfo has 0=>patient_id, 1=>hb, 3=>created_date, 4=>created_by
	var patientsHBInfo = commonFunctions.multiInsert(data, 1);
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    var masterTableDaoObj = require(env.paths.root+env.paths.daoCommon+'masterTableDao.js');

    masterTableDaoObj.getDeviceAttributes('hb',
	   function(result){
            // iterate through patients HB info and form a multi-insert array.
            for(var i = 0; i < patientsHBInfo.length; i++) {
                var hbInsertData = Array();
                hbInsertData.push('', patientsHBInfo[i][0], result[0].Devices_id, result[0].Device_Attributes_id, patientsHBInfo[i][1], patientsHBInfo[i][2], patientsHBInfo[i][3]);
                hbInsertFinalData.push(hbInsertData);
            }

            // insert patient HB readings in device transaction table
            patientDaoObj.insertPatientDeviceReadings(hbInsertFinalData,
                function(result1) {
                    res.json(result1);
                }
            );
        });
});

router.get("/getPatientHB/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientHBInfo(req.params.patientId,
    function(result){
        var result = _und.groupBy(result, 'Created_Date');
        res.json(result);
    });    
});

router.get("/getSurveyTemplate/:programId/:templateType/:userType/",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getSurveyTemplate(req.params.programId, req.params.templateType, req.params.userType,
    function(result){
        result = commonFunctions.groupByArrayOfObjects(result, 'Survey_Question_Category');
        for(var key in result) {
            result[key]['data'] = commonFunctions.groupByArrayOfObjects(result[key]['data'], 'Survey_Question_no');
        }
	   res.json(result);
    });
});

router.post("/addPatientsSurvey/",function(req, res){

    var data = req.body;
    var noTimeFieldInDBTable = 1;
    var patientsSurveyInfo = commonFunctions.multiInsert(data, noTimeFieldInDBTable);

	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.insertPatientsSurvey(patientsSurveyInfo,
    function(result){
	   res.json(result);
    });    
});

router.get("/getPatientHRA/:patientId/:programId/",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientHRA(req.params.patientId,req.params.programId,
    function(result){
	   res.json(result);
    });
});

router.get("/getPatientFeedback/:patientId/:programId/",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientFeedback(req.params.patientId,req.params.programId,
    function(result){
	   res.json(result);
    });
});

router.post("/referPatients/",function(req, res){  
    	
    var data = req.body;
    var noTimeFieldInDBTable = 1;
    var referPatientsInfo = commonFunctions.multiInsert(data, noTimeFieldInDBTable);
   
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.insertReferPatientsInfo(referPatientsInfo,
    function(result){
	   res.json(result);
    });    
});

router.get("/getPatientReferalReasons/",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientReferalReasons(function(result){
	   res.json(result);
    });
});
router.get("/getAllReferalData/",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getAllReferalData(function(result){
	   res.json(result);
    });
});
router.post("/addPatientsMedications/",function(req, res){  
    	
    var data = req.body;
    var noTimeFieldInDBTable = 1;
    var patientsMedicationInfo = commonFunctions.multiInsert(data, noTimeFieldInDBTable);

	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
    patientDaoObj.addPatientsMedications(patientsMedicationInfo,
    function(result){
        res.json(result);
    });
});

router.get("/getPatientAllergies/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientAllergies(req.params.patientId, function(result){
	   res.json(result);
    });
});

router.post("/addPatientSeverity/",function(req, res){  
    	
    var requestData = req.body;
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');

    patientDaoObj.getPatientSeverity(requestData.Patient_id,
	   function(result){
            var data = requestData;
            if(result.length > 0) {
                patientDaoObj.updatePatientSeverity(data,
                function(result){
                    res.json(result);
                });
            }else {
                var insertData = [];
                var finalInsertData = [];
                insertData.push(data.Patient_id, data.HBFlag, data.HBValue, data.BPSysFlag, data.BPSysValue, data.BPDiaFlag, data.BPDiaValue, data.BPPulseFlag, data.BPPulseValue, data.WeightFlag, data.WeightValue, data.OxyPulseFlag, data.OxyPulseValue, data.OxiSpO2Flag, data.OxiPulseO2Value, data.OverallFlag, data.OverAllStatus, data.ExaminationDate);
                finalInsertData.push(insertData);
                patientDaoObj.addPatientSeverity(finalInsertData,
                function(result){
                    res.json(result);
                });
            };
    });
});

router.get("/getPatientSeverity/:patientId",function(req, res){  
    	
	var patientDaoObj = require(env.paths.root+env.paths.daoApp+'patientDao.js');
	patientDaoObj.getPatientSeverity(req.params.patientId, function(result){
	   res.json(result);
    });
});
module.exports = router;