angular.module('healthMon').factory('patientFact',["$cookieStore",function($cookieStore){

    var patientFact={};
    patientFact.setPatientId=function(PatientId){
        $cookieStore.put('PatientId',PatientId);
    };

    patientFact.setPatientLMPDate=function(LMPDate){
        $cookieStore.put('LMPDate',LMPDate);
    };

    patientFact.getPatientId=function(){
        patientFact.PatientId=$cookieStore.get('PatientId');
        if(!patientFact.PatientId) {
            return 'PatientId missing';
        }
        return patientFact.PatientId;
    };

    patientFact.getPatientLMPDate=function(){
        patientFact.LMPDate=$cookieStore.get('LMPDate');
        if(!patientFact.LMPDate) {
            return 'LMPDate missing';
        }
        return patientFact.LMPDate;
    };
     patientFact.setcareplanApprovedstatus=function(status){
        $cookieStore.put('careplanApprovedstatus',status);
        
    };
    patientFact.getcareplanApprovedstatus=function(){
        patientFact.careplanApprovedstatus=$cookieStore.get('careplanApprovedstatus');
        if(!patientFact.careplanApprovedstatus) {
            return false;
        }
        return patientFact.careplanApprovedstatus;
    };
    patientFact.deletecareplanApprovedstatus=function(){
        if($cookieStore.get('careplanApprovedstatus'))
            $cookieStore.remove('careplanApprovedstatus');
    }
    patientFact.deletePatientParams=function(){
        if($cookieStore.get('PatientId'))
            $cookieStore.remove('PatientId');
        if($cookieStore.get('LMPDate'))
            $cookieStore.remove('LMPDate');
        if($cookieStore.get('careplanApprovedstatus'))
              $cookieStore.remove('careplanApprovedstatus');
    }
    return patientFact;
}]);