import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:word_game/wordle.dart';

class GamePage extends StatefulWidget {
  GamePage(this.game, {Key? key}) : super(key: key);
  WorldeGame game;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: e
                    .map((e) => Container(
                          padding: const EdgeInsets.all(2.0),
                          width: 40.0,
                          height: 40.0,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: Colors.amber.shade200),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
