import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wordy/view/widgets/word_box.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key? key,
    required this.size,
    required this.word,
    required this.language,
  }) : super(key: key);

  final Size size;
  final String word;
  final String language;

  @override
  Widget build(BuildContext context) {
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
