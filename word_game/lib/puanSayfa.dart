import 'package:flutter/material.dart';
import 'package:word_game/keyboard.dart';

class PuanPage extends StatefulWidget {
  const PuanPage({super.key, required this.title});

  final String title;

  @override
  State<PuanPage> createState() => _PuanPageState();
}

class _PuanPageState extends State<PuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Puan Sayfası"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tumPuanlar.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.white,
                child: Center(
                    child: Text(
                  tumPuanlar[index].toString(),
                  style: TextStyle(color: Colors.brown.shade500),
                )),
              );
            }));
  }
}
