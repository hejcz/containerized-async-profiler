package io.github.hejcz.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.concurrent.ConcurrentHashMap;

public class App {

    private final static ConcurrentHashMap<Long, Long> concurrentHashMap = new ConcurrentHashMap<>();

    public static void main(String[] args) {
        run();
    }

    private static void run() {
        while (true) {
            update();
        }
    }

    private static void update() {
        Long inputLine = fetchLong();
        concurrentHashMap.compute(argWithModulo(inputLine), (k, v) -> setOrAdd(v));
    }

    private static Long fetchLong() {
        return 0L;
    }

    private static Long fetchLong2() {
        try {
            URL url = new URL("http://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=1");
            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(url.openStream()))) {
                String inputLine;
                if ((inputLine = in.readLine()) != null) {
                    return Long.parseLong(inputLine.substring(1, inputLine.length() - 1));
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    private static long setOrAdd(Long v) {
        return v == null ? 1 : v + 1;
    }

    private static long argWithModulo(long i) {
        return i % 100_000;
    }

}
