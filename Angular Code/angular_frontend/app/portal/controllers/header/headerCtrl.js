angular.module('healthMon').controller("headerCtrl", function($http,authFact,commonFunctions) {
	var vm = this;
		$http.get("common/getMOTaskAlertsNotifications/"+authFact.getUserObj().HM_User_id,
                      {headers : {'Authorization' : authFact.getToken()}}).then(function(response) {
               vm.TaskAlertList=response.data;
               vm.notifyFlag=commonFunctions.getNotification();
			   var list=vm.TaskAlertList;
			   var cnt = 0;
                vm.showNotification= new Array();
			   for(var i in list){
					if(list[i].User_Task_Type=='notification' && list[i].Task_Viewed != 1){
						cnt++;
                        vm.showNotification.push(list[i]);
                    }
			   }
			   vm.notificationCount=cnt;
			   
         });
        $http.get('common/getUserProfileInfo/'+authFact.getUserObj().HM_User_id,{headers : {'Authorization' : 
                                             authFact.getToken()}}).then(function(response) {             
            vm.profileInfo=response.data;             
        });
     
        vm.clearNotification = function(){
            var list=vm.showNotification;
            for(var i in list){
				if(list[i].User_Task_Type=='notification' && list[i].Task_Viewed != 1){
                        var task_id=list[i].User_Tasks_id;
						$http.get("common/setTaskViewedForHMUserTasks/"+task_id)
                            .then(function(response){
                            commonFunctions.setNotification(true);
                            vm.notifyFlag=commonFunctions.getNotification();
                            vm.notificationCount=0;
                        });
                    }
			   }
        };
});
