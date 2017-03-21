package com.persistent.healthmon.model;

import com.persistent.healthmon.interfaces.GenericModel;
import com.persistent.healthmon.util.Constants;


/**
 * Created by harshal_patil on 5/26/2016.
 */
public class FPModel implements GenericModel {
    private String name;
    private String subTitle;
    private int image;


    public FPModel(String name, String subTitle, int image){
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

    public String getCountryOfOrigin() {
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
        return Constants.CH;
    }

    public int getImageResource(){
        return image;
    }

}
