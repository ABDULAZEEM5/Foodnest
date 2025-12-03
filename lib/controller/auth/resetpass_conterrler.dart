import 'package:flutter/material.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/auth/resetpass.dart';
import 'package:get/get.dart';

class Resetpassconteroller extends GetxController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController newpassword;
  late TextEditingController renewpassword;
  late String email;
  StatusRequset statusRequset = StatusRequset.none;
  Resetpassworddata resetpassworddata = Resetpassworddata(Get.find());

  getdata() async {
    if (formState.currentState!.validate()) {
      if (newpassword.text != renewpassword.text) {
        Get.defaultDialog(
            backgroundColor: Colors.red,
            title: "worring",
            content: const Text("the password no match"));
      } else {
        statusRequset = StatusRequset.laoding;
        var respons = await resetpassworddata
            .passworddata({"email": email, "password": newpassword.text});
        statusRequset = handledata(respons);
        if (statusRequset == StatusRequset.success) {
          if (respons["status"] == "success") {
            Get.toNamed(Approutes.successpage);
          } else {
            statusRequset = StatusRequset.failure;
            Get.defaultDialog(
                backgroundColor: Colors.red,
                title: "worring",
                content: const Text("the Error"));
          }
        }
      }
    }
    update();
  }

  bool t = true;
  changeviwepass() {
    if (t == true) {
      t = false;
    } else {
      t = true;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    newpassword = TextEditingController();
    renewpassword = TextEditingController();
    super.onInit();
  }
}
