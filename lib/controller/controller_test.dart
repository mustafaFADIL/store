import 'package:get/get.dart';

class ProductController extends GetxController {
  var productCount = 0.obs; // متغير قابل للمراقبة

  void incrementCount() {
    productCount++;
  }
}