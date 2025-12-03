import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class LonguageBottum extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const LonguageBottum(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 20),
      width: 220,
      height: 50,
      decoration: BoxDecoration(
          color: Appcolors.primarycolor,
          borderRadius: BorderRadius.circular(20)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.titleMedium)),
    );
  }
}
