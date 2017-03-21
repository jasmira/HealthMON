angular.module('healthMon').controller("anemiaStatusCtrl", function($http,$window,$location,$scope,commonFunctions,graphFunctions) {
    
	$window.scrollTo(0, 0);
	var vm = this;
    $scope.buttonFlag=true;
    $scope.maternal=true; //for program checked
    $scope.allvil=true;//for villages checked
    $scope.anemia=true; //for anemia checked
    $scope.navFlag=false;
    $scope.monthFlag=true;
    $scope.showAllQuarter=true;
    var date = new Date();
    $scope.currentYear=date.getFullYear();
    $scope.year=$scope.currentYear;
    vm.orderByColumn = "Quarterly";
    $scope.orderByColumnLabel = vm.orderByColumn;

    vm.patientHbData=null;
    
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

vm.showGraphForASP= function(startDate,endDate){
            $http.get("portalDashboard/getPatientsHbStatus/"+startDate+"/"+endDate)
            .then(function(response) {
            vm.patientHbData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                vm.noDonutData = true;
            }
            else {
                $scope.severePatients=0; $scope.moderatePatients = 0; $scope.normalPatients = 0;
                if(vm.patientHbData[2][1])
                    $scope.severePatients =vm.patientHbData[2][1];
                if(vm.patientHbData[1][1])
                    $scope.moderatePatients =vm.patientHbData[1][1];
                if(vm.patientHbData[0][1])
                    $scope.normalPatients =vm.patientHbData[0][1];

                $scope.registeredPatients =$scope.severePatients + $scope.moderatePatients +$scope.normalPatients;

                graphFunctions.displayDonutChart(vm.patientHbData);
                }
            });
};
    
    vm.showGraphForASPForVillage= function(villageId,startDate,endDate){
            $http.get("portalDashboard/getPatientsHbStatusForVillage/"+villageId+"/"+startDate+"/"+endDate)
            .then(function(response) {
            vm.patientHbData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                vm.noDonutData4 = true;
            }
            else {
                $scope.severePatients4=0; $scope.moderatePatients4 = 0; $scope.normalPatients4 = 0;
                if(vm.patientHbData[2][1])
                    $scope.severePatients4 =vm.patientHbData[2][1];
                if(vm.patientHbData[1][1])
                    $scope.moderatePatients4 =vm.patientHbData[1][1];
                if(vm.patientHbData[0][1])
                    $scope.normalPatients4 =vm.patientHbData[0][1];

                $scope.registeredPatients4 =$scope.severePatients4 + $scope.moderatePatients4 +$scope.normalPatients4;

                graphFunctions.displayDonutChart4(vm.patientHbData);
                }
            });
};
    
    vm.villages = function(startDate,endDate){
		$http.get("portalDashboard/getAllVillagesForPatientsHbStatus/"+startDate+"/"+endDate)
        .then(function(response) {
            vm.villageData=response.data;
            vm.startDate=startDate;
            vm.endDate=endDate;
            vm.i=0;
			if(commonFunctions.isObjEmpty(vm.villageData)) {
				vm.noDonutData4 = true;
			}else {  
                    vm.showGraphForASPForVillage(vm.villageData[0].village,startDate,endDate);
                    $scope.villageName = vm.villageData[0].villageName;
			}
        });
	};
    
    $scope.villagePlus = function(){
        if(vm.i<vm.villageData.length-1 && vm.i>=0){
                vm.i++;
                vm.showGraphForASPForVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;   
        }
    };
    
    $scope.villageMinus = function(){
        if(vm.i<=vm.villageData.length && vm.i>0){
                vm.i--;
                vm.showGraphForASPForVillage(vm.villageData[vm.i].village,vm.startDate,vm.endDate);
                $scope.villageName = vm.villageData[vm.i].villageName;
        }
    };
    
    vm.quarterDetails = commonFunctions.getLastFourQuarters();
    vm.donutSelectedKey = parseInt(commonFunctions.getASQuarterValue());
    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
    vm.selectedQuarter = "Q"+commonFunctions.getASQuarterValue()+"("+vm.startMonth+"-"+vm.endMonth+")";
    vm.showGraphForASP(quarterStartEndDates[0],quarterStartEndDates[1]);
    vm.villages(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    vm.showGraphForASP1= function(startDate,endDate){
    	   $http.get("portalDashboard/getPatientsHbStatus/"+startDate+"/"+endDate)
            .then(function(response) {
            vm.patientHbData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                vm.noDonutData1 = true;
            }
            else {
                $scope.severePatients1=0; $scope.moderatePatients1 = 0; $scope.normalPatients1 = 0;
                if(vm.patientHbData[2][1])
                    $scope.severePatients1 =vm.patientHbData[2][1];
                if(vm.patientHbData[1][1])
                    $scope.moderatePatients1 =vm.patientHbData[1][1];
                if(vm.patientHbData[0][1])
                    $scope.normalPatients1 =vm.patientHbData[0][1];

                $scope.registeredPatients1 =$scope.severePatients1 + $scope.moderatePatients1 +$scope.normalPatients1;

                graphFunctions.displayDonutChart1(vm.patientHbData);
                }
            });
        };
    
        vm.showGraphForASP2 = function(startDate,endDate){
    	   $http.get("portalDashboard/getPatientsHbStatus/"+startDate+"/"+endDate)
            .then(function(response) {
            vm.patientHbData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                vm.noDonutData2 = true;
            }
            else {
                $scope.severePatients2=0; $scope.moderatePatients2 = 0; $scope.normalPatients2 = 0;
                if(vm.patientHbData[2][1])
                    $scope.severePatients2 =vm.patientHbData[2][1];
                if(vm.patientHbData[1][1])
                    $scope.moderatePatients2 =vm.patientHbData[1][1];
                if(vm.patientHbData[0][1])
                    $scope.normalPatients2 =vm.patientHbData[0][1];

                $scope.registeredPatients2 =$scope.severePatients2 + $scope.moderatePatients2 +$scope.normalPatients2;

                graphFunctions.displayDonutChart2(vm.patientHbData);
                }
            });
        };
    
        vm.showGraphForASP3= function(startDate,endDate){
    	   $http.get("portalDashboard/getPatientsHbStatus/"+startDate+"/"+endDate)
            .then(function(response) {
            vm.patientHbData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                vm.noDonutData3 = true;
            }
            else {
                $scope.severePatients3=0; $scope.moderatePatients3 = 0; $scope.normalPatients3 = 0;
                if(vm.patientHbData[2][1])
                    $scope.severePatients3 =vm.patientHbData[2][1];
                if(vm.patientHbData[1][1])
                    $scope.moderatePatients3 =vm.patientHbData[1][1];
                if(vm.patientHbData[0][1])
                    $scope.normalPatients3 =vm.patientHbData[0][1];

                $scope.registeredPatients3 =$scope.severePatients3 + $scope.moderatePatients3 +$scope.normalPatients3;

                graphFunctions.displayDonutChart3(vm.patientHbData);
                }
            });
        };
        
        vm.monthlyGraphs = function(){
                    var quarterStartEndDates =     commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    $scope.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    $scope.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    var d=new Date(quarterStartEndDates[0]);
                    var startDate=quarterStartEndDates[0];
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 0)).format('YYYY-MM-DD');
                    $scope.month1=commonFunctions.getMonthName(startDate);
                    vm.showGraphForASP1(startDate,endDate);
                    vm.villages(startDate,endDate);
                    $scope.month = commonFunctions.getMonthName(startDate);
                    $scope.firstDate = moment(new Date(d.getFullYear(), d.getMonth(), 1)).format('YYYY-MM-DD');
                    
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
                    $scope.month2=commonFunctions.getMonthName(startDate);
                    vm.showGraphForASP2(startDate,endDate);
                
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD'); 
                    $scope.month3=commonFunctions.getMonthName(startDate);
        
                    vm.selectedQuarter = "Q"+vm.donutSelectedKey+"("+$scope.month1+"-"+$scope.month3+")";
                    vm.showGraphForASP3(startDate,endDate);
                    $scope.lastDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD');
    };
    
    $scope.monthMinus = function(){
        if(vm.startDate > $scope.firstDate &&  vm.endDate <= $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()-1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth(), 0)).format('YYYY-MM-DD');
            vm.noDonutData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);
        }
    };
    
    $scope.monthPlus = function(){
        if(vm.startDate >= $scope.firstDate &&  vm.endDate < $scope.lastDate){
            var d=new Date(vm.startDate);
            var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
            var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
            vm.noDonutData4 = false;
            vm.villages(startDate,endDate);
            $scope.month = commonFunctions.getMonthName(startDate);  
        }
    };
    
    vm.allQuarterGraphs = function(){
                    vm.quarterDetails = commonFunctions.getLastFourQuarters();
                    vm.donutSelectedKey = 1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter1 = "Q"+vm.donutSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForASP(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.donutSelectedKey = vm.donutSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter2 = "Q"+vm.donutSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForASP1(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.donutSelectedKey = vm.donutSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter3 = "Q"+vm.donutSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForASP2(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.donutSelectedKey = vm.donutSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter4 = "Q"+vm.donutSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForASP3(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    };
    
    vm.oneQuarterGraph = function(){
                    var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    vm.selectedQuarter = "Q"+vm.donutSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForASP(quarterStartEndDates[0],quarterStartEndDates[1]);
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
                    vm.noDonutData1 = false;
                    vm.noDonutData2 = false;
                    vm.noDonutData3 = false;
                    vm.noDonutData4 = false;
                    vm.donutSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.monthlyGraphs();
                
        }
        if(orderByVal == "Quarterly"){
                    $scope.orderByColumnLabel = "Quarterly";
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.year = $scope.currentYear;
                    vm.noDonutData = false;
                    vm.noDonutData1 = false;
                    vm.noDonutData2 = false;
                    vm.noDonutData3 = false;
                    vm.noDonutData4 = false;
                    vm.donutSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.oneQuarterGraph();
        }
        if(orderByVal == "Yearly"){
                    $scope.orderByColumnLabel = "Yearly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.showAllQuarter=true;
                    $scope.year = $scope.currentYear;
                    vm.noDonutData = false;
                    vm.noDonutData1 = false;
                    vm.noDonutData2 = false;
                    vm.noDonutData3 = false;
                    vm.noDonutData4 = false;
                    var date = new Date();
                    var startDate = moment(new Date(date.getFullYear(), 00, 01)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(date.getFullYear(), 11, 31)).format('YYYY-MM-DD');
                    vm.startMonth =commonFunctions.getMonthName(startDate);
                    vm.endMonth = commonFunctions.getMonthName(endDate);
                    vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForASP(startDate,endDate);
                    vm.villages(startDate,endDate);
        }
}; 
   	
    $scope.changeQuaterMinus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.donutSelectedKey>1){
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        vm.donutSelectedKey = vm.donutSelectedKey-1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.donutSelectedKey>1){
                        
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        vm.donutSelectedKey = vm.donutSelectedKey-1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year >= date.getFullYear()){
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        $scope.year = $scope.year-1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForASP(startDate,endDate);
                        vm.villages(startDate,endDate);
                        
                }
        
    };
    
    $scope.changeQuaterPlus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.donutSelectedKey<4){
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        vm.donutSelectedKey = vm.donutSelectedKey+1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.donutSelectedKey<4){
                       
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        vm.donutSelectedKey = vm.donutSelectedKey+1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year <= date.getFullYear()){
                        vm.noDonutData = false;
                        vm.noDonutData1 = false;
                        vm.noDonutData2 = false;
                        vm.noDonutData3 = false;
                        vm.noDonutData4 = false;
                        $scope.year = $scope.year+1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForASP(startDate,endDate);
                        vm.villages(startDate,endDate);
                }
    };
    
    $scope.showAllQuarters = function(){
            if($scope.showAllQuarter){
                    $scope.showAllQuarter=false;
                    $scope.monthFlag=true;
                    $scope.navFlag=true;
                    vm.selectedQuarter = "Q1 to Q4";
                    vm.noDonutData = false;
                    vm.noDonutData1 = false;
                    vm.noDonutData2 = false;
                    vm.noDonutData3 = false;
                    vm.noDonutData4 = false;
                    vm.allQuarterGraphs();
                
            }
            else{
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noDonutData = false;
                    vm.noDonutData1 = false;
                    vm.noDonutData2 = false;
                    vm.noDonutData3 = false;
                    vm.noDonutData4 = false;
                    vm.oneQuarterGraph();
            }
        };
		
});