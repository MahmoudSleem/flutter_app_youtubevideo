import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _secureMode = false;


  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'uCrc8kmG5uc',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
        ),
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            // منشان يصير في عندي رول احسن من خلالو اطلع وانزل
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                const Text(
                  'You tube video',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 60),
                YoutubePlayerBuilder(player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.blueGrey,
                    handleColor: Colors.amberAccent,
                  ),

                  onReady: (){
                    print('Player is ready.');
                  },
                ), builder: (context , player){

                  return Column(
                    children: [
                      // some widgets
                      player,
                      //some other widgets
                    ],
                  );
                }),

z
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(height: 60),
                Text('Secure Mode: ${_secureMode.toString()}\n'),
                ElevatedButton(
                    onPressed: () async {
                      final secureModeToggle = !_secureMode;

                      if (secureModeToggle == true) {
                        await FlutterWindowManager.addFlags(
                            FlutterWindowManager.FLAG_SECURE);
                      } else {
                        await FlutterWindowManager.clearFlags(
                            FlutterWindowManager.FLAG_SECURE);
                      }

                      setState(() {
                        _secureMode = !_secureMode;
                      });
                    },
                    child: const Text("Toggle Secure Mode")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
