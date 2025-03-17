import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/core/localization/changelocal.dart';
import 'package:store/core/localization/translation.dart';
import 'package:store/core/services/services.dart';
import 'package:store/view/other/ErrorInternet.dart';
import 'package:store/view/screen/auth/SignupScreen.dart';
import 'package:store/view/screen/user/Homeuser/HomeUser.dart';



SharedPreferences? sharedPreferences;

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  // await initialServices();
  sharedPreferences =await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     LocaleController controller = Get.put(LocaleController());

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // تغيير لون شريط الحالة إلى لون الخلفية
        statusBarIconBrightness: Brightness.dark, // تغيير لون أيقونات شريط الحالة
      ),
    );
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale:controller.initailLnag,
       //home: ErrorInternet(),
        //home: SignupScreen(),
         home: HomeUser(),
    );
  }
}