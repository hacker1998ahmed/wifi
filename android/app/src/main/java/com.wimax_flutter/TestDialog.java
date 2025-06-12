package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class TestDialog extends AlertDialog.Builder {
    public TestDialog(Context context) {
        super(context);
        setTitle("اختبار الأدوات");
        setMessage("جارٍ اختبار tcpdump...\naircrack-ng متوفر\nreaver غير متوفر");
        setPositiveButton("حسنًا", (dialog, which) -> {});
    }
}