import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store/functions/CheckInternet.dart';
import 'package:store/functions/url.dart';
import 'package:store/view/other/ErrorInternet.dart';
import 'package:validators/validators.dart';

class EmailVerificationModel {

  final url_=url();

  Future  resendCode(String? email) async {
    if (email == null || email.isEmpty) {
      return {'success': false, 'message': 'Please provide a valid email.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
    try {
      final response = await http.post(
        url_.url_resend_code,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'success': false, 'message': 'Failed to connect to the server.'};
      }
    } catch (e) {
      print('Error during resend: $e'); // يمكن إزالة هذا في بيئة الإنتاج
      return {'success': false, 'message': 'An error occurred. Please try again later.'};
    }}


    else{
      return  Get.to(()=>ErrorInternet());
    }


  }

  Future verifyCode(String code, String? email) async {
    if (code.isEmpty) {
      return {
        'success': false,
        'message': 'Please enter the verification code.'
      };
    }
    if (email == null || email.isEmpty) {
      return {'success': false, 'message': 'Please provide a valid email.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
    try {
      final response = await http.post(
        url_.url_verifyCode,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'code': code,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'success': false, 'message': '37'.tr};
      }
    } catch (e) {
      print('Error during verification: $e'); // يمكن إزالة هذا في بيئة الإنتاج
      return {'success': false, 'message': '37'.tr};
    }
  }
    else{
    return  Get.to(()=>ErrorInternet());
    }

  }





















  ///------------------------------phone ////////////////////////////////url_verifyCodePhone

  Future  resendCode_Phone(String? phone) async {
    if (phone == null || phone.isEmpty) {
      return {'success': false, 'message': 'Please provide a valid email.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
      try {
        final response = await http.post(
          url_.url_resend_code_phone,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'phone': phone,
          }),
        );

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          return {'success': false, 'message': 'Failed to connect to the server.'};
        }
      } catch (e) {
        print('Error during resend: $e'); // يمكن إزالة هذا في بيئة الإنتاج
        return {'success': false, 'message': 'An error occurred. Please try again later.'};
      }}


    else{
      return  Get.to(()=>ErrorInternet());
    }


  }

  Future verifyCode_phone(String code, String? phone) async {
    if (code.isEmpty) {
      return {
        'success': false,
        'message': 'Please enter the verification code.'
      };
    }
    if (phone == null || phone.isEmpty) {
      return {'success': false, 'message': 'Please provide a valid email.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
      try {
        final response = await http.post(
          url_.url_verifyCodePhone,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'code': code,
            'phone': phone,
          }),
        );

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          return {'success': false, 'message': '37'.tr};
        }
      } catch (e) {
        print('Error during verification: $e'); // يمكن إزالة هذا في بيئة الإنتاج
        return {'success': false, 'message': '37'.tr};
      }
    }
    else{
      return  Get.to(()=>ErrorInternet());
    }

  }


}