import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';

import '../widgets/word_box.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: backgroundDecorotion,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wordCard(size, "Elma", "Turkish"),
                  SizedBox(height: 20),
                  wordCard(size, "Apple", "English"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget wordCard(Size size, String word, String language) {
    return FlipCard(
      front: WordBox(
        size: size,
        text: language,
      ),
      back: WordBox(
        size: size,
        text: word,
      ),
    );
  }
}
