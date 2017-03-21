angular.module('healthMon').controller("patientViewTrendsCtrl",function($http,authFact,patientFact,commonFunctions,graphFunctions,_) {
    var vm = this;
    vm.patientId=patientFact.getPatientId();
    vm.patientLMPDate=patientFact.getPatientLMPDate();
    vm.trendParam = 'Select Parameter';
    vm.showHBChart = false;
    vm.showBPChart = false;
    vm.showWtChart = false;
    vm.noGraph = false;

    vm.currentPregnancyWeek = commonFunctions.calculatePregnancyWeeks(vm.patientLMPDate);
    vm.gestationalWeeks = _.range(0, vm.currentPregnancyWeek, 2);

    vm.gestationalWeeks.unshift('x');

    vm.showHBGraph = function() {
        vm.trendParam = 'Haemoglobin';
        vm.showHBChart = true;
        vm.showBPChart = false;
        vm.showWtChart = false;

        $http.get("patient/getPatientHB/"+vm.patientId).then(function(response) {
            vm.patientHBInfo = response.data;
            vm.hbData = [];
            
            for(var key in vm.patientHBInfo) {
                for(var i=0; i<vm.patientHBInfo[key].length;i++) {
                    vm.hbData.push(vm.patientHBInfo[key][i].Device_Attributes_value);
                }
            }

            if(commonFunctions.isObjEmpty(vm.hbData)) {
                vm.noGraph = true;
                vm.showHBChart = false;
            }else {
                vm.noGraph = false;
                vm.showHBChart = true;

                vm.hbData.unshift('HB');
                var chart = c3.generate({
                    bindto: '#chartHB',
                    data: {
                        x: 'x',
                        columns: [
                            vm.gestationalWeeks,
                            vm.hbData
                        ]
                    }
                });
            }
        });
    }
    
    vm.showBPGraph = function() {
        vm.trendParam = 'Blood Pressure';
        vm.showBPChart = true;
        vm.showHBChart = false;
        vm.showWtChart = false;
        
        $http.get("patient/getPatientBPInfo/"+vm.patientId).then(function(response) {
            vm.patientBPInfo = response.data;
            vm.bpSystolicData = [];
            vm.bpDiastolicData = [];

            for(var key in vm.patientBPInfo) {
                for(var i=0; i<vm.patientBPInfo[key].length;i++) {
                    if(vm.patientBPInfo[key][i].Device_Attribute_Name == 'hm_systolic') vm.bpSystolicData.push(vm.patientBPInfo[key][i].Device_Attributes_value);
                    if(vm.patientBPInfo[key][i].Device_Attribute_Name == 'hm_diastolic') vm.bpDiastolicData.push(vm.patientBPInfo[key][i].Device_Attributes_value);
                }
            }

            if(commonFunctions.isObjEmpty(vm.bpSystolicData)) {
                vm.showBPChart = false;
                vm.noGraph = true;
            }else {
                vm.showBPChart = true;
                vm.noGraph = false;
                vm.bpSystolicData.unshift('Systolic Blood Pressure');
                vm.bpDiastolicData.unshift('Diastolic Blood Pressure');
                var chart = c3.generate({
                    bindto: '#chartBP',
                    data: {
                        x: 'x',
                        columns: [
                            vm.gestationalWeeks,
                            vm.bpSystolicData,
                            vm.bpDiastolicData
                        ]
                    }
                });
            }
        });
    }

    vm.showWeightGraph = function() {
        vm.trendParam = 'Weight';
        vm.showBPChart = false;
        vm.showHBChart = false;
        vm.showWtChart = true;
        
        $http.get("patient/getPatientVitals/"+vm.patientId).then(function(response) {
            vm.patientVitalsInfo = response.data;
            vm.weightData = [];

            for(var key in vm.patientVitalsInfo) {
                for(var i=0; i<vm.patientVitalsInfo[key].length;i++) {
                    if(vm.patientVitalsInfo[key][i].Vitals_id == 2) vm.weightData.push(vm.patientVitalsInfo[key][i].Vital_value);
                }
            }

            if(commonFunctions.isObjEmpty(vm.weightData)) {
                vm.showWtChart = false;
                vm.noGraph = true;
            }else {
                vm.showWtChart = true;
                vm.noGraph = false;
                vm.weightData.unshift('Weight');
                var chart = c3.generate({
                    bindto: '#chartWeight',
                    data: {
                        x: 'x',
                        columns: [
                            vm.gestationalWeeks,
                            vm.weightData
                        ]
                    }
                });
            }
        });
    }
});