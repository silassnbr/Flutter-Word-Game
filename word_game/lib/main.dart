import 'package:flutter/material.dart';
import 'package:word_game/gamePage.dart';
import 'package:word_game/gameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word_block',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'word game'),
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => GameScreen())));
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
            ElevatedButton(
                onPressed: navigateGamePage,
                child: const Text("OYUNA BAŞLA",
                    style: TextStyle(
                      color: Colors.brown,
                    ))),
          ],
        ),
      ),
    );
  }
}
