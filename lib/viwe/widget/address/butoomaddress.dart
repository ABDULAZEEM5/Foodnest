import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';


class Bouttomaddress extends StatelessWidget {
final  void Function() onPressed;
final  String text;
  const Bouttomaddress({super.key,required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 60),
        width: 280,
        decoration: BoxDecoration(
            color: Appcolors.scondecolor,
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed:onPressed ,
            child: Text(
              text,
              style: TextStyle(color: Appcolors.white),
            )));
  }
}
