import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/Home.dart';
import '../../pages/Collections/collectionspage.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
           leading: IconButton(
    icon: Icon(Icons.arrow_back),
onPressed: () {
  Navigator.pop(context);
},
  ),
        ),
        body: Container(
          alignment: Alignment.center,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
            Expanded(
              child : Center(
                   child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
 Image(
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3900/3900101.png',
                      scale: 8)),
              Text(
                "Your Cart Is Empty",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                  "There are no items added in your Cart.Shop more to add products to your cart"),
              
                

            ],)
              )
              
        
            ),
        
               
          
            
                    
        
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: 400,
                    child: BottomAppBar(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Get.to(() => Home());
                        },
                        child: const Text(
                          'Shop Now ',
                        ), // trying to move to the bottom
                      ),
                    )),
              ))
            ],
          ),
        ),
      ),
    );

    throw UnimplementedError();
  }
}
