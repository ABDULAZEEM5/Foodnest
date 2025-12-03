import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class PedingData {
  Crud crud;
  PedingData(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.peding, data);
    return respons.fold((l) => l, (r) => r);
  }

  deletedata(Map data) async {
    var respons = await crud.postdata(Applinkurl.orderdelete, data);
    return respons.fold((l) => l, (r) => r);
  }
}
