package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import android.widget.TextView;

public class SettingsFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_settings, container, false);
        TextView versionText = view.findViewById(R.id.version_text);
        Switch darkModeSwitch = view.findViewById(R.id.dark_mode_switch);

        versionText.setText("v0.1.0");

        darkModeSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            // يمكنك ربط هذا بـ Flutter عبر MethodChannel
        });

        return view;
    }
}