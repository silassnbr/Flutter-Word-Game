import 'dart:ffi';
import 'dart:math';

List<String> sesli_harfler = ["a", "e", "ı", "i", "o", "ö", "u", "ü", "a", "e"];
List<String> sessiz_harfler = [
  "z",
  "y",
  "v",
  "t",
  "ş",
  "s",
  "r",
  "p",
  "n",
  "r",
  "m",
  "l",
  "k",
  "h",
  "j",
  "ğ",
  "g",
  "d",
  "ç",
  "c",
  "b"
];
List<String?> harfler = List.filled(80, "");

class WorldeGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;

  static bool gameOver = false;

  static void initGame() {
    // final random = Random();
  }
  var wordsList = [];
  var filteredWordsList = [];
  List<bool> secilme = List.filled(80, false);

  List<String> user_word = [];
  List<int> satir = [];
  List<int> sutun = [];
  List<String> insertWord(word, row, col) {
    user_word.add(word);
    satir.add(row);
    sutun.add(col);
    print("eklendi ${user_word}");
    // search(user_word.toLowerCase());
    return user_word;
  }

  List<String> deleteWord(word, row, col) {
    user_word.remove(word);
    satir.remove(row);
    sutun.remove(col);

    print("silindi ${user_word}");
    print(satir);
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
  int adet_sesli = 12;
  int adet_sessiz = 12;
  int adet_harf = 24;

  String? ratio_check() {
    String? letter;
    var random = Random();
    var randomNumber;
    if (adet_sesli / adet_harf < 50) {
      randomNumber = random.nextInt(11);
      letter = sesli_harfler[randomNumber];
    } else if (adet_sessiz / adet_harf < 50) {
      randomNumber = random.nextInt(22);
      letter = sesli_harfler[randomNumber];
    }
    return letter;
  }

  static shuffleLetters() {
    sesli_harfler.shuffle();
    sessiz_harfler.shuffle();
    List<String> random_letter =
        sesli_harfler.sublist(0, 10) + sessiz_harfler.sublist(0, 14);

    random_letter.shuffle();
    harfler.setRange(0, 8, random_letter);
    return harfler;
  }
  //static List<String>harfler_new = shuffleSesliHarfler();

  List<List<String>> wordleBoard;

  Letter()
      : wordleBoard = List.generate(
          10,
          (index) {
            //shuffleSesliHarfler();
            return List.generate(
              8,
              (indexx) => shuffleLetters()[indexx + index * 8],
            );
          },
        );
}
