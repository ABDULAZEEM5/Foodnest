import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {
  Myserives myserives = Get.find();

  String? username;
  String? email;

  signout() {
    String id = myserives.sharedPre.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
    myserives.sharedPre.clear();
    Get.offAllNamed(Approutes.login);
  }

  @override
  void onInit() {
    username = myserives.sharedPre.getString("username");
    email = myserives.sharedPre.getString("email");
    super.onInit();
  }
}
