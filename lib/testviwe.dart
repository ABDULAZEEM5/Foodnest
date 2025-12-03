import 'package:flutter/material.dart';
import 'package:foodnest/controller/test.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:get/get.dart';

class Testviwe extends StatelessWidget {
  const Testviwe({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testconterller());
    return Scaffold(
        appBar: AppBar(backgroundColor: Appcolors.scondecolor),
        body: GetBuilder<Testconterller>(
            builder: (conterler) => Container(
                    child: HandledataRequset(
                  statusRequset: conterler.statusRequset!,
                  widget: Text("${conterler.data}"),
                ))));
  }
}
