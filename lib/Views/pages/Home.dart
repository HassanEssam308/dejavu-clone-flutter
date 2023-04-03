import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'HomeData/HomeData.dart';
import 'HomeData/Textsearch.dart';
import 'HomeData/ListCategory.dart';
import 'HomeData//ListCategory1.dart';
import 'HomeData/Shoplook.dart';
import 'HomeData/Slidde.dart';
import 'HomeData/diviide.dart';
class Home extends StatelessWidget {
  Home({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: const SharedDrawer(),
      body: ListView(scrollDirection: Axis.vertical, children: [
        textsearch(),
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(children: [
            Sliderr(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                 Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 15, 20),
                    ),
                  listCategory(),
                  listCategoryy()
              ],

            ),
          
            SizedBox(height: 6),
            Text(
              'New Collecion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            divide(),
            SizedBox(height: 6),
            Container(
              height: 200,
              child: ProductData(),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Shop the look',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            divide(),
            SizedBox(height: 6),
            ShopLook(),
            SizedBox(height: 10),
            Text(
              'End Of Season Sale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            divide(),
            SizedBox(height: 6),
            Container(
              height: 200,
              child: ProductData(),
            ),
          ]),
        ),
      ]),
    );
  }
}

