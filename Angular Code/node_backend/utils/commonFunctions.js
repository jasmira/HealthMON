var util = require('util');
var path = require('path');
var rootPath = path.resolve(".");
var env = require(rootPath+"/config/env.js");
var logger = require(rootPath+env.paths.utils+"logger.js");
var connectionProvider = require(rootPath+env.paths.nodeBackend+'mysqlConnectionProvider.js');
var currentFilePath = env.paths.daoApp+'patientDao.js';

var commonFunctions = { 
	multiInsert : function(data, noTimeFieldInDBTable) { // convert input data in array format that can be used for multiple inserts in database
		var dataArr = [];
		for (var prop in data) {
			dataArr.push(data[prop]);
		}

		var arrayForMultiinsert = [];
		for (index = 0; index < dataArr.length; index++) {
            var dataArray = dataArr[index];
            if(noTimeFieldInDBTable == null) {
                //dataArray = dataArray.concat(",",Date.now());
                // add date in yyyy-mm-dd format
                var d = new Date();
                var currentDate = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
                dataArray = dataArray.concat(",", currentDate);
            }
            //remove spaces from every array element, if any
            var arrWOSpaces = dataArray.split(",");
            for(var j=0; j<arrWOSpaces.length; j++) {
                arrWOSpaces[j] = arrWOSpaces[j].trim();
            }
			//arrayForMultiinsert.push((dataArray).split(","));
            arrayForMultiinsert.push(arrWOSpaces);
		}
		return arrayForMultiinsert;
	},
   
    calculateDateDiff : function(dateInput) { // calculate difference of provided dateInput with current date
        if(!dateInput) {
            return false;
        }

        var dateDiff = new Array();
        dateDiff['pastDate'] = 0;
        dateDiff['futureDate'] = 0;
        dateDiff['todayDate'] = 0;
        dateDiff['daysFromTaskCreation']=0;
        dateDiff['hoursFromTaskCreation']=0;

        // The number of milliseconds in one day
        var oneDay = 1000 * 60 * 60 * 24;
        var oneHour=1000 * 60 * 60;

        var d1 = new Date(dateInput);
        // current date is set in d2
        var d2 = new Date();
        // set hours to midnight instead of system time
        d2.setHours(0, 0, 0, 0);

        if(d1 < d2) {// if first date is less than second one
            dateDiff['pastDate'] = 1;
        }else if(d1 > d2) {// if first date is greater than second one
            dateDiff['futureDate'] = 1;
        }else {// if first date is equal to second one
            dateDiff['todayDate'] = 1;
        }

        // Convert both dates to milliseconds to get actual difference between them in days
        var date1_ms = d1.getTime();
        var date2_ms = d2.getTime();
     
        
        // Calculate the difference in milliseconds
        var difference_ms = Math.abs(date1_ms - date2_ms);

        // Convert back to days and return
        dateDiff['diffInDays'] = Math.round(difference_ms/oneDay);
        
        
        if((Math.round(difference_ms/oneHour)/24)<1)
           dateDiff['hoursFromTaskCreation']=Math.round(difference_ms/oneHour)/24;
        else {
            
            dateDiff['daysFromTaskCreation']=(Math.round(difference_ms/oneHour)/24);
            dateDiff['hoursFromTaskCreation']=dateDiff['daysFromTaskCreation']% 24;
           
            }
        return dateDiff;
    },
    
    convertDate : function(inputDate) { // convert date string to mm/dd/YYYY e.g. Tue Apr 26 2016 12:01:23 GMT+0530 (India Standard Time)
        function pad(s) { return (s < 10) ? '0' + s : s; }
        
        var d = new Date(inputDate);
        var finalDate = [pad(d.getMonth()+1), pad(d.getDate()), d.getFullYear()].join('/');
        return finalDate;
    },
    
    groupBy : function(array, col, value) {
        var result = [], o = {};
        array.forEach(function (a) {
            if (!o[a[col]]) {
                o[a[col]] = {};
                o[a[col]][col] = a[col];
                o[a[col]][value] = 0;
                result.push(o[a[col]]);
            }
            o[a[col]][value] += +a[value];
        });
        return result;
    },

    isObjEmpty : function(obj) {
        for(var prop in obj) {
            if(obj.hasOwnProperty(prop))
                return false;
        }
        return true;
    },
    
    groupByArrayOfObjects : function(arr, key) {
        /* INPUT - var origArr = [
                        {food: 'apple', type: 'fruit'},
                        {food: 'potato', type: 'vegetable'},
                        {food: 'banana', type: 'fruit'}
                    ];
        
        OUTPUT - [
                    {type: 'fruit', foods: ['apple', 'banana']},
                    {type: 'vegetable', foods: ['potato']}
                ]*/
        var newArr = [],
            types = {},
            newItem, i, j, cur;
        for (i = 0, j = arr.length; i < j; i++) {
            cur = arr[i];
            if (!(cur[key] in types)) {
                types[cur[key]] = { categoryKey: cur[key], data: [] };
                newArr.push(types[cur[key]]);
            }
            types[cur[key]].data.push(cur);
        }
        return newArr;
    },

    formatArray : function(fieldName, arrayInput) {
        var formattedValue = null;
        var formattedArray = new Object();

        for(var i = 0; i < arrayInput.length; i++) {
            var val = arrayInput[i][fieldName];
            //formattedValue = {[val] : arrayInput[i]};
            //formattedArray.push({[val] : arrayInput[i]});
            formattedArray[val] = arrayInput[i];
        }
        return formattedArray;
    }
};
module.exports = commonFunctions;