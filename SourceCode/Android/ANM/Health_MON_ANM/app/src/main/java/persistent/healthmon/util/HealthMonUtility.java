package persistent.healthmon.util;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.Environment;
import android.content.res.Resources;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Locale;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import persistent.healthmon.R;
import persistent.healthmon.fragments.PatientRegistrationFragment;
import persistent.healthmon.model.SpinerIdValue;

/**
 * Created by khyati_shah on 5/25/2016.
 */
public class HealthMonUtility {

    public static boolean isTablet(Context context) {
        boolean xlarge = ((context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) == Configuration.SCREENLAYOUT_SIZE_XLARGE);
        boolean large = ((context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) == Configuration.SCREENLAYOUT_SIZE_LARGE);
        return (xlarge || large);
    }

    public static void replaceFragment(Context context, Fragment fragment) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.fragmentContainerMain, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void addFragment(Context context, Fragment fragment) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.add(R.id.fragmentContainerMain, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void replaceFragment(Context context, Fragment fragment, int contianerId) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(contianerId, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void reloadFragment(Context context, Fragment fragment, int contianerId) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();

        Fragment targetFragment = fragmentManager.findFragmentByTag(fragment.getClass().toString());
        if (targetFragment == null) {
            fragmentTransaction.add(contianerId, fragment, fragment.getClass().toString());
        } else {

            List<Fragment> al = fragmentManager.getFragments();
            for (Fragment frag : al) {
                if (frag != null) {
                    if (!(frag instanceof PatientRegistrationFragment))
                        fragmentTransaction.hide(frag);
                }
            }
            fragmentTransaction.show(targetFragment);
        }
        fragmentTransaction.commit();
    }
    public static int getSelectedPositionSpinner(Spinner spiiner, String selectedText) {
        int index = 0;

        for (int i = 0; i < spiiner.getCount(); i++) {
            if (spiiner.getItemAtPosition(i).toString().equalsIgnoreCase(selectedText)) {
                index = i;
                break;
            }
        }
        return index;
    }

    public static int getSelectedPositionSpinner(ArrayList<SpinerIdValue> lstVals, int id) {
        int index = 0;

        for (int i = 0; i < lstVals.size(); i++) {
            if (lstVals.get(i).getId() == id) {
                index = i;
                break;
            }
        }
        return index;
    }
    public static byte[] getBitmapAsByteArray(Bitmap bitmap) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 5, outputStream);
        return outputStream.toByteArray();
    }
    public static void showDatePicker(Context context, DatePickerDialog.OnDateSetListener onDateSetListener) {
        Calendar calendar;
        int year, month, day;
        calendar = Calendar.getInstance();
        year = calendar.get(Calendar.YEAR);
        month = calendar.get(Calendar.MONTH);
        day = calendar.get(Calendar.DAY_OF_MONTH);
        new DatePickerDialog(context, onDateSetListener, year, month, day).show();
    }
    public static int getPatientSerialNoFromFile(Context context) {
        int srNo = 01;
        try {
            File root = new File(Environment.getExternalStorageDirectory(), Constants.DIR_HEALTH_MON);
            File gpxfile = new File(root, Constants.FILE_PATIENT_SR_NO);

            if (!root.exists()) {
                root.mkdirs();
            }
            if (gpxfile.exists()) {
                BufferedReader br = new BufferedReader(new FileReader(gpxfile));
                StringBuilder text = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    text.append(line);
                }
                br.close();
                srNo = Integer.parseInt(text.toString());
                srNo++;
            }
            FileWriter writer = new FileWriter(gpxfile);
            writer.write(String.valueOf(srNo));
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return srNo;
    }

    public static void showPatientRiskDialog(Context context, int drawableId, String message) {
        Button btnClose;
        TextView txtErrorMsg;
        ImageView imgSmily;
        final Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_high_risk_patient);
        btnClose = (Button) dialog.findViewById(R.id.btnClose);
        txtErrorMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
        imgSmily = (ImageView) dialog.findViewById(R.id.imgSmily);
        imgSmily.setImageResource(drawableId);
        txtErrorMsg.setText(message);
        btnClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    public static void changeLocale(Context context, String languageCode) {
        Resources res = context.getResources();
        Locale myLocale = new Locale(languageCode, "IN");
        DisplayMetrics dm = res.getDisplayMetrics();
        Locale.setDefault(myLocale);
        android.content.res.Configuration config = new android.content.res.Configuration();
        config.locale = myLocale;
        context.getResources().updateConfiguration(config, context.getResources().getDisplayMetrics());


    }
    public static void showErrorDialog(Context context, String message) {
        TextView txtErrorMsg;
        Button btnOk;
        // Create custom dialog object
        final Dialog dialog = new Dialog(context);
        // Include dialog.xml file
        dialog.setContentView(R.layout.dialog_error);
        txtErrorMsg = (TextView) dialog.findViewById(R.id.txtErrorMsg);
        btnOk = (Button) dialog.findViewById(R.id.btnOk);

        txtErrorMsg.setText(message);
        btnOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        // Set dialog title
        //dialog.setTitle("Custom Dialog");
        dialog.show();
    }

}
