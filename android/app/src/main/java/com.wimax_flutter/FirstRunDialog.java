package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;

public class FirstRunDialog extends AlertDialog.Builder {
    public FirstRunDialog(Context context) {
        super(context);
        setTitle("مرحبًا بك!");
        setMessage("هذا هو أول تشغيل للتطبيق.\n"
                   + "تأكد من أن لديك صلاحيات Root.\n"
                   + "يمكنك استخدام القائمة الجانبية لإدارة الأدوات والهجمات.");
        setPositiveButton("ابدأ", (dialog, which) -> {});
    }
}