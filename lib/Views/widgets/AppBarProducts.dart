import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppBarProducts extends StatelessWidget with PreferredSizeWidget {
  final String subCateName;
    AppBarProducts({super.key, required this.subCateName});
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(
        subCateName.tr,

      ),
      elevation: 0,
      actions: [
          // const Icon(
          //   Icons.search,
          //   color: Color.fromARGB(255, 60, 59, 59),
          //   size: 28,
          // ),
        Stack(
          alignment: Alignment.topRight,
          children: [
          
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 60, 59, 59),
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: Text(
                  '$count',style: const TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
