import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  getdata(Map data) async {
    var respon = await crud.postdata(Applinkurl.search, data);
    return respon.fold((l) => l, (r) => r);
  }
}
