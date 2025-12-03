import 'package:flutter/widgets.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/auth/verfiyemail.dart';
import 'package:get/get.dart';

class Verfiyconteroller extends GetxController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  StatusRequset statusRequset =StatusRequset.none;
  Verfiyemaildata verfiyemaildata = Verfiyemaildata(Get.find());

  getdata() async {
    if (formState.currentState!.validate()) {
      statusRequset = StatusRequset.laoding;
      var respons = await verfiyemaildata.getemaildata({"email": email.text});
      statusRequset = handledata(respons);
      if (statusRequset == StatusRequset.success) {
        if (respons["status"] == "success") {
           Get.toNamed(Approutes.resetpass, arguments: {"email": email.text});
        } else {
          statusRequset = StatusRequset.failure;
          Get.defaultDialog(
              title: "Errorr",
              content: const Text("email wrong please write correct email"));
        }
      }
    }
    update();
  }


   
  

  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }
}
