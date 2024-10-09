package com.example.flutter_demo;

import android.content.Context;
import android.os.Vibrator;
import android.os.Build;
import android.os.VibrationEffect;
import android.util.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import java.util.List;

public class VibrationChannel implements MethodChannel.MethodCallHandler {
    private static final String CHANNEL_NAME = "com.example/vibration";
    private MethodChannel channel;
    private Context mContext;


    private Vibrator vibrator;
    public static final String TAG = "VibrationChannel";

    public VibrationChannel(BinaryMessenger messenger, Context context) {
        Log.d(TAG, "init");
        this.mContext = context;
        channel = new MethodChannel(messenger, CHANNEL_NAME);
        channel.setMethodCallHandler(this);
        this.vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);

    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        Log.d(TAG, "onMethodCall: " + methodCall.method);
        switch (methodCall.method) {
            case "vibrate":
                triggerVibration();
                result.success(null);
                break;
            case "rhythmVibrate":
                List<Integer> patternList = methodCall.arguments();  // 从 Flutter 端接收震动模式
                long[] pattern = new long[patternList.size()];
                for (int i = 0; i < patternList.size(); i++) {
                    pattern[i] = patternList.get(i);
                }
                rhythmVibrate(pattern);  // 调用震动方法
                result.success(null);
                break;
            case "stopVibration":
                stopVibration();
                result.success(null);
                break;
            default:
                result.notImplemented();
                break;
        }


    }

    private void triggerVibration() {
         if (vibrator != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(VibrationEffect.createOneShot(500, VibrationEffect.DEFAULT_AMPLITUDE));
            } else {
                vibrator.vibrate(500); // API 26以下，使用过时的震动方法
            }
        } else {
            Log.e("Vibration", "Vibrator service not found!");
        }
    }

    private void rhythmVibrate(long[] pattern) {
         if (vibrator != null) {
            if (vibrator.hasVibrator()) {
                // 配置震动的节奏，格式：{等待时间, 震动时间, 间隔时间, 震动时间, ...}
                long[] defaultPattern = {0, 1000, 500, 1000};  // 立即震动，震动1秒，暂停0.5秒，再震动1秒

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    // Android 8.0 (API 26) 及以上，使用 VibrationEffect
                    vibrator.vibrate(android.os.VibrationEffect.createWaveform(pattern == null || pattern.length == 0 ? defaultPattern : pattern, -1));  // -1 表示不重复
                } else {
                    // Android 8.0 以下，使用传统方法
                    vibrator.vibrate(pattern == null || pattern.length == 0 ? defaultPattern : pattern, -1);  // -1 表示不重复
                }
            }
        } else {
            Log.e("Vibration", "Vibrator service not found!");
        }
    }
    // 停止震动
    private void stopVibration() {
        if (vibrator != null && vibrator.hasVibrator()) {
            vibrator.cancel();
        }
    }

}