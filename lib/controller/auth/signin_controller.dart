import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/auth/signin.dart';
import 'package:get/get.dart';

class Loginconteroller extends GetxController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  late TextEditingController password;

  Signindata signindata = Signindata(Get.find());
  StatusRequset statusRequset = StatusRequset.none;

  Myserives myserives = Get.find();

  getdata() async {
    if (formState.currentState!.validate()) {
      statusRequset = StatusRequset.laoding;
      var respons = await signindata
          .getdata({"email": email.text, "password": password.text});
      statusRequset = handledata(respons);
      if (statusRequset == StatusRequset.success) {
        if (respons["status"] == "success") {
          myserives.sharedPre.setString("step", "2");
          myserives.sharedPre.setString("id", "${respons['data']['user_id']}");
          myserives.sharedPre
              .setString("username", "${respons["data"]["user_name"]}");
          myserives.sharedPre
              .setString("useremail", "${respons["data"]["user_email"]}");
          String id = myserives.sharedPre.getString("id").toString();
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$id");
          Get.offAllNamed(Approutes.homescreen);
        } else {
          statusRequset = StatusRequset.failure;
          Get.defaultDialog(
              title: "Errorr",
              content: const Text("email or password is wrong"));
        }
      }
      update();
    }
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

  gotosignup() {
    Get.offNamed(Approutes.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
