var express = require("express");
var app = express();
var path = require('path');
var rootPath = path.resolve(".");
var config = require(rootPath+"/config/env.js");
var bodyparser=require('body-parser');
app.use(bodyparser.urlencoded({extended : true}));
app.use(bodyparser.json());

//var indexRoute = require(config.paths.root+config.paths.commonRoutes+"loginRouteConfig.js");
var userRoute = require(config.paths.root+config.paths.appRoutes+"userRouteconfig.js");
var patientRoute = require(config.paths.root+config.paths.appRoutes+"patientRouteConfig.js");
var loggerRoute = require(config.paths.root+config.paths.commonRoutes+"loggerRouteConfig.js");
var masterTableRoute = require(config.paths.root+config.paths.commonRoutes+"masterTableRouteConfig.js");
var commonApisRoute = require(config.paths.root+config.paths.commonRoutes+"commonApisRouteConfig.js");
var portalDashboardRoute = require(config.paths.root+config.paths.portalRoutes+"dashboardRouteConfig.js");
var portalCalendarRoute = require(config.paths.root+config.paths.portalRoutes+"calendarRouteConfig.js");

//app.use('/login',indexRoute);
app.use("/", userRoute);

app.use("/", loggerRoute);
app.use("/masterData", masterTableRoute);
app.use("/patient", patientRoute);
app.use("/common", commonApisRoute);
app.use("/portalDashboard", portalDashboardRoute);
app.use("/portalCalendar", portalCalendarRoute);

//var notfound = require("../includes/404.js")(app);

module.exports = app;
