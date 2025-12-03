import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Checkout {
  Crud crud;
  Checkout(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.checkoutorder, data);
    return respons.fold((l) => l, (r) => r);
   
  }
}
