import 'package:flutter/material.dart';
import 'package:foodnest/binding.dart';
import 'package:foodnest/core/locallzation/locallanguage.dart';
import 'package:foodnest/core/locallzation/translations.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intinMyservice();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Locallanguage locallanguage = Get.put(Locallanguage());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      translations: MyTranslations(),
      getPages: routes,
      theme: locallanguage.mytheme,
      // themeMode:ThemeMode.light , // locallanguage.mytheme,//locallanguage.mytheme
      locale: locallanguage.mylangauge,
    );
  }
}
