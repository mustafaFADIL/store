import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:store/data/model/user/Product.dart';
import 'package:store/functions/colors.dart';
import 'package:store/view/screen/user/Homeuser/ProductDetailsScreen.dart';

class ProductUtils {
  static Widget buildProductItem(Product product) {
    return Card(
      elevation: 5,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {

          Get.to(()=>ProductDetailsScreen(product: product, colorImageMap: {

              Colors.green: 'https://i.pinimg.com/736x/9f/3f/d4/9f3fd432ab096c726466e10ab2d8a66f.jpg',
              Colors.blue: 'https://i.pinimg.com/474x/05/5c/8f/055c8fc2d5dc9af4b68e576c9333f70b.jpg',
              Colors.red: 'https://i.pinimg.com/474x/6d/33/ee/6d33eed2c107e9a06266c23c5b5467fc.jpg',

          },));
          // TODO: Navigate to product details screen using Get.toNamed()
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // TODO: Add product to cart using controller
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Navigate to product details
                        },
                        icon: Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}