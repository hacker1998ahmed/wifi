package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

public class ReaverFragment extends Fragment {
    private EditText bssidInput;
    private Button startButton;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_reaver, container, false);
        bssidInput = view.findViewById(R.id.bssid_input);
        startButton = view.findViewById(R.id.start_attack);

        startButton.setOnClickListener(v -> {
            String bssid = bssidInput.getText().toString();
            Shell.runCommand("reaver -i wlan0 -b " + bssid + " -vv");
        });

        return view;
    }
}