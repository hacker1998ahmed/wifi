package com.wimax_flutter;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class StopReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Shell.runCommand("pkill airodump-ng");
        Shell.runCommand("pkill reaver");
        Shell.runCommand("pkill tcpdump");
    }
}