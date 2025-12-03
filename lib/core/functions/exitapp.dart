import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

exitapp() {
  
    Get.defaultDialog(
        title: "warring",
        middleText: "you want Exit the app",
        onConfirm: () {
          exit(0);
        },
        onCancel: () {
          Get.back();
        },
        textConfirm: "yes",
        textCancel: "No");
  
}
