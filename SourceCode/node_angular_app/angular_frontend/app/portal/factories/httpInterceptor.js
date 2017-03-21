angular.module('healthMon').factory('httpInterceptor', function ($location,$q,authFact) {
  var httpInterceptor= {
    request: function (config) {
     config.headers['Authorization'] = authFact.getToken();
      return config;
    },
    response : function(response){
        //console.log('in response'+authFact.getToken());
        return response;
    },
    responseError : function(response){
     
        if(response.status==498){
              $location.path('/');  //Token is expired...
              authFact.removeCookies();
        }
            return $q.reject(response);
		}
    };
    return httpInterceptor;
});

angular.module('healthMon').config(function ($httpProvider) {
  $httpProvider.interceptors.push('httpInterceptor');
});