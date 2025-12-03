import 'package:flutter/material.dart';

class Logoimage extends StatelessWidget {
  final String image;
  const Logoimage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30, right: 35),
        child: Image.asset(
          height: 240,
          image,
        ));
  }
}
