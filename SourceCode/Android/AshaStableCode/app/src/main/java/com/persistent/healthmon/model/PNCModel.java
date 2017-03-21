package com.persistent.healthmon.model;


import com.persistent.healthmon.interfaces.GenericModel;
import com.persistent.healthmon.util.Constants;

/**
 * Created by harshal_patil on 5/26/2016.
 */
public class PNCModel implements GenericModel {
    private String name;
    private String subTitle;
    private int image;


    public PNCModel(String name, String subTitle, int image){
        this.name = name;
        this.subTitle = subTitle;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getsubTitle() {
        return subTitle;
    }

    public void setsubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getHeader(){
        return name;
    }

    public String getSubHeader(){
        return subTitle;
    }

    public String getType(){
        return Constants.PNC;
    }

    public int getImageResource(){
        return image;
    }
}