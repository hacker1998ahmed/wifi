package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class ErrorDialog extends AlertDialog.Builder {
    public ErrorDialog(Context context, String errorMessage) {
        super(context);
        setMessage(errorMessage);
        setTitle("خطأ");
        setPositiveButton("إغلاق", (dialog, which) -> {});
    }
}