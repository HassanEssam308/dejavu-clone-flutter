import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/views/pages/ProductsOfSubCat/productsofsubcat.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  final String categoryId;
  const SubCategories({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> subcategories = FirebaseFirestore.instance
        .collection('subcategory')
        .where('category.catid', isEqualTo: categoryId)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: subcategories,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    side: const BorderSide(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsOfSubCatPage(
                            subCategoryID: document.id,
                            subCategoryName: '${data['name']}'),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(data['name']),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
