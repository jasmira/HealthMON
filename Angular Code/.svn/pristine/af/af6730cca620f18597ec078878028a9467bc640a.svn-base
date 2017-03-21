angular.module('healthMon').factory('login', ['$http', function($http) {
  $http.post("/login", data).then(function(response) {
          
          if(response.data.result.authorized)
               $location.path('/dashboard');
          else 
               $location.path('/');
        });
 }]);