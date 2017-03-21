package com.persistent.healthmon.model;

/**
 * Created by harshal_patil on 5/20/2016.
 */
public class TrainingDetails {

    public TrainingDetails() {

    }
    public TrainingDetails(String hm_learning_id, String hm_program_id, String hm_learning_for_user_type, String hm_learning_description, String hm_learning_type, String hm_learning_is_internal, String hm_learning_content_type, String hm_learning_link, String hm_program_desc) {
        this.learning_id = hm_learning_id;
        this.program_id = hm_program_id;
        //this.user_id = hm_user_id;
        this.learning_for_user_type = hm_learning_for_user_type;
        this.learning_description = hm_learning_description;
        this.learing_type = hm_learning_type;
        this.learning_internal = hm_learning_is_internal;
        this.content_type = hm_learning_content_type;
        this.learning_link = hm_learning_link;
        //this.creation_date = hm_learning_created_date;
        //this.active = hm_learning_active;
        this.program_desc = hm_program_desc;


    }
        String learning_id;
        String program_id;

    public String getLearning_for_ser_type() {
        return learning_for_user_type;
    }

    public void setLearning_for_user_type(String learning_for_user_type) {
        this.learning_for_user_type = learning_for_user_type;
    }

    String learning_for_user_type;
    public String getProgram_desc() {
        return program_desc;
    }

    public void setProgram_desc(String program_desc) {
        this.program_desc = program_desc;
    }

    String program_desc;

    public String getLearning_id() {
        return learning_id;
    }

    public void setLearning_id(String learning_id) {
        this.learning_id = learning_id;
    }

        String user_id;
        String user_type;
        String learning_description;
        String learing_type;

    public String getProgram_id() {
        return program_id;
    }

    public void setProgram_id(String program_id) {
        this.program_id = program_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getLearning_description() {
        return learning_description;
    }

    public void setLearning_description(String learning_description) {
        this.learning_description = learning_description;
    }

    public String getLearing_type() {
        return learing_type;
    }

    public void setLearing_type(String learing_type) {
        this.learing_type = learing_type;
    }

    public String getLearning_internal() {
        return learning_internal;
    }

    public void setLearning_internal(String learning_internal) {
        this.learning_internal = learning_internal;
    }

    public String getContent_type() {
        return content_type;
    }

    public void setContent_type(String content_type) {
        this.content_type = content_type;
    }

    public String getLearning_link() {
        return learning_link;
    }

    public void setLearning_link(String learning_link) {
        this.learning_link = learning_link;
    }

    public String getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(String creation_date) {
        this.creation_date = creation_date;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    String learning_internal;
        String content_type;
        String learning_link;
        String creation_date;
        String active;



    }


