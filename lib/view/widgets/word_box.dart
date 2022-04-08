import 'package:flutter/material.dart';
import '../../core/constants/word_text_style.dart';

class WordBox extends StatelessWidget {
  const WordBox({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
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
              ),
              Text("",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
