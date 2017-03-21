package com.persistent.healthmon.interfaces;

import com.android.volley.VolleyError;

/**
 * Created by harshal_patil on 6/9/2016.
 */
public interface EducationData {

    void onData(String response);
    void onError(VolleyError error);
}
