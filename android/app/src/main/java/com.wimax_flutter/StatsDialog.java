package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class StatsDialog extends AlertDialog.Builder {
    public StatsDialog(Context context, String stats) {
        super(context);
        setTitle("إحصائيات الهجوم");
        setMessage(stats);
        setPositiveButton("إغلاق", (dialog, which) -> {});
    }
}