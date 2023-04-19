import 'package:dejavu_clone/Views/pages/Collections/collectionspage.dart';
import 'package:dejavu_clone/Views/pages/User/IsLogged.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Home.dart';
import 'User/Login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int count = 0;
  List<Widget> Pages = [
     Home(),
    const CollectionsOfCategoriesPage(),
    const IsLogged(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: const Color.fromARGB(255, 176, 175, 175),
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        items:  [
          BottomNavigationBarItem(
            icon:const Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: 'Home'.tr,
          ),
           BottomNavigationBarItem(
            icon:const Icon(
              Icons.collections_bookmark_sharp,
              size: 35,
            ),
            label: 'Collection'.tr,
          ),
          BottomNavigationBarItem(
              icon:const Icon(
                Icons.person,
                size: 35,
              ),
              //     label: 'Blogs'),
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.person_2_rounded,
              //       size: 35,
              //     ),
              label: 'Person'.tr)
        ],
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: Pages[_currentIndex],
      drawer: const SharedDrawer(),
    );
  }
}
