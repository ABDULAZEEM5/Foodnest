import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Coustmtext extends StatelessWidget {
  final String textboutton;
  final String text;
  final void Function() onTap;
  const Coustmtext(
      {super.key,
      required this.textboutton,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.centerLeft,
          child: Text(text, style: Theme.of(context).textTheme.labelLarge),
        ),
        InkWell(
          onTap:onTap,
          child: SizedBox(
              height: 40,
              child: Text(
                textboutton,
                style: TextStyle(color: Appcolors.scondecolor),
              )),
        )
      ],
    );
  }
}
