package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.widget.TextView;

public class DeviceDialog extends AlertDialog.Builder {
    public DeviceDialog(Context context, Device device) {
        super(context);
        TextView content = new TextView(context);
        content.setText("IP: " + device.getIp() + "\n" +
                        "MAC: " + device.getMac() + "\n" +
                        "الشركة: " + device.getVendor());
        setView(content);
        setTitle("تفاصيل الجهاز");
    }
}