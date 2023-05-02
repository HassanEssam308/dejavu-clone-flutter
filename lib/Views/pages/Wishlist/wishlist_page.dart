import 'package:dejavu_clone/Views/pages/ProductDetails/product_details_page.dart';
import 'package:dejavu_clone/Views/pages/Wishlist/empty_wishlist_page.dart';
import 'package:dejavu_clone/Views/pages/Wishlist/wishlist_product.dart';
import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    List listOfFavoriteProducts = (box.read("listOfFavorites") != null)
        ? [...box.read("listOfFavorites")]
        : [];

    // if (listOfFavoriteProducts.isNotEmpty) {
    //   for (var item in listOfFavoriteProducts) {
    //     print(item['id']);
    //   }
    // }

    return Scaffold(
      appBar: BaseAppBar(),
      body: listOfFavoriteProducts.isEmpty
          ? const EmptyWishlistPage()
          : GridView.builder(
              itemCount: listOfFavoriteProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, index) {
                return Container(
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
                      Get.to(ProductDetails(
                        productID: listOfFavoriteProducts[index],
                      ));
                    },
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                listOfFavoriteProducts.removeWhere((id) =>
                                  id ==
                                    listOfFavoriteProducts[index]);
                                box.write("listOfFavorites",
                                    [...listOfFavoriteProducts]);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      ////////////////////////////////////////////////
                      WishlistProduct(
                        productID: (listOfFavoriteProducts[index])
                      )
                    ]),
                  ),
                );
              }),
    );
  }
}





//  class _WishlistPageState extends State<WishlistPage> {
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     List listOfFavoriteProducts = (box.read("listOfFavorites") != null)
//         ? [...box.read("listOfFavorites")]
//         : [];

//     if (listOfFavoriteProducts.isNotEmpty) {
//       for (var item in listOfFavoriteProducts) {
//         print(item['id']);
//       }
//     }

//     return Scaffold(
//       appBar: BaseAppBar(),
//       body: listOfFavoriteProducts.isEmpty
//           ? const EmptyWishlistPage()
//           : GridView.builder(
//               itemCount: listOfFavoriteProducts.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemBuilder: (BuildContext context, index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       width: 1.0,
//                       color: const Color.fromARGB(255, 238, 238, 238),
//                     ),
//                   ),
//                   child: MaterialButton(
//                     hoverColor: Colors.white,
//                     onPressed: () {
//                       Get.to(ProductDetails(
//                         productID: listOfFavoriteProducts[index]['id'],
//                       ));
//                     },
//                     child: Column(children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 listOfFavoriteProducts.removeWhere((item) =>
//                                     item['id'] ==
//                                     listOfFavoriteProducts[index]['id']);
//                                 box.write("listOfFavorites",
//                                     [...listOfFavoriteProducts]);
//                                 setState(() {});
//                               },
//                               icon: const Icon(
//                                 Icons.favorite,
//                                 size: 25,
//                                 color: Colors.red,
//                               ))
//                         ],
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Image.network(
//                           listOfFavoriteProducts[index]['imgs'][0],
//                         ),
//                       ),
//                       Text(
//                         MylocaleController.currentlang == 'ar'
//                             ? listOfFavoriteProducts[index]['name_ar']
//                             : listOfFavoriteProducts[index]['name'],
//                         style: const TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: listOfFavoriteProducts[index]['offer'] == false
//                             ? Text(
//                                 'EGP ${listOfFavoriteProducts[index]['new_price']}',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               )
//                             : Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     MylocaleController.currentlang == 'ar'
//                                         ? '${listOfFavoriteProducts[index]['old_price']} ج.م '
//                                         : 'EGP ${listOfFavoriteProducts[index]['old_price']}',

//                                     // 'EGP${data['old_price']}',
//                                     style: const TextStyle(
//                                         decoration: TextDecoration.lineThrough,
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     MylocaleController.currentlang == 'ar'
//                                         ? '${listOfFavoriteProducts[index]['new_price']} ج.م '
//                                         : 'EGP ${listOfFavoriteProducts[index]['new_price']}',
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     MylocaleController.currentlang == 'ar'
//                                         ? '${listOfFavoriteProducts[index]['discount']} % خ'
//                                         : '%OFF ${listOfFavoriteProducts[index]['discount']}',
//                                     // ' ${data['discount']} %OFF',
//                                     style: const TextStyle(
//                                       color: Colors.red,
//                                       fontSize: 12,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                       )
//                     ]),
//                   ),
//                 );
//               }),
//     );
//   }
// }
