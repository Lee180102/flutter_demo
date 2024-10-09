package com.example.flutter_demo;

import android.content.Context;
import android.content.res.AssetManager;
import android.util.Log;

import java.io.IOException;

public class AssetHelper {
    private static final String TAG = "AssetHelper";
    private Context mContext;

    public AssetHelper(Context context) {
        this.mContext = context;
    }

    public void listAssets() {
        AssetManager assetManager = mContext.getAssets();
        // 列出根目录下的所有文件和目录
        listFiles(assetManager, "");
    }

    private void listFiles(AssetManager assetManager, String path) {
        try {
            // 获取指定路径下的所有文件和目录
            String[] files = assetManager.list(path);
            if (files != null) {
                for (String file : files) {
                    String fullPath = path.isEmpty() ? file : path + "/" + file;
                    Log.d(TAG, "Asset: " + fullPath);

                    // 递归调用，检查是否为目录
                    if (isDirectory(assetManager, fullPath)) {
                        listFiles(assetManager, fullPath); // 递归列出子目录
                    }
                }
            }
        } catch (IOException e) {
            Log.e(TAG, "Failed to list assets in path: " + path, e);
        }
    }

    private boolean isDirectory(AssetManager assetManager, String path) {
        try {
            String[] files = assetManager.list(path);
            return files != null && files.length > 0; // 如果有文件，认为是目录
        } catch (IOException e) {
            Log.e(TAG, "Error checking if path is directory: " + path, e);
            return false;
        }
    }
}
