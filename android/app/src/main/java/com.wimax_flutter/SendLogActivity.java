package com.wimax_flutter;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

public class SendLogActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_log);

        Button shareButton = findViewById(R.id.share_button);
        shareButton.setOnClickListener(v -> {
            Intent sendIntent = new Intent();
            sendIntent.setAction(Intent.ACTION_SEND);
            sendIntent.putExtra(Intent.EXTRA_TEXT, "سجل التطبيق:\n" + Shell.getLog());
            sendIntent.setType("text/plain");
            startActivity(Intent.createChooser(sendIntent, "إرسال سجل التطبيق"));
        });
    }
}