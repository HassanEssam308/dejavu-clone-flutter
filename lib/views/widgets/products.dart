import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/Views/pages/ProductDetails/product_details_page.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  final String categoryId;
  final String subCategoryId;
  const Products({super.key, this.categoryId = '', this.subCategoryId = ''});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeigth = size.height / 2;
    // final double itemWidth = size.width / 1.5;

    final Stream<QuerySnapshot> _products;

    if (categoryId != '') {
      _products = FirebaseFirestore.instance
          .collection('product')
          .where('catid', isEqualTo: categoryId)
          .snapshots();
    } else {
      _products = FirebaseFirestore.instance
          .collection('product')
          .where('subid', isEqualTo: subCategoryId)
          .snapshots();
    }

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
                return Column(
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
                          // print(document.id);
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
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              MylocaleController.currentlang == 'ar'
                                  ? '${data['new_price']} ج.م '
                                  : 'EGP ${data['new_price']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
