import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class AddDeletecart {
  Crud crud;
  AddDeletecart(this.crud);
  adddata(Map data) async {
    var respon = await crud.postdata(Applinkurl.cartadd, data);
    return respon.fold((l) => l, (r) => r);
  }

   deletedata(Map data) async {
    var respon = await crud.postdata(Applinkurl.cartdelete, data);
    return respon.fold((l) => l, (r) => r);
  }
}
