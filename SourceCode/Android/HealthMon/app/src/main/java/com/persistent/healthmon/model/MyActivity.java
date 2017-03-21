package com.persistent.healthmon.model;

/**
 * Created by khyati_shah on 6/1/2016.
 */
public class MyActivity {

    String ashaId;
    String server_task_id;
    String taskId;
    String activityName;
    String comments;
    String taskCreatedTime;
    String taskType;
    String taskDate;
    String taskCreatedDate;
    String taskVenue;
    String taskSeverity;
    String taskActionable;
    String taskAction;
    String taskEndTime;
    String reminderInterval;
    String createdByName;
    String createdBy;
    String taskStatus;
    String reminder_URI;
    String event_URI;
    String is_Edited;
    String is_Uploaded;

    public String getServer_task_id() {
        return server_task_id;
    }

    public void setServer_task_id(String server_task_id) {
        this.server_task_id = server_task_id;
    }

    public String getReminder_URI() {
        return reminder_URI;
    }

    public void setReminder_URI(String reminder_URI) {
        this.reminder_URI = reminder_URI;
    }

    public String getEvent_URI() {
        return event_URI;
    }

    public void setEvent_URI(String event_URI) {
        this.event_URI = event_URI;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    public String getTaskCreatedTime() {
        return taskCreatedTime;
    }

    public void setTaskCreatedTime(String taskCreatedTime) {
        this.taskCreatedTime = taskCreatedTime;
    }

    public String getTaskVenue() {
        return taskVenue;
    }

    public void setTaskVenue(String taskVenue) {
        this.taskVenue = taskVenue;
    }

    public String getTaskSeverity() {
        return taskSeverity;
    }

    public void setTaskSeverity(String taskSeverity) {
        this.taskSeverity = taskSeverity;
    }

    public String getTaskActionable() {
        return taskActionable;
    }

    public void setTaskActionable(String taskActionable) {
        this.taskActionable = taskActionable;
    }

    public String getTaskAction() {
        return taskAction;
    }

    public void setTaskAction(String taskAction) {
        this.taskAction = taskAction;
    }

    public String getTaskEndTime() {
        return taskEndTime;
    }

    public void setTaskEndTime(String taskEndTime) {
        this.taskEndTime = taskEndTime;
    }

    public String getReminderInterval() {
        return reminderInterval;
    }

    public void setReminderInterval(String reminderInterval) {
        this.reminderInterval = reminderInterval;
    }

    public String getCreatedByName() {
        return createdByName;
    }

    public void setCreatedByName(String createdByName) {
        this.createdByName = createdByName;
    }

    public String getIs_Edited() {
        return is_Edited;
    }

    public void setIs_Edited(String is_Edited) {
        this.is_Edited = is_Edited;
    }

    public String getIs_Uploaded() {
        return is_Uploaded;
    }

    public void setIs_Uploaded(String is_Uploaded) {
        this.is_Uploaded = is_Uploaded;
    }

    public String getAshaId() {
        return ashaId;
    }

    public void setAshaId(String ashaId) {
        this.ashaId = ashaId;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }


    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public String getTaskDate() {
        return taskDate;
    }

    public void setTaskDate(String taskDate) {
        this.taskDate = taskDate;
    }

    public String getTaskCreatedDate() {
        return taskCreatedDate;
    }

    public void setTaskCreatedDate(String taskCreatedDate) {
        this.taskCreatedDate = taskCreatedDate;
    }

    @Override
    public String toString() {
        /*return this.taskId + "," + this.activityName + "," + this.comments + "," + this.taskType + "," + this.taskSeverity + "," + this.taskCreatedTime + "," + this.taskCreatedDate + "," +
                this.taskActionable + "," + this.taskAction + "," + this.createdBy + "," + this.taskCreatedDate + "," + this.taskVenue + "," + this.taskCreatedTime + "," + this.taskEndTime
                + "," + this.reminderInterval + "," + this.taskStatus;*/

        return this.ashaId + "," + "1" + "," + this.taskId + "," + this.activityName + "," + this.comments + "," + this.taskCreatedDate + "," + "MyActivity" + "," + this.taskDate + "," + "1" + "," + this.getReminderInterval() + "," + this.ashaId + "," + this.taskStatus;
    }
}
