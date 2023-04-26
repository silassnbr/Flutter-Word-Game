import 'dart:async';

import 'package:flutter/material.dart';
import 'package:word_game/gamePage.dart';
import 'package:word_game/gameScreen.dart';
import 'package:word_game/puanSayfa.dart';
import 'package:word_game/wordle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word_block',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'WORD GAME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateGamePage() {
    Timer(Duration(milliseconds: 1000), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => GameScreen())));
    });
  }

  void puanSayfasi() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => PuanPage(title: ''))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lütfen Başlamak için butona basınız',
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: navigateGamePage,
                child: const Text("OYUNA BAŞLA",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            const Text(
              'Önceki skorlar',
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: puanSayfasi,
                child: const Text("Puanlar",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
