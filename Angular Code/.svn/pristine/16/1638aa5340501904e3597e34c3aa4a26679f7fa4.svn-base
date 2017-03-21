angular.module('healthMon').controller("calendarCtrl", ['$http','uiCalendarConfig','moment','authFact','$uibModal',function($http,uiCalendarConfig,moment,authFact,$uibModal) {
	var vm = this;
	vm.SelectedEvent = null;
	var isFirstTime = true;
	var loggedInUser = authFact.getUserObj().HM_User_id;
	$http.get("portalCalendar/getUsersProgramId/"+loggedInUser).then(function(response) {
		vm.programId = response.data.Programs_id;					
	});
	vm.events = [];
	vm.eventSources = [vm.events];
 
	vm.NewEvent = {};
	//this function for get datetime from json date
	function getDate(datetime) {
		if (datetime != null) {
			var mili = datetime.replace(/\/Date\((-?\d+)\)\//, '$1');
			return new Date(parseInt(mili));
		}
		else {
			return "";
		}
	}
	// this function for clear clender enents
	function clearCalendar() {
		if (uiCalendarConfig.calendars.myCalendar != null) {
			uiCalendarConfig.calendars.myCalendar.fullCalendar('removeEvents');
			uiCalendarConfig.calendars.myCalendar.fullCalendar('unselect');
		}
	}
	
	//Load events from server
	// will put this to a method 
	function populate() {
		clearCalendar();
		$http.get("portalCalendar/getCalendarActivities/"+authFact.getUserObj().HM_User_id).then(function(response) {
		vm.events.slice(0, vm.events.length);
		angular.forEach(response.data,function(value){
			vm.events.push({
				id:value.User_Tasks_id,
				title:value.User_Task_Name,
				description:value.User_Task_Description,
				start:moment(value.User_start_time),
				end:moment(value.User_end_time),
				allDay:value.All_Day,
				Venue : value.User_task_Venue,
				ReminderInterval : value.User_Reminder_interval,
				allDayEvent:value.All_Day,
				setReminder:value.Set_Reminder,
				stick:true
			});
		});
	});
	}
	populate();
	
	//configure calendar
	vm.uiConfig = {
		calendar: {
			height: 450,
			editable: true,
			eventOverlap: false,
			displayEventTime: true,
			header: {
				left: 'month,agendaWeek,agendaDay',
				center: 'title',
				right:'today prev,next'
			},
			timeFormat : {
				month : ' ', // for hide on month view
				agenda: 'h:mm'
			},
			selectable: true,
			selectHelper: true,
			select : function(start, end){
				var fromDate = moment(start).format('YYYY/MM/DD LT');
				var endDate = moment(end).format('YYYY/MM/DD LT');
				vm.NewEvent = {
					EventID : 0,
					StartAt : fromDate,
					EndAt : endDate,
					IsFullDay :false,
					Title : '',
					Description : '',
					Venue : '',
					ReminderInterval : '',
					allDayEvent:false,
					setReminder:false,
					userId:authFact.getUserObj().HM_User_id
				}
 
				vm.ShowModal();
			},
			eventResize: function(event) {
				vm.SelectedEvent = event;
				var endDate;
				var fromDate = moment(event.start).format('YYYY/MM/DD LT');
				endDate = moment(event.end).format('YYYY/MM/DD LT');
				var allDay = ((event.allDayEvent == 1) ? true : false);
				var reminder = ((event.setReminder == 1) ? true : false);
				//alert(event.end+"before");
				if(event.allDay==true && event.end==null) {
				  endDate = moment(fromDate).add(24, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				if(event.allDay==false && event.end==null) {
				  endDate = moment(fromDate).add(2, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				//alert(endDate+"end date");alert(event.end+"after");
				vm.NewEvent = {
					EventID : event.id,
					StartAt : fromDate,
					EndAt : endDate,
					IsFullDay :false,
					Title : event.title,
					Description : event.description,
					Venue : event.Venue,
					ReminderInterval : event.ReminderInterval,
					allDayEvent:allDay,
					setReminder:reminder,
					userId:authFact.getUserObj().HM_User_id
				}
				vm.ShowModal();
				alert("Time slot has been changed please save the changes.");
			},
			eventDrop: function(event) {
				vm.SelectedEvent = event;
				var endDate;
				var fromDate = moment(event.start).format('YYYY/MM/DD LT');
				endDate = moment(event.end).format('YYYY/MM/DD LT');
				var allDay = ((event.allDayEvent == 1) ? true : false);
				var reminder = ((event.setReminder == 1) ? true : false);
				//alert(event.end+"before");
				if(event.allDay==true && event.end==null) {
				  endDate = moment(fromDate).add(24, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				if(event.allDay==false && event.end==null) {
				  endDate = moment(fromDate).add(2, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				//alert(endDate+"end date");alert(event.end+"after");
				vm.NewEvent = {
					EventID : event.id,
					StartAt : fromDate,
					EndAt : endDate,
					IsFullDay :false,
					Title : event.title,
					Description : event.description,
					Venue : event.Venue,
					ReminderInterval : event.ReminderInterval,
					allDayEvent:allDay,
					setReminder:reminder,
					userId:authFact.getUserObj().HM_User_id
				}
				vm.ShowModal();
				alert("Time slot has been changed please save the changes.");
			},
			eventClick: function (event) {
				vm.SelectedEvent = event;
				var endDate;
				var fromDate = moment(event.start).format('YYYY/MM/DD LT');
				endDate = moment(event.end).format('YYYY/MM/DD LT');
				var allDay = ((event.allDayEvent == 1) ? true : false);
				var reminder = ((event.setReminder == 1) ? true : false);
				//alert(event.end+"before");
				if(event.allDay==true && event.end==null) {
				  endDate = moment(fromDate).add(24, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				if(event.allDay==false && event.end==null) {
				  endDate = moment(fromDate).add(2, 'hours').format('YYYY/MM/DD LT');
				  event.end = endDate;
				}
				//alert(endDate+"end date");alert(event.end+"after");
				vm.NewEvent = {
					EventID : event.id,
					StartAt : fromDate,
					EndAt : endDate,
					IsFullDay :false,
					Title : event.title,
					Description : event.description,
					Venue : event.Venue,
					ReminderInterval : event.ReminderInterval,
					allDayEvent:allDay,
					setReminder:reminder,
					userId:authFact.getUserObj().HM_User_id
				}
 
				vm.ShowModal();
			},
			/*eventAfterAllRender: function () {
				if (vm.events.length > 0 && isFirstTime) {
					//Focus first event
					uiCalendarConfig.calendars.myCalendar.fullCalendar('gotoDate', vm.events[0].start);
					isFirstTime = false;
				}
			},*/
			eventMouseover: function(calEvent, jsEvent) {
				var tooltip = '<div class="tooltipevent" style="padding:0.5%;padding-top:0;font-size:12px; border:1px solid #275073; border-radius:5px; background:#fff;position:absolute;z-index:10001;color:#275073"><span style="background:#275073;width:100%!important;margin-top:0;align:center;color:#fff;font-size:22px;">' + calEvent.title +'</span></br>Start:'+moment(calEvent.start).format('DD/MM/YYYY LT') +'</br>End:'+moment(calEvent.end).format('DD/MM/YYYY LT')+'</br>Location: '+calEvent.Venue+'</div>';
				$("body").append(tooltip);
				$(this).mouseover(function(e) {
					$(this).css('z-index', 10000);
					$('.tooltipevent').fadeIn('500');
					$('.tooltipevent').fadeTo('10', 1.9);
				}).mousemove(function(e) {
					$('.tooltipevent').css('top', e.pageY + 10);
					$('.tooltipevent').css('left', e.pageX + 20);
				});
			},
			eventMouseout: function(calEvent, jsEvent) {
				 $(this).css('z-index', 8);
				 $('.tooltipevent').remove();
			},
		}
	};
 
	//This function for show modal dialog
	vm.ShowModal = function () {
		vm.option = {
			templateUrl: 'modalContent.html',
			controller: 'modalController',
			controllerAs: 'modalController',
			backdrop: 'static',
			resolve: {
				NewEvent: function () {
					return vm.NewEvent;
				}
			}
		};
 
		var modal = $uibModal.open(vm.option);
		modal.result.then(function (data) {
			vm.NewEvent = data.event; 
			vm.NewEvent.StartAt = moment(vm.NewEvent.StartAt).format('YYYY-MM-DD HH:mm:ss');
			vm.NewEvent.EndAt = moment(vm.NewEvent.EndAt).format('YYYY-MM-DD HH:mm:ss');
			vm.NewEvent.currentdate = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
			vm.NewEvent.programId = vm.programId;
			switch (data.operation) {
				case 'Save':
					//Save here
					$http({
						method: 'POST',
						url: '/portalCalendar/addEditSelfSchedule',
						data : vm.NewEvent
					}).then(function (response) {
						if (response.data.status) {
							populate();
						}
					})
					break;
				case 'Delete':
					//Delete here $http({
					$http({
						method: 'POST',
						url: '/portalCalendar/deleteSelfSchedule',
						data: {'eventID' : vm.NewEvent.EventID }
					}).then(function (response) {
						if (response.data.status) {
							populate();
						}
					})
					break;
				default:
					break;
			}
		}, function () {
			console.log('Modal dialog closed');
		})
	}
 
}]);

// create a new controller for modal 
angular.module('healthMon').controller('modalController', ['$uibModalInstance', 'NewEvent','moment', function ($uibModalInstance,NewEvent,moment) {
	var vm = this;
	vm.NewEvent = NewEvent;
	vm.Message = "";
	//alert(JSON.stringify(vm.NewEvent));
	var currentdate = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
	var start = moment(vm.NewEvent.StartAt).format('YYYY-MM-DD HH:mm:ss');
	var end = moment(vm.NewEvent.EndAt).format('YYYY-MM-DD HH:mm:ss');
	//alert(vm.NewEvent.StartAt+"----"+start);
	//alert(vm.NewEvent.EndAt+"----"+end);
	vm.ok = function () {
		if(start < currentdate){
			alert("You cannot schedule an activity in past date.");
			return false;
		}
		if(end < currentdate){
			alert("You cannot schedule an activity in past date.");
			return false;
		}
		if (vm.NewEvent.Title.trim() != "") {
			$uibModalInstance.close({event : vm.NewEvent, operation: 'Save'});
		}
		else {
			vm.Message = "Event Subject required!";
		}
	}
	vm.delete = function () {
		$uibModalInstance.close({ event: vm.NewEvent, operation: 'Delete' });
	}
	vm.cancel = function () {
		$uibModalInstance.dismiss('cancel');
	}
}]);

// create a new controller for New Activity 
angular.module('healthMon').controller('newActivityCtrl', ['$http', function ($http) {
	var vm = this;
	
}]);

// create a new controller for New Activity  Invite
angular.module('healthMon').controller('newActivityInviteCtrl', ['$http','authFact','moment', function ($http,authFact,moment) {
	var vm = this;
	var currentdate2 = moment(new Date()).format('YYYY-MM-DD HH:mm');
	vm.message = "";
	vm.newInvite = {};
	var loggedInUser = authFact.getUserObj().HM_User_id;
	
	
	$http.get("common/getUserList").then(function(response) {
		var data = response.data;
		vm.users = data.filter(function(returnableObjects){
               return returnableObjects.HM_User_id !== loggedInUser;
        });
	});
	
	vm.saveInvite = function () { 
		
		if(vm.newInvite.selectedUsers === undefined){
			alert("Please Select users.");
			form.selectedUsers.focus();
			return false;
		}
		if(vm.newInvite.venue === undefined){
			alert("Please enter Venue.");
			form.venue.focus();
			return false;
		}
		if(vm.newInvite.start === undefined){
			alert("Please enter Start Time.");
			form.startDt.focus();
			return false;
		}
		if(moment(vm.newInvite.start,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
			alert("Please enter valid Start Time.");
			form.startDt.focus();
			return false;
		}
		
		if(vm.newInvite.allDayBooked === undefined) {
			if(vm.newInvite.end === undefined){
				alert("Please enter End Time.");
				form.endDt.focus();
				return false;
			}
			if(moment(vm.newInvite.end,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
				alert("Please enter valid End Time.");
				form.endDt.focus();
				return false;
			}
		}
		if(moment(vm.newInvite.start).format('YYYY-MM-DD HH:mm') < currentdate2){
			alert("You cannot schedule an activity in past date.");
			form.startDt.focus();
			return false;
		}
		if(vm.newInvite.allDayBooked === undefined) {
			if(moment(vm.newInvite.end).format('YYYY-MM-DD HH:mm') < currentdate2){
				alert("You cannot schedule an activity in past date.");
				form.endDt.focus();
				return false;
			}
			if((moment(vm.newInvite.start).format('YYYY-MM-DD HH:mm')) ===  (moment(vm.newInvite.end).format('YYYY-MM-DD HH:mm'))){
				alert("Start Time and End Time should not be same.");
				form.endDt.focus();
				return false;
			}
			if(moment(vm.newInvite.start).format('YYYY-MM-DD HH:mm') >  moment(vm.newInvite.end).format('YYYY-MM-DD HH:mm')){
				alert("Start Time should less than End Time.");
				form.startDt.focus();
				return false;
			}
		}
		if(vm.newInvite.subject === undefined){
			alert("Please enter Subject.");
			form.subject.focus();
			return false;
		}
		if(vm.newInvite.allDayBooked === true && vm.newInvite.start!== undefined){
			var endtym = moment(vm.newInvite.start).add(1, 'day').format('YYYY-MM-DD');
			var endHrs = ' 00:00:00'
			vm.newInvite.end = endtym+endHrs;
			vm.newInvite.start =moment(vm.newInvite.start).format('YYYY-MM-DD')+endHrs;
			confirm("Invite is set for All day. \n\nSelected Start time is: " + vm.newInvite.start +"\n\nEnd time Will be: "+vm.newInvite.end+"\n\nDo you want to continue");
			
		}
		
		$http.get("portalCalendar/getUsersProgramId/"+loggedInUser).then(function(response) {
			vm.newInvite.programId = response.data.Programs_id;
			//alert("ppp  "+vm.newInvite.programId);
			var selectedUsersArray = [];
			var usersProgramIdsArray = [];
			selectedUsersArray.push(loggedInUser);
			usersProgramIdsArray.push(vm.newInvite.programId);
			angular.forEach(vm.newInvite.selectedUsers,function(value){
				selectedUsersArray.push(value.HM_User_id);
				usersProgramIdsArray.push(value.Programs_id);
			});
			vm.newInvite.selectedUsers = selectedUsersArray;
			vm.newInvite.usersProgramIds = usersProgramIdsArray;
			//alert(vm.newInvite.usersProgramIds);
			vm.newInvite.Created_by = loggedInUser;
			vm.newInvite.Created_Date = currentdate2;
			vm.newInvite.User_Task_Date = vm.newInvite.start;
			$http({
					method: 'POST',
					url: '/portalCalendar/addInvites',
					data : vm.newInvite
				}).then(function (response) {
						//alert(response.data.message);
						vm.message = response.data.message;
						vm.newInvite={};
					
				})
		});
	}
}]);
// create a new controller for New Activity  Push
angular.module('healthMon').controller('newActivityPushActivityCtrl', ['$http','authFact','moment','$timeout', function ($http,authFact,moment,$timeout) {
	var vm = this;
	var currentdate3 = moment(new Date()).format('YYYY-MM-DD HH:mm');
	vm.message = "";
	var loggedInUser = authFact.getUserObj().HM_User_id;
	vm.newPushActivity = {};
	$http.get("common/getAshaAnmUserList").then(function(response) {
		var data = response.data;
		vm.users = data.filter(function(returnableObjects){
               return returnableObjects.HM_User_id !== loggedInUser;
        });
	});
	vm.savePushActivity = function () {
		if(vm.newPushActivity.selectedUsers === undefined){
			alert("Please Select users.");
			form.selectedUsers.focus();
			return false;
		}
		if(vm.newPushActivity.venue === undefined){
			alert("Please enter Venue.");
			form.venue.focus();
			return false;
		}
		if(vm.newPushActivity.start === undefined || vm.newPushActivity.start === ''){
			alert("Please enter Start Time.");
			form.startDt.focus();
			return false;
		}
		if(moment(vm.newPushActivity.start,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
			alert("Please enter valid Start Time.");
			form.startDt.focus();
			return false;
		}
		//alert(vm.newPushActivity.end);
		if(moment(vm.newPushActivity.start).format('YYYY-MM-DD HH:mm') < currentdate3){
			alert("You cannot schedule an activity in past date.");
			form.startDt.focus();
			return false;
		}
		
		
		if(vm.newPushActivity.end !== undefined || vm.newPushActivity.end === ''){
			if(moment(vm.newPushActivity.end,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
				alert("Please enter valid End Time.");
				form.endDt.focus();
				return false;
			}
			if(moment(vm.newPushActivity.end).format('YYYY-MM-DD HH:mm') < currentdate3){
				alert("You cannot schedule an activity in past date.");
				form.endDt.focus();
				return false;
			}
		}
		if(vm.newPushActivity.allDayBooked === undefined) {
			if(vm.newPushActivity.end !== undefined){
				
				if(moment(vm.newPushActivity.start).format('YYYY-MM-DD HH:mm') ==  moment(vm.newPushActivity.end).format('YYYY-MM-DD HH:mm')){
					alert("Start time and End time should not be same.");
					form.endDt.focus();
					return false;
				}
				if(moment(vm.newPushActivity.start).format('YYYY-MM-DD HH:mm') >  moment(vm.newPushActivity.end).format('YYYY-MM-DD HH:mm')){
					alert("Start time should less than End time.");
					form.startDt.focus();
					return false;
				}
				
			}
		}
		if(vm.newPushActivity.subject === undefined || vm.newPushActivity.subject === ''){
			alert("Please enter Subject.");
			form.subject.focus();
			return false;
		}
		if(vm.newPushActivity.allDayBooked === true && vm.newPushActivity.start!== undefined){
			var endtym = moment(vm.newPushActivity.start).add(1, 'day').format('YYYY-MM-DD');
			var endHrs = ' 00:00:00'
			vm.newPushActivity.end = endtym+endHrs;
			vm.newPushActivity.start =moment(vm.newPushActivity.start).format('YYYY-MM-DD')+endHrs;
			confirm("Invite is set for All day. \n\nSelected Start time is: " + vm.newPushActivity.start +"\n\nEnd time Will be: "+vm.newPushActivity.end+"\n\nDo you want to continue");
			
		}
		var selectedUsersArray = [];
		var usersProgramIdsArray = [];
		//alert(JSON.stringify(vm.newPushActivity.selectedUsers));
		angular.forEach(vm.newPushActivity.selectedUsers,function(value){
			selectedUsersArray.push(value.HM_User_id);
			usersProgramIdsArray.push(value.Programs_id);
		});
		vm.newPushActivity.selectedUsers = selectedUsersArray;
		vm.newPushActivity.usersProgramIds = usersProgramIdsArray;
		vm.newPushActivity.Created_by = loggedInUser;
		vm.newPushActivity.Created_Date = currentdate3;
		vm.newPushActivity.User_Task_Date = vm.newPushActivity.start;
		if(vm.newPushActivity.end === undefined){
			vm.newPushActivity.end = moment(vm.newPushActivity.start).add(6, 'hours').format('YYYY-MM-DD HH:mm:ss');
		}
		//alert(usersProgramIdsArray);
		
		$http({
				method: 'POST',
				url: '/portalCalendar/addPushActivity',
				data : vm.newPushActivity
			}).then(function (response) {
					
					//alert(response.data.message);
					vm.message = response.data.message;
					vm.newPushActivity={};
				
			})
		
	}
}]);
// create a new controller for New Activity Self Schedule
angular.module('healthMon').controller('newActivitySelfScheduleCtrl', ['$http','authFact','moment','$timeout', function ($http,authFact,moment,$timeout) {
	var vm = this;
	vm.message = '';
	var currentdate1 = moment(new Date()).format('YYYY-MM-DD HH:mm');
	var loggedInUser = authFact.getUserObj().HM_User_id;
	vm.newSelfSchedule = {};
	
	vm.saveSelfSchedule = function () {
		if(vm.newSelfSchedule.subject === undefined){
			alert("Please enter Subject.");
			form.subject.focus();
			return false;
		}
		if(vm.newSelfSchedule.venue === undefined){
			alert("Please enter Venue.");
			form.venue.focus();
			return false;
		}
		
		if(vm.newSelfSchedule.start === undefined){
			alert("Please enter Start Time.");
			form.startDt.focus();
			return false;
		}
		if(moment(vm.newSelfSchedule.start,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
			alert("Please enter valid Start Time.");
			form.startDt.focus();
			return false;
		}
		
		if(vm.newSelfSchedule.allDayBooked === undefined) {
			if(vm.newSelfSchedule.end === undefined){
				alert("Please enter End Time.");
				form.endDt.focus();
				return false;
			}
			if(moment(vm.newSelfSchedule.end,  'YYYY-MM-DD HH:mm:ss', true).isValid() === false){
				alert("Please enter valid End Time.");
				form.startDt.focus();
				return false;
			}
		}
		if(moment(vm.newSelfSchedule.start).format('YYYY-MM-DD HH:mm') < currentdate1){
			alert("You cannot schedule an activity in past date.");
			form.startDt.focus();
			return false;
		}
		if(moment(vm.newSelfSchedule.end).format('YYYY-MM-DD HH:mm') < currentdate1){
			alert("You cannot schedule an activity in past date.");
			form.endDt.focus();
			return false;
		}
		if(vm.newSelfSchedule.allDayBooked === undefined) {
			if(moment(vm.newSelfSchedule.start).format('YYYY-MM-DD HH:mm') ==  moment(vm.newSelfSchedule.end).format('YYYY-MM-DD HH:mm')){
				alert("Start Time and End Time should not be same.");
				form.endDt.focus();
				return false;
			}
			if(moment(vm.newSelfSchedule.start).format('YYYY-MM-DD HH:mm') >  moment(vm.newSelfSchedule.end).format('YYYY-MM-DD HH:mm')){
				alert("Start Time should less than End Time.");
				form.startDt.focus();
				return false;
			}
		}
		if(vm.newSelfSchedule.allDayBooked === true && vm.newSelfSchedule.start!== undefined){
			var endtym = moment(vm.newSelfSchedule.start).add(1, 'day').format('YYYY-MM-DD');
			var endHrs = ' 00:00:00'
			vm.newSelfSchedule.end = endtym+endHrs;
			vm.newSelfSchedule.start =moment(vm.newSelfSchedule.start).format('YYYY-MM-DD')+endHrs;
			confirm("Invite is set for All day. \n\nSelected Start time is: " + vm.newSelfSchedule.start +"\n\nEnd time Will be: "+vm.newSelfSchedule.end+"\n\nDo you want to continue");
			
		}
		vm.newSelfSchedule.userId = loggedInUser;
		vm.newSelfSchedule.Created_by = loggedInUser;
		vm.newSelfSchedule.Created_Date = currentdate1;
		$http.get("portalCalendar/getUsersProgramId/"+loggedInUser).then(function(response) {
					vm.newSelfSchedule.programId = response.data.Programs_id;					
				
			$http({
					method: 'POST',
					url: '/portalCalendar/addSelfSchedule',
					data : vm.newSelfSchedule
				}).then(function (response) {
						
						//alert(response.data.message);
						vm.message = response.data.message;
						vm.newSelfSchedule={};
					
				})
		});
		
	}
}]);


