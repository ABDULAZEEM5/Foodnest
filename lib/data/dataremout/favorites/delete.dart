import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Deletefavorites {
Crud crud;
Deletefavorites(this.crud);

deletedata(Map data)async{
  var respons = await crud.postdata(Applinkurl.deletefavorites, data);
  return respons.fold((l) => l, (r) => r);
}
  
}