import 'package:dejavu_clone/views/widgets/products.dart';
import 'package:flutter/material.dart';

class ProductsOfSubCatPage extends StatelessWidget {
  final String subCategoryID;
  final String subCategoryName;
  const ProductsOfSubCatPage({
    super.key,
    required this.subCategoryID,
    required this.subCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategoryName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body:Column(
        children: [
          Products(subCategoryId:subCategoryID ,),
        ],
      ),
      // Products(categoryId: subCategoryID),
      // Text(subCategoryID)
    
    );
  }
}
