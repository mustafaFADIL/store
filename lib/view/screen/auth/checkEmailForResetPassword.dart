//checkEmailForResetPassword.dart



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/authController/checkEmailForResetPasswordController.dart';
import 'package:store/functions/colors.dart';


class checkEmailForResetPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckEmailForResetPasswordController>(
      init: CheckEmailForResetPasswordController(),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.colorWhite,
                    ),
                    child: Icon(Icons.arrow_back, color: AppColors.colorBlack),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Form(
                  key: controller.formKey_checkEmail,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppColors.logo,width: AppColors.logo_W,height: AppColors.logo_H,),
                          SizedBox(height: 25,),

                          Text(
                            '9'.tr,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.colorBlack),
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: controller.emailController_checkEmail,
                            decoration: InputDecoration(
                              labelText: '4'.tr,
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '22'.tr;
                              }
                              if (!isValidEmail(value)) {
                                return '23'.tr;
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: controller.isLoading.value ? null : controller.checkEmail,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                :   Text(
                              '10'.tr,
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
            ],
          ),
        );
      },
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}