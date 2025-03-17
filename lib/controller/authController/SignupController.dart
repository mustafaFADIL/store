import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/model/authModel/SignupModel.dart';
import 'package:store/view/screen/auth/EmailVerificationScreen.dart';

class SignupController extends GetxController {
  final nameController_Signup = TextEditingController();
  final emailController_Signup = TextEditingController();
  final passwordController_Signup = TextEditingController();
  final phoneController_Signup = TextEditingController();

  final formKey_Signup = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  final _signupModel = SignupModel();

  Future<void> signup() async {

    if (formKey_Signup.currentState!.validate()) {

      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      String name = nameController_Signup.text;
      String email = emailController_Signup.text;
      String password = passwordController_Signup.text;
      String phone = phoneController_Signup.text;

      // التحقق من صحة البيانات في الكونترولر
      if (name.isEmpty) {

         isLoading.value = false;
        return;
      }
      if (email.isEmpty || !email.contains('@')) {

         isLoading.value = false;
        return;
      }
      if (password.isEmpty || password.length < 8) {

        errorMessage.value = '26'.tr;
        isLoading.value = false;
        return;
      }
      if (phone.isEmpty) {
         isLoading.value = false;
        return;
      }

      final response = await _signupModel.signup(name, email, password, phone);

      if (response['success'] == true) {

        successMessage.value = '40'.tr;
        Get.to(() => EmailVerificationScreen(),
            arguments: {'email': emailController_Signup.text});
      } else {

        errorMessage.value = "39".tr;// رسالة خطأ عامة
      }

      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController_Signup.dispose();
    emailController_Signup.dispose();
    passwordController_Signup.dispose();
    phoneController_Signup.dispose();
    super.onClose();
  }
}