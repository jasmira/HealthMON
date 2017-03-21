angular.module('healthMon').controller("enrolledPatientsCtrl", function($window, $scope,$http,commonFunctions,$location, graphFunctions) {
	$window.scrollTo(0, 0);
	var vm = this;
	
	$scope.buttonFlag=true;
    $scope.maternal=true; //for program checked
    $scope.allvil=true;//for villages checked
    $scope.enrollment=true; //for Enrolled checked
    $scope.navFlag=false;
    $scope.monthFlag=true;
    $scope.showAllQuarter=true;
    var date = new Date();
    $scope.currentYear=date.getFullYear();
    $scope.year=$scope.currentYear;
    vm.orderByColumn = "Quarterly";
    $scope.orderByColumnLabel = vm.orderByColumn;
    
    $scope.showFilterPanel = function(){
        $scope.sendVillage = [];
        $scope.sendProgram = [];
        $scope.sendParameter = [];
      // $('#filterPanel').find('input[type=checkbox]:checked').removeAttr('checked'); 
        if($scope.buttonFlag)
            $scope.buttonFlag = false;
        else
            $scope.buttonFlag = true;
    };
   
    $scope.selectedVillage = function(village, value){
        if(value){
                $scope.sendVillage.push(village);
            }else{
                var index = $scope.sendVillage.indexOf(village);
                $scope.sendVillage.splice(index, 1);
            }
    };
    $scope.selectedProgram = function(program, value){
            if(value){
                $scope.sendProgram.push(program);
            }else{
                var index = $scope.sendProgram.indexOf(program);
                $scope.sendProgram.splice(index, 1);
            }
        };
    $scope.selectedParameter = function(parameter, value){
            if(value){
                $scope.sendParameter.push(parameter);
            }else{
                var index = $scope.sendParameter.indexOf(parameter);
                $scope.sendParameter.splice(index, 1);
            }
        };
    
    $scope.sendCheckedData = function(){
        /*alert($scope.sendVillage);
        alert($scope.sendProgram);
        alert($scope.sendParameter);*/
        $scope.buttonFlag = true;
    };
    
    vm.patientEnrollmentData = null;
    vm.villages = null;
    
    /*vm.new=function(startDate, endDate){
    $http.get("portalDashboard/getAllVillagesOfEnrolledPatients/"+startDate+"/"+endDate)
        .then(function(response){
              vm.villages=response.data;
              if(commonFunctions.isObjEmpty(vm.villages)) {
                               alert("no data");
                        }else {
        	
                            console.log(vm.villages);
                        }
                });
    };
    
    vm.showGraphForEPPerVillage = function(startDate, endDate, villageid){
        $http.get("portalDashboard/getPatientsEnrollmentDataForVillage/"+startDate+"/"+endDate+"/"+villageid)
        .then(function(response){
              vm.patientEnrollmentData=response.data;
                        if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                               vm.noVerticalGraphData4 = true;
                        }else {
        	
                            graphFunctions.displayVerticalBarChart4(vm.patientEnrollmentData);
                            
                        }
                });
    };*/
    
    vm.showGraphForEP= function(startDate,endDate){
    	       $http.get("portalDashboard/getPatientsEnrollmentData/"+startDate+"/"+endDate)
                    .then(function(response) {
                        vm.patientEnrollmentData=response.data;
                        if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                                vm.noVerticalGraphData = true;
                        }else {
        	
                            graphFunctions.displayVerticalBarChart(vm.patientEnrollmentData);
                        }
                });
        };
    
    
    vm.showGraphForEPM1= function(startDate,endDate){
    	       $http.get("portalDashboard/getPatientsEnrollmentData/"+startDate+"/"+endDate)
                        .then(function(response) {
                        vm.patientEnrollmentData=response.data;
                        if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                                vm.noVerticalGraphData1 = true;
                        }else {
        	                   
                                graphFunctions.displayVerticalBarChartM1(vm.patientEnrollmentData);
                        }
                });
        };
    
    vm.showGraphForEPM2= function(startDate,endDate){
    	       $http.get("portalDashboard/getPatientsEnrollmentData/"+startDate+"/"+endDate)
                        .then(function(response) {
                        vm.patientEnrollmentData=response.data;
                        if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                                vm.noVerticalGraphData2 = true;
                        }else {
                            graphFunctions.displayVerticalBarChartM2(vm.patientEnrollmentData);
                        }
                });
        };
    vm.showGraphForEPM3= function(startDate,endDate){
    	       $http.get("portalDashboard/getPatientsEnrollmentData/"+startDate+"/"+endDate)
                    .then(function(response) {
                        vm.patientEnrollmentData=response.data;
                        if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                                vm.noVerticalGraphData3 = true;
                        }else {
                            graphFunctions.displayVerticalBarChartM3(vm.patientEnrollmentData);
                        }
                });
        };
        
    vm.quarterDetails = commonFunctions.getLastFourQuarters();
    vm.verticalBarSelectedKey = parseInt(commonFunctions.getEPQuarterValue());
    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[commonFunctions.getEPQuarterValue()], commonFunctions.getEPQuarterValue());
    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
    vm.selectedQuarter = "Q"+commonFunctions.getEPQuarterValue()+"("+vm.startMonth+"-"+vm.endMonth+")";
    vm.showGraphForEP(quarterStartEndDates[0],quarterStartEndDates[1]);
    
        
    
    vm.monthlyGraphs = function(){
                    var quarterStartEndDates =     commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    $scope.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    $scope.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    var d=new Date(quarterStartEndDates[0]);
                    var startDate=quarterStartEndDates[0];
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 0)).format('YYYY-MM-DD');
                    $scope.month1=commonFunctions.getMonthName(startDate);
                    vm.showGraphForEPM1(startDate,endDate);
                
                    
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+1, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 0)).format('YYYY-MM-DD');
                    $scope.month2=commonFunctions.getMonthName(startDate);
                    vm.showGraphForEPM2(startDate,endDate);
                
                    var startDate = moment(new Date(d.getFullYear(), d.getMonth()+2, 1)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(d.getFullYear(), d.getMonth()+3, 0)).format('YYYY-MM-DD'); 
                    $scope.month3=commonFunctions.getMonthName(startDate);
        
                    vm.selectedQuarter = "Q"+vm.verticalBarSelectedKey+"("+$scope.month1+"-"+$scope.month3+")";
                    vm.showGraphForEPM3(startDate,endDate);
        
    };
    
    vm.allQuarterGraphs = function(){
                    vm.quarterDetails = commonFunctions.getLastFourQuarters();
                    vm.verticalBarSelectedKey = 1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter1 = "Q"+vm.verticalBarSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEP(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.verticalBarSelectedKey = vm.verticalBarSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter2 = "Q"+vm.verticalBarSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEPM1(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.verticalBarSelectedKey = vm.verticalBarSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter3 = "Q"+vm.verticalBarSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEPM2(quarterStartEndDates[0],quarterStartEndDates[1]);

                    vm.verticalBarSelectedKey = vm.verticalBarSelectedKey+1;
                    var quarterStartEndDates =    commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    $scope.quarter4 = "Q"+vm.verticalBarSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+") "+$scope.year;
                    vm.showGraphForEPM3(quarterStartEndDates[0],quarterStartEndDates[1]);
    
    };
    
    vm.oneQuarterGraph = function(){
                    var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
                    vm.startMonth =commonFunctions.getMonthName(quarterStartEndDates[0]);
                    vm.endMonth = commonFunctions.getMonthName(quarterStartEndDates[1]);
                    vm.selectedQuarter = "Q"+vm.verticalBarSelectedKey+"("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForEP(quarterStartEndDates[0],quarterStartEndDates[1]);
    };
    
    
    $scope.periodFunction = function(orderByVal){
            vm.orderByColumn = orderByVal;
            if(orderByVal == "Monthly"){
                    $scope.orderByColumnLabel = "Monthly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noVerticalGraphData1 = false;
                    vm.noVerticalGraphData2 = false;
                    vm.noVerticalGraphData3 = false;
                    vm.noVerticalGraphData4 = false;
                    vm.verticalBarSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.monthlyGraphs();
            }
        
            if(orderByVal == "Quarterly"){
                    $scope.orderByColumnLabel = "Quarterly";
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.showAllQuarter=true;
                    $scope.year = $scope.currentYear;
                    vm.noVerticalGraphData = false;
                    vm.noVerticalGraphData1 = false;
                    vm.noVerticalGraphData2 = false;
                    vm.noVerticalGraphData3 = false;
                    vm.noVerticalGraphData4 = false;
                    vm.verticalBarSelectedKey = commonFunctions.getCurrentQuarter();
                    vm.oneQuarterGraph();
                    
            }
              
            if(orderByVal == "Yearly"){
                    $scope.orderByColumnLabel = "Yearly";
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.monthFlag=true;
                    $scope.year = $scope.currentYear;
                    vm.noVerticalGraphData = false;
                    vm.noVerticalGraphData1 = false;
                    vm.noVerticalGraphData2 = false;
                    vm.noVerticalGraphData3 = false;
                    vm.noVerticalGraphData4 = false;
                    var date = new Date();
                    var startDate = moment(new Date(date.getFullYear(), 00, 01)).format('YYYY-MM-DD');
                    var endDate = moment(new Date(date.getFullYear(), 11, 31)).format('YYYY-MM-DD');
                    vm.startMonth =commonFunctions.getMonthName(startDate);
                    vm.endMonth = commonFunctions.getMonthName(endDate);
                    vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                    vm.showGraphForEP(startDate,endDate);
             }
    };
     
    
    $scope.changeQuaterMinus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.verticalBarSelectedKey>1){
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.noVerticalGraphData4 = false;
                        vm.verticalBarSelectedKey = vm.verticalBarSelectedKey-1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.verticalBarSelectedKey>1){
                        
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.verticalBarSelectedKey = vm.verticalBarSelectedKey-1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year >= date.getFullYear()){
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.noVerticalGraphData4 = false;
                        $scope.year = $scope.year-1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForEP(startDate,endDate);
                                          
                }
        
    };
    
    $scope.changeQuaterPlus = function(){
        
                if(vm.orderByColumn == "Monthly" && vm.verticalBarSelectedKey<4){
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.noVerticalGraphData4 = false;
                        vm.verticalBarSelectedKey = vm.verticalBarSelectedKey+1;
                        vm.monthlyGraphs();
                }
        
                if(vm.orderByColumn == "Quarterly" && vm.verticalBarSelectedKey<4){
                       
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.noVerticalGraphData4 = false;
                        vm.verticalBarSelectedKey = vm.verticalBarSelectedKey+1;
                        vm.oneQuarterGraph();
                }
        
                if(vm.orderByColumn == "Yearly" && $scope.year <= date.getFullYear()){
                        vm.noVerticalGraphData = false;
                        vm.noVerticalGraphData1 = false;
                        vm.noVerticalGraphData2 = false;
                        vm.noVerticalGraphData3 = false;
                        vm.noVerticalGraphData4 = false;
                        $scope.year = $scope.year+1;
                        var startDate = moment(new Date($scope.year, 00, 01)).format('YYYY-MM-DD');
                        var endDate = moment(new Date($scope.year, 11, 31)).format('YYYY-MM-DD');
                        vm.startMonth =commonFunctions.getMonthName(startDate);
                        vm.endMonth = commonFunctions.getMonthName(endDate);
                        vm.selectedQuarter = "("+vm.startMonth+"-"+vm.endMonth+")";
                        vm.showGraphForEP(startDate,endDate);
                }
    };
    
    $scope.showAllQuarters = function(){
            if($scope.showAllQuarter){
                    $scope.showAllQuarter=false;
                    $scope.monthFlag=true;
                    $scope.navFlag=true;
                    vm.selectedQuarter = "Q1 to Q4";
                    vm.noVerticalGraphData = false;
                    vm.noVerticalGraphData1 = false;
                    vm.noVerticalGraphData2 = false;
                    vm.noVerticalGraphData3 = false;
                    vm.noVerticalGraphData4 = false;
                    vm.allQuarterGraphs();
                
            }
            else{
                    $scope.showAllQuarter=true;
                    $scope.navFlag=false;
                    $scope.year = $scope.currentYear;
                    vm.noVerticalGraphData = false;
                    vm.noVerticalGraphData1 = false;
                    vm.noVerticalGraphData2 = false;
                    vm.noVerticalGraphData3 = false;
                    vm.noVerticalGraphData4 = false;
                    vm.oneQuarterGraph();
            }
        };
    
});