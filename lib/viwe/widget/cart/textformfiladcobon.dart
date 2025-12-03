import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class TextfildeCustomecoupon extends StatelessWidget {
  final TextEditingController mycontroller;
  const TextfildeCustomecoupon({
    super.key,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            // color: Appcolors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
            controller: mycontroller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Appcolors.scondecolor)),
                hintText: "coupon ",
                hintStyle: const TextStyle(
                  fontSize: 20,
                  height: 1,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.scondecolor),
                    borderRadius: BorderRadius.circular(10)))));
  }
}
