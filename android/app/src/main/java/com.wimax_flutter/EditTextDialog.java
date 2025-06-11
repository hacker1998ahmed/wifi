package com.wimax_flutter;

import android.app.AlertDialog;
import android.content.Context;
import android.widget.EditText;

public class EditTextDialog extends AlertDialog.Builder {
    public EditTextDialog(Context context) {
        super(context);
        EditText input = new EditText(context);
        setView(input);
        setTitle("أدخل قيمة");
        setPositiveButton("موافق", (dialog, which) -> {
            String value = input.getText().toString();
            Shell.runCommand("echo 'القيمة المدخلة: $value'");
        });
    }
}