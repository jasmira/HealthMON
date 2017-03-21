package persistent.healthmon.interfaces;

/**
 * Created by khyati_shah on 6/17/2016.
 */
public interface OnResult {

    void onError(String message);

    void onResponse(String message);
}
