angular.module('healthMon').controller("patientTreatmentTabCtrl",function($scope,patientFact,patientTreatmentService) {


    // get current patient id
    $scope.patientId = patientFact.getPatientId();
    $scope.saveStatus = '';

    // get all the data required to init the treatment tab
    _initMedication();
    _initInvestigation();
    _initDiagnosis();
    _initProcedure();


    /**
     * _initMedication - Bootstraps medication panel
     * @return {type}  - none
     */
    function _initMedication(){

        $scope.selectedMed = 'Type Medicine Name';
        $scope.medFrequency = 'Select';
        $scope.medicationQuantity ;
        $scope.availDrugsLst = [];
        $scope.medicationComments = '';
        $scope.medicationDrugCategory = '';

        $scope.medication = [];     // previous medication details
        $scope.newMedication = patientTreatmentService.getMedicationUnsavedChanges();  // new medication details --- get this from service


        $scope.medicationSaveMsg = patientTreatmentService.getMedicationUnsavedChangesFlag();

        // get list of avail drugs
        var promise = patientTreatmentService.getMedicationDrugsList($scope.patientId);
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.availDrugsLst = data;
            }
        },function(err){
            // defeered
            console.log("Error retrieving drugs list" , err);
        })
    }

    $scope.addPreviousDrugs = function(){
        // get previous medication details
        var promise = patientTreatmentService.getPreviousMedicationDetails($scope.patientId);
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.medication = data;
                for (var i = 0; i < data.length; i++) {
                    var record = angular.copy(data[i]);
                    $scope.newMedication.push(record)
                }

            }
        },function(err){
            // defeered
            console.log("Error retrieving drugs list" , err);
        })
    }


    /**
     * _initInvestigain - bootstraps investigation panel
     * @return {type}  description
     */
    function _initInvestigation(){

        $scope.investigationType = 'Type Investigation Name';
        $scope.investigationQuantity = 1;
        $scope.investigationComment = '' ;
        $scope.investigationLst = [];
        $scope.investigationAndTests = [];
        $scope.investigationId  = '';

        $scope.investigationSaveMsg = patientTreatmentService.getInvestigationUnsavedChangesFlag();
        $scope.newinvestigationLst = patientTreatmentService.getInvestigationUnsavedChanges();

        var promise = patientTreatmentService.getInvestigationAndTestInfo();
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.investigationAndTests = data;
            }
        },function(err){
            // defeered
            console.log("Error retrieving drugs list" , err);
        })

    }

    $scope.addPreviousTests = function(){
        var promise = patientTreatmentService.getInvestigationList($scope.patientId);
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.investigationLst = data;
                for (var i = 0; i < data.length; i++) {
                    var record = angular.copy(data[i]);
                    $scope.newinvestigationLst.push(record)
                }
            }
        },function(err){
            // defeered
            console.log("Error retrieving drugs list" , err);
        })
    }

    function _initProcedure(){
        $scope.procedureLst = [];
        $scope.procedure = 'Procedure';
        $scope.procedureComments = '';
        $scope.procedures = [];
        $scope.procedureId = '';
        $scope.newProcedureLst = patientTreatmentService.getProcedureUnsavedChanges();

        $scope.procedureSaveMsg = patientTreatmentService.getProcedureUnsavedChangesFlag();

        var promise = patientTreatmentService.getProcedureTypes();
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.procedures = data;
            }
        },function(err){
            // defeered
            console.log("Error retrieving procedureLst " , err);
        })

    }

    $scope.addPreviousProcedures = function(){
        var promise = patientTreatmentService.getProcedureLst($scope.patientId);
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.procedureLst = data;
                //$scope.newProcedureLst = angular.copy(data);
                for (var i = 0; i < data.length; i++) {
                    var record = angular.copy(data[i]);
                    $scope.newProcedureLst.push(record)
                }
            }
        },function(err){
            // defeered
            console.log("Error retrieving procedureLst " , err);
        })
    }


    /**
     * _initDiagnosis - Bootstraps doagnosis pane
     * @return {type}  description
     */
    function _initDiagnosis(){
        $scope.diagnosisLst = [];
        $scope.diagnosis = 'Diagnosis';
        $scope.diagnosisComments = '';
        $scope.diagnosisTypes = [];
        $scope.diagnosisId = '';
        $scope.newDiagnosisLst = patientTreatmentService.getDiagnosisUnsavedChanges();

        $scope.diagnosisSaveMsg = patientTreatmentService.getDiagnosisUnsavedChangesFlag();

        var promise = patientTreatmentService.getDiagnosisTypes();
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.diagnosisTypes = data;
            }
        },function(err){
            // defeered
            console.log("Error retrieving diagnosis list" , err);
        })

    }

    $scope.addPreviousDiag = function(){
        var promise = patientTreatmentService.getDiagnosedLst($scope.patientId);
        promise.then(function(data){
            // resolved
            if(data != undefined && data != null ){
                $scope.diagnosisLst = data;
                for (var i = 0; i < data.length; i++) {
                    var record = angular.copy(data[i]);
                    $scope.newDiagnosisLst.push(record)
                }
            }
        },function(err){
            // defeered
            console.log("Error retrieving diagnosis list" , err);
        })
    }


    /**
     * sets current medicine from drop down
     * @param  {string} drug name
     * @return {type}      none
     */
    $scope.selectMedicine = function(drug){
        $scope.selectedMed = drug.DrugName;
        $scope.medicationDrugId = drug.DrugId;
        $scope.medicationDrugCategory = drug.DrugCategory;
    }


    /**
     * Sets medicine frequency from from drop down
     * @param  {string} notation 1---0---1
     * @param  {string} freq     2
     * @return {type}          none
     */
    $scope.setMedFrequency = function(notation,freq){
        $scope.medFrequency = freq;
    }


    /**
     * Adds medicine to medication list
     * @return {type}  none
     */
    $scope.addMedicine = function(){
        if($scope.selectedMed != 'Type Medicine Name' && $scope.medFrequency != 'Select' && $scope.medicationQuantity != ""  )
        {
            if($scope.medFrequency == 'Once Daily'){
                $scope.medFrequency = 1;
            }
            else if($scope.medFrequency == 'Twice Daily'){
                $scope.medFrequency = 2;
            }else if($scope.medFrequency == 'Thrice Daily'){
                $scope.medFrequency = 3;
            }
            var duration = $scope.medicationQuantity/$scope.medFrequency;
            $scope.newMedication.push({drug : $scope.selectedMed , freq : $scope.medFrequency , quantity : $scope.medicationQuantity,drugId : $scope.medicationDrugId ,
                drugCategory : $scope.medicationDrugCategory , duration : duration})
            patientTreatmentService.setMedicationUnsavedChanges($scope.newMedication)
            patientTreatmentService.setMedicationUnsavedChangesFlag(true);
        }
        $scope.selectedMed = 'Type Medicine Name';
        $scope.medFrequency = 'Select';
        $scope.medicationQuantity = "";
        $scope.medicationComments = '';
        $scope.medicationDrugId = '';
        $scope.medicationDrugCategory = '';

        $scope.medicationSaveMsg = true;

    }


    /**
     * Removes a medicine from medication list
     * @param  {type} medicationDetail
     * @return {type} none
     */
    $scope.removeMedication = function(medicationDetail){
        for (var i = 0; i < $scope.newMedication.length; i++) {
            if ($scope.newMedication[i].drug === medicationDetail.drug) {
                // remove
                $scope.newMedication.splice(i,1);
                // if they are in old medication call db api to remove med
            }
        }

        for (var i = 0; i < $scope.medication.length; i++) {
            if ($scope.medication[i].drug === medicationDetail.drug) {
                // if they are in old medication call db api to remove med , needs confirmation
                $scope.medication.splice(i,1);
            }
        }

    }


    // investigation and tests
    $scope.setInvestigationType = function(invtype){
        $scope.investigationType = invtype.type;
        $scope.investigationId = invtype.id
    }


    /**
     * Adds a new medication to medications list
     * @return {type}  none
     */
    $scope.addInvestigationToLst = function(){
        if($scope.investigationType != null && $scope.investigationType != undefined && $scope.investigationQuantity != undefined){
            $scope.newinvestigationLst.push({type : $scope.investigationType , quantity : $scope.investigationQuantity , comment : $scope.investigationComment, id : $scope.investigationId })
            // back to other
            patientTreatmentService.setInvestigationUnsavedChanges($scope.newinvestigationLst );
            $scope.investigationType = 'Type Investigation Name';
            $scope.investigationQuantity = 1;
            $scope.investigationComment = '' ;
            $scope.investigationId = '';

            $scope.investigationSaveMsg = true;
            patientTreatmentService.setInvestigationUnsavedChangesFlag(true);
        }
    }

    // diagnosis
    $scope.setDiagnosis = function(diagnosis){
        $scope.diagnosis = diagnosis.type;
        $scope.diagnosisId = diagnosis.id;

    }

    $scope.addDiagnosisToLst = function(){
        if($scope.diagnosis != undefined && $scope.diagnosis != ''){
            $scope.newDiagnosisLst.push({type : $scope.diagnosis, comment : $scope.diagnosisComments , id : $scope.diagnosisId })
            $scope.diagnosisSaveMsg = true;
            patientTreatmentService.setDiagnosisUnsavedChangesFlag(true)
            patientTreatmentService.setDiagnosisUnsavedChanges($scope.newDiagnosisLst);
        }
        $scope.diagnosis = 'Diagnosis';
        $scope.diagnosisId = '';
        $scope.diagnosisComments = '';


    }

    // procedure
    $scope.setProcedure = function(procedure){
        $scope.procedure = procedure.type;
        $scope.procedureId = procedure.id;
    }

    $scope.addProcedureToLst = function(){
        $scope.newProcedureLst.push({type: $scope.procedure , comment : $scope.procedureComments , id : $scope.procedureId})
        $scope.procedure = 'Procedure';
        $scope.procedureComments = '';
        $scope.procedureSaveMsg = true;

        patientTreatmentService.setProcedureUnsavedChanges($scope.newProcedureLst);
        patientTreatmentService.setProcedureUnsavedChangesFlag(true)

    }


    // save all details
    $scope.savePatientTreatmentDetails = function(){
        // diff all four list find new ones push in app api's and clear reload data

        // medication
        var medicationBuffers = [];
        for (var i = 0; i < $scope.newMedication.length; i++) {
            var newMed = $scope.newMedication[i];
            var medicationMatchFound = false;
            for (var j = 0; j < $scope.medication.length; j++) {
                var med = $scope.medication[j]
                if(angular.equals(newMed,med)){
                    medicationMatchFound = true;
                }
            }
            if(!medicationMatchFound){
                medicationBuffers.push(newMed);
            }
        }

        // investigation
        var investigationBuffers = [];
        for (var i = 0; i < $scope.newinvestigationLst.length; i++) {
            var newInv = $scope.newinvestigationLst[i];
            var investigationMatchFound = false;
            for (var j = 0; j < $scope.investigationLst.length; j++) {
                var inv = $scope.investigationLst[j]
                if(angular.equals(newInv,inv)){
                    investigationMatchFound = true;
                }
            }
            if(!investigationMatchFound){
                investigationBuffers.push(newInv);
            }
        }

        // diagnosis
        var diagnosisBuffers = [];
        for (var i = 0; i < $scope.newDiagnosisLst.length; i++) {
            var newDiag = $scope.newDiagnosisLst[i];
            var diagnosisMatchFound = false;
            for (var j = 0; j < $scope.diagnosisLst.length; j++) {
                var diag = $scope.diagnosisLst[j]
                if(angular.equals(newDiag,diag)){
                    diagnosisMatchFound = true;
                }
            }
            if(!diagnosisMatchFound){
                diagnosisBuffers.push(newDiag);
            }
        }

        // procedure
        var procedureBuffers = [];
        for (var i = 0; i < $scope.newProcedureLst.length; i++) {
            var newPro = $scope.newProcedureLst[i];
            var procedureMatchFound = false;
            for (var j = 0; j < $scope.procedureLst.length; j++) {
                var pro = $scope.procedureLst[j]
                if(angular.equals(newPro,pro)){
                    procedureMatchFound = true;
                }
            }
            if(!procedureMatchFound){
                procedureBuffers.push(newPro);
            }
        }

        // call a method of service and try reload data
        patientTreatmentService.saveTreatmentDetails(medicationBuffers,investigationBuffers,diagnosisBuffers,procedureBuffers,$scope.patientId)
        if(procedureBuffers.length > 0 || diagnosisBuffers.length > 0 || investigationBuffers.length > 0 || medicationBuffers.length > 0){
            $scope.saveStatus = 'Treatment Details Saved Successfully'
        }

        $scope.medicationSaveMsg = false;
        patientTreatmentService.setMedicationUnsavedChangesFlag(false);
        $scope.investigationSaveMsg = false;
        patientTreatmentService.setInvestigationUnsavedChangesFlag(false);
        $scope.diagnosisSaveMsg = false;
        patientTreatmentService.setDiagnosisUnsavedChangesFlag(false)
        $scope.procedureSaveMsg = false;
        patientTreatmentService.setProcedureUnsavedChangesFlag(false)

    }
});
