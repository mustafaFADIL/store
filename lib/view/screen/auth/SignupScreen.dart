import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/controller/authController/SignupController.dart';
import 'package:store/functions/colors.dart';
import 'package:store/functions/funLang.dart';
import 'package:store/view/screen/auth/SignInScreen.dart';

class SignupScreen extends StatelessWidget {

  final  funLang_= Funlang();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
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




              Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 15, 0),
                child: Form(
                  key: controller.formKey_Signup,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(AppColors.logo,width: AppColors.logo_W,height: AppColors.logo_H,),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                SizedBox(height: AppColors.logo_SizeBox_login_siginin),
                                Text(
                                '1'.tr,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.colorBlack),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  Get.offAll(() => SignInScreen());
                                },
                                child:   Text(
                                  '2'.tr,
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: AppColors.colorGrey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.nameController_Signup,
                            decoration: InputDecoration(
                              labelText: '3'.tr,
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '21'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.emailController_Signup,
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
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.passwordController_Signup,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '5'.tr,
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '24'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(

                            controller: controller.phoneController_Signup,
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              labelText: '6'.tr,

                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '25'.tr;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: controller.isLoading.value ? null : controller.signup,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                :   Text(
                              '1'.tr,
                              style: TextStyle(color:AppColors.colorBlack),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Get.offAll(() => SignInScreen());
                            },
                            child:   Text(
                              '7'.tr,
                              style: TextStyle(color:AppColors.colorBlack),
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
                right: 20,
                child: Container(
                  width: 35,
                  height: 35,
                  child: InkWell(

                      onTap: (){

                        funLang_.showPopupMenu(context);
                      },

                      child: Icon(Icons.language, color: AppColors.colorBlack,size: 30)),

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