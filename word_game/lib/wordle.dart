import 'dart:math';

List<String> harfler = ["a", "b", "c"];

class WorldeGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;

  static bool gameOver = false;

  //Setting the gameBoard
  List<List<Letter>> wordleBoard = List.generate(
      10,
      (index) => List.generate(
            8,
            (index) => Letter("t", 0),
          ));

  static void initGame() {
    // final random = Random();
  }

  //checking world
  // bool checkWordExist(String word) {
  //   return word_list.contains(word);
  // }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}
