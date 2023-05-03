import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/Home.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Cart'.tr,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3900/3900101.png',
                          scale: 8)),
                  Text(
                    "YourCartIsEmpty".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                   Center(
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Text(
                          "ThereAreNoItemsAdded".tr),
                     ),
                   ),
                ],
              ))),
              Expanded(
                  child:
                   Align(
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
                        child:  Text(
                         "ShopNow".tr,
                          style:const TextStyle(fontSize: 17),
                        ), // trying to move to the bottom
                      ),
                    )),
              ))
            ],
          ),
        ),
    
    );

  }
}
