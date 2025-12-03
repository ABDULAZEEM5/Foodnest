import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class TiteleOrder extends StatelessWidget {
    final String text1;
   final String text2;
  const TiteleOrder({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Row(
                        children: [
                          Text(text1,
                              style: Theme.of(context).textTheme.labelSmall),
                          Text(
                            text2,
                            style: TextStyle(color: Appcolors.primarycolor,fontSize: 22,fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
  }
}