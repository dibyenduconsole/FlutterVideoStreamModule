/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoyo_player/yoyo_player.dart';

class YoYoPlayerScreen extends StatefulWidget {
  final String playerURL;
  YoYoPlayerScreen({Key key, @required this.playerURL}) : super(key: key);
  @override
  _YoYoPlayerScreenState createState() => _YoYoPlayerScreenState();
}

class _YoYoPlayerScreenState extends State<YoYoPlayerScreen> {
  bool fullscreen = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);
    return Scaffold(
        appBar:AppBar(),
            
        body: Column(
          children: [
            YoYoPlayer(
              aspectRatio: 16 / 9,
              url:widget.playerURL,
                  // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  //"https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
              // "https://player.vimeo.com/external/440218055.m3u8?s=7ec886b4db9c3a52e0e7f5f917ba7287685ef67f&oauth2_token_id=1360367101",
              // "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
              videoStyle: VideoStyle(),
              videoLoadingStyle: VideoLoadingStyle(
                loading: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('image/yoyo_logo.png'),
                        fit: BoxFit.fitHeight,
                        height: 50,
                      ),
                      Text("Loading video"),
                    ],
                  ),
                ),
              ),
              onfullscreen: (t) {
                setState(() {
                  fullscreen = t;
                });
              },
            ),
          ],
        ),
      
    );
  }
}*/