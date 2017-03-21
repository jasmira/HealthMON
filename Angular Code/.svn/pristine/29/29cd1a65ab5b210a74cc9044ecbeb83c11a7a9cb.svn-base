angular.module('healthMon').config(function($stateProvider, $urlRouterProvider,PATH) {
    $urlRouterProvider.otherwise('/');
	$stateProvider       
        .state('/', {
            url: '/',
            templateUrl: '/static/'+PATH.loginViews+'/login.html',
            controller: "loginCtrl",
			controllerAs: "loginCtrl",
            authenticated : true
        })    
        .state('dashboard', {
            url: '/dashboard',          
            views: {
               '': {
					templateUrl: '/static/'+PATH.dashBoardViews+'/dashboard.html',
                    controller: 'dashboardCtrl',
					controllerAs: 'dashboardCtrl'
				},          
               '@dashboard': { 
                    templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-alerts.html',
                    authenticated : true
               },
			   'appointment@dashboard': { 
                    templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-appointments.html',
                    controller: 'AppointmentCtrl',
                    controllerAs: "AppointmentCtrl",
                    authenticated : true
               },
			   'insights@dashboard': { 
                    templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-insights.html',
                    controller: 'InsightCtrl',
                    controllerAs: "InsightCtrl",
                    authenticated : true
               },
			   'admittedPatients@dashboard': { 
                    templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-admittedPatients.html',
                    authenticated : true
                   
               }
            }, 
            templateUrl: '/static/'+PATH.dashBoardViews+'/dashboard.html', 
            controller: "dashboardCtrl",
			controllerAs: "dashboardCtrl",
            authenticated : true
        })
        .state('dashboard.tasks', {
            url: '/tasks',
            templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-tasks.html',
            authenticated : true
        })    
        .state('dashboard.alerts', {
            url: '/alerts',
            templateUrl: '/static/'+PATH.dashBoardViews+'/partial-dashboard-alerts.html',
            authenticated : true
        }) 
	    .state('allPatients', {
            url: '/allPatients',
            templateUrl: '/static/'+PATH.allPatientViews+'/allPatients.html',
            controller: "allPatientsCtrl",
            controllerAs: "allPatientsCtrl",
            authenticated : true
        })
	    .state('patientListView', {
            url: '/patientListView',
            templateUrl: '/static/'+PATH.allPatientViews+'/allPatientsListView.html',
            controller: "allPatientsCtrl",
            controllerAs: "allPatientsCtrl",
            authenticated : true
        }) 
        .state('logout', {
            url: '/logout',
            controller: "logoutCtrl",
            controllerAs: "logoutCtrl",
            authenticated : true
        })
        .state('analytics', {
            url: '/analytics',
            templateUrl: '/static/'+PATH.analyticsViews+'/analytics.html',
            controller: "analyticsCtrl",
            controllerAs: "analyticsCtrl",
            authenticated : true
        }) 
        .state('anemiaStatus', {
            url: '/anemiaStatus',
            templateUrl: '/static/'+PATH.analyticsViews+'/anemiaStatus.html',
            controller: "anemiaStatusCtrl",
            controllerAs: "anemiaStatusCtrl",
            authenticated : true
        }) 
        .state('enrolledPatients', {
            url: '/enrolledPatients',
            templateUrl: '/static/'+PATH.analyticsViews+'/enrolledPatients.html',
            controller: "enrolledPatientsCtrl",
            controllerAs: "enrolledPatientsCtrl",
            authenticated : true
        })
     .state('expectedDelivery', {
            url: '/analyticsED',
            templateUrl: '/static/'+PATH.analyticsViews+'/expected-delivery-analytics.html',
            controller: "expectedDeliveryCtrl",
            controllerAs: "expectedDeliveryCtrl",
            authenticated : true
        })

	    .state('calendar', {
            url: '/calendar',
            templateUrl: '/static/'+PATH.calendarViews+'/calendarMain.html',
            controller: "calendarCtrl",
            controllerAs: "calendarCtrl",
            authenticated : true
        }) 
	    .state('newActivity', {
            url: '/newActivity',
			views: {
				    '': {
						templateUrl: '/static/'+PATH.calendarViews+'/newActivity.html',
						controller: 'newActivityCtrl',
						controllerAs: 'newActivityCtrl'
					},          
				    '@newActivity': { 
						templateUrl: '/static/'+PATH.calendarViews+'/partial-newActivity-invite.html',
						controller: "newActivityInviteCtrl",
						controllerAs: "newActivityInviteCtrl",
						authenticated : true
				   }
			   },
            templateUrl: '/static/'+PATH.calendarViews+'/newActivity.html',
            controller: "newActivityCtrl",
            controllerAs: "newActivityCtrl",
            authenticated : true
      })
	    .state('newActivity.invite', {
            url: '/invite',
            templateUrl: '/static/'+PATH.calendarViews+'/partial-newActivity-invite.html',
			controller: "newActivityInviteCtrl",
			controllerAs: "newActivityInviteCtrl",
            authenticated : true
      })  
	    .state('newActivity.pushActivity', {
            url: '/pushActivity',
            templateUrl: '/static/'+PATH.calendarViews+'/partial-newActivity-pushActivity.html',
			controller: "newActivityPushActivityCtrl",
			controllerAs: "newActivityPushActivityCtrl",
            authenticated : true
      })  		
      .state('newActivity.selfActivity', {
            url: '/selfActivity',
            templateUrl: '/static/'+PATH.calendarViews+'/partial-newActivity-selfSchedule.html',
			controller: "newActivitySelfScheduleCtrl",
			controllerAs: "newActivitySelfScheduleCtrl",
            authenticated : true
      }) 
       .state('patientCareplan', {
            url: '/patientCareplan',
			 views: {
				'': {
						templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/patientCareplan.html',
						controller: 'patientCareplanCtrl',
						controllerAs: 'patientCareplanCtrl'
					},          
				   '@patientCareplan': { 
						templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-careplan.html',
						controller: "patientCareplanCtrl",
						controllerAs: "patientCareplanCtrl",
						authenticated : true
				    }
			    },
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/patientCareplan.html',
            controller: "patientCareplanCtrl",
            controllerAs: "patientCareplanCtrl",
            authenticated : true
        })
        .state('patientCareplan.careplan', {
            url: '/careplan',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-careplan.html',
			controller: "patientCareplanCtrl",
			controllerAs: "patientCareplanCtrl",
            authenticated : true
        })  
        .state('patientCareplan.editcareplan', {
            url: '/editcareplan',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-editcareplan.html',
			controller: "editCareplanCtrl",
			controllerAs: "editCareplanCtrl",
            authenticated : true
        })  
         .state('patientCareplan.addcareplantemplates', {
            url: '/addcareplantemplates',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-addcareplantemplates.html',
			controller: "addcareplantemplatesCtrl",
			controllerAs: "addcareplantemplatesCtrl",
            authenticated : true
        })  
         .state('patientCareplan.viewtrends', {
            url: '/viewtrends',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientViewTrends.html',
            controller: "patientViewTrendsCtrl",
            controllerAs: "patientViewTrendsCtrl",
            authenticated : true
        })
	    .state('patientCareplan.patientSummary', {
            url: '/patientSummary',
			 views: {
				'': {
						templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary.html',
						controller: 'patientCareplanCtrl',
						controllerAs: 'patientCareplanCtrl'
					},          
				'@patientCareplan.patientSummary': { 
						templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-demographics.html',
						controller: "patientDemographicsCtrl",
						controllerAs: "patientDemographicsCtrl",
						authenticated : true
				    }
			    },
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary.html',
			controller: "patientCareplanCtrl",
			controllerAs: "patientCareplanCtrl",
            authenticated : true
        })  		
        .state('patientCareplan.treatment', {
            url: '/treatment',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-treatment.html',
			controller: "patientCareplanCtrl",
			controllerAs: "patientCareplanCtrl",
            authenticated : true
        }) 
        .state('patientCareplan.patientSummary.demographics', {
            url: '/demographics',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-demographics.html',
            controller: "patientDemographicsCtrl",
            controllerAs: "patientDemographicsCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.familyinfo', {
            url: '/familyinfo',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-familyinfo.html',
            controller: "patientFamilyInfoCtrl",
            controllerAs: "patientFamilyInfoCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.patienteligibility', {
            url: '/patienteligibility',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-eligibility.html',
            controller: "patientEligibilityCtrl",
            controllerAs: "patientEligibilityCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.medication', {
            url: '/medication',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-medication.html',
            controller: "patientMedicationCtrl",
            controllerAs: "patientMedicationCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.immunization', {
            url: '/immunization',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-immunization.html',
            controller: "patientImmunizationCtrl",
            controllerAs: "patientImmunizationCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.vitals', {
            url: '/vitals',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-vitals.html',
            controller: "patientVitalsCtrl",
            controllerAs: "patientVitalsCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.patientcareplan', {
            url: '/patientcareplan',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-careplan.html',
            controller: "patientCarePlanCtrl",
            controllerAs: "patientCarePlanCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.hra', {
            url: '/hra',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-hra.html',
            controller: "patientHRACtrl",
            controllerAs: "patientHRACtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.feedback', {
            url: '/feedback',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-feedback.html',
            controller: "patientFeedbackCtrl",
            controllerAs: "patientFeedbackCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.allergies', {
            url: '/allergies',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-allergies.html',
            controller: "patientAllergiesCtrl",
            controllerAs: "patientAllergiesCtrl",
            authenticated : true
        })
        .state('patientCareplan.patientSummary.diagnosis', {
            url: '/diagnosis',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-diagnosis.html',
            controller: "patientDiagnosisCtrl",
            controllerAs: "patientDiagnosisCtrl",
            authenticated : true
        })
		.state('patientCareplan.patientSummary.visitHistory', {
            url: '/visitHistory',
            templateUrl: '/static/'+PATH.allPatientViews+'/PatientsCarePlans/partial-patientSummary-visitHistory.html',
            controller: "patientVisitHistoryCtrl",
            controllerAs: "patientVisitHistoryCtrl",
            authenticated : true
        })
});

angular.module('healthMon').run(['$rootScope','$location','$state','authFact',function($rootScope,$location,$state,authFact){
    $rootScope.$state = $state;
    $rootScope.previousState;
    $rootScope.$on('$stateChangeStart',function(e, toState, toParams, fromState, fromParams){
         $rootScope.previousState=fromState.name;
        if(toState.authenticated==true){
          
            var userAuth=authFact.getToken();
            var userObj=authFact.getUserObj();
            if(userAuth && userObj!=null){
				if(userAuth=='token missing')
					$location.path('/');
				if(userAuth!= 'token missing' && $location.$$path!='/'){
                        $location.path($location.$$path);
				}
                if(userAuth!= 'token missing' && $location.$$path == '/'){
                    $location.path('/dashboard');
				}
            }else{
              $location.path('/');
            }
         }
    });
    
}]);

