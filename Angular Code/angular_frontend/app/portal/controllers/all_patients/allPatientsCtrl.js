angular.module('healthMon').controller("allPatientsCtrl", function($http,$location,$rootScope,commonFunctions,patientFact) {
	var vm = this;
    vm.patientsList = null;
    vm.formattedPatientsList = null;
    vm.referredCount = 0;
    vm.allPatientsDisplayData = null;
    vm.patientCount = 0;
    vm.data=null;
	//vm.currentPage = 0;
	vm.currentPageHR = 0;
	vm.currentPageMR = 0;
	vm.currentPageNR = 0;
    vm.pageSize = 3;
  //  vm.data = [];
    vm.q = '';

    $http.get("common/getAllPatientsMedicationInfo").then(function(response) {
        vm.data=response.data;  
         
    });
     localStorage.setItem('patientcareplan','');
        var temp=[];
      $rootScope.list=localStorage.setItem('AddedCarePlanList',JSON.stringify(temp));
      localStorage.setItem('severity','');
      localStorage.setItem('PregnancyWeeks','');
    
    // delete params related to patient from cookie store
    patientFact.deletePatientParams();

	$http.get("common/getPatientList/0").then(function(response) {
        //vm.referredPatientIds=null;
        vm.formattedReferredPatientsList=null;
        // get list of all patients that have EDD >= current date
        vm.patientsList = response.data;
        vm.formattedPatientsList = commonFunctions.formatArray('Patient_id', vm.patientsList);
        //console.log(JSON.stringify(vm.formattedPatientsList));
        var patientsData = vm.getAllPatientsDisplayData(vm.formattedPatientsList);
        vm.allPatientsDisplayData = patientsData.patients;
        // get total patients count
        vm.patientCount = vm.patientsList.length;
        vm.referredCount = patientsData.referred_count;

        // default order by
        vm.orderByColumn = 'severity';
        vm.orderByColumnLabel = 'Severity';
        vm.sortPatients = function(orderByVal) {
            vm.orderByColumn = orderByVal;
            if(orderByVal == "Patient_Age") vm.orderByColumnLabel = "Age";
            if(orderByVal == "EDD") vm.orderByColumnLabel = "Patient EDD";
            if(orderByVal == "severity") vm.orderByColumnLabel = "Severity";
        }
    });
    
    vm.getAllPatientsDisplayData = function(patients) {
        var finalResult = null;
        var referredCnt=0;
       
        if((typeof(patients) == 'object') && (Object.keys(patients).length > 0)) {
            for(var key in patients) {
                // check if patient is referred
                if(patients[key]['Referal_id'] > 0) {
                    patients[key]['referred'] = true;
                    referredCnt++;
                }else {
                    patients[key]['referred'] = false;
                }

                var pregnancyWeeks = 0;
                pregnancyWeeks = commonFunctions.calculatePregnancyWeeks(patients[key]['LMPDate']);
                patients[key]['weeks'] = pregnancyWeeks;

                patients[key]['LMPDate'] = moment(patients[key]['LMPDate'], "YYYY-MM-DD").format('DD/MM/YYYY');
                patients[key]['EDD'] = moment(patients[key]['EDD'], "YYYY-MM-DD").format('DD/MM/YYYY');

                if(patients[key]['OverallFlag'] == 2) {
                    patients[key]['severity'] = 1;
                }else if(patients[key]['OverallFlag'] == 1) {
                    patients[key]['severity'] = 2;
                }else if(patients[key]['OverallFlag'] == 0) {
                    patients[key]['severity'] = 3;
                }
                
                  vm.medicationInfo=new Object();
                  vm.medicationInfo=commonFunctions.formatArray('Patient_id',vm.data);
                  for(var i in  vm.data){
                  
                    if(vm.data[i].Patient_id==key){
                     
                        if(vm.data[i].Medication=='TT1'){
                            vm.medicationInfo[key]['TT1_Medication']=vm.data[i].Medication;
                          
                            if(vm.data[i].User_id==null)
                           vm.medicationInfo[key]['TT1_Medication_dueDate']= 
                               moment(vm.data[i].Created_Date)
                               .add(30, 'days').format('DD/MM/YYYY');
                            
                            vm.medicationInfo[key]
                            ['TT1_Medication_LastDate']=moment(vm.data[i].Created_Date)
                               .add(-1, 'days').format('DD/MM/YYYY');
                        }
                          if(vm.data[i].Medication=='TT2'){
                            vm.medicationInfo[key]['TT2_Medication']=vm.data[i].Medication;
                            
                          if(vm.data[i].User_id==null)
                           vm.medicationInfo[key]['TT2_Medication_dueDate']=  
                               moment(vm.data[i].Created_Date)
                               .add(30, 'days').format('DD/MM/YYYY');
                            
                            vm.medicationInfo[key]
                            ['TT2_Medication_LastDate']=moment(vm.data[i].Created_Date)
                               .add(-1, 'days').format('DD/MM/YYYY');
                        }
                          if(vm.data[i].Medication=='IFA'){
                            vm.medicationInfo[key]['IFA_Medication']=vm.data[i].Medication;
                            
                            if(vm.data[i].User_id==null)
                           vm.medicationInfo[key]['IFA_Medication_dueDate']= 
                               moment(vm.data[i].Created_Date)
                               .add(30, 'days').format('DD/MM/YYYY');
                            
                            vm.medicationInfo[key]
                            ['IFA_Medication_LastDate']=moment(vm.data[i].Created_Date)
                               .add(-1, 'days').format('DD/MM/YYYY');
                        }
                        if(vm.data[i].Medication=='TT_Booster'){
                            vm.medicationInfo[key]['TT_Booster_Medication']=vm.data[i].Medication;
                            
                         if(vm.data[i].User_id==null)
                         vm.medicationInfo[key]['TT_Booster_Medication_dueDate']= 
                             moment(vm.data[i].Created_Date)
                               .add(30, 'days').format('DD/MM/YYYY');
                            
                        vm.medicationInfo[key]['TT_Booster_Medication_LastDate']=
                              moment(vm.data[i].Created_Date)
                               .add(-1, 'days').format('DD/MM/YYYY');
                        }
                        
                    }
                   
                } 
                
                
            }
            finalResult = {'patients' : patients, 'referred_count' : referredCnt};
        }
        return finalResult;
    }

    vm.fetchPatientData = function(patient_Id,LMPDate){
        // bring date to original format which was changed on patient cards from yyyy-mm-dd to dd-mm-yyyy
        LMPDate = moment(LMPDate, "DD/MM/YYYY").format("YYYY-MM-DD");

        $rootScope.patient_Id=patient_Id;
        $rootScope.LMPDate=LMPDate;
        // set params related to patient in cookie store
       
        for(var i in vm.formattedPatientsList){
           if(i==patient_Id)
        localStorage.setItem('severity',vm.formattedPatientsList[i]['severity']);
        }
        localStorage.setItem('PregnancyWeeks',commonFunctions.calculatePregnancyWeeks(LMPDate));
        patientFact.setPatientId(patient_Id);
        patientFact.setPatientLMPDate(LMPDate);        
    }
	
	/* Pagination Code */
	vm.numberOfPages=function(count){	
	     return Math.ceil(count/vm.pageSize); 
    }
    
	vm.handlePrevNextClick = function(event)
	{
	  var clickButton = $(event.target).attr("data-id");
	  
		// High Risk
		if(clickButton == "highrisk-next") {
			vm.currentPageHR=vm.currentPageHR+1;
	    }else if(clickButton == "highrisk-prev") {
			vm.currentPageHR=vm.currentPageHR-1;
	    }
		
		// Medium Risk
		if(clickButton == "mediumrisk-next") {
			vm.currentPageMR=vm.currentPageMR+1;
	    }else if(clickButton == "mediumrisk-prev") {
			vm.currentPageMR=vm.currentPageMR-1;
	    }
		
		// Normal Risk
		if(clickButton == "normalrisk-next") {
			vm.currentPageNR=vm.currentPageNR+1;
	    }else if(clickButton == "normalrisk-prev") {
			vm.currentPageNR=vm.currentPageNR-1;
	    }
	}
	
	vm.customFn = function(severity) {
		if(severity == 1)
			return vm.currentPageHR*vm.pageSize;
		else if(severity == 2)
			return	vm.currentPageMR*vm.pageSize;
		else if(severity == 3)
			return vm.currentPageNR*vm.pageSize;		
	}
	
	/* Pagination Code End */

});

/* Pagination Code */
// -------------------------------------------------------------------------------------------------------
angular.module('healthMon').filter('startFrom', function() {
    return function(input, start) {	
		//console.log(input +","+ start);
        start = +start; //parse to int
        return input.slice(start);
    }
}); 