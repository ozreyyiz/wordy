import 'package:flutter/material.dart';
import 'package:wordy/core/constants/boxDecorationConts.dart';
import 'package:wordy/view/dictionary/dictionary_page.dart';
import 'package:wordy/view/widgets/menu_box.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: backgroundDecorotion,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(width: 0),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              MenuBox(
                size: size,
                header: "English - Turkish",
                smallHeader: "Dictionary",
                function: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DictionaryPage()),
                    );
                  });
                },
              ),
              MenuBox(
                  size: size,
                  header: "Coming",
                  smallHeader: "Soon",
                  function: () {}),
              MenuBox(
                  size: size,
                  header: "Coming",
                  smallHeader: "Soon",
                  function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
