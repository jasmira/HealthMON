
/**
 * Module dependencies.
 */
var express=require('express');
var path = require('path');
var cron = require('node-cron');
var rootPath = path.resolve(".");
var config = require(rootPath+"/config/env.js");

var http = require('http');
var app = require("./routes");

app.use('/static', express.static(__dirname + config.paths.angularFrontend));
app.use('/ashaProfile', express.static(__dirname + config.paths.public + 'Profile_Images/asha'));
app.use('/educationAndLearning', express.static(__dirname + config.paths.public +'learning_contents'));
app.set('port', 8080);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});