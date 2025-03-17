import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store/view/widgets/NavigationUsers.dart';
import 'package:cached_network_image/cached_network_image.dart';
class HomeUser_test extends StatelessWidget {
  final HomeController controller = Get.put(HomeController()); // إضافة المتحكم



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          _buildTopSection(),
          _buildDesignerCollection(controller),
          _buildTopTrends(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  // الجزء العلوي من الواجهة
  Widget _buildTopSection() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://picturess.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F03%2F425-3.jpg&n=hUmeSYUsTkeK2y8cFm2GQ'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'SPRING COLLECTION',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '20% OFF',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'For Selected Spring Style',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Shop now'),
            ),
          ],
        ),
      ),
    );
  }

  // قسم مجموعة المصممين
  Widget _buildDesignerCollection(HomeController controller) { // إضافة controller كوسيط
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Designer Collection',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('Show all'),
            ],
          ),
          SizedBox(height: 16),
          Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.designerCollection
                  .map((product) => _buildProductItem(product))
                  .toList(),
            ),
          )),
        ],
      ),
    );
  }

  // قسم الاتجاهات الرائجة
  Widget _buildTopTrends() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Trends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('Show all'),
            ],
          ),
          SizedBox(height: 16),
          SingleChildScrollView( // إضافة Obx هنا
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.topTrends
                  .map((product) => _buildProductItem(product))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // عنصر المنتج
  Widget _buildProductItem(Product product) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: product.imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()), // مؤشر تحميل
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)), // عنصر نائب للخطأ
              ),
              if (product.isNew)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price}'),
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  Text('${product.likes}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// نموذج بيانات المنتج
class Product {
  final String title;
  final double price;
  final String imageUrl;
  final int likes;
  final bool isNew;

  Product(
      {required this.title,
        required this.price,
        required this.imageUrl,
        this.likes = 0,
        this.isNew = false});
}

// متحكم الصفحة الرئيسية
class HomeController extends GetxController {
  final designerCollection = <Product>[
    Product(
        title: 'Main Title',
        price: 44.99,
        imageUrl:
        'https://na3em.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2020%2F10%2F1641-12.jpg&n=te63EtWDgwvau2CZMLGtg',
        isNew: true),
    Product(
        title: 'Atom Dress',
        price: 44.99,
        imageUrl:
        'https://na3em.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2020%2F10%2F1641-12.jpg&n=te63EtWDgwvau2CZMLGtg'),
    Product(
        title: 'Mair',
        price: 44.99,
        imageUrl:
        'https://na3em.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2020%2F10%2F1641-12.jpg&n=te63EtWDgwvau2CZMLGtg'),
  ].obs;

  final topTrends = <Product>[
    Product(
        title: 'KOR Slim-Fit Shirt',
        price: 24.99,
        imageUrl:
        'https://picturess.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F03%2F425-3.jpg&n=hUmeSYUsTkeK2y8cFm2GQ',
        likes: 12),
    Product(
        title: 'West Sl',
        price: 24.99,
        imageUrl:
        'https://na3em.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2020%2F10%2F1641-12.jpg&n=te63EtWDgwvau2CZMLGtg',
        likes: 5),
  ].obs;
}