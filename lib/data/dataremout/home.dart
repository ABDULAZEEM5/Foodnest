import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Homedata {
  Crud crud;
  Homedata(this.crud);
  getdata() async {
    var respons = await crud.postdata(Applinkurl.home, {});
    return respons.fold((l) => l, (r) => r);
  }
}
