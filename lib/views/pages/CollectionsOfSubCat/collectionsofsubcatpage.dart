import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/views/pages/ProductsOfSubCat/productsofsubcat.dart';
import 'package:flutter/material.dart';

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
          .where('catid', isEqualTo: categoryId)
          .snapshots();
      return StreamBuilder<QuerySnapshot>(
          stream: subCategories,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                title: Text(' ${snapshot.data!.docs[0]['catname']}'),
              ),
              body: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        ' ${snapshot.data!.docs[0]['catname']} Collection',
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
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(50),
                              // ),
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
                                // Image.network("https://cdn.shopify.com/s/files/1/0499/3079/7217/products/SUN-DVTH-007-BEIGE_1_900x.jpg?v=1671525120"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    '${data['name']}',
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

