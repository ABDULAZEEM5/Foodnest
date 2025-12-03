import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Paymenttype extends StatelessWidget {
  final String text;
  final bool isactive;
  const Paymenttype({super.key, required this.text, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 350,
        padding: const EdgeInsets.only(left: 50),
        decoration: BoxDecoration(
            color: isactive == true ? Appcolors.scondecolor : null,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              color: isactive == true ? Appcolors.white : null,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
