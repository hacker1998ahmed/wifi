package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;

public class CustomActionEditorFragment extends Fragment {
    private EditText commandInput;
    private Switch rootSwitch;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_custom_action_editor, container, false);
        commandInput = view.findViewById(R.id.custom_command_input);
        rootSwitch = view.findViewById(R.id.root_required_switch);

        view.findViewById(R.id.save_button).setOnClickListener(v -> {
            new CustomAction(commandInput.getText().toString(), rootSwitch.isChecked()).execute();
            getActivity().onBackPressed();
        });

        return view;
    }
}