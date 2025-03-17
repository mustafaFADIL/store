import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/authController/SignInController.dart';
import 'package:store/core/localization/changelocal.dart';
import 'package:store/functions/colors.dart';
import 'package:store/functions/funLang.dart';
import 'package:store/view/screen/auth/EmailVerificationScreen.dart';
import 'package:store/view/screen/auth/SignupScreen.dart';
import 'package:store/view/screen/auth/checkEmailForResetPassword.dart';

class SignInScreen extends StatelessWidget {

  final  funLang_= Funlang();

  @override
  Widget build(BuildContext context) {




    return GetBuilder<SigninController>(
      init: SigninController(),
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
                padding:   EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Form(
                  key: controller.formKey_SignIn,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(AppColors.logo,width: AppColors.logo_W,height: AppColors.logo_H,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: AppColors.logo_SizeBox_login_siginin),
                              InkWell(
                                onTap: () {
                                  Get.offAll(() => SignupScreen());
                                },
                                child: Text(
                                  '1'.tr,
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: AppColors.colorGrey,),
                                ),
                              ),
                              const SizedBox(width: 20),
                                Text(
                                '2'.tr,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.colorBlack),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: controller.emailController_Signin,
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
                            controller: controller.passwordController_Signin,
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
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: controller.isLoading.value ? null : controller.signIn,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                : Text(
                              '2'.tr,
                              style: TextStyle(color: AppColors.colorBlack),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Get.to(() => checkEmailForResetPassword());
                            },
                            child:   Text(
                              '8'.tr,
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
                right: 20,
                child: Container(
                  width: 35,
                  height: 35,
                  child: InkWell(

                      onTap: (){
                        print("asdfsadf");
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



