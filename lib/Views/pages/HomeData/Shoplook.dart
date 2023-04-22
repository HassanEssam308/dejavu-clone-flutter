
import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../SingleProduct/SingleProduct.dart';
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
                Get.to(()=>ProductDetails());
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
