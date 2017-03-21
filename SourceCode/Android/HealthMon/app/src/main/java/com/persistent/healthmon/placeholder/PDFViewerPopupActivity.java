package com.persistent.healthmon.placeholder;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import com.github.barteksc.pdfviewer.PDFView;
import com.github.barteksc.pdfviewer.listener.OnLoadCompleteListener;
import com.github.barteksc.pdfviewer.scroll.DefaultScrollHandle;
import com.persistent.healthmon.R;
import com.shockwave.pdfium.PdfDocument;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

public class PDFViewerPopupActivity extends Activity {

    private String TAG = PDFViewerPopupActivity.class.getSimpleName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pdf_viewr_popup);

        Intent intent = getIntent();
        String fileName = intent.getStringExtra("fileName");

        final PDFView pdfView = (PDFView) findViewById(R.id.pdfView);

        pdfView.fromAsset(fileName)
                .onLoad(new OnLoadCompleteListener() {
                    @Override
                    public void loadComplete(int nbPages) {
                        PdfDocument.Meta meta = pdfView.getDocumentMeta();
                        Log.e(TAG, "title = " + meta.getTitle());
                        Log.e(TAG, "author = " + meta.getAuthor());
                        Log.e(TAG, "subject = " + meta.getSubject());
                        Log.e(TAG, "keywords = " + meta.getKeywords());
                        Log.e(TAG, "creator = " + meta.getCreator());
                        Log.e(TAG, "producer = " + meta.getProducer());
                        Log.e(TAG, "creationDate = " + meta.getCreationDate());
                        Log.e(TAG, "modDate = " + meta.getModDate());

                        printBookmarksTree(pdfView.getTableOfContents(), "-");
                    }
                })
                .scrollHandle(new DefaultScrollHandle(this))
                .load();;

//        File pdfFile = new File("res/raw/antenatalcare1.pdff");
//        Uri path = Uri.fromFile(pdfFile);
//        Log.d("!!!!!!uri path", path.toString());
//        Log.d("!!!!!!file path", pdfFile.getAbsolutePath());
//        Intent intent = new Intent(Intent.ACTION_VIEW);
//        intent.setDataAndType(path, "application/pdf");
//        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//
//        startActivity(intent);

//        try {
//            CopyReadAssets();
//        } catch (ActivityNotFoundException e) {
//            Log.e(getLocalClassName(), e.toString(), e);
//        }

    }

    public void printBookmarksTree(List<PdfDocument.Bookmark> tree, String sep) {
        for (PdfDocument.Bookmark b : tree) {

            Log.e(TAG, String.format("%s %s, p %d", sep, b.getTitle(), b.getPageIdx()));

            if (b.hasChildren()) {
                printBookmarksTree(b.getChildren(), sep + "-");
            }
        }
    }
    private void CopyReadAssets()
    {
        AssetManager assetManager = getAssets();

        InputStream in = null;
        OutputStream out = null;
        File file = new File(getFilesDir(), "antenatalcare.pdf");
        try
        {
            in = assetManager.open("antenatalcare.pdf");
            out = openFileOutput(file.getName(), Context.MODE_WORLD_READABLE);

            copyFile(in, out);
            in.close();
            in = null;
            out.flush();
            out.close();
            out = null;
        } catch (Exception e)
        {
            Log.e("tag", e.getMessage());
        }

        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setDataAndType(
                Uri.parse("file://" + getFilesDir() + "/antenatalcare.pdf"),
                "application/pdf");
        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        getApplicationContext().startActivity(intent);
    }

    private void copyFile(InputStream in, OutputStream out) throws IOException
    {
        byte[] buffer = new byte[1024];
        int read;
        while ((read = in.read(buffer)) != -1)
        {
            out.write(buffer, 0, read);
        }
    }

}
