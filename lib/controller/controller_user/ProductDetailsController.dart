import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:store/data/model/user/Product.dart';

class ProductDetailsController extends GetxController {
  final Product product;
  Rx<Color> selectedColor = Colors.red.obs;
  RxString selectedImageUrl;
  Map<Color, String> colorImageMap = {};

  ProductDetailsController({required this.product})
      : selectedImageUrl = product.imageUrl.obs;

  void selectColor(Color color) {
    selectedColor.value = color;
    if (colorImageMap.containsKey(color)) {
      selectedImageUrl.value = colorImageMap[color]!;
    } else {
      selectedImageUrl.value = product.imageUrl;
    }
  }

  void selectSpot(String spotUrl) {
    // ... (إضافة منطق اختيار Spot إذا لزم الأمر)
  }

  void setColorImageMap(Map<Color, String> colorMap) {
    colorImageMap = colorMap;
  }
}