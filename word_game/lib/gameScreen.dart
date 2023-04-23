import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:word_game/keyboard.dart';
import 'package:word_game/main.dart';
import 'package:word_game/wordle.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 20;

  WorldeGame _game = WorldeGame();
  Letter _letter = Letter();
  late String word;

  @override
  void initState() {
    super.initState();
    WorldeGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          GameKeyboard(_game, _letter),
        ],
      ),
    );
  }
}
