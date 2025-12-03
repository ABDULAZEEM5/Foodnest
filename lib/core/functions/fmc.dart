import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:foodnest/controller/order/peding_conterller.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

getmassagefcm() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().playNotification();
    print("///////////////////////////////////////////////////");
    print(message.notification!.body);
    print(message.notification!.title);
    
    print(message.data["pagename"]);
    
    print("///////////////////////////////////////////////////");
    Get.snackbar(
        "${message.notification!.title}", "${message.notification!.body}");
        getdatamessage(message.data);
  });
}


getdatamessage(Map data){
  if (Get.currentRoute=="/pedingorder" && data["pagename"]=="refreshorderpage") {
    Pedingconterller controller=Get.find();
    controller.refreshorderpage();
  }
}