import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Deliverytype extends StatelessWidget {
  final String text;
  final String image;
  final bool isactive;
  const Deliverytype(
      {super.key,
      required this.text,
      required this.isactive,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            decoration: BoxDecoration(
                color: isactive == true ? Appcolors.scondecolor : null,
                borderRadius: BorderRadius.circular(12)),
            width: 150,
            height: 150,
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 100,
                  color: isactive == true ? Appcolors.white : Appcolors.black,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 19,
                  fontWeight: FontWeight.bold,
                      color:
                          isactive == true ? Appcolors.white : Appcolors.black),
                )
              ],
            )));
  }
}
