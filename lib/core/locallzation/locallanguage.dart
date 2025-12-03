import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appthemes.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:get/get.dart';

class Locallanguage extends GetxController {
  Myserives myserives = Get.find();
  ThemeData mytheme = myEnaglishtheme;
  Locale? mylangauge;

  ThemeData themeData = ThemeData.dark();

  chnagelanguage(String codelang) {
    Locale locale = Locale(codelang);
    myserives.sharedPre.setString("lang", codelang);
    mytheme = codelang == "en" ? myEnaglishtheme : arabictheme;
    Get.changeTheme(mytheme);
    Get.updateLocale(locale);
  }

  savetypelangauge() {
    var choselang = myserives.sharedPre.get("lang");
    if (choselang == "ar") {
      mylangauge = const Locale("ar");
      mytheme = arabictheme;
    } else if (choselang == "en") {
      mylangauge = const Locale("en");
      mytheme = myEnaglishtheme;
    } else {
      mylangauge = Locale(Get.deviceLocale!.languageCode);
    }
  }

  getthemebuttom() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
      myserives.sharedPre.setString("light", "1");
    } else {
      Get.changeTheme(ThemeData.dark());
      myserives.sharedPre.clear();
    }
  }

  @override
  void onInit() {
    savetypelangauge();
    var themedl = myserives.sharedPre.getString("light");
    if (themedl == "1") {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
    super.onInit();
  }
}
