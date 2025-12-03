import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class CoustomloginButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CoustomloginButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        width: 330,
        decoration: BoxDecoration(
            color: Appcolors.scondecolor,
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Appcolors.white),
            )));
  }
}
