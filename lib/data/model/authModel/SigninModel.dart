import 'dart:convert';
import 'package:get/get.dart';
 import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:store/functions/CheckInternet.dart';
import 'package:store/functions/url.dart';
import 'package:store/view/other/ErrorInternet.dart';
import 'package:validators/validators.dart';

class SigninModel {


final url_=url();

  Future signIn(String email, String password) async {
    // التحقق من صحة البيانات في المودل
    if (!isEmail(email)) {
      return {'success': false, 'message': 'Please enter a valid email address.'};
    }
    if (password.isEmpty || password.length < 8) {
      return {'success': false, 'message': 'Password must be at least 8 characters long.'};
    }

    var checkinternet=await CheckInternet();

    if(checkinternet){
      try {
        final response = await http.post(
          url_.url_login, // استخدام HTTPS
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
          },
          body: jsonEncode({
            'email': email,
            'password': _hashPassword(password),
          }),
        );

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          return {'success': false, 'message': '38'.tr};
        }
      }
      catch (e) {
        print('Error during login: $e'); // يمكن إزالة هذا في بيئة الإنتاج
        return {'success': false, 'message': '37'.tr};
      }
    }
    else{
      return  Get.to(()=>ErrorInternet());
    }



  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}