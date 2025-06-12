package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class LoadingDialog extends AlertDialog.Builder {
    public LoadingDialog(Context context) {
        super(context);
        setTitle("جاري التحميل...");
        setView(new android.widget.ProgressBar(context));
        setCancelable(false);
    }
}