import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/locallzation/locallanguage.dart';
import 'package:foodnest/viwe/widget/language/coustomlangboutton.dart';
import 'package:get/get.dart';

class Language extends GetView<Locallanguage> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              LonguageBottum(
                onPressed: () {
                  controller.chnagelanguage("ar");
                  Get.toNamed(Approutes.onbording);
                },
                text: 'عربي',
              ),
              LonguageBottum(
                onPressed: () {
                  controller.chnagelanguage("en");
                  Get.toNamed(Approutes.onbording);
                },
                text: 'English',
               ),
              // LonguageBottum(
              //   onPressed: () {
              //    controller.getthemebuttom();
              //   },
              //   text: 'theme',
              // )
            ],
          )),
    );
  }
}
