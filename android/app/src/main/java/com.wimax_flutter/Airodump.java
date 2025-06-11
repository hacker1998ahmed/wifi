package com.wimax_flutter;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Airodump {
    public static void startScan(String interfaceName) {
        try {
            Process process = Runtime.getRuntime().exec("su");
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                // يمكنك هنا معالجة النتائج أو إرسالها إلى Flutter عبر MethodChannel
            }
            process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}