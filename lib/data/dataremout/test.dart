import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Testdata {
  Crud crud;

  Testdata(this.crud);
  getdata() async {
    var respons = await crud.postdata(Applinkurl.test, {});
    return respons.fold((l) => l, (r) => r);
  }
}
