import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:flutter/material.dart';

import '../widgets/SharedDrawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: const SharedDrawer(),
    );
  }
}
