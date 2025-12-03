import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Addressdeivery extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isactive;
  const Addressdeivery(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          decoration: BoxDecoration(color:isactive==true? Appcolors.scondecolor:null,borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: isactive == true ? Appcolors.white : Appcolors.black,
            )),
        subtitle: Text(subtitle, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isactive == true ? Appcolors.white : Appcolors.black1,)),
      ),
    ));
  }
}
