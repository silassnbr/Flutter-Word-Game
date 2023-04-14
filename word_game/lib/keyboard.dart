import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:word_game/gamePage.dart';
import 'package:word_game/wordle.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WorldeGame game;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GamePage(widget.game),
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: sol, child: const Text("sol")),
            const Text("data"),
            ElevatedButton(onPressed: sol, child: const Text("sağ"))
          ],
        )
      ],
    );
  }

  void sol() {
    print("onayyy");
  }
}
