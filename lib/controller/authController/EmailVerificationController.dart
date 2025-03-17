import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/model/authModel/EmailVerificationModel.dart';
import 'package:store/view/screen/auth/resetPassword.dart';

class EmailVerificationController extends GetxController {
  final TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  String? email;
  String? Go;
   int countdown = 300; // 5 minutes in seconds
  late Timer timer;
  bool isResendEnabled = false;

  final _emailVerificationModel = EmailVerificationModel(); // Instantiate the model

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?['email'];
    Go = Get.arguments?['Go'];
     startCountdown();

    resendCode();
    if (email == null) {
      errorMessage.value = "29".tr;
    }
  }

  void startCountdown() {
    countdown = 300;
    isResendEnabled = false;
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (countdown < 1) {
        t.cancel();
        isResendEnabled = true;
        update(); // Update UI
      } else {
        countdown = countdown - 1;
        update(); // Update UI
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  Future<void> resendCode() async {


    isLoading.value = true; // Set loading state

    final response = await _emailVerificationModel.resendCode(email);

    if (response['success'] == true) {
      print('Resend successful');
    } else {
      errorMessage.value = response['message'] ?? '42'.tr;
      print('Resend failed: ${response['message']}');
    }

    isLoading.value = false; // Reset loading state
  }

  Future<void> verifyCode() async {
    errorMessage.value = '';

    isLoading.value = true; // Set loading state

    final response = await _emailVerificationModel.verifyCode(
      codeController.text,
      email,
    );

    if (response['success'] == true) {
      if (Go == '1') {
        print(
            "----------------------------------------------------------------------------");
        print("move ressetPassword");
        Get.to(() => ResetPasswordScreen(email: email.toString()));
        print(
            "----------------------------------------------------------------------------");
      } else {
        print(
            "----------------------------------------------------------------------------");
        print("sssssssssssssssssssssssssssss");
        Get.snackbar("رسالة تحقق", "تم تأكيد البريد الالكتروني الان سوف ننتقل الى تأكيد رقم الهاتف");
        print(
            "----------------------------------------------------------------------------");
      }
      print('Verification successful');
    } else {
      errorMessage.value = response['message'] ?? '43'.tr;
      print('Verification failed: ${response['message']}');
    }

    isLoading.value = false; // Reset loading state
  }
}