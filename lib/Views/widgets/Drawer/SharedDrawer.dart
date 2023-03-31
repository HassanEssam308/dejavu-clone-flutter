
import 'package:dejavu_clone/Views/pages/ProductsOfOffers/productsofofferspage.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/GetsubCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/User/Login.dart';

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
          padding: const EdgeInsets.only(left: 10.0),
          child: InkWell(
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: InkWell(
              child: const Text(
                'Sign in / Sign up',
                style: TextStyle(fontSize: 28),
              ),
              onTap: () {
                Get.to(() => Login());
              },
            ),
          ),
          const SizedBox(height: 35),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Shop by Category',
              style: TextStyle(
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
                    
                      const Text(
                        'Shoes',
                        style: TextStyle(fontSize: 20),
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
                              GetSubCategory(categoryName:'Shoes' ,)
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
                      const Text(
                        'Bags',
                        style: TextStyle(fontSize: 20),
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
                               GetSubCategory(categoryName:'Bags' ,)
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
              child: const Text('Offers', style: TextStyle(fontSize: 20)),
              onTap: () {
                Get.to(()=>const ProductsOfOffersPage(
                  categoryID:'nuWveyFOC62RoDdaFbqK',
                  categoryName:'Offers'
                ));
              },
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Quick Links',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 15),
          screens('Cart'),
          screens('Wishlist'),
          screens('About us'),
          screens('Contact us'),
          screens('Privacy Policy'),
        ],
      ),
    );
  }
}
