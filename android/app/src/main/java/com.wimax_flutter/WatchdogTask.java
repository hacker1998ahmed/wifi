package com.wimax_flutter;

import android.os.Handler;
import android.os.Looper;

public class WatchdogTask implements Runnable {
    private Handler handler = new Handler(Looper.getMainLooper());

    @Override
    public void run() {
        Shell.runCommand("ps | grep tcpdump");
        handler.postDelayed(this, 5000); // كل 5 ثوانٍ
    }
}