package com.persistent.healthmon.placeholder;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.support.v4.graphics.drawable.RoundedBitmapDrawable;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.persistent.healthmon.R;
import com.persistent.healthmon.util.RoundImage;

/**
 * Created by harshal_patil on 6/6/2016.
 */
public class PregnancyDietPopupWindow extends android.widget.PopupWindow {
    Context ctx;
    Button btnDismiss;
    TextView lblText;
    ImageView imageView;
    View popupView;

    public PregnancyDietPopupWindow(Context context) {
        super(context);

        ctx = context;
        popupView = LayoutInflater.from(context).inflate(R.layout.refer_doc_popup, null);
        setContentView(popupView);
        new BitmapDrawable(context.getResources(), (Bitmap) null);
        RoundedBitmapDrawable roundedBitmapDrawable = RoundedBitmapDrawableFactory.create(
                context.getResources(),
                BitmapFactory.decodeResource(context.getResources(), R.drawable.koala));
        roundedBitmapDrawable.setCircular(true);
        RoundImage roundImage = new RoundImage(BitmapFactory.decodeResource(context.getResources(), R.drawable.koala));

        imageView = (ImageView) popupView.findViewById(R.id.refer_doc_popup);
        imageView.setImageDrawable(ctx.getResources().getDrawable(R.drawable.warning_signs_during_pregnancy));
        setHeight(600);
        setWidth(1000);


        // Closes the popup window when touch outside of it - when looses focus
        setOutsideTouchable(true);
        setFocusable(true);

        // Removes default black background
        //setBackgroundDrawable(new BitmapDrawable());


    }        // Attaches the view to its parent anchor-view at position x and y

    public void show(View anchor, int x, int y) {
        showAtLocation(anchor, Gravity.CENTER, x, y);
    }
}
