package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class ExportDialog extends AlertDialog.Builder {
    public ExportDialog(Context context) {
        super(context);
        setMessage("هل تريد تصدير التقرير كـ CSV أو JSON؟");
        setPositiveButton("CSV", (dialog, which) -> {
            Shell.runCommand("cp /sdcard/wimax_report.csv /storage/emulated/0/Download/");
        });
        setNegativeButton("JSON", (dialog, which) -> {
            Shell.runCommand("cp /sdcard/wimax_report.json /storage/emulated/0/Download/");
        });
    }
}