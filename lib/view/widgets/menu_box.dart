import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBox extends StatelessWidget {
  const MenuBox({
    Key? key,
    required this.size, this.header="", this.smallHeader="",  this.function= a,
  }) : super(key: key);

  final Size size;
  final String header;
  final String smallHeader;
  final Function function;
  

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap:()=>function(),
        child: Container(
          height: size.height / 5,
          width: size.width,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 6, 56, 97),
              Color.fromARGB(255, 6, 56, 97),
            ]),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                header,
                style: GoogleFonts.indieFlower(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                smallHeader,
                style: GoogleFonts.indieFlower(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

a() {
}






