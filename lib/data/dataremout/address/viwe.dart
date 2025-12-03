import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Viwedeleadderssdata {
  Crud crud;
  Viwedeleadderssdata(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.viweadderss, data);
    return respons.fold((l) => l, (r) => r);
  }

   deletedata(Map data) async {
    var respons = await crud.postdata(Applinkurl.deleteadderss, data);
    return respons.fold((l) => l, (r) => r);
  }
}

