package com.example.flutter_demo;

import android.content.Context;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {

    private SoundChannel soundChannel;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // 实例化通道
        new BatteryChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), this.getContext());
        soundChannel = new SoundChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), this.getContext());
        new VibrationChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), this.getContext());
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (soundChannel != null) {
            soundChannel.release();
        }
    }

    public Context getContext() {
        return this;
    }
}
