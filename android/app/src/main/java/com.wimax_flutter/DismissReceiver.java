package com.wimax_flutter;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class DismissReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        // يمكنك هنا إيقاف العمليات الجارية
        Shell.runCommand("pkill tcpdump");
    }
}