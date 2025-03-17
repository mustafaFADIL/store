
import 'package:flutter/material.dart';

//external server

String server_out="";

//internal serval

String server_in="http://192.168.0.127/store/";

String host=server_in;

class url {

  ///--------------------------------------------------Start auth

  Uri url_login=Uri.parse(host+"auth/login.php");
  Uri url_signup=Uri.parse(host+"auth/signup.php");
  Uri url_resetPassword=Uri.parse(host+"auth/resetPassword.php");
  Uri url_resend_code=Uri.parse(host+"auth/resend_code.php");
  Uri url_resend_code_phone=Uri.parse(host+"auth/sendCodeWhatsApp.php");
  Uri url_verifyCode=Uri.parse(host+"auth/verify_email.php");
  Uri url_verifyCodePhone=Uri.parse(host+"auth/verifyPhone.php");
  Uri url_checkEmail=Uri.parse(host+"auth/checkEmail.php");



///--------------------------------------------------end auth







}