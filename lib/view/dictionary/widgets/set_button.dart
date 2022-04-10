import 'package:flutter/material.dart';
import 'package:wordy/core/base/word_modal.dart';
import 'package:wordy/view/dictionary/edit_data_page.dart';

class SetButton extends StatelessWidget {
  const SetButton({
    Key? key, required this.word,
  }) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
      fillColor: Colors.blue,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditDataPage(word: word)));
      },
      child: Icon(
        Icons.mode_edit,
        color: Colors.white,
      ),
    );
  }
}
