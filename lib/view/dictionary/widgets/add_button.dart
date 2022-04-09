import 'package:flutter/material.dart';

import '../word_add_page.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
      fillColor: Colors.blue,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WordAddPage()));
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}