import 'package:get/get.dart';
import 'package:store/data/model/user/Product.dart';

class Homeusercontroller extends GetxController {
  final List<Product> products = [
    Product(
      name: 'Gentle shampoo',
      imageUrl: 'https://static.wixstatic.com/media/f261d0_6d5d2608824748798f05867c14534d31~mv2.jpg/v1/fit/w_500,h_500,q_90/file.jpg', // استبدل برابط الصورة الصحيح
      price: 8.00,
    ),
    Product(
      name: 'Moisturizing',
      imageUrl: 'https://i.pinimg.com/736x/06/2c/ed/062ced545a4377881f786e32a527dcbb.jpg', // استبدل برابط الصورة الصحيح
      price: 12.20,
    ),
    Product(
      name: 'Detoxing shampoo',
      imageUrl: 'https://i.pinimg.com/736x/6b/96/12/6b9612756c0964bc193b8c0f2416f13c.jpg', // استبدل برابط الصورة الصحيح
      price: 8.30,
    ),
    Product(
      name: 'Detoxing shampoo',
      imageUrl: 'https://i.pinimg.com/736x/b9/e8/c3/b9e8c37599f6146b33caa8a8dc4a2f70.jpg', // استبدل برابط الصورة الصحيح
      price: 8.30,
    ),
    Product(
      name: 'Detoxing shampoo',
      imageUrl: 'https://i.pinimg.com/736x/b9/e8/c3/b9e8c37599f6146b33caa8a8dc4a2f70.jpg', // استبدل برابط الصورة الصحيح
      price: 8.30,
    ),
    Product(
      name: 'heat serum',
      imageUrl: 'https://i.pinimg.com/474x/93/57/93/935793b8bcae3b256d73ce302dd8b2f6.jpg', // استبدل برابط الصورة الصحيح
      price: 19.40,
    ),
  ].obs;
}