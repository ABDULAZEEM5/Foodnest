import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Ratingorder {
  Crud crud;
  Ratingorder(this.crud);
  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.rating, data);
    return respons.fold((l) => l, (r) => r);
   
  }
}
