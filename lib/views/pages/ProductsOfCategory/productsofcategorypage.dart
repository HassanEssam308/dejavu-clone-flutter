import 'package:dejavu_clone/Views/widgets/AppBarProducts.dart';
import 'package:dejavu_clone/views/pages/Collections/collectionspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './subcategories.dart';
import '../../widgets/products.dart';

class ProductsOfCategoryPage extends StatelessWidget {
  final String categoryID;
  final String categoryName;
  const ProductsOfCategoryPage({
    super.key,
    required this.categoryID,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarProducts(subCateName:categoryName.tr ,),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SubCategories(
                    categoryId: categoryID,
                  ),
                ],
              ),
            ),
            Products(categoryId: categoryID),
          ],
        ),
      ),
    );
  }
}

// final Stream<QuerySnapshot> _subcategory = FirebaseFirestore.instance
//     .collection('subcategory')
//     .where('category.catid', isEqualTo: 'vBEYRuSj9Us4ZPPUbg13')
//     .snapshots();

// StreamBuilder<QuerySnapshot>(
//   stream: _subcategory,
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError) {
//       return const Text('Something went wrong');
//     }

//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     return SingleChildScrollView(
//       child: Row(
//         children: snapshot.data!.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data =
//               document.data()! as Map<String, dynamic>;
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.black,
//                 side: BorderSide(),
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 textStyle: const TextStyle(fontSize: 10),
//               ),
//               onPressed: () {},
//               child: Text(data['name']),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   },
// ),
