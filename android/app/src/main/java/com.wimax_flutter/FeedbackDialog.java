package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

public class FeedbackDialog extends AlertDialog.Builder {
    public FeedbackDialog(Context context) {
        super(context);
        setMessage("هل تريد إرسال تعليق على التطبيق؟");
        setPositiveButton("نعم", (dialog, which) -> {
            Intent emailIntent = new Intent(Intent.ACTION_SENDTO, Uri.fromParts(
                    "mailto", "your.email@example.com", null));
            emailIntent.putExtra(Intent.EXTRA_SUBJECT, "تعليق على WiMax Flutter");
            context.startActivity(Intent.createChooser(emailIntent, "إرسال تعليق"));
        });
        setNegativeButton("لا", (dialog, which) -> {});
    }
}