import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:store/functions/CheckInternet.dart';
import 'package:store/functions/url.dart';
import 'package:store/view/other/ErrorInternet.dart';

class SignupModel {
  final url_=url();


  Future signup  (
      String name, String email, String password, String phone) async {
    // التحقق من صحة البيانات في المودل
    if (name.isEmpty) {

      return {'success': false, 'message': 'Please enter your name.'};
    }
    if (email.isEmpty || !email.contains('@')) {
      return {'success': false, 'message': 'Please enter a valid email address.'};
    }
    if (password.isEmpty || password.length < 8) {
      return {'success': false, 'message': 'Password must be at least 8 characters.'};
    }
    if (phone.isEmpty) {
      return {'success': false, 'message': 'Please enter your phone number.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
    try {
      String password_ = _hashPassword(password);

      final response = await http.post(
        url_.url_signup, //  استخدام HTTPS
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password_,
          'phone': phone,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);

      } else {
        return {'success': false, 'message': '37'.tr};
      }
    } catch (e) {

      // تجنب طباعة الأخطاء في وحدة التحكم
      return {'success': false, 'message': '37'.tr};
    }} else{
      return  Get.to(()=>ErrorInternet());
    }


  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }


}

