angular.module('healthMon').controller("patientCareplanCtrl",function($rootScope,$http,$state,patientFact,
                                                                       authFact,moment,commonFunctions) {
    var vm = this;
   
    $rootScope.list=[];
    $rootScope.patientCareplan =Object();
    var tempCareplan=Object();
    
    vm.patientId=patientFact.getPatientId();
    vm.severity=localStorage.getItem('severity');
    vm.PregnancyWeeks=localStorage.getItem('PregnancyWeeks');

    
    if(localStorage.getItem("AddedCarePlanList"))
        $rootScope.list=JSON.parse(localStorage.getItem("AddedCarePlanList"));
   
    
   
    vm.categoryList=['Condition Specific Care Management','Vaccines','Self Management',
                      'Medication Adherence','General Care','LabsScreening'];
        
    //All required data fetched related to patient and stored in scope.
   
     $http.get("patient/getPatientProgramInfo/"+vm.patientId).then(function(response) {
        var patientProgramInfo = response.data;

        if(patientProgramInfo.length > 0) {
        vm.LMPDate =moment(patientProgramInfo[0].Program_item_value).format('DD/MM/YYYY');
        vm.EDD = moment(patientProgramInfo[1].Program_item_value).format('DD/MM/YYYY');
            
        }
    });
    $http.get("patient/getPatientBPInfo/"+vm.patientId).then(function(response) {
        
        for(var i in response.data)
            for(var j in response.data[i]){
        
            if(response.data[i][j].Device_Attribute_Name=='hm_systolic')
              vm.HMsystolic=response.data[i][j].Device_Attributes_value;
              
            if(response.data[i][j].Device_Attribute_Name=='hm_diastolic')
                vm.HMdiastolic=response.data[i][j].Device_Attributes_value;
        }
    });
    $http.get("patient/getPatientVitals/"+vm.patientId).then(function(response) {
        for(var i in response.data){
            for(j in response.data[i]){
             if(response.data[i][j].Vital_Name=='Weight')
              vm.weight=response.data[i][j].Vital_value;
             }
        }
    });
    
    $http.get("patient/getPatientPersonalInfo/"+vm.patientId).then(function(response) {
        if(response.data.length>0){
        vm.firstname=response.data[0].Patient_FName;
        vm.lastname=response.data[0].Patient_LName;
        vm.contact=response.data[0].Patient_Contact;
            
        }
    });
    vm.HMhb==null
    $http.get("patient/getPatientHB/"+vm.patientId).then(function(response) {
       
         for(var i in response.data)
            for(var j in response.data[i]){
               
            if(response.data[i][j].Device_Attribute_Name=='hb' &&  vm.HMhb==null)
              vm.HMhb=response.data[i][j].Device_Attributes_value;
        }
    });
      
    $http.get("common/getPatientCareplan/"+vm.patientId).then(function(response) {
         
        $rootScope.patientCarePlanInfo = response.data.patientCarePlan;
        var data = commonFunctions.groupByArrayOfObjects($rootScope.patientCarePlanInfo, 'Category_Desc');
       for(var key in data) {
           
            var key1 = data[key]['categoryKey'];
            if(data[key]['data'][0].Approved==1)
                patientFact.setcareplanApprovedstatus(true);
           else
                patientFact.setcareplanApprovedstatus(false);
           
           vm.approved=patientFact.getcareplanApprovedstatus();
           
            for(var i in data[key]['data']){
             tempCareplan[key1]=data[key]['data'];
            }
            
        }
         var data = commonFunctions.groupByArrayOfObjects($rootScope.list, 'Category_Desc');
        for(var key in data) {
            var key1 = data[key]['categoryKey'];
            var array=[];
             
            for(var i in $rootScope.patientCareplan[key1])
                array.push($rootScope.patientCareplan[key1][i]);
               
            var j=0;
            for(j in data[key]['data']){
              array.push(data[key]['data'][j]);
                
            }
            tempCareplan[key1]=array;
        }
        if(localStorage.getItem('patientcareplan')==''){
             $rootScope.patientCareplan=tempCareplan;
             localStorage.setItem("patientcareplan",JSON.stringify($rootScope.patientCareplan)); 
        }
        else{
             $rootScope.patientCareplan=JSON.parse(localStorage.getItem("patientcareplan"));
          
            if($rootScope.previousState=='patientCareplan.editcareplan'){
                 vm.approved=false;
              var temp=[];
            for(var key1 in vm.categoryList){
            var array1=[];
                 for(var i in $rootScope.patientCareplan[vm.categoryList[key1]]){
                     $rootScope.patientCareplan[vm.categoryList[key1]][i].Approved=0;
                    temp.push($rootScope.patientCareplan[vm.categoryList[key1]][i]);
                }
              }
                 if(temp.length==0)
                   alert('No carePlan to save');
                else
                  $http({
				    method: 'POST',
				    url:'/common/setPatientCareplan/'+vm.patientId,
				   data : temp
			      }).then(function (response) {
         
          
               });
            }
        }
    }); 
   
    vm.approveCareplan=function(){
         var temp=[];
        for(var key1 in vm.categoryList){
            var array1=[];
                 for(var i in $rootScope.patientCareplan[vm.categoryList[key1]]){
                     $rootScope.patientCareplan[vm.categoryList[key1]][i].Approved=1;
                    temp.push($rootScope.patientCareplan[vm.categoryList[key1]][i]);
                }
        }
        if(temp.length==0)
            alert('No carePlan for approval');
        else
        $http({
				method: 'POST',
				url:'/common/setPatientCareplan/'+vm.patientId,
				data : temp
			}).then(function (response) {
         
          
        });
        vm.approved=true;
        patientFact.setcareplanApprovedstatus(vm.approved);
        $rootScope.list=[];
        localStorage.setItem("AddedCarePlanList",JSON.stringify($rootScope.list));
    }
    vm.medications=[];
    vm.addMedication=function(){
      
        vm.medications.push({selectedDrug :vm.selectedDrug,quantity : vm.quantity,frequency : 
                             vm.frequency});
    
    }
 
});
    angular.module('healthMon').controller("editCareplanCtrl",function($rootScope,$http,$state,$timeout,                                         patientFact,authFact,moment,commonFunctions) {
        var vm = this;
        vm.selectedCategory='';
        vm.selectedTask='';
        vm.selectedFrequency=''; 
        vm.selectedRole='';
    
        vm.categoryList=['Condition Specific Care Management','Vaccines','Self Management',
                      'Medication Adherence','General Care','LabsScreening'];
        
        vm.taskList=['Measure Heamoglobin(Hb)','TT1','TT2','Sleep for 9 hours','Calcium','IFA','Drink 2 glass of milk','Measure Girth','Measure SpO2','Visit HPV (Once)','Eat Fresh Fruits','Take Medications','Measure BP','Visit Podiatrist','Visit Ophthalmologist','Schedule an appointment for EKG','Do albumin and creatinine test','Take appointment for Egfr','Do LDL test','Do Flu Vaccination','Visit provider for Pneumovax','Create Diet Plan','Review foot inspection'];
        
        
        vm.frequencyList=['Once','Daily','Weekly','Bi-weekly','Quarterly','Annually'];
        
        vm.roleList=['asha','ANM','MO','HO','Patient'];

        $rootScope.list=[];
        $rootScope.patientCareplan =Object();
        $rootScope.suggestions=null;  
      
        patientFact.setcareplanApprovedstatus(false);
        $rootScope.list=JSON.parse(localStorage.getItem("AddedCarePlanList"));
        $rootScope.patientCareplan=JSON.parse(localStorage.getItem("patientcareplan"));
        
    vm.selectCategory=function(Category_Desc){
        vm.displaytaskList=[];
        vm.selectedCategory=Category_Desc;
        vm.selectedTask=''; 
        
         $http.get("common/getTasksAccordingTocategory/"+vm.selectedCategory).then(function(response) {
              
             for(var i in response.data)
                 vm.displaytaskList.push(response.data[i].Template_Task_Desc);
                  
         });
        
    }
            
    vm.deleteOneTask=function(Category_Desc1,Template_Task_Desc1,Frequency_Desc1,role1){     
       
	    var currentdate = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
        var delete_task={Category_Desc:Category_Desc1,Template_Task_Desc:Template_Task_Desc1,
                  role:role1,Frequency_Desc:Frequency_Desc1,MedicineGivenBy_User_Name:''};
        var checktask=false;
   
        for(var i=0;i<$rootScope.list.length;i++){
            if($rootScope.list[i].Category_Desc.toLowerCase()==delete_task.Category_Desc.toLowerCase() &&  
               $rootScope.list[i].Template_Task_Desc.toLowerCase()==delete_task.Template_Task_Desc.toLowerCase() && 
               $rootScope.list[i].role.toLowerCase()==delete_task.role.toLowerCase() &&
               $rootScope.list[i].Frequency_Desc.toLowerCase()==delete_task.Frequency_Desc.toLowerCase()){
      
               var removed=$rootScope.list.splice( i, 1 );
                i--;
                checktask=true;
                 
            }
        } 
       // var data = commonFunctions.groupByArrayOfObjects($rootScope.patientCarePlanInfo, 'Category_Desc');
            for(var key1 in vm.categoryList) {
          
           // var key1 = data[key]['categoryKey'];
            var array=[];
            
                for(var i in $rootScope.patientCareplan[vm.categoryList[key1]]){
                    array.push($rootScope.patientCareplan[vm.categoryList[key1]][i]);
                  
                    if($rootScope.patientCareplan[vm.categoryList[key1]]
                      [i].Category_Desc.toLowerCase()==delete_task.Category_Desc.toLowerCase() &&  
                      $rootScope.patientCareplan[vm.categoryList[key1]]
                      [i].Template_Task_Desc.toLowerCase()==delete_task.Template_Task_Desc.toLowerCase() && 
                      $rootScope.patientCareplan[vm.categoryList[key1]][i].role.toLowerCase()==delete_task.role.toLowerCase() 
                       &&
                      $rootScope.patientCareplan[vm.categoryList[key1]]
                      [i].Frequency_Desc.toLowerCase()==delete_task.Frequency_Desc.toLowerCase())
                    
                    array.pop();
                }
                $rootScope.patientCareplan[vm.categoryList[key1]]=array;
                localStorage.setItem("patientcareplan",JSON.stringify($rootScope.patientCareplan));
            }
            
            localStorage.setItem("AddedCarePlanList",JSON.stringify($rootScope.list));
    }
    
    vm.deleteAllNewAddedTasks=function(){
        vm.patientId=patientFact.getPatientId();
        $rootScope.patientCareplan=JSON.parse(localStorage.getItem('patientcareplan'));
        $rootScope.list=JSON.parse(localStorage.getItem("AddedCarePlanList"));
         
            for(var i in $rootScope.list){
                for(var key1 in vm.categoryList) {
                  var array=[];
                    for(var j in $rootScope.patientCareplan[vm.categoryList[key1]]){
                        if($rootScope.patientCareplan[vm.categoryList[key1]]  
                           [j].Category_Desc.toLowerCase()==
                           $rootScope.list[i].Category_Desc.toLowerCase() &&  
                           $rootScope.patientCareplan[vm.categoryList[key1]]
                           [j].Template_Task_Desc.toLowerCase()==
                           $rootScope.list[i].Template_Task_Desc.toLowerCase() && 
                           $rootScope.patientCareplan[vm.categoryList[key1]]
                           [j].role.toLowerCase()==$rootScope.list[i].role.toLowerCase() &&
                           $rootScope.patientCareplan[vm.categoryList[key1]]
                           [j].Frequency_Desc.toLowerCase()==
                           $rootScope.list[i].Frequency_Desc.toLowerCase()){
                     
                        }
                        else
                            array.push($rootScope.patientCareplan[vm.categoryList[key1]][j]);
                    }
                    $rootScope.patientCareplan[vm.categoryList[key1]]=array;
                
                }
            }
            $rootScope.list=[];
            localStorage.setItem("AddedCarePlanList",JSON.stringify($rootScope.list));
            localStorage.setItem("patientcareplan",JSON.stringify($rootScope.patientCareplan)); 
    }
    $rootScope.addTask=function(task){                     
	  var currentdate = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
        var t_id;
        if(vm.selectedCategory=='Condition Specific Care Management' || vm.selectedCategory=='Vaccines' || vm.selectedCategory=='Self Management' || vm.selectedCategory=='Medication Adherence')
        t_id=1;
        else
         t_id=3;   
     
        
        if(task==null)
        var task={Template_id:t_id,Created_By:
                  authFact.getUserObj('UserObj').HM_User_id,Created_Date:currentdate,Updated_By:authFact.getUserObj('UserObj').HM_User_id,Updated_Date:currentdate,Category_Desc:vm.selectedCategory,Template_Task_Desc:vm.selectedTask,
                  role:vm.selectedRole,Frequency_Desc:vm.selectedFrequency,MedicineGivenBy_User_Name:'',
                  Approved:0};
        
        var checktask=false;
        for(var i in $rootScope.list){
            if($rootScope.list[i].Category_Desc.toLowerCase()==task.Category_Desc.toLowerCase() &&  
               $rootScope.list[i].Template_Task_Desc.toLowerCase()==task.Template_Task_Desc.toLowerCase() && 
               $rootScope.list[i].role.toLowerCase()==task.role.toLowerCase() &&
               $rootScope.list[i].Frequency_Desc.toLowerCase()==task.Frequency_Desc.toLowerCase()){
                  alert('Duplicate Task');
                 checktask=true;
                 
            }
        } 
        
        if(task.Category_Desc=='' || task.Template_Task_Desc=='' || task.role=='' || task.Frequency_Desc==''){
            alert('select the all dropdowns');
        }
        else{
        if($rootScope.list.length==0 || checktask==false){
            $rootScope.list.push(task);
            //var data = commonFunctions.groupByArrayOfObjects($rootScope.patientCarePlanInfo, 
                                                             //'Category_Desc', '');
            for(var key1 in vm.categoryList) {
          
                //var key1 = data[key]['newArrKeyName1'];
                var array=[];
                checktask=false;
                 
                for(var i in $rootScope.patientCareplan[vm.categoryList[key1]]){
                   
                    array.push($rootScope.patientCareplan[vm.categoryList[key1]][i]);
                    if($rootScope.patientCareplan[vm.categoryList[key1]]
                     [i].Category_Desc.toLowerCase()==task.Category_Desc.toLowerCase() &&  
                      $rootScope.patientCareplan[vm.categoryList[key1]]
                      [i].Template_Task_Desc.toLowerCase()==task.Template_Task_Desc.toLowerCase() && 
                      $rootScope.patientCareplan[vm.categoryList[key1]]
                       [i].role.toLowerCase()==task.role.toLowerCase() &&
                      $rootScope.patientCareplan[vm.categoryList[key1]]
                      [i].Frequency_Desc.toLowerCase()==task.Frequency_Desc.toLowerCase()){
                        checktask=true;
                        alert('Duplicate Task for patientCareplan');
                    }
                }
              
                if(checktask==false){
                   
                    if(vm.categoryList[key1]==task.Category_Desc)
                    array.push(task);
                }
                $rootScope.patientCareplan[vm.categoryList[key1]]=array;
               
            }
        }
        }
        
              localStorage.setItem("AddedCarePlanList",JSON.stringify($rootScope.list));
               localStorage.setItem("patientcareplan",JSON.stringify($rootScope.patientCareplan)); 
         vm.selectedCategory='';
        vm.selectedTask='';
        vm.selectedFrequency=''; 
        vm.selectedRole='';
    }
    
  });
  angular.module('healthMon').controller("addcareplantemplatesCtrl",function($rootScope,$http,$state,$timeout,                                         patientFact,authFact,moment,commonFunctions) {
    var vm = this;
   
    vm.selectedTemplate=null;
    $rootScope.displayTemplate=Object();  
    vm.displaySelectedTemplate=function(){
        
    if($rootScope.previouslyselectedTemplate!=null &&  
       $rootScope.previouslyselectedTemplate==vm.selectedTemplate)
        alert('Duplicate Care Plan is not allowed');
    else
        
    if(vm.selectedTemplate==null)
        alert('select the template..');
    else{
         $rootScope.previouslyselectedTemplate= vm.selectedTemplate;
        $http.get("common/getCareplanTemplate/"+vm.selectedTemplate).then(function(response) {
        vm.templatedata=response.data;
        $rootScope.displayTemplate=Object();         
        var data = commonFunctions.groupByArrayOfObjects(vm.templatedata, 'Category_Desc');
           
        for(var key in data) {
           
            var key1 = data[key]['categoryKey'];
            
            for(var i in data[key]['data'])
           $rootScope.displayTemplate[key1]=data[key]['data'];
          
         }
                 
        });
      }
    }
    
    vm.removeSelectedTemplate=function(){
        $rootScope.displayTemplate=Object();        
        
    }
    vm.addSelectedTemplate=function(){
         if(vm.selectedTemplate==null)
            alert('select the template..');
         else
         {
        var data = commonFunctions.groupByArrayOfObjects(vm.templatedata, 'Category_Desc');
             var currentdate = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
        for(var key in data) {
           
            var key1 = data[key]['categoryKey'];
            
            for(var i in  $rootScope.displayTemplate[key1]){
                var task={Template_id:$rootScope.displayTemplate[key1][i].Template_id,Created_By:
                  authFact.getUserObj('UserObj').HM_User_id,Created_Date:currentdate,Updated_By: authFact.getUserObj('UserObj').HM_User_id,
                  Updated_Date:currentdate,Category_Desc:$rootScope.displayTemplate[key1][i].Category_Desc,Template_Task_Desc:$rootScope.displayTemplate[key1][i].Template_Task_Desc,
                  role:$rootScope.displayTemplate[key1][i].role,Frequency_Desc:$rootScope.displayTemplate[key1][i].Frequency_Desc,MedicineGivenBy_User_Name:'',
                  Approved:0};
                
               $rootScope.addTask(task);
            }
         }
        
          } 
        
    }
      
  });

