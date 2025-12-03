import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Editdadderssdata {
  Crud crud;
  Editdadderssdata(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.editadderss, data);
    return respons.fold((l) => l, (r) => r);
  }
}