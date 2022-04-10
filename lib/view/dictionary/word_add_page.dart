import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wordy/core/base/word_modal.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';

class WordAddPage extends StatefulWidget {
  WordAddPage({Key? key}) : super(key: key);

  @override
  State<WordAddPage> createState() => _WordAddPageState();
}

class _WordAddPageState extends State<WordAddPage> {
  TextEditingController engWordController = TextEditingController();
  TextEditingController trWordController = TextEditingController();
  TextEditingController sentenceoneController = TextEditingController();
  TextEditingController sentencetwoController = TextEditingController();

  Future addWord({required Word word}) async {
    final docWord = FirebaseFirestore.instance.collection("words").doc();
    word.id = docWord.id;
    final json = word.toJson();

    await docWord.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                  controller: trWordController,
                  style: textStyle(),
                  decoration: inputDecoration("Turkish"),
                ),
                Column(
                  children: [
                    TextFormField(
                      maxLength: 45,
                      controller: sentenceoneController,
                      style: textStyle(),
                      decoration: inputDecoration("1.sentence"),
                    ),
                    TextFormField(
                      maxLength: 45,
                      controller: sentencetwoController,
                      style: textStyle(),
                      decoration: inputDecoration("2.sentence"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    final word = Word(
                      sentenceone: sentenceoneController.text,
                      sentencetwo: sentencetwoController.text,
                      englishWord: engWordController.text,
                      turkishWord: trWordController.text,
                    );
                    sentenceoneController.text = "";
                    sentencetwoController.text = "";
                    engWordController.text = "";
                    trWordController.text = "";
                    addWord(word: word);
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Add"),
                  ),
                )
              ],
            ),
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
