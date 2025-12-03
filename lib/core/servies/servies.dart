import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myserives extends GetxService {
  late SharedPreferences sharedPre;

  Future<Myserives> intinl() async {
   await Firebase.initializeApp();
   FirebaseMessaging.instance.requestPermission();
    sharedPre = await SharedPreferences.getInstance();
    getpremissionlocation();
    return this;
  }
  

  getpremissionlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("worring", "open Location services pleas ");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("worring", "pleas give perission to contoune ");
      }
    }

    if (permission == LocationPermission.deniedForever) {
     return Get.snackbar("worring", "con`t contoune without give perission ");

  
  }
  }}

intinMyservice() async {
  await Get.putAsync(() => Myserives().intinl());
}
