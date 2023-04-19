import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';

class ProductData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _ProductData;

    _ProductData = FirebaseFirestore.instance.collection('product').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _ProductData,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(scrollDirection: Axis.horizontal, children: [
          Wrap(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  Container(
                    height: 150,
                    width: 130,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.add_circle),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            data['imgs'][0],
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          MylocaleController.currentlang == 'ar'
                              ? data['name_ar']
                              : data['name'],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            (MylocaleController.currentlang == 'ar')
                                ? '${data['new_price']} ج.م '
                                : 'EGP ${data['new_price']}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ]);
      },
    );
  }
}
