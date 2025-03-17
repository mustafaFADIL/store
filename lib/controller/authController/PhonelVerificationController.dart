import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/model/authModel/EmailVerificationModel.dart';
import 'package:store/view/screen/auth/resetPassword.dart';

class PhonelVerificationController extends GetxController {
  final TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  String? phone;
  String? Go;
  int countdown = 300; // 5 minutes in seconds
  late Timer timer;
  bool isResendEnabled = false;

  final _emailVerificationModel = EmailVerificationModel(); // Instantiate the model

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments?['phone'];
    Get.snackbar("sssssssssssssssssssssssss", phone.toString());
    Go = Get.arguments?['Go'];
    startCountdown();

    resendCode_phone();
    if (phone == null) {
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

  Future<void> resendCode_phone() async {


    isLoading.value = true; // Set loading state

    final response = await _emailVerificationModel.resendCode_Phone(phone);

    if (response['success'] == true) {
      print('Resend successful');
    } else {
      errorMessage.value = response['message'] ?? '42'.tr;
      print('Resend failed: ${response['message']}');
    }

    isLoading.value = false; // Reset loading state
  }
//verifyCode_phone


  Future<void> verifyCode_phone() async {
    errorMessage.value = '';

    isLoading.value = true; // Set loading state

    final response = await _emailVerificationModel.verifyCode_phone(
      codeController.text,
      phone,
    );

    if (response['success'] == true) {

      print('Verification successful');
    } else {
      errorMessage.value = response['message'] ?? '43'.tr;
      print('Verification failed: ${response['message']}');
    }

    isLoading.value = false; // Reset loading state
  }


}