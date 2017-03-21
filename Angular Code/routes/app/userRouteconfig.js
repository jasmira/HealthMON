var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var bodyparser = require('body-parser');
var express = require("express");


var router = express.Router();

router.use(bodyparser.urlencoded({extended : true}));

var userDaoObj = require(env.paths.root+env.paths.daoApp+'userDao.js');
router.post("/login",function(req, res){
    userDaoObj.getUser(req.body.username,req.body.password,function(result){
        res.send(result);
    });
});

router.get("/",function(req,res){
    res.sendFile(env.paths.root+env.paths.views+'index.html');
});

module.exports = router;


