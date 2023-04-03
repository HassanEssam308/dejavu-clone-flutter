import 'package:dejavu_clone/Views/pages/ProductsOfCategory/productsofcategorypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryy extends StatelessWidget {
  const ListCategoryy({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
           width: (MediaQuery.of(context).size.width / 2),
          // height: 230,
          // width: 230,
          child: TextButton(
              onPressed: () {
                Get.to(() => const ProductsOfCategoryPage(
                      categoryID: 'vBEYRuSj9Us4ZPPUbg13',
                      categoryName: 'Bags',
                    ));
              },
              child: const Image(
                  fit: BoxFit.fill,
                 
                  image:  NetworkImage(
                      'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu-Button-Bags-Summer-2023-2_9e20f2ae-0e36-4ed4-aea5-050a84c2a675_720x.jpg?v=1680000171'))),
        ),
        const Positioned(
          top: 80,
          left: 65,
          child: Text(
            'Bags',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