angular.module('healthMon').controller("patientDemographicsCtrl",function($http,authFact,patientFact) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientPersonalInfo/"+vm.patientId).then(function(response) {
        vm.patientPersonalInfo = response.data;
        if(vm.patientPersonalInfo.length > 0) {
            vm.patientPersonalInfo[0].Patient_DOB = moment(vm.patientPersonalInfo[0].Patient_DOB).format('DD/MM/YYYY');
            if(vm.patientPersonalInfo[0].Patient_BPL == 1) {
                vm.patientPersonalInfo[0].Patient_BPL = 'Yes';
            }else {
                vm.patientPersonalInfo[0].Patient_BPL = 'No';
            }

            if(vm.patientPersonalInfo[0].Patient_Ward == "null") {
                vm.patientPersonalInfo[0].Patient_Ward = '-';
            }
            
            if(vm.patientPersonalInfo[0].Address_line2 == "") {
                vm.patientPersonalInfo[0].Address_line2 = '-';
            }
        }
    });
});

angular.module('healthMon').controller("patientFamilyInfoCtrl",function($http,authFact,patientFact,moment) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientFamilyInfo/"+vm.patientId).then(function(response) {
        vm.patientFamilyInfo = response.data;
        for(var i = 0; i < vm.patientFamilyInfo.length; i++) {
            vm.patientFamilyInfo[i].Date_Of_Birth = moment(vm.patientFamilyInfo[i].Date_Of_Birth).format('DD/MM/YYYY');
        }
    });
});

