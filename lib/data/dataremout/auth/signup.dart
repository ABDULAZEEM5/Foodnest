import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class Signupdata {
Crud crud;
 Signupdata(this.crud) ;
 getsigndata(Map data) async {
  var respons=await crud.postdata(Applinkurl.signup, data);
  return respons.fold((l) => l, (r) => r);
 }

  
}