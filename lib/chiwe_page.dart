import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class ChwewiePage extends StatefulWidget {
  final String playerURL;
  ChwewiePage({Key key, @required this.playerURL}) : super(key: key);
  @override
  _ChwewiePageState createState() => _ChwewiePageState();
}

class _ChwewiePageState extends State<ChwewiePage> {
  
  final videoPlayerController = VideoPlayerController.network("https://deuk5ztnroigp.cloudfront.net/CHANNEL_24x7.m3u8");
  ChewieController chewieController;

@override
  void deactivate() {
    // TODO: implement deactivate
    chewieController.pause();
    super.deactivate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Container(
          child: Chewie(controller: chewieController),
        ));
  }
}