import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class ItemspriceAdd extends StatelessWidget {
  final void Function() delete;
  final void Function() add;
  final String text;
  final String textcard;
  const ItemspriceAdd(
      {super.key,
      required this.add,
      required this.delete,
      required this.text,
      required this.textcard});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: TextStyle(
                height: 0.2,
                fontWeight: FontWeight.bold,
                color: Appcolors.primarycolor,
                fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 17),
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Appcolors.grey),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  color: Appcolors.white,
                  onPressed: add,
                  icon: const Icon(Icons.add)),
              Text(
                textcard,
                style: TextStyle(fontSize: 20),
              ),
              Container(margin: EdgeInsets.only(bottom: 10,top: 9),
                child: IconButton(
                 padding:EdgeInsets.symmetric(horizontal: 5) ,
                  alignment: Alignment.center,
                    color: Appcolors.white,
                    onPressed: delete,
                    icon: const Icon(Icons.remove)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
