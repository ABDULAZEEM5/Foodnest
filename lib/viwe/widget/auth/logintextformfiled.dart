import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Coustemlogintextformfiled extends StatelessWidget {
  final bool? obscureText;
  final String? Function(String?) validate;
  final void Function()? onTap;
  final IconData icon;
  final String hintText;
  final String lable;
  final bool isnumber;
  final TextEditingController? mycontoller;
  const Coustemlogintextformfiled(
      {super.key,
      this.obscureText,
      this.onTap,
      required this.icon,
      required this.hintText,
      this.mycontoller,
      required this.lable,
      required this.validate, required this.isnumber});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextFormField(
            validator: validate,
            controller: mycontoller,
            obscureText:
                obscureText == null || obscureText == false ? false : true,
                keyboardType:isnumber == true?TextInputType.number:TextInputType.text,
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 20, color: Appcolors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Appcolors.primarycolor)),
                suffixIcon: InkWell(onTap: onTap, child: Icon((icon))),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                label: Text(lable, style: TextStyle(color: Colors.black)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)))));
  }
}
