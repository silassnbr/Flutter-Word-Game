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

  Future<bool> sag() async {
    String secilen = "";
    WidgetsFlutterBinding.ensureInitialized();
    //String searchQuery = _searchController.text;
    //print("aranacaklar ${widget.game.filteredWordsList}");
    print("user_word ${widget.game.user_word}");
    //if(searchQuery.length == widget.game.filteredWordsList[0].length) {
    for (int i = 0; i < widget.game.user_word.length; i++) {
      secilen += widget.game.user_word[i];
    }
    if (secilen.length ==
        widget.game.filteredWordsList[0].length) {
      print("DOĞRU ");
      return true;
    } else {
      setState(() {
        dogru = dogru - 1;
      });
      print("Yanlış ");
      return false;
    }
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
}
