import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hls_player/hls_player.dart';
import 'package:hls_player/model/video.dart';

class HLSVideoPlayerPage extends StatefulWidget {
  final String playerURL;
  HLSVideoPlayerPage({Key key, @required this.playerURL}) : super(key: key);
  @override
  _HLSVideoPlayerPageState createState() => _HLSVideoPlayerPageState();
}

class _HLSVideoPlayerPageState extends State<HLSVideoPlayerPage> {

String playeU = "";

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    // initZappingPlatformState();
    playeU = widget.playerURL;
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
   Future<void> initPlatformState() async {
    var  uRL_VIDEO = playeU;

    try {
      await HlsPlayer.initializeVideo(url: uRL_VIDEO).then((onValue) {
        print(onValue);
      }).catchError((onError) {
        print(onError);
      });
    } on PlatformException {}
  }

  static Future<void> initZappingPlatformState() async {
    const uRL_VIDEO =
        "http://200.23.206.107:18080/canales/miscelaneos/docubox/playlist.m3u8";
    const uRL_VIDEO2 = "http://mdstrm.com/video/5a29c07e5522e40a45beb669.m3u8";
    const uRL_VIDEO3 =
        "http://unlimited1-cl.dps.live/campustv/campustv.smil/playlist.m3u8";

    final Video video = Video();

    video.titulo = "titulo";
    video.descripcion = "descripcion";
    video.imagenPath =
        "https://170.79.102.232:8443/img/channels/logo_1587071125.png?w=500&h=500";
    video.numeroCanal = 1;
    video.studio = 1381;
    video.linkReproductor = uRL_VIDEO;

    final Video video2 = Video();

    video2.titulo = "titulo";
    video2.descripcion = "descripcion";
    video2.imagenPath =
        "https://170.79.102.232:8443/img/channels/logo_1567784648.png?w=500&h=500";
    video2.numeroCanal = 2;
    video2.studio = 1382;
    video2.linkReproductor = uRL_VIDEO2;

    final Video video3 = Video();

    video3.titulo = "titulo";
    video3.descripcion = "descripcion";
    video3.imagenPath =
        "https://170.79.102.232:8443/img/channels/logo_1565631656.png?w=500&h=500";
    video3.numeroCanal = 3;
    video3.studio = 1383;
    video3.linkReproductor = uRL_VIDEO3;

    final canales = [video, video2, video3];

    try {
      await HlsPlayer.initializeZapping(
              canales: canales,
              playVideoAtIndex: 1,
              urlEPG:
                  r"http://170.79.102.232:18080/30h_c51b182583a9d4a8_$5da43c0fb7fbd7b0c7d3/STUDIO.json")
          .then((onValue) {
        print(onValue);
        Timer.periodic(Duration(seconds: 5), (Timer t) => initGetVideoLink());
      }).catchError((onError) {
        print(onError);
      });
    } on PlatformException {}
  }

  static Future<void> initGetVideoLink() async {
    try {
      await HlsPlayer.getVideoLink().then((onValue) {
        print(onValue);
      }).catchError((onError) {
        print(onError);
      });
    } on PlatformException {}
  }

  Widget testWidget = new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'play video',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: () {
              //initPlatformState();
            },
          ),
          RaisedButton(
            child: Text(
              'play videos zapping',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: () {
              initZappingPlatformState();
            },
          ),
        ],
      )),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return testWidget;
  }
}