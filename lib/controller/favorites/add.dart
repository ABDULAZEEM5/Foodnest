import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/favorites/add.dart';
import 'package:foodnest/data/dataremout/favorites/delete.dart';
import 'package:get/get.dart';

class AddDeletefaveconterller extends GetxController {
  Addfavorites addfavorites = Addfavorites(Get.find());
  Deletefavorites deletefavorites = Deletefavorites(Get.find());

 
  late StatusRequset statusRequset;
  Myserives myserives = Get.find();

  adddata(String itemsid) async {
    statusRequset = StatusRequset.laoding;
    var respons = await addfavorites.adddata(
        {"userid": myserives.sharedPre.getString("id"), "itemsid": itemsid});
    statusRequset = handledata(respons);
     print("kiom//////////////////////////////////////$respons//////////////////");
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        Get.snackbar("success", "items is added to favorites");
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  deletedata(String itemsid) async {
    statusRequset = StatusRequset.laoding;
    var respons = await deletefavorites.deletedata(
        {"userid": myserives.sharedPre.getString("id"), "itemsid": itemsid});
    statusRequset = handledata(respons);
     print("kiom//////////////////////////////////////$respons//////////////////");
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        Get.snackbar("success", "items is delete to favorites");
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
