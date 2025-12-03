import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/test.dart';
import 'package:get/get.dart';

class Testconterller extends GetxController {
  Testdata testdata = Testdata(Get.find());
  List data = [];
  StatusRequset? statusRequset;

  getdata() async {
 
    statusRequset = StatusRequset.laoding;
await Future.delayed(Duration(seconds: 5));
    var respons = await testdata.getdata();
    print("///////////////////////////////");
    print(respons);
    print("///////////////////////////////");
    statusRequset = handledata(respons);
    if (StatusRequset.success == statusRequset) {
      if (respons['status'] == "success") {
        data.addAll(respons["data"]);
      } else {
        statusRequset = StatusRequset.failure;
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
