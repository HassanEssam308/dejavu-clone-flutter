import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsOfOffers extends StatelessWidget {
  final String categoryID;
  final String categoryName;
  const ProductsOfOffers({
    super.key,
    required this.categoryID,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _products = FirebaseFirestore.instance
        .collection('product')
        .where('offer', isEqualTo: true)
        .orderBy('catid')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _products,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Expanded(
          child: ListView(children: [
            Wrap(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.6,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(255, 238, 238, 238),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child:
                            Column( children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              data['imgs'][0],
                            ),
                          ),
                          Text(
                            data['name'],
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: data['offer'] == false
                                ? Text(
                                    'EGP ${data['new_price']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'EGP${data['old_price']}',
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'EGP ${data['new_price']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' ${data['discount']} %OFF',
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 12,),
                                      )
                                    ],
                                  ),
                          )
                        ]),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ]),
        );
      },
    );
  }
}
