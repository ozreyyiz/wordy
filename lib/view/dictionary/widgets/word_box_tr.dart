import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/word_text_style.dart';

class WordBoxTr extends StatelessWidget {
  const WordBoxTr({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;

  final String text;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Material(
        color: Colors.black,
        elevation: 20,
        child: Container(
          height: size.height / 3.5,
          width: size.width - 20,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 5, 19, 30),
            Color.fromARGB(255, 0, 0, 0),
          ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Turkish",
                  style: wordTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      back: Material(
        color: Colors.black,
        elevation: 20,
        child: Container(
          height: size.height / 3.5,
          width: size.width - 20,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 5, 19, 30),
            Color.fromARGB(255, 0, 0, 0),
          ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: wordTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
