import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wordy/core/base/word_modal.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';
import 'package:wordy/view/dictionary/dictionary_page.dart';

class EditDataPage extends StatefulWidget {
  EditDataPage({Key? key, required this.word}) : super(key: key);
  final Word word;

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  TextEditingController engWordController = TextEditingController();
  TextEditingController trWordController = TextEditingController();
  TextEditingController sentenceoneController = TextEditingController();
  TextEditingController sentencetwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sentenceoneController.text = widget.word.sentenceone;
    sentencetwoController.text = widget.word.sentencetwo;
    engWordController.text = widget.word.englishWord;
    trWordController.text = widget.word.turkishWord;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Word Edit Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: backgroundDecorotion,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  maxLength: 30,
                  controller: trWordController,
                  style: textStyle(),
                  decoration: inputDecoration("Turkish"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLength: 30,
                  controller: engWordController,
                  style: textStyle(),
                  decoration: inputDecoration("English"),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final docWord = FirebaseFirestore.instance
                            .collection("words")
                            .doc(widget.word.id);
                        docWord.update({
                          "turkish_word": "${trWordController.text}",
                          "english_word": "${engWordController.text}",
                          "sentenceone": "${sentenceoneController.text}",
                          "sentencetwo": "${sentencetwoController.text}",
                        });
                        sentenceoneController.text = "";
                        sentencetwoController.text = "";
                        engWordController.text = "";
                        trWordController.text = "";

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DictionaryPage()),
                            (route) => false);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text("Update"),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        final docWord = FirebaseFirestore.instance
                            .collection("words")
                            .doc(widget.word.id);
                        docWord.delete();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DictionaryPage()),
                            (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Delete"),
                      ),
                    ),
                  ],
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
