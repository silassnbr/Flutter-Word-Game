import 'package:flutter/material.dart';
import 'package:word_game/keyboard.dart';
import 'package:word_game/wordle.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  WorldeGame _game = WorldeGame();
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
          const Text(
            "zaman bolumu+puan",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GameKeyboard(_game),
        ],
      ),
    );
  }
}
