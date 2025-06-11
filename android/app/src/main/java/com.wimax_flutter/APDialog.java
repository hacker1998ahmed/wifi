package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.view.LayoutInflater;
import android.widget.TextView;

public class APDialog extends AlertDialog.Builder {
    private final AP ap;

    public APDialog(Context context, AP ap) {
        super(context);
        this.ap = ap;
        setTitle("نقطة الوصول");
        setView(createContentView(context));
    }

    private TextView createContentView(Context context) {
        TextView content = new TextView(context);
        content.setText("SSID: " + ap.getSSID() + "\n" +
                        "BSSID: " + ap.getBSSID() + "\n" +
                        "التشفير: " + ap.getEncryption());
        return content;
    }
}