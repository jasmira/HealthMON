angular.module('healthMon').controller("anemiaPatientTrendsCtrl", function($window, $scope,$http,$location){
	$window.scrollTo(0, 0);
	var vm = this;
	$http.get('portalReports/getAnemiaPatientTrends/').then(function(response) {
        vm.anemiaReportData = response.data;
    });
    
});