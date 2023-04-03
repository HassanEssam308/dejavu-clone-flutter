
import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class divide extends StatelessWidget {
  const divide({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 4,
      color: Color.fromARGB(255, 13, 14, 13),
      thickness: 3,
      indent: 180,
      endIndent: 180,
    );
  }
}

