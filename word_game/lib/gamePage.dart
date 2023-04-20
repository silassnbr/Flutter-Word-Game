import 'package:flutter/material.dart';
import 'dart:math';
import 'package:word_game/keyboard.dart';
import 'package:word_game/wordle.dart';

List<int> yukseklik = [3, 3, 3, 3, 3, 3, 3, 3];
Color _backgroundColor = Colors.white;
int dogru = 0;
int yanlis = 0;

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
  int temp = 0;
  int count = 0;
  var random_row = 0;
  bool temp_flag = true;

  List<String> falling_letters = [];
  List<int> remove_animation = [];

  void row_control(){

    if(temp < 3 || yanlis >= 3) { // temp < 3
      count = 8;
      random_row = 0;
      if(temp >= 3)
        yanlis = 0;
    } else {
      count = 1;
      var random = Random();
      random_row = random.nextInt(8);
    }
    falling_letters = widget.letter.shuffleLetters(count);

    flag = false;
    _currentIndex = 0;
    temp +=1;
  }
  bool flag = false;

  void _startScrolling() {

    if(temp == 0)
      row_control();

    Future.delayed(Duration(milliseconds: 400)).then((_) {
      setState(() {
        if (_currentIndex < 72) {
          // move the last 8 items to the beginning of the list
          for (int i = 0; i < count; i++) {

            if(harfler[_currentIndex + i + 8 + random_row] == "") {
              harfler[_currentIndex + i + 8 + random_row] = falling_letters[i];
              remove_animation.add(_currentIndex + i + random_row);
            }
          }
          // clear the last 8 items
          for (int i = 0; i < remove_animation.length; i++) {
            harfler[remove_animation[i]] = "";
          }
          remove_animation = [];
          _currentIndex = _currentIndex + 8;
          /*        if(_currentIndex == 80)
            flag = true;*/

          // update the current index to point to the new first item
        }
      });

      for(int i =0; i < count; i++){
        if(!hit_floor(i))
          break;
      }
      //print("hit_floor ${hit_floor(count)}");
      if(flag){
        row_control();
      }
      _startScrolling();
    });
  }

  bool hit_floor(int row_ind){
    int next_index =0;
    next_index = _currentIndex +8 + row_ind;

    if( _currentIndex > 71 || harfler[next_index] != ""){
      flag = true;
      return true;
    }
    else
      flag = false;
    return false;

  }

  void changeColor() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      setState(() {
        int rand = Random().nextInt(10);
        int randSut = Random().nextInt(8);

        harfler[randSut] = rand.toString();
        //_asagi(randSut);
      });
      changeColor();
    });
  }

  @override
  void initState() {
    super.initState();
    _startScrolling();
    //changeColor();
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
        Text("Yanlis sayisi   " + yanlis.toString()),
      ],
    );
  }
}
