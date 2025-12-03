import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Discripitonbody extends StatelessWidget {
  final String text;
  const Discripitonbody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Appcolors.grey, fontSize: 15),
      ),
    );
  }
}
