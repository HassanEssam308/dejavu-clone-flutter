
import 'package:flutter/material.dart';


class divide extends StatelessWidget {
  const divide({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      height: 4,
      color: const Color.fromARGB(255, 13, 14, 13),
      thickness: 3,
      indent:  (MediaQuery.of(context).size.width / 2.9),
      endIndent: (MediaQuery.of(context).size.width /2.9),
    );
  }
}

