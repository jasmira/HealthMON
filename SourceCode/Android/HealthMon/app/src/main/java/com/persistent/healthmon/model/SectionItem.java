package com.persistent.healthmon.model;

import com.persistent.healthmon.interfaces.Item;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class SectionItem implements Item {

    private final String title;

    public SectionItem(String title) {
        this.title = title;
    }

    public String getTitle(){
        return title;
    }

    @Override
    public boolean isSection() {
        return true;
    }

}