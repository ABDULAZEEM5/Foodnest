import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Notificationdata {
  Crud crud;
  Notificationdata(this.crud);
 getnotify(Map data)async{
var respons = await crud.postdata(Applinkurl.notification, data);
return respons.fold((l) => l, (r) => r);
 }
}