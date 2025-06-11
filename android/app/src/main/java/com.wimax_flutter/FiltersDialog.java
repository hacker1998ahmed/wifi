package com.wimax_flutter;

import android.app.Activity;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class FiltersDialog {
    public static void show(Activity activity) {
        Spinner filterSpinner = new Spinner(activity);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(activity,
                R.array.filters_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        filterSpinner.setAdapter(adapter);

        new android.app.AlertDialog.Builder(activity)
            .setTitle("المرشحات")
            .setView(filterSpinner)
            .setPositiveButton("تطبيق", (dialog, id) -> {})
            .show();
    }
}