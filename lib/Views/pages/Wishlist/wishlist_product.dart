import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';

class WishlistProduct extends StatefulWidget {
  final String productID;
  const WishlistProduct({
    super.key,
    required this.productID,
  });

  @override
  State<WishlistProduct> createState() => _WishlistProductState();
}

class _WishlistProductState extends State<WishlistProduct> {
  @override
  Widget build(BuildContext context) {
    // print(widget.productID);

    final Stream<DocumentSnapshot> product = FirebaseFirestore.instance
        .collection('product')
        .doc('${widget.productID}')
        .snapshots();

    return StreamBuilder<DocumentSnapshot>(
      stream: product,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // final product =snapshot.data!.data();
        Map<String, dynamic> data =
            snapshot.data!.data()! as Map<String, dynamic>;

        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 6,
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: NetworkImage(data['imgs'][0]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          
            Text(
              MylocaleController.currentlang == 'ar'
                  ? data['name_ar']
                  : data['name'],
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: data['offer'] == false
                  ? Text(
                      'EGP ${data['new_price']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          MylocaleController.currentlang == 'ar'
                              ? '${data['old_price']} ج.م '
                              : 'EGP ${data['old_price']}',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12),
                        ),
                        Text(
                          MylocaleController.currentlang == 'ar'
                              ? '${data['new_price']} ج.م '
                              : 'EGP ${data['new_price']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          MylocaleController.currentlang == 'ar'
                              ? '${data['discount']} % خ'
                              : '%OFF ${data['discount']}',
                          // ' ${data['discount']} %OFF',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
            )
          ],
        );
      },
    );
  }
}
