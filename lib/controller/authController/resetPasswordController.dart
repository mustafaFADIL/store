import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/model/authModel/resetPasswordModel.dart';
import 'package:store/view/screen/auth/SignInScreen.dart';
 import 'package:validators/validators.dart';

class ResetPasswordController extends GetxController {
  final String email;

  ResetPasswordController({required this.email});

  final formKey_resetPassword = GlobalKey<FormState>();
  final passwordController_resetPassword = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final successMessage = ''.obs;

  final _resetPasswordModel = ResetPasswordModel();

  Future<void> resetPassword() async {
    if (formKey_resetPassword.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      String password = passwordController_resetPassword.text;

      // التحقق من صحة البيانات في الكونترولر
      if (password.isEmpty || password.length < 8) {
        errorMessage.value = '26'.tr;
        isLoading.value = false;
        return;
      }

      final response = await _resetPasswordModel.resetPassword(email, password);

      if (response['success'] == true) {
        successMessage.value = '40'.tr;
        Get.off(() => SignInScreen());
      } else {
        errorMessage.value = response['message'] ?? '41'.tr;
      }

      isLoading.value = false;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '24'.tr;
    }
    if (value.length < 8) {
      return 'P26'.tr;
    }
    return null;
  }

  @override
  void onClose() {
    passwordController_resetPassword.dispose();
    super.onClose();
  }
}