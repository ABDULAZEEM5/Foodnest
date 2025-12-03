import 'package:foodnest/core/classes/crud.dart';
import 'package:foodnest/linkurl.dart';

class  Coupondata {
  Crud crud;
  Coupondata(this.crud);
  getdata(Map data) async{
    var respon=await crud.postdata(Applinkurl.coupon, data);
    return respon.fold((l) => l, (r) => r);
  }
  
}