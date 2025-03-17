import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/controller_user/ProductDetailsController.dart';
import 'package:store/data/model/user/Product.dart';
import 'package:store/functions/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final Map<Color, String> colorImageMap;
  final ProductDetailsController controller;

  ProductDetailsScreen({required this.product, required this.colorImageMap})
      : controller = Get.put(ProductDetailsController(product: product));

  @override
  Widget build(BuildContext context) {
    controller.setColorImageMap(colorImageMap);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Obx(
                      () => Container(
                    height: MediaQuery.of(context).size.width < 500 ? 400 : 700, // تغيير هنا
                    width: double.infinity,
                    child: Image.network(
                      controller.selectedImageUrl.value,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/default_image.png');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.product.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${controller.product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Nike AirMax97 follows the outstanding design that established  ',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectColor(Colors.red);
                            },
                            child: Obx(
                                  () => CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 15,
                                child: controller.selectedColor.value ==
                                    Colors.red
                                    ? Icon(Icons.check, color: Colors.white)
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              controller.selectColor(Colors.blue);
                            },
                            child: Obx(
                                  () => CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 15,
                                child: controller.selectedColor.value ==
                                    Colors.blue
                                    ? Icon(Icons.check, color: Colors.white)
                                    : null,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectColor(Colors.green);
                            },
                            child: Obx(
                                  () => CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 15,
                                child: controller.selectedColor.value ==
                                    Colors.green
                                    ? Icon(Icons.check, color: Colors.white)
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(

                          backgroundColor: AppColors.colorNavUser,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}