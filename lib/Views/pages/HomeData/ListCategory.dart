import 'package:dejavu_clone/Views/pages/ProductsOfCategory/productsofcategorypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({super.key});

  @override
  Widget build(BuildContext context) {
  return Stack(
    children: [
      Container(
         width: (MediaQuery.of(context).size.width / 2),
        // height: 230,
        // width: 230,
        child: TextButton(
        
            onPressed: () {
              Get.to(() => const ProductsOfCategoryPage(categoryID:'cgCpnqSfoejbeTYqAxQE' ,categoryName:'Shoes',)); },

            child:const  Image(
                fit: BoxFit.fill,
                 
                image:   NetworkImage(
                    'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu-Button-Shoes-Summer-2023-2_daf583a8-d78b-403d-a51d-6b054d3b963a_720x.jpg?v=1680000158'))),
      ),
      const Positioned(
        top: 80,
        left: 65,
        child:  Text(
          'Shoes',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
}