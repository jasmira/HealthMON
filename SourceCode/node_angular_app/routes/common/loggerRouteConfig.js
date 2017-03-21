var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var express = require("express");
var router = express.Router();
var logger = require(rootPath+env.paths.utils+"logger.js");

router.get("/read_logs/:errorLevel/:fileName",function(req, res){
    var data = logger.readLogs(req.params.errorLevel, req.params.fileName);
    res.send(data);
});

router.post("/add_log",function(req, res){
    console.log(JSON.stringify(req.body));
    console.log(req.body.type);
    var successs = logger.log(req.body.type, req.body.errorType, req.body.errorMsg);
    if (successs) {
        res.send("done!");
    }else {                
        res.send("fail!");
    }
});

module.exports = router;