import 'package:dejavu_clone/Views/widgets/AppBarProducts.dart';
import 'package:dejavu_clone/views/pages/ProductsOfOffers/productsofoffers.dart';
import 'package:flutter/material.dart';

class ProductsOfOffersPage extends StatelessWidget {
  final String categoryID;
  final String categoryName;
  const ProductsOfOffersPage({
    super.key,
    required this.categoryID,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProducts(subCateName:categoryName ,),
        // AppBar(
        //   title: Text(categoryName),
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   elevation: 0,
        // ),
        body: Column(
          children: [
            ProductsOfOffers(categoryID: categoryID,
             categoryName: categoryName)
          ],
        ),
        );
  }
}
