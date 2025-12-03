import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Verfiyemaildata {
  Crud crud;
  Verfiyemaildata(this.crud);
  getemaildata(Map data) async {
    var respons = await crud.postdata(Applinkurl.verfiyemail, data);
    return respons.fold((l) => l, (r) => r);
  }
}
