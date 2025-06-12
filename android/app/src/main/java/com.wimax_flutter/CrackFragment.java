package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

public class CrackFragment extends Fragment {
    private EditText handshakeInput;
    private EditText wordlistInput;
    private Button crackButton;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_wpa_crack, container, false);
        handshakeInput = view.findViewById(R.id.handshake_path);
        wordlistInput = view.findViewById(R.id.wordlist_path);
        crackButton = view.findViewById(R.id.crack_button);

        crackButton.setOnClickListener(v -> {
            String handshake = handshakeInput.getText().toString();
            String wordlist = wordlistInput.getText().toString();
            Shell.runCommand("aircrack-ng -w " + wordlist + " " + handshake);
        });

        return view;
    }
}