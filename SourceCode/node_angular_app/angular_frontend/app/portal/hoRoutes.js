angular.module('healthMon').config(function($stateProvider, $urlRouterProvider,PATH) {
    $urlRouterProvider.otherwise('/');
	$stateProvider       
        .state('hoDashboard', {
            url: '/hoDashboard',
            templateUrl: '/static/'+PATH.dashBoardViews+'/hoDashboard.html',
            controller: "hoDashboardCtrl",
			controllerAs: "hoDashboardCtrl",
            authenticated : true
        })    
   
});

