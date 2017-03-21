package com.persistent.healthmon.interfaces;

import android.net.Uri;

/**
 * Created by khyati_shah on 6/23/2016.
 */
public interface ReminderCreated {
    public void onReminderCreated(Uri eventURI, Uri reminderURI);
}
