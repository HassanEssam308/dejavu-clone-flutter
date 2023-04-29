import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/Views/pages/ProductDetails/slider.dart';
import "package:flutter/material.dart";

class ProductDetails extends StatefulWidget {
  final String productID;
  const ProductDetails({
    super.key,
    required this.productID,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    // print(widget.productID);

    final Stream<DocumentSnapshot> product = FirebaseFirestore.instance
        .collection('product')
        .doc(widget.productID)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
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

          // Map<String, dynamic> data =
          //     snapshot.data!.data()! as Map<String, dynamic>;
   
          // print(snapshot.data!.data());
 

          return ListView(
            children: [
              Column(
                children: [
                  MySlider(
                    snapshotOfData: snapshot.data!,

                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
