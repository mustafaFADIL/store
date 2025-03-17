
import 'dart:ui';
import 'package:flutter/material.dart';


class AppColors { // تم تغيير اسم الفئة إلى AppColors
  static Color colorPrimary = Colors.black;
  static Color colorBlack = Colors.black;
  static Color colorGrey = Colors.grey;
  static Color colorWhite= Colors.white;
  static Color colorSnowy = HexColor("f7f9f8");
  static Color colorSnowy2 = HexColor("E1E6EC");














  ///-----start another


  static String logoInternet= "assest/images/logoInternet.png";

  ///----lang

  static String logoAr= "assest/images/ar.png";
  static String logoKu= "assest/images/ku.png";
  static String logoEn= "assest/images/en.png";
  ///----- end lang



 ///-----end another



  ///---------------------------------//// ///color auth start


  ///start basic auth
  static Color colorTopPostion= Colors.amberAccent;
  static Color colorDownPostion= Colors.amberAccent.shade700;
  static String logo= "assest/images/logoamber.png";
  static double logo_W= 200;
  static double logo_H= 200;
  static double logo_SizeBox= 0;
  static double logo_SizeBox_login_siginin= 0;
  ///end basic




// ///---home user start
//   static Color colorTopUser= Colors.green.shade600;
//   static Color colorTopTextUser= Colors.white;
//   static Color colorNavUser= Colors.green.shade600;
//   static Color colorNavUserText= Colors.black;
// ///---home user end


///---home user start
  static Color colorTopUser= Colors.amberAccent ;
  static Color colorTopTextUser= Colors.black;
  static Color colorNavUser= Colors.amberAccent.shade400;
  static Color colorNavUserText= Colors.black;

///---home user end





}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}