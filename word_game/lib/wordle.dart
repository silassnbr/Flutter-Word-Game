import 'dart:math';

List<String> harfler = [
  "",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "c",
  "a",
  "b",
  "c",
];

class WorldeGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;

  static bool gameOver = false;

  //Setting the gameBoard
  List<List<String>> wordleBoard = List.generate(
      10,
      (index) => List.generate(
            8,
            (indexx) => harfler[indexx + index * 8],
          ));

  static void initGame() {
    // final random = Random();
  }
  var wordsList = [];
  var filteredWordsList = [];
  var user_word = "";

  String insertWord(word) {
    user_word += word;
    print("eklendi ${user_word}");
    // search(user_word.toLowerCase());
    return user_word;
  }

  // void search(value) {
  //   filteredWordsList =
  //       wordsList.where((item) => item.startsWith('$value')).toList();
  //   print(filteredWordsList.length);
  //   user_word = value; //TextField için
  // }
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
