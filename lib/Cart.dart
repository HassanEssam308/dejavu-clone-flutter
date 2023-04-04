import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-256/shopping-cart-1962599-1656003.png',
                        scale: 5)),
                // Icon(Icons.shopping_cart),
                Text(
                  "Your Cart Is Empty",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                Text(
                    "There are no items added in your Cart. Shop more to add products to your cart."),

                Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).padding.top),
                  ),
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                ElevatedButton(
                  child: Text('this is a button'),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );

    throw UnimplementedError();
  }
}