angular.module('healthMon').controller("patientEligibilityCtrl",function($http,authFact,patientFact) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientProgramInfo/"+vm.patientId).then(function(response) {
        vm.patientProgramInfo = response.data;

        if(vm.patientProgramInfo.length > 0) {
            vm.patientProgramInfo[0].Program_item_value = moment(vm.patientProgramInfo[0].Program_item_value).format('DD/MM/YYYY');
            vm.patientProgramInfo[1].Program_item_value = moment(vm.patientProgramInfo[1].Program_item_value).format('DD/MM/YYYY');
            
            if(vm.patientProgramInfo[2].Program_item_value) {
                vm.patientProgramInfo[2].Program_item_value = 'Yes';
            }else {
                vm.patientProgramInfo[2].Program_item_value = 'No';
            }
        }
    });
});

angular.module('healthMon').controller("patientMedicationCtrl",function($http,authFact,patientFact,moment) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("common/getPatientCareplan/"+vm.patientId).then(function(response) {
        vm.patientMedicationInfo = response.data;
        vm.medicationData = Object();
        var cnt = 0;

        for(var key in vm.patientMedicationInfo) {
            for(var i=0; i<vm.patientMedicationInfo[key].length; i++) {
                if(key == 'patientCarePlan') {
                    if(vm.patientMedicationInfo[key][i].Category_Desc == "Medication Adherence") {
                        vm.medicationData[cnt] = {'created_date' : moment(vm.patientMedicationInfo[key][i].Created_Date).format('DD MMM YYYY'), 'drug_name' : vm.patientMedicationInfo[key][i].Template_Task_Desc, 'medicine_qty' : vm.patientMedicationInfo[key][i].Frequency_Desc, 'created_by' : vm.patientMedicationInfo[key][i].MedicineGivenBy_User_Name, 'phc' : vm.patientMedicationInfo[key][i].PHC};
                        cnt++;
                    }
                }
                if(key == 'medication') {
                    if(vm.patientMedicationInfo[key][i].DrugForm == "tablet" || vm.patientMedicationInfo[key][i].DrugForm == "capsule") {
                        vm.medicationData[cnt] = {'created_date' : moment(vm.patientMedicationInfo[key][i].Created_Date).format('DD MMM YYYY'), 'drug_name' : vm.patientMedicationInfo[key][i].DrugName, 'medicine_qty' : vm.patientMedicationInfo[key][i].Medicine_Qty, 'created_by' : vm.patientMedicationInfo[key][i].User_Name, 'phc' : vm.patientMedicationInfo[key][i].PHC};
                        cnt++;
                    }
                }
            }
        }
    });
});

