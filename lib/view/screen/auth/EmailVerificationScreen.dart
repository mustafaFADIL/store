import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/functions/colors.dart';
import 'package:store/controller/authController/EmailVerificationController.dart';

class EmailVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerificationController>(
      init: EmailVerificationController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colorTopPostion,
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colorDownPostion,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back, color: AppColors.colorBlack),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorWhite,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppColors.logo,width: AppColors.logo_W,height: AppColors.logo_H,),

                      SizedBox(height: AppColors.logo_SizeBox),


                      Text(
                        '11'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controller.codeController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: '12'.tr,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '19'.tr;
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return '28'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.verifyCode,
                        child: controller.isLoading.value
                            ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 8),
                            Text('14'.tr),
                          ],
                        )
                            : Text('13'.tr),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: controller.isResendEnabled
                            ? () async {
                          await controller.resendCode();
                          if (controller.errorMessage.value.isEmpty) {
                            Get.snackbar(
                              '15'.tr,
                              '20'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            controller.startCountdown(); // Restart countdown
                          }
                        }
                            : null,
                        child: Text(controller.isResendEnabled
                            ? '15'.tr
                            : '${'15'.tr} (${controller.formatTime(controller.countdown)})'),
                      ),
                      Obx(() => Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}