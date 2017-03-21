angular.module('healthMon').directive('header',[
	function(){
		"use strict";
		return {
			link: function($scope){
				
			},
			templateUrl:"/static/views/portal/header.html",
			controller: 'headerCtrl',
			controllerAs: 'headerCtrl'
		}
	}
]);