angular.module('healthMon').controller("patientImmunizationCtrl",function($http,authFact,patientFact,moment) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("common/getPatientCareplan/"+vm.patientId).then(function(response) {
        vm.patientImmunizationInfo = response.data;
        vm.immunizationData = Object();
        var cnt = 0;

        for(var key in vm.patientImmunizationInfo) {
            for(var i=0; i<vm.patientImmunizationInfo[key].length; i++) {
                if(key == 'patientCarePlan') {
                    if(vm.patientImmunizationInfo[key][i].Category_Desc == "Vaccines") {
                        vm.immunizationData[cnt] = {'created_date' : moment(vm.patientImmunizationInfo[key][i].Created_Date).format('DD MMM YYYY'), 'drug_name' : vm.patientImmunizationInfo[key][i].Template_Task_Desc, 'medicine_qty' : vm.patientImmunizationInfo[key][i].Frequency_Desc, 'created_by' : vm.patientImmunizationInfo[key][i].MedicineGivenBy_User_Name, 'phc' : vm.patientImmunizationInfo[key][i].PHC};
                        cnt++;
                    }
                }
                if(key == 'medication') {
                    if(vm.patientImmunizationInfo[key][i].DrugForm == "injection") {
                        vm.immunizationData[cnt] = {'created_date' : moment(vm.patientImmunizationInfo[key][i].Created_Date).format('DD MMM YYYY'), 'drug_name' : vm.patientImmunizationInfo[key][i].DrugName, 'medicine_qty' : vm.patientImmunizationInfo[key][i].Medicine_Qty, 'created_by' : vm.patientImmunizationInfo[key][i].User_Name, 'phc' : vm.patientImmunizationInfo[key][i].PHC};
                        cnt++;
                    }
                }
            }
        }
    });
});

