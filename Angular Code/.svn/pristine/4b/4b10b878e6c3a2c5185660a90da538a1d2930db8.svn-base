angular.module('healthMon').controller("dashboardCtrl", function($http,$state,authFact,moment) {
    //console.log('token '+authFact.getToken());
    var vm = this;
     vm.highlight_task=false;
    vm.highlight_alert=true;
    //on page refresh of dashboard.tasks state tasks tab should be active.
    if($state.current.name=='dashboard.tasks'){
        vm.highlight_task=true;
        vm.highlight_alert=false;
    }
   
    $http.get('common/getMOTaskAlertsNotifications/'+authFact.getUserObj().HM_User_id).then(function(response) {
        vm.TaskAlertList = response.data;
        
        vm.alertCount=0;
        vm.taskCount=0;
		var list=vm.TaskAlertList;
        //to calculate count of alerts and tasks.
        for(var i in list) {
			if(list[i].User_Task_Type=='task' && list[i].User_Task_Severity==1)
				vm.alertCount++;
			if(list[i].User_Task_Type == 'task' && list[i].User_Task_Severity != 1)
				vm.taskCount++;
            
            list[i].User_Task_Date=moment(list[i].User_Task_Date).format('YYYY-MM-DD');
            list[i].User_Task_CreatedTime=moment(list[i].User_Task_CreatedTime).format('YYYY-MM-DD');
        }
    });
});

angular.module('healthMon').controller("AppointmentCtrl", function($http,$location,$anchorScroll,authFact,moment,commonFunctions) {
    var vm = this;
	var loggedInUser = authFact.getUserObj().HM_User_id;
	vm.Created_by = loggedInUser;
	vm.Created_Date = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
	$http.get("portalCalendar/getUsersProgramId/"+loggedInUser).then(function(response) {
		vm.programId = response.data.Programs_id;					
	});
		//vm.accepted=0;
        $http.get("portalDashboard/getAppointments/"+authFact.getUserObj().HM_User_id).then(function(response) {
            vm.appointmentList=response.data;
			vm.appointmentCount = vm.appointmentList.length;
			//vm.appointmentCount = Object.keys(vm.appointmentList).length;
			
			vm.getpregWeek = function(lmpDate){
				var pregWeeks = commonFunctions.calculatePregnancyWeeks(lmpDate);
				return pregWeeks;
			}
			
			vm.getSeverityClass = function(severity){
				//alert(severity+"jjjj");
				if(severity==2){
					return vm.SeverityClass = "appoint-list-red";
				}
				if(severity==0){
					return vm.SeverityClass = "appoint-list-success";
				}
				if(severity==1){
					return vm.SeverityClass = "appoint-list-orange";
				}
			
			}
        });
		vm.acceptAppointment = function(appointment){
			//alert(JSON.stringify(appointment));
			var startDt = moment(appointment.Appointment_Date).format('YYYY-MM-DD HH:mm:ss');
			var endDt = moment(startDt).add(15, 'minutes').format('YYYY-MM-DD HH:mm:ss');
			var subject = appointment.HM_Patient_name+"(PID:"+appointment.Patient_id+")";
			var loggedInUser = authFact.getUserObj().HM_User_id;
			vm.newAppointmentSchedule = {
				'userId':loggedInUser,
				'subject':subject,
				'message':appointment.OverAllStatus,
				'venue':'',
				'start':startDt,
				'end':endDt,
				'ReminderInterval':'',
				'allDayBooked':'',
				'setReminder':'',
				'programId':vm.programId,
				'Created_by':vm.Created_by,
				'Created_Date':vm.Created_Date
			};
			//alert(startDt+"===="+endDt);
			$http({
				method: 'POST',
				url: '/portalCalendar/addSelfSchedule',
				data : vm.newAppointmentSchedule
			}).then(function (response) {
				if(response.data.status == 'success'){
					$http({
						method: 'POST',
						url: '/portalDashboard/setAppointmentAccepted/'+appointment.Appointment_id,
					}).then(function (responseInner) {
						if(responseInner.data.status == 'success'){
							//vm.accepted=1;
							alert("Appointment accepted.");
							location.reload(); 
						}
					
					});
				}
				if(response.data.status == 'app_exists'){
					alert("You cannot accept this appointment as you have conficlting appointment.");
				}
				if(response.data.status == 'fail'){
					alert("There is some error in accepting appointment please try again.");
				}
				vm.newAppointmentSchedule={};
			});
		}
		
});

