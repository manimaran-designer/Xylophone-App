import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:swipedetector/swipedetector.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  String _swipeDirection = '';

  int soundNumber;

  var player;

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SwipeDetector(
            // Use Painter For Swipe interations
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.orange, soundNumber: 2),
                buildKey(color: Colors.yellow, soundNumber: 3),
                buildKey(color: Colors.green, soundNumber: 4),
                buildKey(color: Colors.teal, soundNumber: 5),
                buildKey(color: Colors.blue, soundNumber: 6),
                buildKey(color: Colors.purple, soundNumber: 7),
              ],
            ),
            onSwipeUp: () {
              setState(
                () {
                  playSound(soundNumber);
                },
              );
            },
            onSwipeDown: () {
              setState(
                () {
                  playSound(soundNumber);
                },
              );
            },
            swipeConfiguration: SwipeConfiguration(
              verticalSwipeMinVelocity: 100.0,
              verticalSwipeMinDisplacement: 50.0,
              verticalSwipeMaxWidthThreshold: 5000.0,
              horizontalSwipeMaxHeightThreshold: 5000.0,
              horizontalSwipeMinDisplacement: 50.0,
              horizontalSwipeMinVelocity: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
