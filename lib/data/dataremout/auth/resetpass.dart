import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Resetpassworddata {
  Crud crud;
  Resetpassworddata(this.crud);
  passworddata(Map data) async {
    var respons = await crud.postdata(Applinkurl.resetpass, data);
    return respons.fold((l) => l, (r) => r);
  }
}
