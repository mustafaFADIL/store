import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/localization/changelocal.dart';
import 'package:store/data/model/authModel/SigninModel.dart';
import 'package:store/functions/funLang.dart';
import 'package:store/view/screen/auth/EmailVerificationScreen.dart';
import 'package:store/view/screen/auth/PhoneVerificationScreen.dart';
import 'package:store/view/screen/user/Homeuser/HomeUser.dart';
 import 'package:validators/validators.dart';


class SigninController extends GetxController {
  final formKey_SignIn = GlobalKey<FormState>();
  final emailController_Signin = TextEditingController();
  final passwordController_Signin = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;
  int loginAttempts = 0;

  final _signinModel = SigninModel();




  Future<void> signIn() async {
    if (loginAttempts >= 5) {
      errorMessage.value = '27'.tr;
      return;
    }

    if (formKey_SignIn.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      String email = emailController_Signin.text;
      String password = passwordController_Signin.text;

      // التحقق من صحة البيانات في الكونترولر
      if (!isEmail(email)) {
        errorMessage.value = '23'.tr;
        isLoading.value = false;
        return;
      }
      if (password.isEmpty || password.length < 8) {
        errorMessage.value = '26'.tr;
        isLoading.value = false;
        return;
      }

      final response = await _signinModel.signIn(email, password);

      if (response['success'] == true) {
        loginAttempts = 0;
        if (response['verification'] == 1) {

          if (response['verification_phone'] == 0) {
            // errorMessage.value = "39".tr;

            Get.snackbar("phoneeeeeeeeeeee", response['phone']);
            Get.to(() => PhoneVerificationScreen(), arguments: {'phone': response['phone']});



          }


        else {
            successMessage.value = '40'.tr;
            Get.offAll(()=>HomeUser());
          }



        } else if (response['verification'] == 0) {
          errorMessage.value = "39".tr;
          Get.to(() => EmailVerificationScreen(), arguments: {'email': response['email'],'verification_phone': response['verification_phone']});

        }

      } else {
        errorMessage.value ='38'.tr;
        loginAttempts++;
      }

      isLoading.value = false;
    }
  }



  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '24'.tr;
    }
    if (value.length < 8) {
      return '26'.tr;
    }
    return null;
  }












}


