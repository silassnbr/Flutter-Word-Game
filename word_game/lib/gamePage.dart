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
        ...widget.game.wordleBoard.map((e) {
          int rowIndex = widget.game.wordleBoard.indexOf(e); // get row index
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rowIndex.toString()), // add row index as text
              ...e.asMap().entries.map((entry) {
                int colIndex = entry.key; // get column index
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.game.insertWord(entry.value);
                      print(rowIndex * 8 + colIndex);
                    });
                    //widget.game.search(widget.game.user_word);
                    print(widget.game.user_word);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    width: 40.0,
                    height: 40.0,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.amber.shade200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entry.value,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(colIndex.toString()), // add column index as text
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
        SizedBox(height: 20.0),
        Text(
          widget.game.user_word.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  void readletter() {
    print("read letter");
  }
}
