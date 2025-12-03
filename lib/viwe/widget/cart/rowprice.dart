import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Rowprices extends StatelessWidget {
  final String text;
  final String textprice;
  const Rowprices({super.key, required this.text, required this.textprice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          textprice,
          style: TextStyle(
              color: Appcolors.primarycolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
