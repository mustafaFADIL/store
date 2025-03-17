import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/model/authModel/checkEmailForResetPasswordModel.dart';
import 'package:store/view/screen/auth/EmailVerificationScreen.dart';
 import 'package:validators/validators.dart';

class CheckEmailForResetPasswordController extends GetxController {
  final formKey_checkEmail = GlobalKey<FormState>();
  final emailController_checkEmail = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;
  int loginAttempts = 0;

  final _checkEmailModel = CheckEmailModel();

  Future<void> checkEmail() async {
    if (loginAttempts >= 5) {
      errorMessage.value = '27'.tr;
      return;
    }

    if (formKey_checkEmail.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      String email = emailController_checkEmail.text;

      // التحقق من صحة البيانات في الكونترولر
      if (!isEmail(email)) {
         isLoading.value = false;
        return;
      }

      final response = await _checkEmailModel.checkEmail(email);

      if (response['success'] == true) {
        loginAttempts = 0;
        successMessage.value = response['message'];
        Get.to(() => EmailVerificationScreen(), arguments: {'email': email, 'Go': '1'});
      } else {
        errorMessage.value = response['message'] ?? '45'.tr;
        loginAttempts++;
      }

      isLoading.value = false;
    }
  }

}