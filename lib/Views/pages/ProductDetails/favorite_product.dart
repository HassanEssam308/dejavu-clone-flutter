import 'package:dejavu_clone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteProduct extends StatefulWidget {
  final snapshotOfData;
  const FavoriteProduct({
    super.key,
    required this.snapshotOfData,
  });

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  @override
  Widget build(BuildContext context) {
    // print(widget.snapshotOfData.data());
    final box = GetStorage();
    List listOfFavoriteProducts = (box.read("listOfFavorites") != null)
        ? [...box.read("listOfFavorites")]
        : [];

    bool isFavorited = false;

    if (listOfFavoriteProducts.isNotEmpty) {
      // print(listOfFavoriteProducts[0]['id']);
      for (var id in listOfFavoriteProducts) {
        // print(item['id']);
        if (id == widget.snapshotOfData.id) {
          isFavorited = true;
          print('isFavorited=$isFavorited');
        }
      }
    }

    Future<void> addFavoriteProduct() async {
      if (isFavorited == true) {
        
        listOfFavoriteProducts
            .removeWhere((id) => id == widget.snapshotOfData.id);
        await box.write("listOfFavorites", [...listOfFavoriteProducts]);
        isFavorited = false;
        // print('remove isFavorited=$isFavorited');

      } else {

        // print("add= ${widget.snapshotOfData.id}");
        isFavorited = true;
        await box.write("listOfFavorites",
            [...listOfFavoriteProducts, widget.snapshotOfData.id]);
      }

      setState(() {});
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        child: FloatingActionButton(
          mini: true,
          backgroundColor: Colors.white,
          onPressed: () {
            addFavoriteProduct();
          },
          child: isFavorited == true
              ? const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_outline_rounded,
                  size: 25,
                  color: Colors.red,
                ),
        ),
      ),
    );
  }
}











// class _FavoriteProductState extends State<FavoriteProduct> {
//   @override
//   Widget build(BuildContext context) {
//     // print(widget.snapshotOfData.data());
//     final box = GetStorage();
//     List listOfFavoriteProducts = (box.read("listOfFavorites") != null)
//         ? [...box.read("listOfFavorites")]
//         : [];

//     bool isFavorited = false;

//     if (listOfFavoriteProducts.isNotEmpty) {
//       // print(listOfFavoriteProducts[0]['id']);
//       for (var item in listOfFavoriteProducts) {
//         // print(item['id']);
//         if (item['id'] == widget.snapshotOfData.id) {
//           isFavorited = true;
//           print('isFavorited=$isFavorited');
//         }
//       }
//     }

//     Future<void> addFavoriteProduct() async {
//       if (isFavorited == true) {
//         print("if");
//         listOfFavoriteProducts
//             .removeWhere((item) => item['id'] == widget.snapshotOfData.id);
//         await box.write("listOfFavorites", [...listOfFavoriteProducts]);
//         isFavorited = false;
//         print('remove isFavorited=$isFavorited');

//         setState(() {});
//       } else { 
//         print("add= ${widget.snapshotOfData.id}");

//         //  setState(() {  isFavorited = true;});
//         Map<String, dynamic> id = {"id": (widget.snapshotOfData.id)};
//         // ProductModel product =
//         //   await  ProductModel.fromJson(widget.snapshotOfData.data(), id);
//         ProductModel product =
//             await ProductModel.fromJson(widget.snapshotOfData.data(), id);
//         await box
//             .write("listOfFavorites", [...listOfFavoriteProducts, product]);
//         print("id= ${product.id}");
//       }

//       // setState(() {});
//     }

//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         alignment: AlignmentDirectional.centerEnd,
//         child: FloatingActionButton(
//           mini: true,
//           backgroundColor: Colors.white,
//           onPressed: () {
//             addFavoriteProduct();
//           },
//           child: isFavorited == true
//               ? const Icon(
//                   Icons.favorite,
//                   size: 25,
//                   color: Colors.red,
//                 )
//               : const Icon(
//                   Icons.favorite_outline_rounded,
//                   size: 25,
//                   color: Colors.red,
//                 ),
//         ),
//       ),
//     );
//   }
// }
