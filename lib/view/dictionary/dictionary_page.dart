import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wordy/core/base/word_modal.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';
import 'package:wordy/view/dictionary/word_add_page.dart';
import 'package:wordy/view/widgets/word_card.dart';

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
                        WordCard(
                            size: size,
                            word: word.turkishWord,
                            language: "Turkish"),
                        WordCard(
                            size: size,
                            word: word.englishWord,
                            language: "English"),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WordAddPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: Text("Add"),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Something went wrong! ${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
