import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Addfavorites {
Crud crud;
Addfavorites(this.crud);

adddata(Map data)async{
  var respons = await crud.postdata(Applinkurl.addfavorites, data);
  return respons.fold((l) => l, (r) => r);
}
  
}