import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wordy/core/base/word_modal.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';
import 'package:wordy/view/dictionary/widgets/add_button.dart';
import 'package:wordy/view/dictionary/word_add_page.dart';
import 'package:wordy/view/dictionary/widgets/word_box_eng.dart';
import 'package:wordy/view/dictionary/widgets/word_box_tr.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  Stream<List<Word>> readWord() {
    return FirebaseFirestore.instance.collection("words").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Word.fromJson(doc.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: readWord(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final words = snapshot.data!;
              final index = Random().nextInt(words.length);
              Word word = words[index];

              return Container(
                decoration: backgroundDecorotion,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WordBoxTr(
                          size: size,
                          text: word.turkishWord,
                        ),
                        WordBoxEng(
                          size: size,
                          text: "x",
                          sentenceone: word.sentenceone,
                          sentencetwo: word.sentencetwo,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AddButton(),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                child: Icon(Icons.cached),
                              ),
                            ),
                            SetButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Something went wrong! ${snapshot.error}");
            } else {
              return Container(
                decoration: backgroundDecorotion,
                child: Center(
                  child: const CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class SetButton extends StatelessWidget {
  const SetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
      fillColor: Colors.blue,
      onPressed: () {},
      child: Icon(
        Icons.mode_edit,
        color: Colors.white,
      ),
    );
  }
}


