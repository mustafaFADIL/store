
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
 import 'package:store/main.dart';

class LocaleController extends GetxController {



 Locale initailLnag =sharedPreferences!.getString("lang")

     ==null?Get.deviceLocale!

     :Locale(sharedPreferences!.getString("lang")!);


  void changelang(String codelang){


    Locale local =Locale(codelang);
     sharedPreferences!.setString("lang",codelang);
    Get.updateLocale(local);

  }




}