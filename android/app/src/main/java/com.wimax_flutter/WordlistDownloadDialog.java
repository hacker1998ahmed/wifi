package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.widget.ProgressBar;

public class WordlistDownloadDialog extends AlertDialog.Builder {
    public WordlistDownloadDialog(Context context) {
        super(context);
        ProgressBar progressBar = new ProgressBar(context);
        setTitle("جارٍ تنزيل قائمة الكلمات...");
        setView(progressBar);
        setCancelable(false);
    }
}