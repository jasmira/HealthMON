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
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by harshal_patil on 5/5/2016.
 */
public class PulseOxPopupWindow extends android.widget.PopupWindow
{
    WebView w;
    Context ctx;
    Button btnDismiss;
    TextView lblText;
    ImageView imageView;
    View popupView;

    public PulseOxPopupWindow(Context context)
    {
        super(context);

        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.helpguide_popup, null);
        setContentView(popupView);
        w = (WebView) popupView.findViewById(R.id.vkWebView);
        WebSettings webSetting = w.getSettings();
        webSetting.setJavaScriptEnabled(true);
        webSetting.setDisplayZoomControls(true);
        String htmlFilename = "pulseoximeter.html";
        AssetManager mgr = context.getAssets();
        new BitmapDrawable(context.getResources(), (Bitmap) null);
        try {
            InputStream in = mgr.open(htmlFilename, AssetManager.ACCESS_BUFFER);
            String htmlContentInStringFormat = HelpGuidePopupWindow.StreamToString(in);
            in.close();
            w.loadDataWithBaseURL(null, htmlContentInStringFormat, "text/html", "utf-8", null);

        } catch (IOException e) {
            e.printStackTrace();
        }
        w.setScrollContainer(false);
        setHeight(600);
        setWidth(1000);


        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        //setBackgroundDrawable(new BitmapDrawable());

    } // End constructor

    // Attaches the view to its parent anchor-view at position x and y
    public void show(View anchor, int x, int y)
    {
        showAtLocation(anchor, Gravity.CENTER, x, y);
    }
}