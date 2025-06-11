package com.wimax_flutter;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class CustomActionFragment extends Fragment {
    private ListView actionList;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_custom_actions, container, false);
        actionList = view.findViewById(R.id.actions_list);

        ArrayAdapter<String> adapter = new ArrayAdapter<>(requireContext(), android.R.layout.simple_list_item_1,
            new String[]{"ARP Spoof", "Deauth Attack", "WPS Attack"});
        actionList.setAdapter(adapter);

        return view;
    }
}