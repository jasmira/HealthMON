package persistent.healthmon.interfaces;

import com.android.volley.VolleyError;

/**
 * Created by khyati_shah on 4/1/2016.
 */
public interface LoginData {

    void onData(String response);
    void onError(VolleyError error);
}
