package com.wimax_flutter;

import android.app.Activity;
import android.os.Environment;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.io.File;
import java.util.ArrayList;

public class FileExplorerDialog {
    public static void show(Activity activity, String folderPath) {
        File dir = new File(folderPath);
        if (!dir.exists()) return;

        ArrayList<String> files = new ArrayList<>();
        for (File file : dir.listFiles()) {
            files.add(file.getName());
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1, files);
        ListView listView = new ListView(activity);
        listView.setAdapter(adapter);

        new android.app.AlertDialog.Builder(activity)
            .setTitle("اختيار ملف")
            .setView(listView)
            .setPositiveButton("اختيار", (dialog, id) -> {})
            .show();
    }
}