angular.module('healthMon').controller("patientVitalsCtrl",function($http,authFact,patientFact,commonFunctions) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientVitals/"+vm.patientId).then(function(response) {
        vm.vitalsInfo = Object();
        vm.patientVitalsInfo = response.data;
        var cnt = 0;

        for (var key in vm.patientVitalsInfo) {
            vm.vitalsInfo[cnt] = Object();
            for(var i=0; i<Object.keys(vm.patientVitalsInfo[key]).length; i++) {
                var objKey = vm.patientVitalsInfo[key][i].Vital_Name;
                vm.vitalsInfo[cnt][objKey] = vm.patientVitalsInfo[key][i].Vital_value;
                vm.vitalsInfo[cnt]['Created_Date'] = vm.patientVitalsInfo[key][i].Created_Date;
            }
            vm.vitalsInfo[cnt]['Created_Date'] = moment(vm.vitalsInfo[cnt]['Created_Date']).format('DD MMM YYYY');
            cnt++;
        }
    });
});

angular.module('healthMon').controller("patientCarePlanCtrl",function($http,authFact,patientFact,commonFunctions) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();
    vm.carePlanDisplayData = Object();

    $http.get("common/getPatientCareplan/"+vm.patientId).then(function(response) {
        vm.patientCarePlanInfo = response.data.patientCarePlan;
        var data = commonFunctions.groupByArrayOfObjects(vm.patientCarePlanInfo, 'Category_Desc');

        for(var key in data) {
            var key1 = data[key]['categoryKey'];
            for(var i=0; i<data[key]['data'].length; i++) {
                data[key]['data'][i]['Created_Date'] = moment(data[key]['data'][i]['Created_Date']).format('DD MMM YYYY');
            }
            vm.carePlanDisplayData[key1] = data[key]['data'];
        }
    });
});

