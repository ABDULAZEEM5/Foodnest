import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.offers, data);
    return respons.fold((l) => l, (r) => r);
   
  }
}
