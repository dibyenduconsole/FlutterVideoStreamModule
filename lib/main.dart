import 'package:flutter/material.dart';
import 'package:video_player_module/hls_video_player.dart';
import 'package:video_player_module/yoyo_player.dart';
import 'package:video_player_module/player_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
var url = "https://deuk5ztnroigp.cloudfront.net/CHANNEL_24x7.m3u8"; 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(child: Text("Play 1"),onPressed: (){
                 Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new PlayerScreen(playerURL: url,)));
            },),

            RaisedButton(child: Text("Play 2"),onPressed: (){
 Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new YoYoPlayerScreen(playerURL: url,)));
            },),

            RaisedButton(child: Text("Play 3"),onPressed: (){
Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new HLSVideoPlayerPage(playerURL: url,)));
            },),


          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
