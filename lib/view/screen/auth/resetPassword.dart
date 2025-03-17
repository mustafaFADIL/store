import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/authController/resetPasswordController.dart';
import 'package:store/functions/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  ResetPasswordScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(email: email),
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
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Form(
                  key: controller.formKey_resetPassword,
                  child: SingleChildScrollView(




                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Image.asset(AppColors.logo,width: AppColors.logo_W,height: AppColors.logo_H,),
                          SizedBox(height: AppColors.logo_SizeBox),



                          Text(
                            '17'.tr,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.colorBlack),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: controller.passwordController_resetPassword,
                            decoration: InputDecoration(
                              labelText: '18'.tr,
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '17'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: controller.isLoading.value ? null : controller.resetPassword,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                :   Text(
                              '16'.tr,
                              style: TextStyle(color: AppColors.colorBlack),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(() => Text(
                            controller.errorMessage.value,
                            style: TextStyle(color: Colors.red),
                          )),
                          Obx(() => Text(
                            controller.successMessage.value,
                            style: TextStyle(color: Colors.green),
                          )),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}