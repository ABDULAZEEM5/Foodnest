import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/favorites/viwe.dart';
import 'package:foodnest/data/model/favorites.dart';
import 'package:get/get.dart';

class Viwfaveconterller extends GetxController {
  Datafavorites datafavorites = Datafavorites(Get.find());
  late StatusRequset statusRequset;
  Myserives myserives = Get.find();
  List<Favoritesmodele> data = [];

  getdata() async {
    data.clear();
    update();
    statusRequset = StatusRequset.laoding;
    update();
    var respons = await datafavorites
        .getdata({"id": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List dataf = respons["data"];
        data.addAll(dataf.map((e) => Favoritesmodele.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  removedata(String favoriteid) async {
    statusRequset = StatusRequset.laoding;
    var respons =
        await datafavorites.remove({"id":favoriteid});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        getdata();
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

removedata1( String favoriteid) {
      datafavorites.remove({"id":favoriteid});
    data.removeWhere((element) => element.favoritesId.toString() == favoriteid);
     update();
  }


  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
