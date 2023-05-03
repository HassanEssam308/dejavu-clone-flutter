import 'package:dejavu_clone/Views/pages/ProductDetails/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopLook extends StatelessWidget {
  const ShopLook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Container(
          padding: EdgeInsets.all(9),
          child: InkWell(
              onTap: () {
                // Get.to(()=>ProductDetails(productID: '776vfFXYjxoNGC8jdInt',));
             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(productID: '776vfFXYjxoNGC8jdInt',)
                              ),
                            );
              },
              child: Image.network(
                  'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/ShopTheLook-LID-DJTT-054_62b895ae-ea0f-424a-9319-c4bf2bf89199_1200x.jpg?v=1678803538')),
        ),
        Container(
          padding: EdgeInsets.all(9),
          child: InkWell(
              onTap: () {},
              child: Image.network(
                  'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/ShopTheLook-XKK-DVTH-001_1200x.jpg?v=1678803437')),
        ),
        Container(
          padding: EdgeInsets.all(9),
          child: InkWell(
              onTap: () {},
              child: Image.network(
                  'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/ShopTheLook-KND4-LID37_1200x.jpg?v=1678804477')),
        )
      ],
    );
  }
}
