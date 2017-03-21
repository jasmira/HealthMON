angular.module('healthMon').factory('authFact',["$cookieStore",function($cookieStore){
    
    var authFact={};
    authFact.setToken=function(token){
        $cookieStore.put('token',token);
     
    };
     authFact.getToken=function(){
            
        // return  authFact.authToken;
         authFact.Token=$cookieStore.get('token');
         if(!authFact.Token)
             return 'token missing';
         
         return authFact.Token;
     };
    
    /*authFact.setUserObj=function(user){
         $cookieStore.put('UserObj',user);
       console.log('cccc...'+$cookieStore.get('UserObj').HM_User_id);
       // UserObj=user;
    } */
    
    authFact.getUserObj=function(){
        var UserObj=$cookieStore.get('UserObj');
    
        if(UserObj)
        return UserObj;
        else
            console.log('User object not found');
        
    }
    
    authFact.removeCookies=function(){
       
        $cookieStore.remove('token');
        $cookieStore.remove('UserObj');
         
         
         
     }
    return authFact;
}]);