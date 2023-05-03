import 'package:dejavu_clone/Views/pages/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyWishlistPage extends StatelessWidget {
  const EmptyWishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width / 8,
            backgroundImage: const AssetImage('assets/images/wishlist.webp'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text('YourWishlist'.tr),
          ),
          Text(
            'ExploreWishlist'.tr,
            softWrap: true,
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: TextButton(
              onPressed: () {
                Get.off(MainScreen());
             
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainScreen()),
                // );
              },
              child: Text(
                'StartShopping'.tr,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
