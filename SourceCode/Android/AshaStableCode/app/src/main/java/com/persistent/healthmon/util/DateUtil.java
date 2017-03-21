package com.persistent.healthmon.util;

import android.text.format.DateUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by khyati_shah on 6/9/2016.
 */
public class DateUtil {
    private final static String TAG = HealthMonUtility.class.getCanonicalName();


    public static Date toDate(String date, String format) {
        DateFormat dtFormat = new SimpleDateFormat(format);
        Date dtReturn = null;
        try {
            dtReturn = dtFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return dtReturn;
    }

    public static boolean isBetweenDates(Date dateA, Date dateB, Date dateCheck) {
        if ((dateCheck.after(dateA) || dateCheck.equals(dateA)) && (dateCheck.before(dateB) || dateCheck.equals(dateB))) {
            return true;
        } else {
            return false;
        }

        //return dateCheck.compareTo(dateA) >= 0 && dateCheck.compareTo(dateB) <= 0;
    }

    public static String dateConvert(String date, String sourceFormat, String targetFormat) {
        Date dateDt = null;
        String strConvertedDt = "";
        try {
            // DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
            DateFormat fromFormat = new SimpleDateFormat(sourceFormat);
            fromFormat.setLenient(false);
            //DateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat toFormat = new SimpleDateFormat(targetFormat);
            toFormat.setLenient(false);


            dateDt = fromFormat.parse(date);
            strConvertedDt = toFormat.format(dateDt);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return strConvertedDt;
    }

    public static long gettodayinLong() {
        Calendar c = Calendar.getInstance();
        HealthMonLog.i(TAG, "Milliseconds = " + System.currentTimeMillis() + "  24: milisec = " + c.getTime().getTime() + "  Calendar date= " + c.getTime());
        Date date = c.getTime();
        date.setHours(23);
        date.setMinutes(59);
        c.setTime(date);
        return c.getTime().getTime();
    }

    public static int getAge(String dateOfBirth) {
        int age = 0;
        try {
            Calendar dob = Calendar.getInstance();
            DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
            dob.setTime(fromFormat.parse(dateOfBirth));
            Calendar today = Calendar.getInstance();
            age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
            if (today.get(Calendar.MONTH) < dob.get(Calendar.MONTH)) {
                age--;
            } else if (today.get(Calendar.MONTH) == dob.get(Calendar.MONTH)
                    && today.get(Calendar.DAY_OF_MONTH) < dob.get(Calendar.DAY_OF_MONTH)) {
                age--;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return age;
    }

    public static String getEDDDate(String LMPDate) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c = Calendar.getInstance();
        String strResultDate = "";
        try {
            c.setTime(fromFormat.parse(LMPDate));
            c.add(Calendar.DATE, 280);
            Date resultdate = new Date(c.getTimeInMillis());
            strResultDate = fromFormat.format(resultdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return strResultDate;
    }

    public static String getDueDate(String doneDate, int frquency) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar c = Calendar.getInstance();
        String strResultDate = "";
        try {
            c.setTime(fromFormat.parse(doneDate));
            c.add(Calendar.DATE, frquency);
            Date resultdate = new Date(c.getTimeInMillis());
            strResultDate = fromFormat.format(resultdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return strResultDate;
    }


    public static boolean isToday(String strDate1) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date1 = null;
        try {
            date1 = fromFormat.parse(strDate1);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return DateUtils.isToday(date1.getTime());
    }

    public static String getDateOfBirth(int age) {
        String strDateOfBirth = "";
        try {
            DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, -(age * 365));
            Date dateBefore = cal.getTime();
            strDateOfBirth = fromFormat.format(dateBefore).toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return strDateOfBirth;
    }

    public static String getCurrentTimeStamp() {
        String currentTimeStamp = "";
        try {

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            currentTimeStamp = dateFormat.format(new Date()); // Find todays date
            return currentTimeStamp;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return currentTimeStamp;
    }

    public static int getPragnancyWeeks(String dateLMP, String strDateFormat) {
        int weeks = 0;
        try {
            DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
            Date dtLMp = dateFormat.parse(dateLMP);
            Date dtTday = new Date();
            weeks = getWeeksBetween(dtLMp, dtTday);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return weeks;
    }

    public static int getWeeksBetween(Date a, Date b) {

        if (b.before(a)) {
            return -getWeeksBetween(b, a);
        }
        a = resetTime(a);
        b = resetTime(b);

        Calendar cal = new GregorianCalendar();
        cal.setTime(a);
        int weeks = 0;
        while (cal.getTime().before(b)) {
            // add another week
            cal.add(Calendar.WEEK_OF_YEAR, 1);
            weeks++;
        }
        return weeks;
    }

    public static Date resetTime(Date d) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(d);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    public static boolean isValidLMP(String LMP) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date dtLMP = fromFormat.parse(LMP);
            int weeks = getWeeksBetween(dtLMP, new Date());
            if (weeks > 36)
                return false;
            else
                return true;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isValidPastDeliveryDt(String pastDeliveryDt) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date dtPastDelivery = fromFormat.parse(pastDeliveryDt);
            int weeks = getWeeksBetween(dtPastDelivery, new Date());
            if (weeks > 40)
                return false;
            else
                return true;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isFutureDate(String date) {
        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date dtDate = fromFormat.parse(date);
            Date today = new Date();
            if (dtDate.after(today)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isPastDate(String date) {
        DateFormat dtFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date dtDate = dtFormat.parse(date);
            Date today = new Date();
            Date converted = dtFormat.parse(dtFormat.format(today));

            if (dtDate.before(converted)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String convertTime(String time, String sourceFormatStr, String destFormatStr) {
        //SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
        // SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
        String convertedTime = "";
        SimpleDateFormat srcFormat = new SimpleDateFormat(sourceFormatStr);
        SimpleDateFormat destFormat = new SimpleDateFormat(destFormatStr);
        Date _24HourDt = null;
        try {
            _24HourDt = srcFormat.parse(time);
            convertedTime = destFormat.format(_24HourDt);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return convertedTime;
    }

    public static boolean isPastTime(String timeDate) {
        DateFormat timeFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
        try {
            Date timeSource = timeFormat.parse(timeDate);
            Date timeNow = new Date();

            if (timeSource.before(timeNow)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getMonthsBetween(Date dtDate1, Date dtDate2) {
        Calendar startCalendar = new GregorianCalendar();
        startCalendar.setTime(dtDate1);
        Calendar endCalendar = new GregorianCalendar();
        endCalendar.setTime(dtDate2);

        int diffYear = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
        int diffMonth = diffYear * 12 + endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
        return diffMonth;
    }
}
