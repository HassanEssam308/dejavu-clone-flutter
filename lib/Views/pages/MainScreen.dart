import 'package:dejavu_clone/Views/pages/Collections/collectionspage.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
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
    const Home(),
    const CollectionsOfCategoriesPage(),
    Login()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Color.fromARGB(255, 176, 175, 175),
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.collections_bookmark_sharp,
                size: 35,
              ),
              label: 'Collections',),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 35,
              ),
          //     label: 'Blogs'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.person_2_rounded,
          //       size: 35,
          //     ),
              label: 'Person')
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
