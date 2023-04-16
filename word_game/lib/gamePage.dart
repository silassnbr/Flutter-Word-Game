import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:word_game/keyboard.dart';
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
    GameKeyboard bord = GameKeyboard(widget.game);

    return Column(
      children: [
        ...widget.game.wordleBoard
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: e.map((e) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.game.insertWord(e);
                      });
                      //widget.game.search(widget.game.user_word);
                      print(widget.game.user_word);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      width: 30.0,
                      height: 40.0,
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.amber.shade200),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                /*.map((e) => Container(
                          padding: const EdgeInsets.all(2.0),
                          width: 30.0,
                          height: 20.0,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: Colors.amber.shade200),
                          child: ElevatedButton(
                            onPressed: readletter,
                            child: Text(harfler[2]),
                          ),
                        ))
                    .toList(),*/
              ),
            )
            .toList(),
        SizedBox(height: 20.0),
        Text(
          widget.game.user_word,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  void readletter() {
    print("read letter");
  }
}
