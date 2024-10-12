import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'countdown.dart'; // 引入倒计时组件
import 'countdown_provider.dart'; // 引入倒计时Provider

class CountdownWithProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountdownProvider(),
      builder: (context, child) {
        // 使用 builder 来延迟构建
        return Scaffold(
          appBar: AppBar(title: Text('倒计时示例')),
          body: Center(
            child: Column(
              children: [
                Countdown(
                  fontSize: 20,
                  vibration: true,
                  sound: true,
                  soundAssetPath: "assets/sound/InspiringEpicCinematic.mp3",
                ),
                ElevatedButton(
                  onPressed: () {
                    print("123");
                    // 使用 listen: false 避免 rebuild
                    Provider.of<CountdownProvider>(context, listen: false)
                        .startTimer(1);
                  },
                  child: Text("开始倒计时"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
