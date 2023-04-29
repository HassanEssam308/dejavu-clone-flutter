import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/Views/pages/ProductDetails/product_details_page.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsOfOffers extends StatelessWidget {
  final String categoryID;
  final String categoryName;
  const ProductsOfOffers({
    super.key,
    required this.categoryID,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _products = FirebaseFirestore.instance
        .collection('product')
        .where('offer', isEqualTo: true)
        .orderBy('catid')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _products,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Expanded(
          child: ListView(children: [
            Wrap(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return 
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.6,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(255, 238, 238, 238),
                        ),
                      ),
                      child: MaterialButton(
                        hoverColor: Colors.white,
                        onPressed: () {
                           Get.to(() => ProductDetails(
                                productID: document.id,
                              ));
                        },
                        child: Column(children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              data['imgs'][0],
                            ),
                          ),
                          Text(
                            MylocaleController.currentlang == 'ar'
                                ? data['name_ar']
                                : data['name'],
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: data['offer'] == false
                                ? Text(
                                    'EGP ${data['new_price']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        MylocaleController.currentlang == 'ar'
                                            ? '${data['old_price']} ج.م '
                                            : 'EGP ${data['old_price']}',

                                        // 'EGP${data['old_price']}',
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        MylocaleController.currentlang == 'ar'
                                            ? '${data['new_price']} ج.م '
                                            : 'EGP ${data['new_price']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        MylocaleController.currentlang == 'ar'
                                            ? '${data['discount']} % خ'
                                            : '%OFF ${data['discount']}',
                                        // ' ${data['discount']} %OFF',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                          )
                        ]),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ]),
        );
      },
    );
  }
}
