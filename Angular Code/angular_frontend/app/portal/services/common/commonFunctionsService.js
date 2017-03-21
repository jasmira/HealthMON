angular.module('healthMon').service('commonFunctions', function() {
	//donutSelectedKey = getCurrentQuarter();
	
	
    this.getCurrentQuarter = function() {
        var now = new Date();
        var currentQuarter = Math.ceil((now.getMonth() + 1) / 3);
        return currentQuarter;
    }
	var EDDQuarter = this.getCurrentQuarter();
    this.getEDDQuarterValue = function () {
        return EDDQuarter;
    }
    this.setEDDQuarterValue = function(value) {
        EDDQuarter = value;
    }
	
	var HRPQuarter = this.getCurrentQuarter();;
    this.getHRPQuarterValue = function () {
        return HRPQuarter;
    }
    this.setHRPQuarterValue = function(value) {
        HRPQuarter = value;
    }
	
	var ASQuarter = this.getCurrentQuarter();;
    this.getASQuarterValue = function () {
        return ASQuarter;
    }
    this.setASQuarterValue = function(value) {
        ASQuarter = value;
    }
	
	var EPQuarter = this.getCurrentQuarter();;
    this.getEPQuarterValue = function () {
        return EPQuarter;
    }
    
    this.setEPQuarterValue = function(value) {
        EPQuarter = value;
    }
    
    var notifyFlag = false;;
    this.getNotification = function () {
        return notifyFlag;
    }
    this.setNotification = function(value){
        notifyFlag = value;
    }
    
    this.getQuarterStartEndDates = function(yearString, quarter) {// yearString in format "Q2 - Jan-to-Mar (2016)"
        //var year = $scope.quarterDetails[2].split('(');
        var yearArr = yearString.split('(');
        var year = yearArr[1].replace(")", "");
        
        var quarterDates = Array();
        quarterMonthsMapping = {1 : [1, 3], 2 : [4, 6], 3 : [7, 9], 4 : [10, 12]};
        quarterDates[0] = this.getFirstDayOfMonth(year, quarterMonthsMapping[quarter][0]);
        quarterDates[1] = this.getLastDayOfMonth(year, quarterMonthsMapping[quarter][1]);
        return quarterDates;
    }
    
    this.getLastDayOfMonth = function(year, month) {
        var d = new Date((new Date(year, month,1))-1);
        var lastDateOfMonth = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
        //document.write('====='+lastDateOfMonth);
        return lastDateOfMonth;
    }
        
    this.getFirstDayOfMonth = function(year, month) {
        var d = new Date(new Date(year, month,1));
        var FirstDateOfCurrentMonth = d.getFullYear() + "-" + (d.getMonth()) + "-" + d.getDate();
        //document.write(FirstDateOfCurrentMonth);
        return FirstDateOfCurrentMonth;
    }

    this.getLastFourQuarters = function () {
        var amount = 4;
        var now = new Date();
        var thisYear = now.getFullYear();
        var quarterStart = this.getCurrentQuarter();
        
        var quarterMapping = new Object();
        quarterMapping = {1 : 'Jan-to-Mar', 2 : 'Apr-to-June', 3 : 'July-to-Sept', 4 : 'Oct-to-Dec'};

        var quarterData = new Object();

        for (var i = 0; i < amount; i++) {
            var quarter = 'Q' + quarterStart + ' - ' + quarterMapping[quarterStart] + ' (' + thisYear + ')';
            quarterData[quarterStart] = quarter;
            quarterStart--;
            if (quarterStart <= 0) {
                thisYear--;
                quarterStart = 4;
            };
        };
        return quarterData;
    }

    this.isObjEmpty = function(obj) {
        for(var prop in obj) {
            if(obj.hasOwnProperty(prop))
                return false;
        }
        return true;
    }

    this.getFutureDate = function(days) {// gets future date depending on the number of days provided
        // Convert specified 'days' to ms
        var ms = 1000 * 60 * 60 * 24 * days;

        // Get the current date/time
        var todaysDate = new Date();

        // Get 'todaysDate' as time and then add specified 'days' converted to ms to it
        var futureMs = todaysDate.getTime() + ms;

        // create future date from provided time in ms
        // convert it to new Date object and return
        var futureDate = new Date(futureMs);
        //fomat date to yyyy-mm-dd
        futureDate = this.formatDate(futureDate);
        return futureDate;
    }
    
    this.getPastDate = function(days) {
        // Convert specified 'days' to ms
        var ms = 1000 * 60 * 60 * 24 * days;

        // Get the current date/time
        var todaysDate = new Date();

        // Get 'todaysDate' as time and then subtract specified 'days' converted to ms from it
        var pastMs = todaysDate.getTime() - ms;

        // create past date from provided time in ms
        // convert it to new Date object and return
        var pastDate = new Date(pastMs);
        //fomat date to yyyy-mm-dd
        pastDate = this.formatDate(pastDate);
        return pastDate;
    }

    this.formatDate = function(date) {// formats specified date to yyyy-mm-dd format
        var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        var formattedDate = [year, month, day].join('-');
        return formattedDate;
    }

    this.formatArray = function(fieldName, arrayInput) {
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

    this.arrayIntersect = function(a, b) {
        var ai=0, bi=0;
        var result = [];

        while( ai < a.length && bi < b.length ) {
            if (a[ai] < b[bi] ){ ai++; }
            else if (a[ai] > b[bi] ){ bi++; }
            else {/* they're equal */
                result.push(a[ai]);
                ai++;
                bi++;
            }
        }
        return result;
    }

    this.createUniqueArrayFromObj = function(obj) {
        var uniqueArray = [];
        var length = Object.keys(obj).length;
        for (var i=0, l=length; i<l; i++) {
            if (uniqueArray.indexOf(obj[i]) === -1 && obj[i] !== '') uniqueArray.push(obj[i]);
        }
        return uniqueArray;
    }

    this.inObject = function(needle, haystack) {
        var length = Object.keys(haystack).length;
        for(var i = 0; i < length; i++) {
            if(haystack[i] == needle) return true;
        }
        return false;
    }
    
    this.inArray = function(needle, haystack) {
        var length = haystack.length;
        for(var i = 0; i < length; i++) {
            if(haystack[i] == needle) return true;
        }
        return false;
    }

    this.groupByArrayOfObjects = function(arr, key) {
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
    }

    this.calculatePregnancyWeeks = function(LMPDate) {
        var weeks = 0;
        if(LMPDate) {
            var date1 = new Date();
            var arrDateValue = LMPDate.split('-');
            var date2 = new Date(arrDateValue[1] + '/' + arrDateValue[2] + '/' + arrDateValue[0]);
            var perWeek = 24 * 60 * 60 * 1000 * 7;
            var weeks = Math.round((date1.valueOf()- date2.valueOf())/ perWeek) + 1;
        }
        return weeks;
    }
	 this.getMonthName = function(month) {
        var monthName = 0;
		var monthNames = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
		var date = new Date(month);
		var startMonth=((date.getMonth()+1)>=10)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
		return monthNames[startMonth-1];
    }
});