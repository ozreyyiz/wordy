import 'package:flutter/material.dart';

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
    return Container(
      height: size.height / 3,
      width: size.width,
      color: Colors.black,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
