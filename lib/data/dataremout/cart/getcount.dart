import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Getcountitem {
  Crud crud;
  Getcountitem(this.crud);

  getcountdata(Map data) async {
    var respon = await crud.postdata(Applinkurl.getcountitem, data);
    return respon.fold((l) => l, (r) => r);
  }
}
