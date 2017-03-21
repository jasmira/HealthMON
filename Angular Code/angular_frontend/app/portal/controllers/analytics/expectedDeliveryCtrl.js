angular.module('healthMon').controller("expectedDeliveryCtrl", function($window,$http,$location,$scope,$timeout,commonFunctions,graphFunctions) {
	$window.scrollTo(0, 0);
	var vm = this;
    
    $scope.buttonFlag=true;
    $scope.maternal=true; //for program checked
    $scope.allvil=true;//for villages checked
    $scope.expected=true; //for EDD checked
    $scope.navFlag=false;
    $scope.monthFlag=true;
    $scope.showAllQuarter=true;
    var date = new Date();
    $scope.currentYear=date.getFullYear();
    $scope.year=$scope.currentYear;
    vm.orderByColumn = "Quarterly";
    $scope.orderByColumnLabel = vm.orderByColumn;
	vm.noHorizontalGraphData = false;
    
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
    
    
    vm.showGraphForEDD = function(startDate,endDate){
	 var xWidth = 400;
	 var yHeight = 290;
		$http.get("portalDashboard/getPatientsEDDForDuration/"+startDate+"/"+endDate)
        .then(function(response) {
			 vm.patientEDData=response.data; 
			if(commonFunctions.isObjEmpty(vm.patientEDData)) {
				// display div saying 'No EDD data available'
				vm.noHorizontalGraphData = true;
			}else { 
				 graphFunctions.displayHorizontalBarChart(vm.patientEDData,xWidth,yHeight);
			}
        });
	};
    
    vm.showGraphForEDDPerVillage = function(villageId,startDate,endDate){
	 var xWidth = 400;
	 var yHeight = 290;
		$http.get("portalDashboard/getPatientsEDDPerVillage/"+villageId+"/"+startDate+"/"+endDate)
        .then(function(response) {
			 vm.patientEDData=response.data; 
			if(commonFunctions.isObjEmpty(vm.patientEDData)) {
				vm.noHorizontalGraphData4 = true;
			}else { 
				graphFunctions.displayHorizontalBarChart4(vm.patientEDData,xWidth,yHeight);
			}
        });
	};
    
    vm.villages = function(startDate,endDate){
		$http.get("portalDashboard/getAllVillagesOfEDDPatients/"+startDate+"/"+endDate)
        .then(function(response) {
            vm.villageData=response.data;
            vm.startDate=startDate;
            vm.endDate=endDate;
            vm.i=0;
			if(commonFunctions.isObjEmpty(vm.villageData)) {
				vm.noHorizontalGraphData4 = true;
			}else {  
                    vm.showGraphForEDDPerVillage(vm.villageData[0].village,startDate,endDate);
                    $scope.villageName = vm.villageData[0].villageName;
			}
        });
	};
    
    $scope.villagePlus = function(){
        if(vm.i<vm.villageData.length-1 && vm.i>=0){
                vm.i++;
                vm.showGraphForEDDPerVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;   
        }
    };
    
    $scope.villageMinus = function(){
        if(vm.i<=vm.villageData.length && vm.i>0){
                vm.i--;
                vm.showGraphForEDDPerVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;
        }
    };
    
   vm.showGraphForEDD1 = function(startDate,endDate){
	 var xWidth = 350;
	 var yHeight = 200;
		$http.get("portalDashboard/getPatientsEDDForDuration/"+startDate+"/"+endDate)
        .then(function(response) {
			 vm.patientEDData=response.data; 
			if(commonFunctions.isObjEmpty(vm.patientEDData)) {
				// display div saying 'No EDD data available'
				vm.noHorizontalGraphData1 = true;
			}else { 
				 graphFunctions.displayHorizontalBarChart1(vm.patientEDData,xWidth,yHeight);
			}
        });
	};
    
    vm.showGraphForEDD2 = function(startDate,endDate){
	   var xWidth = 350;
	   var yHeight = 200;
		$http.get("portalDashboard/getPatientsEDDForDuration/"+startDate+"/"+endDate)
        .then(function(response) {
			 vm.patientEDData=response.data; 
			if(commonFunctions.isObjEmpty(vm.patientEDData)) {
				// display div saying 'No EDD data available'
				vm.noHorizontalGraphData2 = true;
			}else { 
				 graphFunctions.displayHorizontalBarChart2(vm.patientEDData,xWidth,yHeight);
			}
        });
	};
    
    vm.showGraphForEDD3 = function(startDate,endDate){
	 var xWidth = 350;
	 var yHeight = 200;
		$http.get("portalDashboard/getPatientsEDDForDuration/"+startDate+"/"+endDate)
        .then(function(response) {
			 vm.patientEDData=response.data; 
			if(commonFunctions.isObjEmpty(vm.patientEDData)) {
				// display div saying 'No EDD data available'
				vm.noHorizontalGraphData3 = true;
			}else { 
				 graphFunctions.displayHorizontalBarChart3(vm.patientEDData,xWidth,yHeight);
			}
        });
	};
    
    vm.quarterDetails = commonFunctions.getLastFourQuarters();
	vm.horizontalSelectedKey = parseInt(commonFunctions.getEDDQuarterValue());
	var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[commonFunctions.getEDDQuarterValue()], commonFunctions.getEDDQuarterValue());
    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
    vm.selectedQuarter = "Q"+commonFunctions.getEDDQuarterValue()+"("+vm.startMonth+"-"+vm.endMonth+")";
    vm.showGraphForEDD(quarterStartEndDates[0],quarterStartEndDates[1]);
    vm.villages(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    vm.monthlyGraphs = function(){
                    var quarterStartEndDates =     commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    $scope.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    $scope.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    var d=new Date(quarterStartEndDates[0]);
                    var startDate=quarterStartEndDates[0];
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 0)).format('YYYY-MM-DD');
                    $scope.month1=commonFunctions.getMonthName(startDate);
                    vm.showGraphForEDD1(startDate,endDate);
                    vm.villages(startDate,endDate);
                    $scope.month = commonFunctions.getMonthName(startDate);
                    $scope.firstDate = moment(new Date(d.getFullYear(), d.getMonth(), 1)).format('YYYY-MM-DD');
                    
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
                    $scope.month2=commonFunctions.getMonthName(startDate);
                    vm.showGraphForEDD2(startDate,endDate);
                
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD'); 
                    $scope.month3=commonFunctions.getMonthName(startDate);
        
                    vm.selectedQuarter = "Q"+vm.horizontalSelectedKey+"("+$scope.month1+"-"+$scope.month3+")";
                    vm.showGraphForEDD3(startDate,endDate);
                    $scope.lastDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD');
        
    };   
    
    $scope.monthMinus = function(){
        if(vm.startDate > $scope.firstDate &&  vm.endDate <= $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()-1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth(), 0)).format('YYYY-MM-DD');
            vm.noHorizontalGraphData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);
        }
    };
    
    $scope.monthPlus = function(){
        if(vm.startDate >= $scope.firstDate &&  vm.endDate < $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
            vm.noHorizontalGraphData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);  
        }
    };
    
    vm.allQuarterGraphs = function(){
                    vm.quarterDetails = commonFunctions.getLastFourQuarters();
                    vm.horizontalSelectedKey = 1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter1 = "Q"+vm.horizontalSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEDD(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.horizontalSelectedKey = vm.horizontalSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter2 = "Q"+vm.horizontalSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEDD1(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.horizontalSelectedKey = vm.horizontalSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter3 = "Q"+vm.horizontalSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEDD2(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.horizontalSelectedKey = vm.horizontalSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter4 = "Q"+vm.horizontalSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEDD3(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    };
    
    vm.oneQuarterGraph = function(){
                   
                    var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    vm.selectedQuarter = "Q"+vm.horizontalSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForEDD(quarterStartEndDates[0],quarterStartEndDates[1]);
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
                    vm.noHorizontalGraphData1 = false;
                    vm.noHorizontalGraphData2 = false;
                    vm.noHorizontalGraphData3 = false;
                    vm.noHorizontalGraphData4 = false;
                    vm.horizontalSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.monthlyGraphs();
            }
            if(orderByVal == "Quarterly"){
                    $scope.orderByColumnLabel = "Quarterly";
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.showAllQuarter=true;
                    $scope.year = $scope.currentYear;
                    vm.noHorizontalGraphData = false;
                    vm.noHorizontalGraphData1 = false;
                    vm.noHorizontalGraphData2 = false;
                    vm.noHorizontalGraphData3 = false;
                    vm.noHorizontalGraphData4 = false;
                    vm.horizontalSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.oneQuarterGraph();
            }
              
            if(orderByVal == "Yearly"){
                    $scope.orderByColumnLabel = "Yearly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.year = $scope.currentYear;
                    vm.noHorizontalGraphData = false;
                    vm.noHorizontalGraphData1 = false;
                    vm.noHorizontalGraphData2 = false;
                    vm.noHorizontalGraphData3 = false;
                    vm.noHorizontalGraphData4 = false;
                    var date = new Date();
                    var startDate = moment(new Date(date.getFullYear(), 00, 01)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(date.getFullYear(), 11, 31)).format('YYYY-MM-DD');
                    vm.startMonth =commonFunctions.getMonthName(startDate);
                    vm.endMonth = commonFunctions.getMonthName(endDate);
                    vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForEDD(startDate,endDate);
                    vm.villages(startDate,endDate);

            }
    };
   
    $scope.changeQuaterMinus = function(){
               
                if(vm.orderByColumn == "Monthly" && vm.horizontalSelectedKey>1){
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        vm.horizontalSelectedKey = vm.horizontalSelectedKey-1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.horizontalSelectedKey>1){
                         
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        vm.horizontalSelectedKey = vm.horizontalSelectedKey-1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year >= date.getFullYear()){
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        $scope.year = $scope.year-1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForEDD(startDate,endDate);
                        vm.villages(startDate,endDate);
                }
        
    };
    
    $scope.changeQuaterPlus = function(){
               
                if(vm.orderByColumn == "Monthly" && vm.horizontalSelectedKey<4){
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        vm.horizontalSelectedKey = vm.horizontalSelectedKey+1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.horizontalSelectedKey<4){
                       
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        vm.horizontalSelectedKey = vm.horizontalSelectedKey+1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year <= date.getFullYear()){
                        vm.noHorizontalGraphData = false;
                        vm.noHorizontalGraphData1 = false;
                        vm.noHorizontalGraphData2 = false;
                        vm.noHorizontalGraphData3 = false;
                        vm.noHorizontalGraphData4 = false;
                        $scope.year = $scope.year+1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForEDD(startDate,endDate);
                        vm.villages(startDate,endDate);
                }
    };
    
    $scope.showAllQuarters = function(){
            if($scope.showAllQuarter){
                    $scope.showAllQuarter=false;
                    $scope.monthFlag=true;
                    $scope.navFlag=true;
                    vm.selectedQuarter = "Q1 to Q4";
                    vm.noHorizontalGraphData = false;
                    vm.noHorizontalGraphData1 = false;
                    vm.noHorizontalGraphData2 = false;
                    vm.noHorizontalGraphData3 = false;
                    vm.noHorizontalGraphData4 = false;
                    vm.allQuarterGraphs();
                
            }
            else{
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noHorizontalGraphData = false;
                    vm.noHorizontalGraphData1 = false;
                    vm.noHorizontalGraphData2 = false;
                    vm.noHorizontalGraphData3 = false;
                    vm.noHorizontalGraphData4 = false;
                    vm.oneQuarterGraph();
            }
        };
    
});