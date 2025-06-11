package com.wimax_flutter;

public class AP {
    private String bssid;
    private String ssid;
    private int channel;
    private int power;
    private String encryption;

    public AP(String bssid, String ssid, int channel, int power, String encryption) {
        this.bssid = bssid;
        this.ssid = ssid;
        this.channel = channel;
        this.power = power;
        this.encryption = encryption;
    }

    public String getBSSID() {
        return bssid;
    }

    public String getSSID() {
        return ssid;
    }

    public int getChannel() {
        return channel;
    }

    public int getPower() {
        return power;
    }

    public String getEncryption() {
        return encryption;
    }
}