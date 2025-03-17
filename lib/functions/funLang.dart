

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/core/localization/changelocal.dart';
import 'package:store/functions/colors.dart';

class Funlang {


  LocaleController controllerlang=Get.find();
  void showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 0), // تحديد موقع القائمة
      items: [
        PopupMenuItem(
          child: ListTile(

            leading: Ink.image(
              image: AssetImage(AppColors.logoAr), // تحميل صورة من الأصول
              width: 30, // تحديد عرض الصورة
              height: 30, // تحديد ارتفاع الصورة
              fit: BoxFit.cover, // تحديد كيفية احتواء الصورة داخل المساحة
            ),
            title:   Text('30'.tr),
            onTap: () {
              controllerlang.changelang('ar');
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Ink.image(
              image: AssetImage(AppColors.logoEn), // تحميل صورة من الأصول
              width: 30, // تحديد عرض الصورة
              height: 30, // تحديد ارتفاع الصورة
              fit: BoxFit.cover, // تحديد كيفية احتواء الصورة داخل المساحة
            ),
            title:   Text('31'.tr),
            onTap: () {
              controllerlang.changelang('en');
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Ink.image(
              image: AssetImage(AppColors.logoKu), // تحميل صورة من الأصول
              width: 30, // تحديد عرض الصورة
              height: 30, // تحديد ارتفاع الصورة
              fit: BoxFit.cover, // تحديد كيفية احتواء الصورة داخل المساحة
            ),
            title:  Text('32'.tr),
            onTap: () {
              controllerlang.changelang('ku');
              Navigator.pop(context);

            },
          ),
        ),
      ],
    );
  }


}