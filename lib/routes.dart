import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/middelware/middlewar.dart';
import 'package:foodnest/viwe/screen/address/add.dart';
import 'package:foodnest/viwe/screen/address/adddetails.dart';
import 'package:foodnest/viwe/screen/address/edit.dart';
import 'package:foodnest/viwe/screen/address/viwe.dart';
import 'package:foodnest/viwe/screen/auth/login.dart';
import 'package:foodnest/viwe/screen/auth/resetpassword.dart';
import 'package:foodnest/viwe/screen/auth/signup.dart';
import 'package:foodnest/viwe/screen/auth/successresetpass.dart';
import 'package:foodnest/viwe/screen/auth/verfierdemail.dart';
import 'package:foodnest/viwe/screen/card/card.dart';
import 'package:foodnest/viwe/screen/notification.dart';
import 'package:foodnest/viwe/screen/orders/archive.dart';
import 'package:foodnest/viwe/screen/orders/checkout.dart';
import 'package:foodnest/viwe/screen/homescreen.dart';
import 'package:foodnest/viwe/screen/items/items.dart';
import 'package:foodnest/viwe/screen/items/itemsdetails.dart';
import 'package:foodnest/viwe/screen/language/language.dart';
import 'package:foodnest/viwe/screen/onbording.dart';
import 'package:foodnest/viwe/screen/orders/details.dart';
import 'package:foodnest/viwe/screen/orders/peding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page:()=>const Checkout()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [Mymiddleware()]),
  GetPage(name: Approutes.onbording, page: () => const Onbording()),
  GetPage(name: Approutes.login, page: () => const Login()),
  GetPage(name: Approutes.signup, page: () => const Signup()),
  GetPage(name: Approutes.resetpass, page: () => const Resetpassword()),
  GetPage(name: Approutes.verfierdemail, page: () => const Verfierdemail()),
  GetPage(name: Approutes.successpage, page: () => const Successpage()),
  GetPage(name: Approutes.homescreen, page: () => const Homescreen()),
  GetPage(name: Approutes.itemspage, page: () => const Items()),
  GetPage(name: Approutes.itemsdetails, page: () => const Itemsdetails()),
  GetPage(name: Approutes.addaddress, page: () => const Addaddress()),
  GetPage(name: Approutes.viweaddress, page: () => const Viweaddress()),
  GetPage(name: Approutes.editaddress, page: () => const Editaddress()),
  GetPage(name: Approutes.adddetialsaddress, page: () => const Adddetialsddress()),
  GetPage(name: Approutes.mycart, page: () => const MyCard()),
  GetPage(name: Approutes.checkout, page: () => const Checkout()),
  GetPage(name: Approutes.peding, page: () => const Pedingorder()),
  GetPage(name: Approutes.notification, page: () => const Notification()),
  GetPage(name: Approutes.orderdetails, page: () => const Orderdetails()),
  GetPage(name: Approutes.archive, page: () => const Archiveorder()),
];
