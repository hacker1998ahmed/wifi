package com.wimax_flutter;

import android.app.Dialog;
import android.os.Bundle;
import androidx.fragment.app.DialogFragment;
import android.view.LayoutInflater;
import android.widget.Button;
import android.widget.ProgressBar;

public class CopySampleDialog extends DialogFragment {
    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        LayoutInflater inflater = requireActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.dialog_copy_sample, null);

        ProgressBar progressBar = view.findViewById(R.id.progress_bar);
        Button downloadButton = view.findViewById(R.id.download_button);

        downloadButton.setOnClickListener(v -> {
            // تنفيذ التنزيل
            dismiss();
        });

        return new android.app.AlertDialog.Builder(getActivity())
            .setView(view)
            .setTitle("تنزيل نموذج")
            .create();
    }
}