package com.persistent.healthmon.placeholder;

import android.content.Context;
import android.content.res.AssetManager;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;

import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;

import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.persistent.healthmon.R;
import com.persistent.healthmon.util.Constants;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Locale;

/**
 * Created by pushkar_bhadle on 4/25/2016.
 */
public class HelpGuidePopupWindow extends android.widget.PopupWindow
{
    WebView w;
    Context ctx;
    TextView lblText;
    ImageView imageView;
    View popupView;

    public HelpGuidePopupWindow(Context context)
    {
        super(context);

        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.helpguide_popup, null);
        setContentView(popupView);
        //btnDismiss = (Button) popupView.findViewById(R.id.ok_button);
        w = (WebView) popupView.findViewById(R.id.vkWebView);
        WebSettings webSetting = w.getSettings();
        webSetting.setJavaScriptEnabled(true);
        webSetting.setDisplayZoomControls(true);
        //String htmlFilename ="bloodpressure-hi.html";
        String htmlFilename ="bloodpressure-"+ Locale.getDefault().getLanguage()+".html";
        AssetManager mgr = context.getAssets();
        try {
            InputStream in = mgr.open(htmlFilename, AssetManager.ACCESS_BUFFER);
            String htmlContentInStringFormat = StreamToString(in);
            in.close();
            w.loadDataWithBaseURL(null, htmlContentInStringFormat, "text/html", "utf-8", null);

            //w.loadUrl("http://nrhm.gov.in/communitisation/asha/resources/asha-training-modules.html");

        } catch (IOException e) {
            e.printStackTrace();
        }
        w.setScrollContainer(false);
        setHeight(710);
        setWidth(1200);


        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        //setBackgroundDrawable(new BitmapDrawable());
        new BitmapDrawable(context.getResources(), (Bitmap) null);
    } // End constructor
    public static String StreamToString(InputStream in) throws IOException {
        if(in == null) {
            return "";
        }
        Writer writer = new StringWriter();
        char[] buffer = new char[1024];
        try {
            Reader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            int n;
            while ((n = reader.read(buffer)) != -1) {
                writer.write(buffer, 0, n);
            }
        } finally {
        }
        return writer.toString();
    }
    // Attaches the view to its parent anchor-view at position x and y
    public void show(View anchor, int x, int y)
    {
        showAtLocation(anchor, Gravity.CENTER, x, y);
    }
}