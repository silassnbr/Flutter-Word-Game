import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_game/gamePage.dart';
import 'package:word_game/gameScreen.dart';
import 'package:word_game/wordle.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, this.letter, {Key? key}) : super(key: key);
  WorldeGame game;
  Letter letter;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  // final TextEditingController _searchController = TextEditingController();

  WorldeGame game = WorldeGame();

  void _loadWords() async {
    String tempData =
        await DefaultAssetBundle.of(context).loadString('assets/words.txt');
    setState(() {
      widget.game.wordsList = tempData.split(',');
      widget.game.filteredWordsList = widget.game.wordsList;
      print(widget.game.wordsList.length);
    });
  }

  void initState() {
    super.initState();
    _loadWords();
    print("merhabaa");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GamePage(widget.game, widget.letter),
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: sol, child: const Text("Sil")),
            // SizedBox( // <-- SEE HERE
            //   width: 100,
            //   child: TextField(
            //     controller: _searchController,
            //     decoration: const InputDecoration(
            //       hintText: "Kelime ara",
            //     ),
            //     onChanged: widget.game.search,
            //   ),
            // ),
/*            SizedBox( //// <-- SEE HERE
              width: 100,
              child: Text(widget.game.user_word,style: TextStyle(fontSize: 20))
            ),*/
            ElevatedButton(onPressed: sag, child: Text("Kontrol"))
          ],
        ),
      ],
    );
  }

  List<String> falling_letters = ["a", "b", "a", "b", "a", "b", "a", "b"];
  Future<bool?> sag() async {
    String secilen = "";
    WidgetsFlutterBinding.ensureInitialized();
    //String searchQuery = _searchController.text;
    //print("aranacaklar ${widget.game.filteredWordsList}");
    print("user_word ${widget.game.user_word}");
    //if(searchQuery.length == widget.game.filteredWordsList[0].length) {
    for (int i = 0; i < widget.game.user_word.length; i++) {
      secilen += widget.game.user_word[i];
    }
    if (!widget.game.filteredWordsList.isEmpty) {
      if (secilen.length == widget.game.filteredWordsList[0].length) {
        print("DOĞRU ");
        setState(() {
          dogru = dogru + 1;
          puan();
        });

        print(dogru);
        return true;
      }else {
        setState(() {
          dogru = dogru - 1;
          yanlis = yanlis + 1;
          print("88888888888    " + yanlis.toString());
        });
        int ilkEleman = 0;
        if (yanlis == 3) {
          harfler.setRange(0, 8, falling_letters);
          Timer.periodic(Duration(seconds: 1), (timer) {
            setState(() {
              kaydir(ilkEleman);
              ilkEleman += 8;
            });
          });

          yanlis = 0;
        }
        print("Yanlış ");

        return false;
      }
    } else {
      setState(() {
        dogru = dogru - 1;
        yanlis = yanlis + 1;
        print("88888888888    " + yanlis.toString());
      });
      int ilkEleman = 0;
      if (yanlis == 3) {
        harfler.setRange(0, 8, falling_letters);
        Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            kaydir(ilkEleman);
            ilkEleman += 8;
          });
        });

        yanlis = 0;
      }
      print("Yanlış ");

      return false;
    }
  }

  void kaydir(ilkEleman) async {
    setState(() {
      if (ilkEleman < 72) {
        for (int i = 0; i < 8; i++) {
          if (harfler[ilkEleman + i + 8] == "") {
            harfler[ilkEleman + i + 8] = harfler[ilkEleman + i];
            harfler[ilkEleman + i] = "";
          }
        }
      }
    });
  }

  void sol() {
    // _searchController.text="";
    setState(() {
      widget.game.user_word = [];
      widget.game.satir = [];
      widget.game.sutun = [];
      widget.game.secilme = List.filled(80, false);
      print("onayyy");
    });
  }

  void puan(){
    List<String> points = ["aeiklnrt", "ımosu", "bdüy", "cçşz", "hgp","föv", "ğ", "j"];

    for (int i = 0; i < widget.game.user_word.length; i++) {
      if(points[0].contains(widget.game.user_word[i]))
        toplam_puan +=1;
      else if(points[1].contains(widget.game.user_word[i]))
        toplam_puan +=2;
      else if(points[2].contains(widget.game.user_word[i]))
        toplam_puan +=3;
      else if(points[3].contains(widget.game.user_word[i]))
        toplam_puan +=4;
      else if(points[4].contains(widget.game.user_word[i]))
        toplam_puan +=5;
      else if(points[5].contains(widget.game.user_word[i]))
        toplam_puan +=7;
      else if(points[6].contains(widget.game.user_word[i]))
        toplam_puan +=8;
      else if(points[7].contains(widget.game.user_word[i]))
        toplam_puan +=10;

    }
  }
}
