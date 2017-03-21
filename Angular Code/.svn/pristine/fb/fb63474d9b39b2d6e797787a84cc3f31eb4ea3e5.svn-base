angular.module('healthMon').service('patientTreatmentService', function($http,$q,authFact) {
    // api calls relating to all patient treatment will go here


    var medicationUnsavedChanges = [];
    var medicationUnsavedChangesFlag = false;
    var _getMedicationUnsavedChanges = function(){
        return  medicationUnsavedChanges;
    }
    var _setMedicationUnsavedChanges = function(unsavedChanges){
        medicationUnsavedChanges = unsavedChanges;
    }
    var _getMedicationUnsavedChangesFlag = function(){
        return  medicationUnsavedChangesFlag;
    }
    var _setMedicationUnsavedChangesFlag = function(unsavedChanges){
        medicationUnsavedChangesFlag = unsavedChanges;
    }


    var investigationUnsavedChanges = [];
    var investigationUnsavedChangesFlag = false;
    var _getInvestigationUnsavedChanges = function(){
        return  investigationUnsavedChanges;
    }
    var _setInvestigationUnsavedChanges = function(unsavedChanges){
        investigationUnsavedChanges = unsavedChanges;
    }
    var _getInvestigationUnsavedChangesFlag = function(){
        return  investigationUnsavedChangesFlag;
    }
    var _setInvestigationUnsavedChangesFlag = function(unsavedChanges){
        investigationUnsavedChangesFlag = unsavedChanges;
    }


    var diagnosisUnsavedChanges = [];
    var diagnosisUnsavedChangesFlag = false;
    var _getDiagnosisUnsavedChanges = function(){
        return  diagnosisUnsavedChanges;
    }
    var _setDiagnosisUnsavedChanges = function(unsavedChanges){
        diagnosisUnsavedChanges = unsavedChanges;
    }
    var _getDiagnosisUnsavedChangesFlag = function(){
        return  diagnosisUnsavedChangesFlag;
    }
    var _setDiagnosisUnsavedChangesFlag = function(unsavedChanges){
        diagnosisUnsavedChangesFlag = unsavedChanges;
    }


    var procedureUnsavedChanges = [];
    var procedureUnsavedChangesFlag = false;
    var _getProcedureUnsavedChanges = function(){
        return  procedureUnsavedChanges;
    }
    var _setProcedureUnsavedChanges = function(unsavedChanges){
        procedureUnsavedChanges = unsavedChanges;
    }
    var _getProcedureUnsavedChangesFlag = function(){
        return  procedureUnsavedChangesFlag;
    }
    var _setProcedureUnsavedChangesFlag = function(unsavedChanges){
        procedureUnsavedChangesFlag = unsavedChanges;
    }

    /**
     * _getMedicationDrugsList - Returns promise which resolves in list of all drugs for drug dropdown
     *
     * @return {type} promise
     */
    var _getMedicationDrugsList = function(){
        var defer = $q.defer();
        $http.get('/masterData/getHmDrugsInfo')
        .then(function(response){
            if(response.data != null && response.data != undefined){
                var data = [];
                for (var i = 0; i < response.data.length; i++) {
                    data.push({ DrugName : response.data[i].DrugName , DrugId : response.data[i].DrugId , DrugCategory : response.data[i].DrugCategory });
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });
        return defer.promise;
    }

    var _getPreviousMedicationDetails = function(patientId){
        var defer = $q.defer();
        $http.get('/common/getPatientMedications/' + patientId)
        .then(function(response){
            if(response.data != null && response.data != undefined){
                var data = [];
                console.log('medi data',response.data);
                for (var i = 0; i < response.data.length; i++) {
                    var freq =  parseInt(response.data[i].Medicine_Qty)/response.data[i].Duration_In_Days
                    console.log(response.data[i].Duration_In_Days);
                    console.log(freq);
                    var med = { drug : response.data[i].DrugName , quantity : response.data[i].Medicine_Qty , freq : freq ,
                        drugId : response.data[i].DrugId , patientId : response.data[i].Patient_id}
                    data.push(med);
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });
        return defer.promise;
    }

    var _getInvestigationAndTestInfo = function(){
        var defer = $q.defer();
        $http.get('/masterData/getHmInvestigationtestInfo')
        .then(function(response){
            if(response.data != null && response.data != undefined){
                var data = [];
                for (var i = 0; i < response.data.length; i++) {
                    data.push({type : response.data[i].InvestigationTestType , id :  response.data[i].InvestigationTest_id});
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });
        return defer.promise;
    }

    var _getInvestigationList = function(patientId){
         var defer = $q.defer();
        $http.get('/common/getPatientinvestigationtest/' + patientId)
        .then(function(response){
            console.log('pat inv',response);
            if(response.data != null && response.data != undefined){
                var data = [];
                for (var i = 0; i < response.data.length; i++) {
                    var med = { type : response.data[i].InvestigationTestType , quantity : response.data[i].Quantity , comment : response.data[i].Comments }
                    data.push(med);
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });

        return defer.promise;
    }

    var _getDiagnosisTypes = function(patientId){
        var defer = $q.defer();
        $http.get('/masterData/getHmDiagnosisInfo' )
        .then(function(response){
            if(response.data != null && response.data != undefined){
                var data = [];
                for (var i = 0; i < response.data.length; i++) {
                    data.push({type : response.data[i].DiagnosisType , id : response.data[i].Diagnosis_id});
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });

        return defer.promise;
    }


    var _getDiagnosedLst = function(patientId){
        var defer = $q.defer();
        $http.get('/common/getPatientdiagnosis/' + patientId)
        .then(function(response){
            if(response.data != null && response.data != undefined){
                var data = [];
                for (var i = 0; i < response.data.length; i++) {
                    var diag = { type : response.data[i].DiagnosisType , comment : response.data[i].Comments }
                    data.push(diag);
                }
                defer.resolve(data);
            }
        },function(response){
            defer.reject(response.data);
        });

        return defer.promise;
    }


    var _getProcedureTypes = function(){
        var defer = $q.defer();

        $http.get('/masterData/getHmProceduresInfo')
        .then(function(response){
            if(response.data != undefined){
                var procedures = [];
                for (var i = 0; i < response.data.length; i++) {
                    procedures.push({type : response.data[i].ProcedureType , id : response.data[i].Procedure_id})
                }
                defer.resolve(procedures);
            }
        },function(response){
            defer.reject(response.data);
        });

        return defer.promise;
    }

    var _getProcedureLst = function(patientId){
        var defer = $q.defer();

        $http.get('/common/getPatientprocedure/' + patientId)
        .then(function(response){
            if(response.data != undefined){
                var procedureLst = [];
                for (var i = 0; i < response.data.length; i++) {
                    procedureLst.push( {type : response.data[i].ProcedureType , comment : response.data[i].Comments , patientID : response.data[i].Patient_id , procedureId : response.data[i].Procedure_id})
                }
                defer.resolve(procedureLst);
            }
        },function(response){
            defer.reject(response.data);
        });
        return defer.promise;
    }

    var _saveTreatmentDetails = function(medicationDet,investigationDet,diagnosisDet,procedureDet,patientId){
        if(medicationDet != undefined && medicationDet != null && medicationDet.length > 0){
            // call save medication api
            var medData  = {};
            var user = authFact.getUserObj();
            for (var i = 0; i < medicationDet.length; i++) {
                var date = new Date();
                date = date.toString();
                medData['' + i] = '' + patientId + ',' + medicationDet[i].drugId + ',' + medicationDet[i].quantity + ',' + user.User_Name + ',' + date + ',' + medicationDet[i].duration + ',' + medicationDet[i].drugCategory ;
            }

            $http({
				    method: 'POST',
				    url: '/patient/addPatientsMedications',
				    data : medData
			    }).then(function (response) {
				    if(response.data.status == 'success'){

			        }},function(err){
                    console.log(err);
            });

        }
            // ivestigation api
            if(investigationDet != undefined && investigationDet != null && investigationDet.length > 0){
                // call save medication api
                var invData  = {};
                for (var i = 0; i < investigationDet.length; i++) {
                    invData['' + i] = '' + patientId + ',' + investigationDet[i].id + ',' + investigationDet[i].quantity + ',' + investigationDet[i].comment +  ',,,';
                }

                $http({
    				    method: 'POST',
    				    url: '/common/addPatientinvestigationtestData',
    				    data : invData
    			    }).then(function (response) {
                        console.log(response);
    				    if(response.data.status == 'success'){

    			        }},function(err){
                        console.log(err);
                });

            }

            // diagnosis
            if(diagnosisDet != undefined && diagnosisDet != null && diagnosisDet.length > 0){
                // call save medication api
                var diaData  = {};
                var user = authFact.getUserObj();
                console.log('diagnosisDet',diagnosisDet);
                for (var i = 0; i < diagnosisDet.length; i++) {
                    diaData['' + i] = '' + patientId + ',' + diagnosisDet[i].id + ',' + diagnosisDet[i].comment +  ',' +  user.User_Name;
                }

                $http({
    				    method: 'POST',
    				    url: '/common/addPatientdiagnosisData',
    				    data : diaData
    			    }).then(function (response) {
                        console.log(response);
    				    if(response.data.status == 'success'){

    			        }},function(err){
                        console.log(err);
                });

            }

            // procedure
            if(procedureDet != undefined && procedureDet != null && procedureDet.length > 0){
                // call save medication api
                var proData  = {};
                var user = authFact.getUserObj();
                for (var i = 0; i < procedureDet.length; i++) {
                    proData['' + i] = '' + patientId + ',' + procedureDet[i].id + ',' + procedureDet[i].comment +  ',' +  user.User_Name + ',,';
                }

                $http({
    				    method: 'POST',
    				    url: '/common/addPatientprocedureData',
    				    data : proData
    			    }).then(function (response) {
                        console.log(response);
    				    if(response.data.status == 'success'){
    			        }},function(err){
                        console.log(err);
                });

            }

    }

    return {
        getMedicationDrugsList : _getMedicationDrugsList,
        getInvestigationAndTestInfo : _getInvestigationAndTestInfo,
        getPreviousMedicationDetails : _getPreviousMedicationDetails,
        getInvestigationList : _getInvestigationList,
        getDiagnosisTypes : _getDiagnosisTypes,
        getDiagnosedLst : _getDiagnosedLst,
        getProcedureLst : _getProcedureLst,
        getProcedureTypes : _getProcedureTypes,
        saveTreatmentDetails : _saveTreatmentDetails,
        getMedicationUnsavedChanges : _getMedicationUnsavedChanges,
        setMedicationUnsavedChanges : _setMedicationUnsavedChanges,
        getInvestigationUnsavedChanges : _getInvestigationUnsavedChanges,
        setInvestigationUnsavedChanges : _setInvestigationUnsavedChanges,
        setDiagnosisUnsavedChanges : _setDiagnosisUnsavedChanges,
        getDiagnosisUnsavedChanges : _getDiagnosisUnsavedChanges,
        setProcedureUnsavedChanges : _setProcedureUnsavedChanges,
        getProcedureUnsavedChanges : _getProcedureUnsavedChanges,
        getMedicationUnsavedChangesFlag : _getMedicationUnsavedChangesFlag,
        setMedicationUnsavedChangesFlag : _setMedicationUnsavedChangesFlag,
        setInvestigationUnsavedChangesFlag : _setInvestigationUnsavedChangesFlag,
        getInvestigationUnsavedChangesFlag : _getInvestigationUnsavedChangesFlag,
        setDiagnosisUnsavedChangesFlag : _setDiagnosisUnsavedChangesFlag,
        getDiagnosisUnsavedChangesFlag : _getDiagnosisUnsavedChangesFlag,
        setProcedureUnsavedChangesFlag : _setProcedureUnsavedChangesFlag,
        getProcedureUnsavedChangesFlag : _getProcedureUnsavedChangesFlag

    }
});
