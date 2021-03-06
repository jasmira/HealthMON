angular.module('healthMon').controller("loginCtrl", function($http,$location,$cookieStore,$timeout,authFact) {
    
	var vm = this;
    vm.submit = function(){
		var data = { username :vm.username , password:vm.password };
		vm.InvalidCredentials = false;
		var user_id;
     
            $http.post("/login", data).then(function(response) {
                if(response.data.result.authorized) {
                if(authFact.getToken() && authFact.getUserObj()){
					user_id=authFact.getUserObj().HM_User_id;
				} else {
					authFact.setToken(response.data.result.token);
					user_id= response.data.result.HM_User_id;
                }
               
            } else {
				vm.InvalidCredentials=true;
                $location.path('/');
			}
        });
        
        callAtTimeout=function(){
           if(user_id){
                  
                $http.get('common/getUserProfileInfo/'+user_id).then(function(response) { 
             
					var  UserObj={HM_User_id: response.data[0].User_id,User_Name :  
                                  response.data[0].User_Name,User_role : 
								  response.data[0].User_role };
                   
				    $cookieStore.put('UserObj',UserObj);
                    
					if(authFact.getUserObj().User_role=="Medical Officer") {
						$location.path('/dashboard');
					}
					if(authFact.getUserObj().User_role=="Health Officer") {
						$location.path('/hoDashboard');
					}
               });
            }   
        }
                $timeout(callAtTimeout,300);
     }
});
angular.module('healthMon').controller("logoutCtrl", function($http,$location,$timeout,authFact) {
         $http.post('/common/logout').then(function(response) {
        });
          
        $timeout(function() {
            authFact.removeCookies();
           $location.path("/")
        },600);
     
});
