package com.persistent.healthmon.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.bluetooth.BluetoothDevice;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Environment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Base64;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.enums.HealthDevice;
import com.persistent.healthmon.fragments.PatientRegistrationFragment;
import com.persistent.healthmon.interfaces.ReminderCreated;
import com.persistent.healthmon.model.SpinerIdValue;
import com.persistent.healthmon.threads.ClassicBluetoothManager;
import com.persistent.healthmon.threads.HealthDeviceManager;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Created by harshal_patil on 2/28/2016.
 */
public class HealthMonUtility {
    private final static String TAG = HealthMonUtility.class.getCanonicalName();

    public static boolean isTablet(Context context) {
        boolean xlarge = ((context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) == Configuration.SCREENLAYOUT_SIZE_XLARGE);
        boolean large = ((context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) == Configuration.SCREENLAYOUT_SIZE_LARGE);
        return (xlarge || large);
    }

    public static void addFragment(Context context, Fragment fragment) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.add(R.id.fragmentContainer, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void addFragment(Context context, Fragment fragment, int containerId) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.add(containerId, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void replaceFragment(Context context, Fragment fragment) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.fragmentContainer, fragment, fragment.getClass().toString());
        fragmentTransaction.commit();
    }

    public static void replaceFragment(Context context, Fragment fragment, int contianerId) {
        FragmentManager fragmentManager = ((FragmentActivity) context).getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(contianerId, fragment, fragment.getClass().toString());//.addToBackStack("ExternalTrainingsFragment");

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


    public static byte[] getBitmapAsByteArray(Bitmap bitmap) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 5, outputStream);
        return outputStream.toByteArray();
    }

    /*  public static byte[] getBytes(Bitmap bitmap) {
          ByteArrayOutputStream stream = new ByteArrayOutputStream();
          bitmap.compress(Bitmap.CompressFormat.PNG, 0, stream);
          return stream.toByteArray();
      }
  */
    // convert from byte array to bitmap
    public static Bitmap getPhoto(byte[] image) {
        return BitmapFactory.decodeByteArray(image, 0, image.length);
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

    public static String convertToBase64(Bitmap bitmap) {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 5, os);
        byte[] byteArray = os.toByteArray();
        return Base64.encodeToString(byteArray, 0);
    }

    public static Bitmap convertToBitmap(String base64String) {
        Bitmap bitmapResult = null;
        byte[] decodedString = Base64.decode(base64String, Base64.DEFAULT);
        bitmapResult = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
        System.gc();
        return bitmapResult;
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

    public static void showDatePicker(Context context, DatePickerDialog.OnDateSetListener onDateSetListener) {
        Calendar calendar;
        int year, month, day;
        calendar = Calendar.getInstance();
        year = calendar.get(Calendar.YEAR);
        month = calendar.get(Calendar.MONTH);
        day = calendar.get(Calendar.DAY_OF_MONTH);
        new DatePickerDialog(context, onDateSetListener, year, month, day).show();
    }

    public static void showTimePicker(Context context, TimePickerDialog.OnTimeSetListener timePickerListener) {
        final Calendar c = Calendar.getInstance();
        // Current Hour
        int hour = c.get(Calendar.HOUR_OF_DAY);
        // Current Minute
        int minute = c.get(Calendar.MINUTE);
        // set time picker as current time
        new TimePickerDialog(context, timePickerListener, hour, minute,
                false).show();
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

    public static int getActivityNoFromFile(Context context) {
        int srNo = 01;
        try {
            File root = new File(Environment.getExternalStorageDirectory(), Constants.DIR_HEALTH_MON);
            File gpxfile = new File(root, Constants.FILE_ACTIVITY_SR_NO);

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

    public static int getReferalNoFromFile(Context context) {
        int srNo = 01;
        try {
            File root = new File(Environment.getExternalStorageDirectory(), Constants.DIR_HEALTH_MON);
            File gpxfile = new File(root, Constants.FILE_REFERAL_SR_NO);

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

    public static void insertECGWavePoints(ArrayList<Integer> ecgWavePoints) {
        try {
            File root = new File(Environment.getExternalStorageDirectory(), Constants.DIR_HEALTH_MON);
            File gpxfile = new File(root, Constants.FILE_ECG_WAVE_POINTS);

            if (!root.exists()) {
                root.mkdirs();
            }
            // FileWriter writer = new FileWriter(gpxfile);
            PrintWriter printWriter = new PrintWriter(gpxfile);
            for (Integer n : ecgWavePoints) {
/*                writer.write(n);
                writer.write(",");
                writer.flush();*/
                printWriter.println(n);
                printWriter.println(",");
                HealthMonLog.i(TAG, "" + n);
            }
            int cnt = ecgWavePoints.size();
            printWriter.println();
            printWriter.write('\n');
            printWriter.println("Total number of points = " + cnt);
            printWriter.close();
            //writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void hideKeyboard(Activity activity) {
        activity.getWindow().setSoftInputMode(
                WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
        );
    }

    public static String gettoolbarDate() {
        String today;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMM dd,hh:mm");
        Date date = Calendar.getInstance().getTime();
        String date2 = simpleDateFormat.format(date);
        return date2;
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

    public static void showDeviceSettingDialog(final Context activityContext, final String deviceAddress, final String deviceName) {
        CharSequence[] items = new CharSequence[]{"Pulse Oximeter", "BPM Device", "ECG Device"};

        AlertDialog.Builder builder = new AlertDialog.Builder(activityContext);
        builder.setTitle(deviceName);
        builder.setItems(items, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                if (which == 0) {
                    HealthDeviceManager.getInstance().setHealthDeviceAddress(HealthDevice.PULSE_OXIMETER, deviceAddress);
                    Toast.makeText(activityContext, "Set as Pulse Oximeter device", Toast.LENGTH_SHORT).show();
                } else if (which == 1) {
                    HealthDeviceManager.getInstance().setHealthDeviceAddress(HealthDevice.BPM_DEVICE, deviceAddress);
                    Toast.makeText(activityContext, "Set as BPM Device", Toast.LENGTH_SHORT).show();
                } else if (which == 2) {
                    HealthDeviceManager.getInstance().setHealthDeviceAddress(HealthDevice.ECG_DEVICE, deviceAddress);
                    Toast.makeText(activityContext, "Set as ecg device", Toast.LENGTH_SHORT).show();
                }
            }
        });

        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }

    public static void showMenuDialog(final Context activityContext, final boolean pair, final boolean unfair, final BluetoothDevice device) {
        CharSequence[] items;
        if (pair) {
            items = new CharSequence[]{"Pair Device", "Configure Device"};
        } else {
            items = new CharSequence[]{"Unpair Device", "Configure Device"};
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activityContext);
        builder.setTitle("" + device.getName());
        builder.setItems(items, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                if (which == 0 && pair) {
                    ClassicBluetoothManager.getInstance().pairDevice(device);
                } else if (which == 0 && unfair) {
                    ClassicBluetoothManager.getInstance().unPairDevice(device);
                } else if (which == 1) {
                    showDeviceSettingDialog(activityContext, device.getAddress(), device.getName());
                }
            }
        });

        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }


    public static byte[] convertIntArrayListToByteArray(ArrayList<Integer> integerArrayList) {

        if (integerArrayList != null && integerArrayList.size() > 0) {

            byte array[] = new byte[(integerArrayList.size()) * 2];
            ArrayList<Integer> integerList = new ArrayList<Integer>();

            for (int i = 0; i < integerArrayList.size(); i++) {
                String sb = (String.format("%8s", Integer.toBinaryString(integerArrayList.get(i))).replace(' ', '0'));
                while (sb.length() < 16)
                    sb = "0" + sb;

                String binaryValue1 = sb.substring(0, 8);
                String binaryValue2 = sb.substring(8);

                integerList.add(Integer.parseInt(binaryValue1, 2));
                integerList.add(Integer.parseInt(binaryValue2, 2));
            }

            for (int j = 0; j < integerList.size(); j++) {
                array[j] = integerList.get(j).byteValue();
            }
            return array;
        } else {
            return null;
        }

    }

    public static List<Integer> convertByteArrayToIntArrayList(byte[] byteArray) {
        if (byteArray != null && byteArray.length > 0) {
            List<Integer> ecgsignalList = new ArrayList<Integer>();

            for (int i = 0; i < byteArray.length; i++) {
                int value1 = byteArray[i] & 0xff;
                int value2 = byteArray[i + 1] & 0xff;
                i++;
                String s1 = (String.format("%8s", Integer.toBinaryString(value1)).replace(' ', '0'));
                String s2 = (String.format("%8s", Integer.toBinaryString(value2)).replace(' ', '0'));
                int finalValue = Integer.parseInt((s1 + s2), 2);
                ecgsignalList.add(finalValue);
            }
            return ecgsignalList;
        } else {
            return null;
        }

    }

    public static boolean isCallFunAvailable(Context context) {
        PackageManager pm = context.getPackageManager();

        if (pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY))
            return true;
        else
            return false;
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

    public static void setReminder(Activity activity, String eventDate, String time, String timeInterval, String activityName, ReminderCreated reminderCreated) {
        Calendar cal = Calendar.getInstance();
        int beforeMinutes = 10;
        try {
            // get calendar

            DateFormat df = new SimpleDateFormat("dd-MM-yyyy KK:mm aa");
            Date dtEventDate = df.parse(eventDate + " " + time);
            String[] splitInterval = timeInterval.split("\\s+");
            beforeMinutes = Integer.parseInt(splitInterval[0]);

            cal.setTime(dtEventDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Uri EVENTS_URI = Uri.parse(getCalendarUriBase(activity) + "events");
        ContentResolver cr = activity.getApplicationContext().getContentResolver();
        // event insert
        ContentValues values = new ContentValues();
        values.put("calendar_id", 1);
        values.put("title", activityName);
        values.put("allDay", 0);
        /*values.put("dtstart", cal.getTimeInMillis() + 11 * 60 * 1000); // event starts at 11 minutes from now
        values.put("dtend", cal.getTimeInMillis() + 60 * 60 * 1000); // ends 60 minutes from now*/
        values.put("dtstart", cal.getTimeInMillis()); // event starts at 11 minutes from now
        values.put("dtend", cal.getTimeInMillis() + 60 * 60 * 1000); // ends 60 minutes from now
        values.put("eventTimezone", TimeZone.getDefault().getID());
        //values.put("description", "Reminder description");
        //  values.put("visibility", 0);
        values.put("hasAlarm", 1);
        Uri event = cr.insert(EVENTS_URI, values);
        // reminder insert
        Uri REMINDERS_URI = Uri.parse(getCalendarUriBase(activity) + "reminders");
        values = new ContentValues();
        values.put("event_id", Long.parseLong(event.getLastPathSegment()));
        values.put("method", 1);
        values.put("minutes", beforeMinutes);
        Uri reminder = cr.insert(REMINDERS_URI, values);
        reminderCreated.onReminderCreated(event, reminder);
    }

    public static void deleteReminder(Context context, String eventURI, String reminderURI) {
        try {
            int eventDelete = context.getContentResolver().delete(Uri.parse(eventURI), null, null);
            int reminderDelete = context.getContentResolver().delete(Uri.parse(reminderURI), null, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String getCalendarUriBase(Activity act) {

        String calendarUriBase = null;
        Uri calendars = Uri.parse("content://calendar/calendars");
        Cursor managedCursor = null;
        try {
            managedCursor = act.managedQuery(calendars, null, null, null, null);
        } catch (Exception e) {
        }
        if (managedCursor != null) {
            calendarUriBase = "content://calendar/";
        } else {
            calendars = Uri.parse("content://com.android.calendar/calendars");
            try {
                managedCursor = act.managedQuery(calendars, null, null, null, null);
            } catch (Exception e) {
            }
            if (managedCursor != null) {
                calendarUriBase = "content://com.android.calendar/";
            }
        }
        return calendarUriBase;
    }


}
