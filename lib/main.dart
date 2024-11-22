import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  // Ensure Flutter bindings are initialized before any other code runs
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});
  final player = AudioPlayer();

  void playSound(int soundNumber) async {
    try {
      await player.stop(); // Stop any ongoing playback
      await player.setVolume(1.0); // Set volume to maximum
      await player.play(AssetSource('audio/note$soundNumber.wav'));
    } catch (e) {
      print('Error: $e');
    }
  }

  Expanded buildKey(
      {required Color color,
      required int soundNumber,
      required String soundName}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: TextButton.styleFrom(
          enableFeedback: false, // Disables the click sound
          backgroundColor: color,
        ),
        child: Text(
          soundName,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNumber: 1, soundName: 'Do'),
              buildKey(color: Colors.orange, soundNumber: 2, soundName: 'Re'),
              buildKey(color: Colors.yellow, soundNumber: 3, soundName: 'Mi'),
              buildKey(color: Colors.green, soundNumber: 4, soundName: 'Fa'),
              buildKey(color: Colors.teal, soundNumber: 5, soundName: 'Sol'),
              buildKey(color: Colors.blue, soundNumber: 6, soundName: 'La'),
              buildKey(color: Colors.purple, soundNumber: 7, soundName: 'Si'),
            ],
          ),
        ),
      ),
    );
  }
}
