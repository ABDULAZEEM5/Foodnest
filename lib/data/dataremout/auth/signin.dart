import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Signindata {
  Crud crud;
  Signindata(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.signin, data);
    return respons.fold((l) => l, (r) => r);
  }
}
