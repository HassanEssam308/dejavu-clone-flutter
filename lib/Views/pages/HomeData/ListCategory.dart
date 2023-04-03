import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

Widget listCategory() {
  return Stack(
    children: [
     
      Container(
        padding: const EdgeInsets.all(12.0),
        height: 230,
        width: 230,
        child: InkWell(
            onTap: () {

              

            },
            child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu-Button-Shoes-Summer-2023-2_daf583a8-d78b-403d-a51d-6b054d3b963a_720x.jpg?v=1680000158'))),
       
      ),

      Positioned(
        child: Text(
          'Shoes',
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