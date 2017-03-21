package com.persistent.healthmon.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.ThumbnailUtils;
import android.util.Base64;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Created by harshal_patil on 4/26/2016.
 */
public class ImageResizer {

    public static Bitmap getBitmapThumbnail(Context context, String base64StringReceive) {
        byte[] data = Base64.decode(base64StringReceive, Base64.DEFAULT);
        File file = new File(context.getFilesDir(), "testFile");

        try {
            BufferedOutputStream bos = new BufferedOutputStream(context.openFileOutput("testFile", Context.MODE_PRIVATE),1024);
            bos.write(data);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return getThumbFromFile(file);
    }

    private static Bitmap getThumbFromFile(File file) {
        Bitmap tempImage = null;
        try {
            tempImage = decodeSampledBitmapFromFile(file.getAbsolutePath(), 50, 50); // this is in pixels - use your desired size
            return ThumbnailUtils.extractThumbnail(tempImage, 50, 50);
        } finally {
            if (tempImage != null) {
                tempImage.recycle();
            }
        }
    }

    private static Bitmap decodeSampledBitmapFromFile(String filePath, int reqWidth, int reqHeight) {
        // First decode with inJustDecodeBounds=true to check dimensions
        final BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(filePath, options);

        // Calculate inSampleSize
        options.inSampleSize = calculateInSampleSize(options, reqWidth, reqHeight);

        // Decode bitmap with inSampleSize set
        options.inJustDecodeBounds = false;
        return BitmapFactory.decodeFile(filePath, options);
    }

    private static int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        // Raw height and width of image
        final int height = options.outHeight;
        final int width = options.outWidth;
        int inSampleSize = 1;

      if (height > reqHeight || width > reqWidth) {

            final int halfHeight = height / 2;
            final int halfWidth = width / 2;

            // Calculate the largest inSampleSize value that is a power of 2 and keeps both
            // height and width larger than the requested height and width.
            while ((halfHeight / inSampleSize) > reqHeight &&
                    (halfWidth / inSampleSize) > reqWidth) {
                inSampleSize *= 2;
            }
        }

        return inSampleSize;
    }

}
