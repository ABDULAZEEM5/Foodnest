import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/notification.dart';
import 'package:foodnest/data/model/notifcation.dart';
import 'package:get/get.dart';

class Notifictionconterller extends GetxController {
  Myserives myserives = Get.find();
  Notificationdata notifdat = Notificationdata(Get.find());
  late StatusRequset statusRequset;
  List<NotificationModel> data = [];

  getdata() async {
    statusRequset = StatusRequset.laoding;
    var respons = await notifdat
        .getnotify({"userid": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respons);
    if (statusRequset==StatusRequset.success) {
      if (respons["status"]=="success") {
        List datanti=respons["data"];
        data.addAll(datanti.map((e) => NotificationModel.fromJson(e)));
      }else{
        statusRequset=StatusRequset.failure;
      }
      
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
