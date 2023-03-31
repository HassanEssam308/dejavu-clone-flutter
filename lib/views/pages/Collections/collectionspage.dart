import 'package:dejavu_clone/views/pages/CollectionsOfSubCat/collectionsofsubcatpage.dart';
import 'package:dejavu_clone/views/pages/ProductsOfOffers/productsofofferspage.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionsOfCategoriesPage extends StatelessWidget {
  const CollectionsOfCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categories =
        FirebaseFirestore.instance.collection('category').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: categories,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('categories'),
            ),
            body: ListView(children: [
              Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Container(
                    height: MediaQuery.of(context).size.height / 7.5,
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: () {
                        if (document.id == 'nuWveyFOC62RoDdaFbqK') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductsOfOffersPage(
                                categoryID: 'nuWveyFOC62RoDdaFbqK',
                                categoryName: 'Offers',
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CollectionsOfSubCatPage(
                                categoryId: document.id,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data['name']),
                            const Icon(Icons.arrow_forward_ios_sharp)
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ]),
          );
        });
  }
}
