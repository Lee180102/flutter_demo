package com.example.flutter_demo;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class BatteryChannel implements MethodChannel.MethodCallHandler {
    private final String batteryChannelName = "cn.blogss/battery";
    private MethodChannel channel;
    private Context mContext;

    public static final String TAG = "BatteryChannel";

    public BatteryChannel(BinaryMessenger flutterEngine, Context context) {
        Log.d(TAG, "init");
        channel = new MethodChannel(flutterEngine, batteryChannelName);
        channel.setMethodCallHandler(this);
        mContext = context;
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Log.d(TAG, "onMethodCall: " + call.method);
        if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();
            if (batteryLevel != -1) {
                result.success(batteryLevel);
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        } else {
            result.notImplemented();
        }
    }

    private int getBatteryLevel() {
        int batteryLevel = -1; // 初始化为 -1 表示未知

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) mContext.getSystemService(Context.BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            try {
                Intent intent = new ContextWrapper(mContext).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                if (intent != null) {
                    int level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
                    int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
                    if (scale > 0) {
                        batteryLevel = (level * 100) / scale;
                    }
                }
            } catch (Exception e) {
                Log.e("BatteryManager", "Error getting battery level", e);
            }
        }

        return batteryLevel;
    }
}