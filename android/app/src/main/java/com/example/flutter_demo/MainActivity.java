package com.example.flutter_demo;

import android.content.Context;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // 实例化通道
        new BatteryChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), this.getContext());
    }

    public Context getContext() {
        return this;
    }
}
