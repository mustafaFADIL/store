import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:store/controller/controller_user/HomeuserController.dart';

import 'package:store/data/model/user/Product.dart';
import 'package:store/functions/colors.dart';
import 'package:store/functions/text.dart';
import 'package:store/view/screen/auth/SignupScreen.dart';
import 'package:store/view/screen/user/Homeuser/ProductDetailsScreen.dart';

import 'package:store/view/widgets/NavigationUsers.dart';

import 'package:store/view/screen/user/Homeuser/cardProdect.dart';



class HomeUser extends StatelessWidget {

  final Homeusercontroller controller = Get.put(Homeusercontroller());



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.colorTopUser,


        leading:  IconButton(

          icon: Icon(Icons.filter_list,size: 25,color: AppColors.colorTopTextUser),

          onPressed: () {

// TODO: Implement search functionality

          },

        ),


        title: Center(child: Text(AppText.nameProject,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.colorTopTextUser),)),


        actions: [



          IconButton(

            icon: Icon(Icons.shopping_cart_outlined,color: AppColors.colorTopTextUser),

            onPressed: () {

              Get.to(()=>SignupScreen());
// TODO: Navigate to cart screen

            },

          ),

        ],

      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [



            SizedBox(height: 15,),


            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3 ),
                  ),
                ],
              ),
              child: TextField(

                decoration: InputDecoration(
                  labelText: '47'.tr,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),






            //Text(AppText.nameCategory,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),


            SizedBox(height: 15,),

            SingleChildScrollView(

              scrollDirection: Axis.horizontal, // التمرير أفقيًا

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [

                  _buildFilterButton('Bags'),

                  _buildFilterButton('Cleanse'),

                  _buildFilterButton('Clarify'),

                  _buildFilterButton('Clarify'),

                  _buildFilterButton('Hydrate'),

                  _buildFilterButton('Hydrate'),

                  _buildFilterButton('Multitask'),

                  _buildFilterButton('Multitask'),

                ],

              ),

            ),

            SizedBox(height: 16),

            Expanded(

              child: GridView.builder(


                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,

                  crossAxisSpacing: 16,

                  mainAxisSpacing: 16,

                  childAspectRatio: 0.6,

                ),

                itemCount: controller.products.length,

                itemBuilder: (context, index) {

                  final product = controller.products[index];

                  return ProductUtils.buildProductItem(product);

                },

              ),

            ),

          ],

        ),

      ),

      bottomNavigationBar: MyBottomNavigationBar(),

    );

  }



  Widget _buildFilterButton(String label) {

    return Padding(

      padding: const EdgeInsets.all(8.0),

      child: TextButton(

        onPressed: () {

// TODO: Implement filter logic

        },

        style: TextButton.styleFrom(

          backgroundColor: label=='Bags'?AppColors.colorTopUser:Colors.grey[200], // يمكنك تغيير لون الخلفية

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(8.0),

          ),

        ),

        child: Text(

          label,

          style: TextStyle(

            color: label=='Bags'?AppColors.colorTopTextUser:Colors.black, // يمكنك تغيير لون النص

          ),

        ),

      ),

    );

  }



}