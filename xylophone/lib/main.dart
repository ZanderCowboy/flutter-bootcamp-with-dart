import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Widget playButton({Color? color, int? noteNumber}) {
    AudioCache.instance = AudioCache(prefix: 'assets/audio/');

    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(
              AssetSource(
                'note$noteNumber.wav',
              ),
            );
          },
          child: SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Xylophone'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            playButton(color: Colors.red, noteNumber: 1),
            playButton(color: Colors.orange, noteNumber: 2),
            playButton(color: Colors.yellow, noteNumber: 3),
            playButton(color: Colors.green, noteNumber: 4),
            playButton(color: Colors.teal, noteNumber: 5),
            playButton(color: Colors.blue, noteNumber: 6),
            playButton(color: Colors.purple, noteNumber: 7),
          ],
        )),
      ),
    );
  }
}
