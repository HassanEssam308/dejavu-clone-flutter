import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                //  Padding(
                //       padding: EdgeInsets.fromLTRB(5, 15, 15, 20),
                //     ),
                  ListCategory(),
                  ListCategoryy()
              ],

            ),
          
            const SizedBox(height: 6),
            const Text(
              'New Collecion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            const divide(),
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

