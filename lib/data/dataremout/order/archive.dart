import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Archivedata {
  Crud crud;
  Archivedata(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.orderarchive, data);
    return respons.fold((l) => l, (r) => r);
   
  }
}
