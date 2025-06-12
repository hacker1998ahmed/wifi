package com.wimax_flutter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

public class BoundedBufferedReader extends BufferedReader {
    private final int maxLength = 1024 * 1024; // 1MB

    public BoundedBufferedReader(Reader in) {
        super(in);
    }

    @Override
    public String readLine() throws IOException {
        String line = super.readLine();
        if (line != null && line.length() > maxLength) {
            throw new IOException("تخطى حد خط السطر");
        }
        return line;
    }
}