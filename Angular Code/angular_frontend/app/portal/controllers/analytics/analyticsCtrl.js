angular.module('healthMon').controller("analyticsCtrl", function($http, $window, $location, $scope, commonFunctions,graphFunctions) {
	$window.scrollTo(0, 0);
	var vm = this;
	vm.criticleCount=0;
    vm.criticleCount1=0;
    vm.criticleCount2=0;
    vm.criticleCount3=0;
    vm.criticleCount4=0;
	vm.needAttentionCount=1;
    vm.needAttentionCount1=1;
    vm.needAttentionCount2=1;
    vm.needAttentionCount3=1;
    vm.needAttentionCount4=1;
	$scope.buttonFlag=true;
    $scope.maternal=true; //for program checked
    $scope.allvil=true;//for villages checked
    $scope.highrisk=true; //for HighRisk checked
    $scope.navFlag=false;
    $scope.monthFlag=true;
    $scope.showAllQuarter=true;
    var date = new Date();
    $scope.currentYear=date.getFullYear();
    $scope.year=$scope.currentYear;
    vm.orderByColumn = "Quarterly";
    $scope.orderByColumnLabel = vm.orderByColumn;
    
    
	vm.highRiskPatientData= null;
    
    $scope.showFilterPanel = function(){
        $scope.sendVillage = [];
        $scope.sendProgram = [];
        $scope.sendParameter = [];
       //$('#filterPanel').find('input[type=checkbox]:checked').removeAttr('checked'); 
        if($scope.buttonFlag)
            $scope.buttonFlag = false;
        else
            $scope.buttonFlag = true;
    }
   
    $scope.selectedVillage = function(village, value){
        if(value){
                $scope.sendVillage.push(village);
            }else{
                var index = $scope.sendVillage.indexOf(village);
                $scope.sendVillage.splice(index, 1);
            }
    }
    $scope.selectedProgram = function(program, value){
            if(value){
                $scope.sendProgram.push(program);
            }else{
                var index = $scope.sendProgram.indexOf(program);
                $scope.sendProgram.splice(index, 1);
            }
        }
    $scope.selectedParameter = function(parameter, value){
            if(value){
                $scope.sendParameter.push(parameter);
            }else{
                var index = $scope.sendParameter.indexOf(parameter);
                $scope.sendParameter.splice(index, 1);
            }
        }
    
    $scope.sendCheckedData = function(){
        /*alert($scope.sendVillage);
        alert($scope.sendProgram);
        alert($scope.sendParameter);*/
        $scope.buttonFlag = true;
    }
	
	vm.showGraphForHRP = function(startDate,endDate){
		 $http.get("portalDashboard/getHighRiskPatients/"+startDate+"/"+endDate)
	        .then(function(response) {
	        vm.pieGraphData = Array();
	        vm.highRiskPatientData=response.data;
	         
	        vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

	        if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
	            // display div saying 'No data available'
	            vm.noPieGraphData = true;
	        }else {
	            graphFunctions.displayPieChart(vm.pieGraphData);
	            vm.overallCount=0;
	            for(var i=0;i<vm.highRiskPatientData.length;i++){
	            	if(vm.highRiskPatientData[i].OverallFlag==1)
	            		 vm.needAttentionCount=vm.highRiskPatientData[i].totalPatients;
	            	else{
	            		 vm.criticleCount=vm.highRiskPatientData[i].totalPatients;
	            	}
	            	vm.overallCount+=vm.highRiskPatientData[i].totalPatients;
	            }
	           //alert(vm.overallCount);
	        }
	    });
	};
    
    vm.showGraphForHRPPerVillage = function(villageId,startDate,endDate){
	       $http.get("portalDashboard/getHighRiskPatientsForVillage/"+villageId+"/"+startDate+"/"+endDate)
	           .then(function(response) {
                    
	               vm.pieGraphData = Array();
	               vm.highRiskPatientData=response.data;
	               vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);
	               if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
	                   vm.noPieGraphData4 = true;
	               }else {
	                   graphFunctions.displayPieChart4(vm.pieGraphData);
	                   vm.overallCount4=0;
                       vm.criticleCount4=0;
	                   for(var i=0;i<vm.highRiskPatientData.length;i++){
	            	          if(vm.highRiskPatientData[i].OverallFlag==1)
	            		         vm.needAttentionCount4=vm.highRiskPatientData[i].totalPatients;
	            	          else{
	            		         vm.criticleCount4=vm.highRiskPatientData[i].totalPatients;
	            	          }
	            	      vm.overallCount4+=vm.highRiskPatientData[i].totalPatients;
	                   }
                   }
	    });
	};
    
    vm.villages = function(startDate,endDate){
		$http.get("portalDashboard/getAllVillagesForHighRiskPatients/"+startDate+"/"+endDate)
        .then(function(response) {
            vm.villageData=response.data;
            vm.startDate=startDate;
            vm.endDate=endDate;
            vm.i=0;
			if(commonFunctions.isObjEmpty(vm.villageData)) {
				vm.noPieGraphData4 = true;
			}else {  
                    vm.showGraphForHRPPerVillage(vm.villageData[0].village,startDate,endDate);
                    $scope.villageName = vm.villageData[0].villageName;
			}
        });
	};
    
    $scope.villagePlus = function(){
        if(vm.i<vm.villageData.length-1 && vm.i>=0){
                vm.i++;
                vm.showGraphForHRPPerVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;   
        }
    };
    
    $scope.villageMinus = function(){
        if(vm.i<=vm.villageData.length && vm.i>0){
                vm.i--;
                vm.showGraphForHRPPerVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;
        }
    };
	
    vm.quarterDetails = commonFunctions.getLastFourQuarters();
    vm.pieSelectedKey = parseInt(commonFunctions.getHRPQuarterValue());
    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
    vm.selectedQuarter = "Q"+commonFunctions.getHRPQuarterValue()+"("+vm.startMonth+"-"+vm.endMonth+")";
    vm.showGraphForHRP(quarterStartEndDates[0],quarterStartEndDates[1]);
    vm.villages(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    vm.showGraphForHRP1 = function(startDate,endDate){
    	   $http.get("portalDashboard/getHighRiskPatients/"+startDate+"/"+endDate)
	        .then(function(response) {
	        vm.pieGraphData = Array();
	        vm.highRiskPatientData=response.data;
	         
	        vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

	        if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
	            // display div saying 'No data available'
	            vm.noPieGraphData1 = true;
	        }else {
	            graphFunctions.displayPieChart1(vm.pieGraphData);
	            vm.overallCount1=0;
	            for(var i=0;i<vm.highRiskPatientData.length;i++){
	            	if(vm.highRiskPatientData[i].OverallFlag==1)
	            		 vm.needAttentionCount1=vm.highRiskPatientData[i].totalPatients;
	            	else{
	            		 vm.criticleCount1=vm.highRiskPatientData[i].totalPatients;
	            	}
	            	vm.overallCount1+=vm.highRiskPatientData[i].totalPatients;
	            }
	           //alert(vm.overallCount);
	        }
	    });
    };
    
    vm.showGraphForHRP2 = function(startDate,endDate){
    	   $http.get("portalDashboard/getHighRiskPatients/"+startDate+"/"+endDate)
	        .then(function(response) {
	        vm.pieGraphData = Array();
	        vm.highRiskPatientData=response.data;
	         
	        vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

	        if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
	            // display div saying 'No data available'
	            vm.noPieGraphData2 = true;
	        }else {
	            graphFunctions.displayPieChart2(vm.pieGraphData);
	            vm.overallCount2=0;
	            for(var i=0;i<vm.highRiskPatientData.length;i++){
	            	if(vm.highRiskPatientData[i].OverallFlag==1)
	            		 vm.needAttentionCount2=vm.highRiskPatientData[i].totalPatients;
	            	else{
	            		 vm.criticleCount2=vm.highRiskPatientData[i].totalPatients;
	            	}
	            	vm.overallCount2+=vm.highRiskPatientData[i].totalPatients;
	            }
	           //alert(vm.overallCount);
	        }
	    });
    };
    
    vm.showGraphForHRP3 = function(startDate,endDate){
    	   $http.get("portalDashboard/getHighRiskPatients/"+startDate+"/"+endDate)
	        .then(function(response) {
	        vm.pieGraphData = Array();
	        vm.highRiskPatientData=response.data;
	         
	        vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

	        if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
	            // display div saying 'No data available'
	            vm.noPieGraphData3 = true;
	        }else {
	            graphFunctions.displayPieChart3(vm.pieGraphData);
	            vm.overallCount3=0;
	            for(var i=0;i<vm.highRiskPatientData.length;i++){
	            	if(vm.highRiskPatientData[i].OverallFlag==1)
	            		 vm.needAttentionCount3=vm.highRiskPatientData[i].totalPatients;
	            	else{
	            		 vm.criticleCount3=vm.highRiskPatientData[i].totalPatients;
	            	}
	            	vm.overallCount3+=vm.highRiskPatientData[i].totalPatients;
	            }
	           //alert(vm.overallCount);
	        }
	    });
    };
    
	vm.monthlyGraphs = function(){
                    var quarterStartEndDates =     commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    $scope.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    $scope.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    var d=new Date(quarterStartEndDates[0]);
                    var startDate=quarterStartEndDates[0];
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 0)).format('YYYY-MM-DD');
                    $scope.month1=commonFunctions.getMonthName(startDate);
                    vm.showGraphForHRP1(startDate,endDate);
                    vm.villages(startDate,endDate);
                    $scope.month = commonFunctions.getMonthName(startDate);
                    $scope.firstDate = moment(new Date(d.getFullYear(), d.getMonth(), 1)).format('YYYY-MM-DD');
                
                    
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
                    $scope.month2=commonFunctions.getMonthName(startDate);
                    vm.showGraphForHRP2(startDate,endDate);
                
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD'); 
                    $scope.month3=commonFunctions.getMonthName(startDate);
        
                    vm.selectedQuarter = "Q"+vm.pieSelectedKey+"("+$scope.month1+"-"+$scope.month3+")";
                    vm.showGraphForHRP3(startDate,endDate);
                    $scope.lastDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD');
        
    };
    
    $scope.monthMinus = function(){
        if(vm.startDate > $scope.firstDate &&  vm.endDate <= $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()-1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth(), 0)).format('YYYY-MM-DD');
            vm.noPieGraphData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);
        }
    };
    
    $scope.monthPlus = function(){
        if(vm.startDate >= $scope.firstDate &&  vm.endDate < $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
            vm.noPieGraphData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);  
        }
    };
    
    vm.allQuarterGraphs = function(){
                    vm.quarterDetails = commonFunctions.getLastFourQuarters();
                    vm.pieSelectedKey = 1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter1 = "Q"+vm.pieSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForHRP(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.pieSelectedKey = vm.pieSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter2 = "Q"+vm.pieSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForHRP1(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.pieSelectedKey = vm.pieSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter3 = "Q"+vm.pieSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForHRP2(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.pieSelectedKey = vm.pieSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter4 = "Q"+vm.pieSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForHRP3(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    };
    
    vm.oneQuarterGraph = function(){
                    var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    vm.selectedQuarter = "Q"+vm.pieSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForHRP(quarterStartEndDates[0],quarterStartEndDates[1]);
                    vm.villages(quarterStartEndDates[0],quarterStartEndDates[1]);
    };
    
    $scope.periodFunction = function(orderByVal){
            vm.orderByColumn = orderByVal;
        if(orderByVal == "Monthly"){
                    $scope.orderByColumnLabel = "Monthly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noPieGraphData1 = false;
                    vm.noPieGraphData2 = false;
                    vm.noPieGraphData3 = false;
                    vm.noPieGraphData4 = false;
                    vm.pieSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.monthlyGraphs();
                
        }
        if(orderByVal == "Quarterly"){
                    $scope.orderByColumnLabel = "Quarterly";
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.showAllQuarter=true;
                    $scope.year = $scope.currentYear;
                    vm.noPieGraphData = false;
                    vm.noPieGraphData1 = false;
                    vm.noPieGraphData2 = false;
                    vm.noPieGraphData3 = false;
                    vm.noPieGraphData4 = false;
                    vm.pieSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.oneQuarterGraph();
        }
        if(orderByVal == "Yearly"){
                    $scope.orderByColumnLabel = "Yearly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.year = $scope.currentYear;
                    vm.noPieGraphData = false;
                    vm.noPieGraphData1 = false;
                    vm.noPieGraphData2 = false;
                    vm.noPieGraphData3 = false;
                    vm.noPieGraphData4 = false;
                    var date = new Date();
                    var startDate = moment(new Date(date.getFullYear(), 00, 01)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(date.getFullYear(), 11, 31)).format('YYYY-MM-DD');
                    vm.startMonth =commonFunctions.getMonthName(startDate);
                    vm.endMonth = commonFunctions.getMonthName(endDate);
                    vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForHRP(startDate,endDate);
                    vm.villages(startDate,endDate);
        }
    };
    
    $scope.changeQuaterMinus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.pieSelectedKey>1){
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        vm.pieSelectedKey = vm.pieSelectedKey-1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.pieSelectedKey>1){
                        
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        vm.pieSelectedKey = vm.pieSelectedKey-1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year >= date.getFullYear()){
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        $scope.year = $scope.year-1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForHRP(startDate,endDate);
                        vm.villages(startDate,endDate);
                        
                }
        
    };
    
    $scope.changeQuaterPlus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.pieSelectedKey<4){
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        vm.pieSelectedKey = vm.pieSelectedKey+1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.pieSelectedKey<4){
                       
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        vm.pieSelectedKey = vm.pieSelectedKey+1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year <= date.getFullYear()){
                        vm.noPieGraphData = false;
                        vm.noPieGraphData1 = false;
                        vm.noPieGraphData2 = false;
                        vm.noPieGraphData3 = false;
                        vm.noPieGraphData4 = false;
                        $scope.year = $scope.year+1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForHRP(startDate,endDate);
                        vm.villages(startDate,endDate);
                }
    };
    
    $scope.showAllQuarters = function(){
            if($scope.showAllQuarter){
                    $scope.showAllQuarter=false;
                    $scope.monthFlag=true;
                    $scope.navFlag=true;
                    vm.selectedQuarter = "Q1 to Q4";
                    vm.noPieGraphData = false;
                    vm.noPieGraphData1 = false;
                    vm.noPieGraphData2 = false;
                    vm.noPieGraphData3 = false;
                    vm.noPieGraphData4 = false;
                    vm.allQuarterGraphs();
                
            }
            else{
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noPieGraphData = false;
                    vm.noPieGraphData1 = false;
                    vm.noPieGraphData2 = false;
                    vm.noPieGraphData3 = false;
                    vm.noPieGraphData4 = false;
                    vm.oneQuarterGraph();
            }
        };
    
    vm.formatPieGraphData = function(highRiskPatientData) {
        var patients = Object();

        if(highRiskPatientData.length > 0) {
            var normalPatients = Array();
            var highRiskPatients = Array();
            patients['normal'] = Object();
            patients['risk'] = Object();

            for(var i=0; i<highRiskPatientData.length; i++) {
                if(highRiskPatientData[i].OverallFlag == 0 || highRiskPatientData[i].OverallFlag == 1) {
                    normalPatients.push(highRiskPatientData[i].totalPatients);
                }else {
                    highRiskPatients.push(highRiskPatientData[i].totalPatients);
                }
            }
            normalPatientCount = _.reduce(normalPatients, function(memo, num){ return memo + num; }, 0);

            if(normalPatientCount > 0) {
                patients['normal'] = ['Normal Patients', normalPatientCount];
            }

            if(highRiskPatients[0] > 0) {
                patients['risk'] = ['High Risk Patients', highRiskPatients[0]];
            }
        }
        return patients;
    };
	

});