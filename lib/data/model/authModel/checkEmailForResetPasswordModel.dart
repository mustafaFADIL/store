import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store/functions/CheckInternet.dart';
import 'package:store/functions/url.dart';
import 'package:store/view/other/ErrorInternet.dart';
import 'package:validators/validators.dart';

class CheckEmailModel {

  final url_=url();

  Future checkEmail(String email) async {
    // التحقق من صحة البيانات في المودل
    if (!isEmail(email)) {
      return {'success': false, 'message': 'Please enter a valid email address.'};
    }
    var checkinternet=await CheckInternet();

    if(checkinternet){
    try {
      final response = await http.post(
        url_.url_checkEmail, // استخدام HTTPS
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'success': false, 'message': '44'.tr};
      }
    } catch (e) {
      print('Error during check email: $e'); // يمكن إزالة هذا في بيئة الإنتاج
      return {'success': false, 'message': '37'.tr};
    }  }
    else{
      return  Get.to(()=>ErrorInternet());
    }

  }
}