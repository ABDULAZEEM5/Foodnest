import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class TextformfildeCustome extends StatelessWidget {
  final void Function() onsearch;
  final void Function(String) onChanged;
  final TextEditingController mycontroller;
  const TextformfildeCustome({
    super.key,
    required this.onsearch,
    required this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Appcolors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: "Search food ",
                hintStyle: const TextStyle(
                  fontSize: 20,
                  height: 0.8,
                ),
                prefixIcon: IconButton(
                    onPressed: onsearch,
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                    )),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)))));
  }
}
