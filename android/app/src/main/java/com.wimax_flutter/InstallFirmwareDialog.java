package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Environment;

public class InstallFirmwareDialog extends AlertDialog.Builder {
    public InstallFirmwareDialog(Context context) {
        super(context);
        setTitle("تثبيت Firmware");
        setMessage("جارٍ تثبيت fw_bcmdhd.bin...");
        setCancelable(false);
        setPositiveButton("حسناً", (dialog, which) -> {});
    }
}