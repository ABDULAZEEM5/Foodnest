import 'package:foodnest/core/classes/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
  Get.put(Crud());
  }
  
}