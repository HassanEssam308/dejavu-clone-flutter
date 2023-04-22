import 'package:dejavu_clone/Views/pages/MainScreen.dart';
import 'package:dejavu_clone/Views/pages/ProductsOfOffers/productsofofferspage.dart';
import 'package:dejavu_clone/Views/pages/User/IsLogged.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/GetsubCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/User/Login.dart';
import'../../pages/Cart/Cart.dart';
class SharedDrawer extends StatefulWidget {
  const SharedDrawer({super.key});

  @override
  State<SharedDrawer> createState() => _SharedDrawerState();
}

class _SharedDrawerState extends State<SharedDrawer> {
  bool isOpenShoes = false;
  bool isOpenBags = false;
  Widget subCategory(catName) {
    return InkWell(
      child: Text(
        catName,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        Get.to(() => Login());
      },
    );
  }

  Widget screens(name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: InkWell(
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.to(() => const MainScreen());
                },
                child:  Text(
                  'Welcome'.tr,
                  style:const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: InkWell(
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                 " ${'Signin'.tr} /${ 'Signup'.tr}",
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              onTap: () {
                Get.to(() => const IsLogged());
              },
            ),
          ),
          const SizedBox(height: 35),
           Padding(
            padding:const EdgeInsetsDirectional.only(start: 8),
            child: Text(
              'ShopbyCategory'.tr,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 147, 140, 140),
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8),
                         child: Text(
                          'Shoes'.tr,
                          style:const TextStyle(fontSize: 20),
                                             ),
                       ),
                      Icon((isOpenShoes == false) ? Icons.add : Icons.remove),
                    ],
                  ),
                  (isOpenShoes == false)
                      ? const Text('')
                      : Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Column(
                            children: const [
                              GetSubCategory(
                                categoryName: 'Shoes',
                              )
                              // subCategory(' Ankle Boots'),
                              // const SizedBox(height: 15),
                              // subCategory('Half Boots'),
                              // const SizedBox(height: 15),
                              // subCategory('High Boots'),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isOpenShoes = !isOpenShoes;
              });
            },
          ),
          const SizedBox(height: 12.5),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                         padding:  const EdgeInsets.symmetric(horizontal: 8),
                         child: Text(
                          'Bags'.tr,
                          style:const TextStyle(fontSize: 20),
                                             ),
                       ),
                      Icon((isOpenBags == false) ? Icons.add : Icons.remove),
                    ],
                  ),
                  (isOpenBags == false)
                      ? const Text('')
                      : Padding(
                          padding: const EdgeInsets.all(12.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              GetSubCategory(
                                categoryName: 'Bags',
                              )
                              // subCategory('Handbags'),
                              // const SizedBox(height: 15),
                              // subCategory('Shoulder Bags'),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isOpenBags = !isOpenBags;
              });
            },
          ),
          const SizedBox(height: 12.5),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              child:  Padding(
                padding: const   EdgeInsets.symmetric(horizontal: 8),
                child: Text('Offers'.tr, style:const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                Get.to(() => const ProductsOfOffersPage(
                    categoryID: 'nuWveyFOC62RoDdaFbqK',
                    categoryName: 'Offers'));
              },
            ),
          ),
          const SizedBox(height: 15),
           Padding(
            padding:const EdgeInsetsDirectional.only (start: 10.0),
            child: Text(
              'QuickLinks'.tr,
              style:const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 15),
          ///// Cart /////////////////
          const SizedBox(height: 12.5),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: InkWell(
              child:  Text(
                'Cart'.tr
              , style:const TextStyle(fontSize: 20)),
              onTap: () {
                Get.to(()=> Cart());
              },
            ),
          ),
         
          screens('Wishlist'.tr),
          screens('Aboutus'.tr),
          screens('Contactus'.tr),
          screens('PrivacyPolicy'.tr),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
