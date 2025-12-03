import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class TextformfiledAddress extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController? mycontroller;
  final String hinttext;
  const TextformfiledAddress(
      {super.key,  this.mycontroller, required this.hinttext, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator:validator ,
          controller: mycontroller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Appcolors.primarycolor)),
              contentPadding: EdgeInsets.all(10),
              hintText: hinttext,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
