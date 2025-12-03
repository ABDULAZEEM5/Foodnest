import 'package:flutter/widgets.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/auth/signup.dart';
import 'package:get/get.dart';

class Signupconteroller extends GetxController {
  StatusRequset statusRequset = StatusRequset.none;
  Signupdata signupdata = Signupdata(Get.find());

  GlobalKey<FormState> formState = GlobalKey();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;

  getdata() async {
    if (formState.currentState!.validate()) {
      statusRequset = StatusRequset.laoding;
      Map data = {
        "username": username.text,
        "phone": phone.text,
        "email": email.text,
        "password": password.text,
      };
      var respons = await signupdata.getsigndata(data);
      statusRequset = handledata(respons);

      if (statusRequset == StatusRequset.success) {
        if (respons["status"] == "success") {
          Get.defaultDialog(
              title: "succes", content: Text("account has curreted"));
          Get.offNamed(Approutes.login);
        } else {
          Get.defaultDialog(
              title: "woring", content: Text("email or phone as alrady exist"));
          statusRequset = StatusRequset.failure;
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

  gettologin() {
    Get.offNamed(Approutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
}
