


import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/controller__other/controller_core/ControllerErrorInternet.dart';
import 'package:store/functions/CheckInternet.dart';
import 'package:store/functions/colors.dart';


class ErrorInternet extends StatelessWidget {

  ControllerErrorInternet controllererrorinternet=Get.put(ControllerErrorInternet());
//https://api.publicapis.org/entries

  ///-.................................الموظفين


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<ControllerErrorInternet>(

        // init:ControllerHomeUsers(),
          builder:

              (controller) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.colorSnowy,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(AppColors.logoInternet,width: 150,),

                  SizedBox(height: 30,),

                  Text("33".tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Text("34".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  Text("35".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                  SizedBox(height: 40,),

                  TextButton(

                    style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87), // تحديد لون الخلفية
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),

                  ),
                    onPressed: () async{
                      var checkinternet=await CheckInternet();

                      if(checkinternet){



                        Get.back();


                      }
                      else{

                      }
                    },
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Text(
                        '36'.tr,
                        style: TextStyle(color:AppColors.colorWhite),
                      ),
                    ),
                  ),


                ],
              ),


            );

          }










      ),
    );

  }




}
