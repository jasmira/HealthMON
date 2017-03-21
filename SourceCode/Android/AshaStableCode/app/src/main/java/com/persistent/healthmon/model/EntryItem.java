package com.persistent.healthmon.model;

import com.persistent.healthmon.interfaces.Item;

/**
 * Created by harshal_patil on 5/19/2016.
 */
public class EntryItem implements Item {

    public final String title;

    public EntryItem(String title) {
        this.title = title;
    }

    @Override
    public boolean isSection() {
        return false;
    }

}