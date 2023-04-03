import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../widgets/products.dart';
import 'HomeData/HomeData.dart';

class Home extends StatelessWidget {
  Home({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: const SharedDrawer(),
      body: ListView(scrollDirection: Axis.vertical, children: [
        _Textsearch(),
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
                    _ListCategory(),
                    _ListCategoryy()
                

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

class _Textsearch extends StatelessWidget {
  const _Textsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 240, 240, 240).withOpacity(0.8),
              spreadRadius: 7,
              blurRadius: 6,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget _ListCategory() {
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
Widget _ListCategoryy() {
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

class divide extends StatelessWidget {
  const divide({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 4,
      color: Color.fromARGB(255, 13, 14, 13),
      thickness: 3,
      indent: 180,
      endIndent: 180,
    );
  }
}

class Sliderr extends StatelessWidget {
  const Sliderr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            items: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu_Desktop_Banner_7cbbd2ce-d6c8-44d9-9b51-1d7ab03f8565_1512x.jpg?v=1677527333'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu_NewArraivals_Desktop_Banner_7d4ad9a5-455c-491b-b302-c2941c963648_1512x.jpg?v=1679996079'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
              onTap: () {},
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
