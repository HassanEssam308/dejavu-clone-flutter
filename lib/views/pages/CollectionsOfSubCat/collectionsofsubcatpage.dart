import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:dejavu_clone/views/pages/ProductsOfSubCat/productsofsubcat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsOfSubCatPage extends StatelessWidget {
  final String categoryId;

  const CollectionsOfSubCatPage({
    super.key,
    required this.categoryId,
  });
  // if (categoryId == 'nuWveyFOC62RoDdaFbqK') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) =>  const ProductsOfCategoryPage(categoryID: 'nuWveyFOC62RoDdaFbqK',categoryName: 'Offers',
  //         ),
  //       ),
  //     );
  //   }
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> subCategories = FirebaseFirestore.instance
        .collection('subcategory')
        .where('category.catid', isEqualTo: categoryId)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: subCategories,
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text(
                  ' ${MylocaleController.currentlang == 'ar' ? snapshot.data!.docs[0]['category.catname_ar'] : snapshot.data!.docs[0]['category.catname']}'),
            ),
            body: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      ' ${MylocaleController.currentlang == 'ar' ?( 'Collection'.tr  + snapshot.data!.docs[0]['category.catname_ar'] ): (snapshot.data!.docs[0]['category.catname']  +
                        'Collection'.tr)}'
                             ,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.transparent,
                        shadows: [
                          Shadow(offset: Offset(-10, -7), color: Colors.black)
                        ],
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsOfSubCatPage(
                                  subCategoryID: document.id,
                                  subCategoryName: data['name'],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,

                            elevation: 0,
                            // alignment:,
                            //  minimumSize:,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),

                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('${data['img']}'),
                                  ),
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.elliptical(60, 50),
                                    right: Radius.elliptical(60, 50),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  MylocaleController.currentlang == 'ar'
                                      ? data['name_ar']
                                      : '${data['name']}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        });
  }
}
