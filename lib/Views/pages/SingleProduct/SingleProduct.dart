import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/Views/pages/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
        title: Text(
          "Details Screen",
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          alignment: Alignment.topRight,
          height: 400,
          child: ListView(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 248, 247, 247),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                items: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-M.DENIM_1_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-M.DENIM_2_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-M.DENIM_3_720x.jpg?v=1678803759',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-M.DENIM_4_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-BEIGE_1_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-BEIGE_2_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-BEIGE_3_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-BEIGE_4_720x.jpg?v=1678803759'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-SNK-GREN_1_720x.jpg?v=1678627549'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-SNK-GREN_2_720x.jpg?v=1678627549'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-SNK-GREN_3_720x.jpg?v=1678627549'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-SNK-GREN_4_720x.jpg?v=1678627549'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0499/3079/7217/products/LID-DJTT-054-SNK-RED_1_720x.jpg?v=1678627549'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LID-DJTT-054",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "EGP849",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: .2, // thickness of the line
                color: Colors.black,
                height: 20, // The divider's height extent.
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "color* :",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                            ),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'M.DENIM ',
                              style: TextStyle(fontSize: 9),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 250, 250, 250))),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'BEIGE ',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 250, 250, 250))),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'SKN-GREN',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 250, 250, 250))),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'SNK-RED ',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 250, 250, 250))),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'BLACK',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 115,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 250, 250, 250))),

                            onPressed: () {
                              Get.to(() => Home());
                            },

                            child: const Text(
                              'SKN-D-GR ',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            // trying to move to the bottom
                          ),
                        )),
                  )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Size* :",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        width: 100,
                        child: BottomAppBar(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                            ),

                            onPressed: () {},

                            child: const Text(
                              'OneSize ',
                              style: TextStyle(fontSize: 10),
                            ), // trying to move to the bottom
                          ),
                        )),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Product Description:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Studded Qualited Cross-body Bag',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    '* 90% PP & PU Upper Mterial ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '* 100% Polyster Inner Mterial ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '* One main Compatment',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '*Inverted Lock Closure',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Dimension',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30,),
                Row(
                children: [
                  Text(
                    'Length     26cm',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
                Row(
                children: [
                  Text(
                    'Height   16cm',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
                Row(
                children: [
                  Text(
                    'Width     9cm',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
       Container(
          padding: EdgeInsets.all(3),
          child: InkWell(
              onTap: () {},
              child: Image.network(
                  'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/LID-54_480x480.jpg?v=1653665188')),
        )
            ],
          ),
          
        ),
      ),
      );
    
  }
}

