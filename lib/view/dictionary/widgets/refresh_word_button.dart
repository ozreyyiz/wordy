import 'package:flutter/material.dart';
import 'package:wordy/view/dictionary/dictionary_page.dart';

class RefreshWordButton extends StatefulWidget {
  const RefreshWordButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RefreshWordButton> createState() => _RefreshWordButtonState();
}

class _RefreshWordButtonState extends State<RefreshWordButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DictionaryPage()),
            (route) => false);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Icon(Icons.cached),
      ),
    );
  }
}
