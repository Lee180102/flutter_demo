package com.example.flutter_demo;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;
import androidx.annotation.NonNull;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import java.io.IOException;
import java.util.Arrays;

public class SoundChannel implements MethodChannel.MethodCallHandler {
    private static final String CHANNEL_NAME = "com.example/sound";
    private MethodChannel channel;
    private Context mContext;
    private MediaPlayer mediaPlayer;

    public static final String TAG = "SoundChannel";

    // 构造函数，初始化通道
    public SoundChannel(BinaryMessenger messenger, Context context) {
        Log.d(TAG, "init");
        this.mContext = context;
        channel = new MethodChannel(messenger, CHANNEL_NAME);
        channel.setMethodCallHandler(this);
        // 初始化 MediaPlayer
        mediaPlayer = new MediaPlayer();
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Log.d(TAG, "onMethodCall: " + call.method);
        // 创建 AssetHelper 实例
        AssetHelper assetHelper = new AssetHelper(mContext);

        // 列出 assets 下的所有文件，包括子目录
        assetHelper.listAssets();


        switch (call.method) {
            case "playSound":
                String soundPath = call.arguments(); // 获取从 Flutter 传递的音频路径
                playSound(soundPath);
                result.success(null);
                break;
            case "stopSound":
                stopSound();
                result.success(null);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    // 播放指定路径的音频文件
    private void playSound(String soundPath) {
        // 检查是否需要重新初始化 MediaPlayer
        if (mediaPlayer != null) {
            mediaPlayer.release();
            mediaPlayer = null;
        }

        try {
            // 重新初始化 MediaPlayer
            mediaPlayer = new MediaPlayer();

            AssetManager assetManager = mContext.getAssets();
            // 因为 Flutter 中资源存放在 assets 目录下
            AssetFileDescriptor afd = assetManager.openFd("flutter_assets/" + soundPath);
            Log.d(TAG, "afd: " + afd);

            // 设置数据源
            mediaPlayer.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
            mediaPlayer.prepare();
            mediaPlayer.start();
        } catch (IOException e) {
            Log.e(TAG, "Error playing sound from assets", e);
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize MediaPlayer", e);
        }
    }

    // 停止播放声音
    private void stopSound() {
        if (mediaPlayer != null && mediaPlayer.isPlaying()) {
            mediaPlayer.stop();
            mediaPlayer.reset(); // 重置播放器，准备下一次播放
        }
    }

    // 释放资源
    public void release() {
        if (mediaPlayer != null) {
            mediaPlayer.release();
            mediaPlayer = null;
        }
    }
}
