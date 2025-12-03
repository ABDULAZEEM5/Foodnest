import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class DetailsData {
  Crud crud;
  DetailsData(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.orderdetails, data);
    return respons.fold((l) => l, (r) => r);
   
  }
}