angular.module('healthMon').controller("InsightCtrl", function($timeout, $http,commonFunctions,graphFunctions,_) {
    var vm = this;

    //get current year for display
    var d = new Date();
    vm.currentYear = d.getFullYear();

    // get previous four quarters from current quarter
    vm.quarterDetails = commonFunctions.getLastFourQuarters();

    vm.init = function() {
        vm.showDonutGraph();
        vm.showVerticalBarGraph();
        vm.showHorizontalBarGraph();
        vm.showPieGraph();
    }

    $timeout(vm.init);
    
    vm.showDonutGraph = function() {
         vm.noDonutData = false;

        // on first load, get data for current quarter
        if(vm.patientHbData == null) {
            // by default select current quarter
            vm.donutSelectedKey = commonFunctions.getCurrentQuarter();
            vm.donutSelectedValue = vm.quarterDetails[vm.donutSelectedKey];
			commonFunctions.setASQuarterValue(vm.donutSelectedKey);
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);
            $http.get("portalDashboard/getPatientsHbStatus/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientHbData=response.data;
                if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                    // display div saying 'No EDD data available'
                    vm.noDonutData = true;
                }else {
                    graphFunctions.displayDonutChart(vm.patientHbData);
                }
            });
        }

        // get patient hb data as per quarter selection
        vm.donutQuarterSelected = function (donutItemKey, donutItemValue) {
		 	
		    vm.noDonutData = false;
            vm.donutSelectedKey = donutItemKey;
            vm.donutSelectedValue = donutItemValue;
			commonFunctions.setASQuarterValue(vm.donutSelectedKey);
             var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.donutSelectedKey], vm.donutSelectedKey);

            //fetch data as per selected item
            $http.get("portalDashboard/getPatientsHbStatus/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientHbData=response.data;
                if(commonFunctions.isObjEmpty(vm.patientHbData)) {
                    // display div saying 'No data available'
                    vm.noDonutData = true;
                }else {
                    graphFunctions.displayDonutChart(vm.patientHbData);
                }
            });
        }
    }

    vm.showVerticalBarGraph = function() {
		vm.noVerticalGraphData = false;
        // on first load, get data for current quarter
        if(vm.patientEnrollmentData == null) {
            // by default select current quarter
            vm.verticalBarSelectedKey = commonFunctions.getCurrentQuarter();
            vm.verticalBarSelectedValue = vm.quarterDetails[vm.verticalBarSelectedKey];
			commonFunctions.setEPQuarterValue (vm.verticalBarSelectedKey); 
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);
            $http.get("portalDashboard/getPatientsEnrollmentData/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientEnrollmentData=response.data;
                if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                    // display div saying 'No data available'
                    vm.noVerticalGraphData = true;
                }else {
				    graphFunctions.displayVerticalBarChart(vm.patientEnrollmentData);
                }
            });
        }
        // get patient hb data as per quarter selection
        vm.verticalBarQuarterSelected = function (verticalBarItemKey, verticalBarItemValue) {
            vm.noVerticalGraphData = false;
            vm.verticalBarSelectedValue = verticalBarItemValue;
            vm.verticalBarSelectedKey = verticalBarItemKey;
			commonFunctions.setEPQuarterValue (vm.verticalBarSelectedKey); 
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.verticalBarSelectedKey], vm.verticalBarSelectedKey);

            //fetch data as per selected item
            $http.get("portalDashboard/getPatientsEnrollmentData/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientEnrollmentData=response.data;
                if(commonFunctions.isObjEmpty(vm.patientEnrollmentData)) {
                    // display div saying 'No data available'
                    vm.noVerticalGraphData = true;
                }else {
                    graphFunctions.displayVerticalBarChart(vm.patientEnrollmentData);
                }
            });
        }
    }

	/* vm.showHorizontalBarGraph = function() {
	alert("here");
        vm.noHorizontalGraphData = false;
        // get todays date
        var todaysDate = new Date();
        todaysDate = commonFunctions.formatDate(todaysDate);

        // get future date of 3 months from today's date
        var futureDate = commonFunctions.getFutureDate(90);

        // get expected delivery data for latest three months from today's date
        $http.get("portalDashboard/getPatientsEDDForDuration/"+todaysDate+"/"+futureDate).then(function(response) {
            vm.patientEDDData=response.data;
            if(commonFunctions.isObjEmpty(vm.patientEDDData)) {
                // display div saying 'No data available'
                vm.noHorizontalGraphData = true;
            }else {
                graphFunctions.displayHorizontalBarChart(vm.patientEDDData);
            }
        });
    }*/
	 vm.showHorizontalBarGraph = function() {
	 
        vm.noHorizontalGraphData = false;

        // on first load, get data for current quarter
        if(vm.patientEDData == null) {
            // by default select current quarter
            vm.horizontalSelectedKey = commonFunctions.getCurrentQuarter();
            vm.horizontalSelectedValue = vm.quarterDetails[vm.horizontalSelectedKey];
			commonFunctions.setEDDQuarterValue(vm.horizontalSelectedKey);
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);
			//alert(quarterStartEndDates[0]+"/"+quarterStartEndDates[1]);
             $http.get("portalDashboard/getPatientsEDDForDuration/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientEDData=response.data;
                if(commonFunctions.isObjEmpty(vm.patientEDData)) {
                    // display div saying 'No EDD data available'
                    vm.noHorizontalGraphData = true;
                }else {
				//alert("aftr no data");
                    graphFunctions.displayHorizontalBarChart(vm.patientEDData);
                }
            });
        }

        // get patient hb data as per quarter selection
        vm.horizontalQuarterSelected = function (horizontalItemKey, horizontalItemValue) {
		//alert("selected : " +horizontalItemKey + horizontalItemValue)
            vm.noHorizontalGraphData = false;
            vm.horizontalSelectedKey = horizontalItemKey;
            vm.horizontalSelectedValue = horizontalItemValue;
			
			commonFunctions.setEDDQuarterValue(vm.horizontalSelectedKey);
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.horizontalSelectedKey], vm.horizontalSelectedKey);

            //fetch data as per selected item
				//alert(quarterStartEndDates[0]+"/"+quarterStartEndDates[1]);
             $http.get("portalDashboard/getPatientsEDDForDuration/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.patientEDData=response.data;
				//alert("Test");
				//alert(vm.patientEDData);
                if(commonFunctions.isObjEmpty(vm.patientEDData)) {
                    // display div saying 'No data available'
                    vm.noHorizontalGraphData = true;
                }else {
                    graphFunctions.displayHorizontalBarChart(vm.patientEDData);
                }
            });
        }
    }
   

    vm.showPieGraph = function() { 
	vm.noPieGraphData = false;
        // on first load, get data for current quarter
        if(vm.highRiskPatientData == null) {
            // by default select current quarter
            vm.pieSelectedKey = commonFunctions.getCurrentQuarter();
            vm.pieSelectedValue = vm.quarterDetails[vm.pieSelectedKey];
			commonFunctions.setHRPQuarterValue (vm.pieSelectedKey); 
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);
			
            $http.get("portalDashboard/getHighRiskPatients/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.pieGraphData = Array();
                vm.highRiskPatientData=response.data;
				
                vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

                if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
                    // display div saying 'No data available'
				//	alert( "noPieGraphData");
                    vm.noPieGraphData = true;
                }else {
				 graphFunctions.displayPieChart(vm.pieGraphData);
                }
            });
        }

        // get patient hb data as per quarter selection
        vm.PieQuarterSelected = function (pieItemKey, pieItemValue) {
		
            vm.noPieGraphData = false;
            vm.pieSelectedValue = pieItemValue;
            vm.pieSelectedKey = pieItemKey;
			commonFunctions.setHRPQuarterValue (vm.pieSelectedKey);
            var quarterStartEndDates = commonFunctions.getQuarterStartEndDates(vm.quarterDetails[vm.pieSelectedKey], vm.pieSelectedKey);

            //fetch data as per selected item
            $http.get("portalDashboard/getHighRiskPatients/"+quarterStartEndDates[0]+"/"+quarterStartEndDates[1])
                .then(function(response) {
                vm.highRiskPatientData=response.data;
                vm.pieGraphData = vm.formatPieGraphData(vm.highRiskPatientData);

                if(commonFunctions.isObjEmpty(vm.pieGraphData)) {
                    // display div saying 'No data available'
                    vm.noPieGraphData = true;
                }else {
                    graphFunctions.displayPieChart(vm.pieGraphData);
                }
            });
        }

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
        }
    }
});