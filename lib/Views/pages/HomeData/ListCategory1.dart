import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
Widget listCategoryy() {
  return Stack(
    children: [
     
      Container(
        padding: const EdgeInsets.all(12.0),
        height: 230,
        width: 230,
        child: InkWell(
            onTap: () {},
            child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu-Button-Bags-Summer-2023-2_9e20f2ae-0e36-4ed4-aea5-050a84c2a675_720x.jpg?v=1680000171'))),
       
      ),

      Positioned(
        child: Text(
          'Bags',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            
          ),
        ),
        top: 80,
        left: 80,
      )
    ],
  );
}
