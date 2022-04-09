import 'package:flutter/material.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';

class WordAddPage extends StatefulWidget {
  WordAddPage({Key? key}) : super(key: key);

  @override
  State<WordAddPage> createState() => _WordAddPageState();
}

class _WordAddPageState extends State<WordAddPage> {
  TextEditingController engWordController = TextEditingController();
  TextEditingController trWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundDecorotion,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                maxLength: 30,
                controller: engWordController,
                style: textStyle(),
                decoration: inputDecoration("English"),
              ),
              TextFormField(
                maxLength: 30,
                controller: engWordController,
                style: textStyle(),
                decoration: inputDecoration("Turkish"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Add"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 25,
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      border: OutlineInputBorder(),
    );
  }
}
