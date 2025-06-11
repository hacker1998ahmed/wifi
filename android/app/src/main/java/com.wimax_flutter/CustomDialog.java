package com.wimax_flutter;

import android.app.Dialog;
import android.os.Bundle;
import androidx.fragment.app.DialogFragment;
import android.view.LayoutInflater;
import android.widget.TextView;

public class CustomDialog extends DialogFragment {
    private String message;

    public CustomDialog(String message) {
        this.message = message;
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        LayoutInflater inflater = requireActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.dialog_custom, null);

        TextView messageText = view.findViewById(R.id.dialog_message);
        messageText.setText(message);

        return new android.app.AlertDialog.Builder(requireContext())
            .setView(view)
            .setTitle("WiMax Security")
            .create();
    }
}