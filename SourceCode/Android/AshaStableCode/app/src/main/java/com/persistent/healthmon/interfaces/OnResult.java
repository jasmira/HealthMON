package com.persistent.healthmon.interfaces;

/**
 * Created by khyati_shah on 6/17/2016.
 */
public interface OnResult {

    public void onError(String message);

    public void onResponse(String message);
}
