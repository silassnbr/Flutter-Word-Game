import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:word_game/keyboard.dart';
import 'package:word_game/main.dart';
import 'package:word_game/wordle.dart';

class GamePage extends StatefulWidget {
  GamePage(this.game, this.letter, {Key? key}) : super(key: key);
  WorldeGame game;
  Letter letter;

  @override
  State<GamePage> createState() => _GamePageState();
}

//List<bool> secilme = [];

class _GamePageState extends State<GamePage> {
  // void kaydirma() async {
  //   setState(() {
  //     harfler[0] = "a";
  //     harfler[8] = "1";
  //   });
  // }

  // void initState() {
  //   super.initState();
  //   kaydirma();
  //   print("kaydirma");
  // }

  int _currentIndex = 0;
  int sat = 0;
  void _startScrolling() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        if (_currentIndex < harfler.length - 27) {
          print(harfler);
          // move the last 8 items to the beginning of the list
          for (int i = 0; i < 8; i++) {
            harfler[_currentIndex + i + 24] = harfler[_currentIndex + 16 + i];
            harfler[_currentIndex + i + 16] = harfler[_currentIndex + 8 + i];
            harfler[_currentIndex + i + 8] = harfler[_currentIndex + i];
          }
          // clear the last 8 items
          for (int i = _currentIndex; i < _currentIndex + 8; i++) {
            harfler[i] = "";
          }
          _currentIndex = _currentIndex + 8;

          // update the current index to point to the new first item
        }
      });
      _startScrolling();
    });
  }

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  Widget build(BuildContext context) {
    GameKeyboard bord = GameKeyboard(widget.game, widget.letter);

    return Column(
      children: [
        ...widget.letter.wordleBoard.map((e) {
          int rowIndex = widget.letter.wordleBoard.indexOf(e); // get row index
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(rowIndex.toString()), // add row index as text
              ...e.asMap().entries.map((entry) {
                int colIndex = entry.key; // get column index
                return GestureDetector(
                  onTap: () {
                    if (widget.game.secilme[rowIndex * 8 + colIndex] == false) {
                      widget.game.secilme[rowIndex * 8 + colIndex] = true;
                      setState(() {
                        widget.game.insertWord(harfler[rowIndex * 8 + colIndex],
                            rowIndex, colIndex);
                        print(rowIndex * 8 + colIndex);
                      });
                    } else {
                      setState(() {
                        widget.game.secilme[rowIndex * 8 + colIndex] = false;
                        widget.game.deleteWord(harfler[rowIndex * 8 + colIndex],
                            rowIndex, colIndex);
                        print(rowIndex * 8 + colIndex);
                      });
                    }

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
                          harfler[rowIndex * 8 + colIndex].toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Text(colIndex.toString()), // add column index as text
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
          "harf  " + widget.game.user_word.toString(),
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "satır  " + widget.game.satir.toString(),
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "sutun  " + widget.game.sutun.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  void readletter() {
    print("read letter");
  }
}
