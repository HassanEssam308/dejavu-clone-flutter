import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/Views/pages/ProductsOfSubCat/productsofsubcat.dart';
import 'package:dejavu_clone/views/pages/ProductsOfOffers/productsofofferspage.dart';
import 'package:flutter/material.dart';

class GetSubCategory extends StatelessWidget {
  final String categoryName;

  const GetSubCategory({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categories = FirebaseFirestore.instance
        .collection('subcategory')
        .where('category.catname', isEqualTo: categoryName)
        .snapshots();
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

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Container(
                child: InkWell(
                  onTap: () {
                    if (categoryName == 'Offers') {
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
                          builder: (context) => ProductsOfSubCatPage(
                              subCategoryID: document.id,
                              subCategoryName: data['name']),
                            
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                    data['name'],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