angular.module('healthMon').controller("patientHRACtrl",function($http,authFact,patientFact) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientHRA/"+vm.patientId+"/1").then(function(response) {
        vm.patientHRAInfo = response.data;
    });
});

angular.module('healthMon').controller("patientFeedbackCtrl",function($http,authFact,patientFact,commonFunctions) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientFeedback/"+vm.patientId+"/1").then(function(response) {
        if(response.data.length > 0) {
            vm.patientFeedbackInfo = commonFunctions.groupByArrayOfObjects(response.data, 'Survey_Question_Category');
        }
    });
});

angular.module('healthMon').controller("patientAllergiesCtrl",function($http,authFact,patientFact,commonFunctions) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("patient/getPatientAllergies/"+vm.patientId).then(function(response) {
        vm.patientAllergiesInfo = commonFunctions.groupByArrayOfObjects(response.data, 'AllergyTypeName');
        for(var key in vm.patientAllergiesInfo) {
            for(var i=0; i<vm.patientAllergiesInfo[key].data.length; i++) {
                vm.patientAllergiesInfo[key].data[i].Start_Date = moment(vm.patientAllergiesInfo[key].data[i].Start_Date).format('DD MMM YYYY');
                if(vm.patientAllergiesInfo[key].data[i].Resolved_Date) {
                    vm.patientAllergiesInfo[key].data[i].Resolved_Date = moment(vm.patientAllergiesInfo[key].data[i].Resolved_Date).format('DD MMM YYYY');
                }else {
                    vm.patientAllergiesInfo[key].data[i].Resolved_Date = '-';
                }
            }
        }
    });
});

angular.module('healthMon').controller("patientDiagnosisCtrl",function($http,authFact,patientFact,commonFunctions) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("common/getPatientdiagnosis/"+vm.patientId).then(function(response) {
        vm.patientDiagnosisData = response.data;
    });
});

angular.module('healthMon').controller("patientVisitHistoryCtrl",function($http,patientFact) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();

    $http.get("portalDashboard/getPatientVisitHistory/"+vm.patientId).then(function(response) {
        vm.patientVisitHistoryData = response.data;
    });
});