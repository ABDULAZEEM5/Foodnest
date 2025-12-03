
import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Addadderssdata {
  Crud crud;
  Addadderssdata(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.addadderss, data);
    return respons.fold((l) => l, (r) => r);
  }
}
