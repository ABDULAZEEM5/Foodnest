import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/address/viwe.dart';
import 'package:foodnest/data/model/address.dart';
import 'package:get/get.dart';

class Viweaddressconterller extends GetxController {
  Viwedeleadderssdata viwedeleadderssdata = Viwedeleadderssdata(Get.find());
  late StatusRequset statusRequset;
  Myserives myserives = Get.find();
  List<Addressmodel> data = [];


  getdata() async {
    data.clear();
    statusRequset = StatusRequset.laoding;
    var respons = await viwedeleadderssdata
        .getdata({"addressuserid": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List dataviwe = respons["data"];
        data.addAll(dataviwe.map((e) => Addressmodel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  deletedata(String addressid) async {
    statusRequset = StatusRequset.laoding;
    var respon = await viwedeleadderssdata.deletedata({"addressid": addressid});
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        Get.snackbar("success", "address had deleted");
        getdata();
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }


  gotoadd() {
    Get.toNamed(Approutes.addaddress);
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
