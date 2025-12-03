import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Viwecartdata {
  Crud crud;
  Viwecartdata(this.crud);

  viwedata(Map data) async {
    var respon = await crud.postdata(Applinkurl.cartviwe, data);
    return respon.fold((l) => l, (r) => r);
  }
}
