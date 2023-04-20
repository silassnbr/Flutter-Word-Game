import 'package:flutter/material.dart';
import 'dart:math';
import 'package:word_game/keyboard.dart';
import 'package:word_game/wordle.dart';

List<int> yukseklik = [3, 3, 3, 3, 3, 3, 3, 3];
Color _backgroundColor = Colors.white;
int dogru = 0;

class GamePage extends StatefulWidget {
  GamePage(this.game, this.letter, {Key? key}) : super(key: key);
  WorldeGame game;
  Letter letter;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _currentIndex = 0;
  int sat = 0;
  void _startScrolling() {
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      setState(() {
        if (_currentIndex < harfler.length - 27) {
          for (int i = 0; i < 8; i++) {
            harfler[_currentIndex + i + 24] = harfler[_currentIndex + 16 + i];
            harfler[_currentIndex + i + 16] = harfler[_currentIndex + 8 + i];
            harfler[_currentIndex + i + 8] = harfler[_currentIndex + i];
          }
          for (int i = _currentIndex; i < _currentIndex + 8; i++) {
            harfler[i] = "";
          }
          _currentIndex = _currentIndex + 8;
        }
      });
      _startScrolling();
    });
  }

  int i = 0;
  void _asagi(int a) {
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        if (harfler[a + 8] == "") {
          harfler[a + 8] = harfler[a];
          harfler[a] = "";
          a = a + 8;
          i++;
          // if (harfler[a] != "") {
          //   print("dolduuu");
          //   showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //             title: Text("aaa"),
          //           ));
          // }
          // update the current index to point to the new first item
        }
      });
      _asagi(a);
    });
  }

  void changeColor() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      setState(() {
        int rand = Random().nextInt(10);
        int randSut = Random().nextInt(8);

        harfler[randSut] = rand.toString();
        _asagi(randSut);
      });
      changeColor();
    });
  }

  @override
  void initState() {
    super.initState();
    _startScrolling();
    changeColor();
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
                      });
                    } else {
                      setState(() {
                        widget.game.secilme[rowIndex * 8 + colIndex] = false;
                        widget.game.deleteWord(harfler[rowIndex * 8 + colIndex],
                            rowIndex, colIndex);
                      });
                    }
                    widget.game.search();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    width: 40.0,
                    height: 40.0,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: _backgroundColor),
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
        Text("Dogru sayisi   " + dogru.toString()),
      ],
    );
  }
}
