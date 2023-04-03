import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  BaseAppBar({super.key});
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
     
     
      elevation: 0,
      actions: [
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(image: NetworkImage
            ("https://cdn.shopify.com/s/files/1/0499/3079/7217/files/DejavuLogoHeader_400x.png?v=1614379445") ,width: 200,  height: 50, ),
          ],
          ),
        
        ),
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
                radius: 15,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: Text(
                  '$count',
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
