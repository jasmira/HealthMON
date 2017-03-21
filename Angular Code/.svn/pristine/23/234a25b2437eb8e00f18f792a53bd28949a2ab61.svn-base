var winston = require( 'winston' ),
	fs = require( 'fs' ),
    path = require ('path');

var jsEscape = require('js-string-escape');

var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
winston.transports.DailyRotateFile = require('winston-daily-rotate-file');

// save logs for errors in node
var serverLogsPath = env.paths.root+env.logger.serverLogsPath;
// save logs for errors in angular
var clientLogsPath = env.paths.root+env.logger.clientLogsPath;
// specify date format that should be included in log file name
var datePattern = env.logger.fileNameDatePattern;

var log = function(type, level, msg) {
    if(type === 'node') { var dirPath = serverLogsPath; }
    else { var dirPath = clientLogsPath; }

    if ( !fs.existsSync(dirPath) ) {
	   // Create the directory if it does not exist
	   fs.mkdirSync( dirPath );
    }

    //Create the function call from 'type of error' and pass the parameters. Example - debug('debug', 'node', 'DEBUG msg')
    var funcCall = level + "('" + type + "', '" + jsEscape(msg) + "')";
    //Call the function
    var ret = eval(funcCall);
}

var debug = function(type, msg) {
    if(type === 'node') { var dirPath = serverLogsPath; }
    else { var dirPath = clientLogsPath; }

    var winstonObj = new winston.Logger({
      transports: [
        new (winston.transports.DailyRotateFile)({ filename: dirPath + '/log', level: 'debug', datePattern: datePattern})
        //new (winston.transports.Console)({level: 'debug'})
      ]
    });
    winstonObj.debug(msg);
}

var error = function(type, msg) {
    if(type === 'node') { var dirPath = serverLogsPath; }
    else { var dirPath = clientLogsPath; }

    var winstonObj = new winston.Logger({
      transports: [
        new (winston.transports.DailyRotateFile)({ filename: dirPath + '/log', level: 'error', datePattern: datePattern})
        //new (winston.transports.Console)({level: 'error'})
      ]
    });
    winstonObj.error(msg);
}

var warn = function(type, msg) {
    if(type === 'node') { var dirPath = serverLogsPath; }
    else { var dirPath = clientLogsPath; }

    var winstonObj = new winston.Logger({
      transports: [
        new (winston.transports.DailyRotateFile)({ filename: dirPath + '/log', level: 'warn', datePattern: datePattern})
        //new (winston.transports.Console)({level: 'warn'})
      ]
    });
    winstonObj.warn(msg);
}

var info = function(type, msg) {
    if(type === 'node') { var dirPath = serverLogsPath; }
    else { var dirPath = clientLogsPath; }

    var winstonObj = new winston.Logger({
      transports: [
        new (winston.transports.DailyRotateFile)({ filename: dirPath + '/log', level: 'info', datePattern: datePattern})
        //new (winston.transports.Console)({level: 'info'})
      ]
    });
    winstonObj.info(msg);
}

var readLogs = function (level, fileName) {
    // log file
    var data = fs.readFileSync(serverLogsPath+"/"+fileName).toString();
    // convert json data in file to array of json strings based on newline character
    var dataArray = data.split("\n");
    // remove empty array elements, if any
    dataArray = cleanArray(dataArray);
    var outputArr = [];

    for (var i = 0; i < dataArray.length; i++) {
        // remove newlines and carriage returns from each line in file
        var msg = JSON.parse(dataArray[i].replace(/[\n\r]/g, ''));
        if (msg.level === level) {
            outputArr.push(msg);
        }
    }
    return outputArr;
}

function cleanArray(actualArray) {
  var newArray = new Array();
  for (var i = 0; i < actualArray.length; i++) {
    if (actualArray[i]) {
      newArray.push(actualArray[i]);
    }
  }
  return newArray;
}

function concatPathInError(errorMsg, file, api) {
    var errorPath = 'File: ';
    errorPath = errorPath.concat(file, ' API: ', api, ' Error Msg: ');
    errorPath = errorPath.concat(errorMsg);
    return errorPath;
}

module.exports.log = log;
module.exports.readLogs = readLogs;
module.exports.concatPathInError = concatPathInError;