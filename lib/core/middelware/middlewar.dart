import 'package:flutter/widgets.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  Myserives myserives = Get.find();
  @override
  int? priority ;

  @override
  RouteSettings? redirect(String? route) {
     if (myserives.sharedPre.getString("step") =="2") {
      return RouteSettings(name: Approutes.homescreen);
    }
     if (myserives.sharedPre.getString("step") =="1") {
      return RouteSettings(name: Approutes.login);
    }
    if (myserives.sharedPre.getString("lang") != null) {
      return RouteSettings(name: Approutes.onbording);
    } 
    return null;
  }
}
