import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Datafavorites {
  Crud crud;
  Datafavorites(this.crud);

  getdata(Map data) async {
    var respons = await crud.postdata(Applinkurl.viwefavorites, data);
    return respons.fold((l) => l, (r) => r);
  }

  remove(Map data) async {
    var respons = await crud.postdata(Applinkurl.removefavorites, data);
    return respons.fold((l) => l, (r) => r);
  }
}
