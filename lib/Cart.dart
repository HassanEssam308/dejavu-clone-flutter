import 'package:flutter/material.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
