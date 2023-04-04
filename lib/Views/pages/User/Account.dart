import 'package:dejavu_clone/Views/pages/User/Login.dart';
import 'package:dejavu_clone/Views/pages/User/MyOrders.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../widgets/BaseAppBar.dart';

class Account extends StatelessWidget {
  Account({super.key});
  final auth = FirebaseAuth.instance;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/person.jpg'),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      (box.read('name') != null)
                          ? box.read('name')
                          : const Text('User1'),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      (box.read('email') != null)
                          ? box.read('email')
                          : const Text('User1@gmail.com'),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            child: InkWell(
              onTap: () {
                Get.to(() => const MyOrders());
              },
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.list),
                          SizedBox(width: 7),
                          Text(
                            'My Orders',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
              onPressed: () async {
                try {
                  await auth.signOut();
                  Get.to(() => Login());
                } catch (e) {
                  print(e);
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              icon: const Icon(
                Icons.logout,
              ),
              label: const Text('Logout')),
        ],
      ),
      drawer: const SharedDrawer(),
    );
  }
}
