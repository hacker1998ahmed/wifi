package com.wimax_flutter;

import android.os.AsyncTask;

public class DialogRefreshTask extends AsyncTask<Void, Void, String> {
    private OnDataReadyListener listener;

    public DialogRefreshTask(OnDataReadyListener listener) {
        this.listener = listener;
    }

    @Override
    protected String doInBackground(Void... voids) {
        // استخراج البيانات من airodump-ng أو tcpdump...
        return "SSID: WiMax\nBSSID: 00:11:22:33:44:55\nكلمة المرور غير معروفة";
    }

    @Override
    protected void onPostExecute(String result) {
        listener.onDataReady(result);
    }

    public interface OnDataReadyListener {
        void onDataReady(String data);
    }
}