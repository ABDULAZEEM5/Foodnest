import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Itemsdata  {
Crud crud;
  Itemsdata(this.crud);

  getitems(Map data)async{
    var respons = await crud.postdata(Applinkurl.items, data);
    return respons.fold((l) => l, (r) => r);
  }
  
}