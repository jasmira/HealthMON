angular.module('healthMon').controller("reportsCtrl", function($window, $scope,$http,$location){
	$window.scrollTo(0, 0);
	var vm = this;
    
    $http.get('portalReports/getPHCNameAndAddress/').then(function(response) {
        vm.phcData = response.data;
    });
	
	vm.selectReport = function(report){
		vm.selectedReport = report; 
        vm.anemiaFlag=false;
        vm.enrolFlag=false;
        vm.healthFlag=false;
        vm.healthOfBenFlag=false;
        vm.referalFlag=false;
        vm.missedFlag=false;
        vm.perOfTeam=false;
	};
	vm.generateReport = function(){
		if(vm.selectedReport == "Anemia Patient Trends") {
		      vm.anemiaFlag=true;
              vm.enrolFlag=false;
              vm.healthFlag=false;
              vm.healthOfBenFlag=false;
              vm.referalFlag=false;
              vm.missedFlag=false;
              vm.perOfTeam=false;
		}
        else if(vm.selectedReport == "Enrolled Beneficiaries") {
		      vm.enrolFlag=true;
              vm.anemiaFlag=false;
              vm.healthFlag=false;
              vm.healthOfBenFlag=false;
              vm.referalFlag=false;
              vm.perOfTeam=false;
              vm.missedFlag=false;
		}
        else if(vm.selectedReport == "Health Status Trend") {
		      vm.healthFlag=true;
              vm.anemiaFlag=false;
              vm.enrolFlag=false;
              vm.healthOfBenFlag=false;
              vm.referalFlag=false;
              vm.perOfTeam=false;
              vm.missedFlag=false;
		}
        else if(vm.selectedReport == "Health Status of Beneficiaries") {
		      vm.healthOfBenFlag=true;
              vm.anemiaFlag=false;
              vm.enrolFlag=false;
              vm.healthFlag=false;
              vm.referalFlag=false;
              vm.perOfTeam=false;
              vm.missedFlag=false;
		}
        else if(vm.selectedReport == "Referral Cases") {
		      vm.referalFlag=true;
              vm.anemiaFlag=false;
              vm.enrolFlag=false;
              vm.healthFlag=false;
              vm.healthOfBenFlag=false;
              vm.perOfTeam=false;
              vm.missedFlag=false;
		}
        else if(vm.selectedReport == "Performance of Team Members") {
		      vm.perOfTeam=true;
              vm.anemiaFlag=false;
              vm.enrolFlag=false;
              vm.healthFlag=false;
              vm.healthOfBenFlag=false;
              vm.referalFlag=false;
              vm.missedFlag=false;
		}
        else if(vm.selectedReport == "Missed Records Trends") {
		      vm.missedFlag=true;
              vm.anemiaFlag=false;
              vm.enrolFlag=false;
              vm.healthFlag=false;
              vm.healthOfBenFlag=false;
              vm.referalFlag=false;
              vm.perOfTeam=false;
		}
        else{
              vm.noReport=true;
        }
	};
});

