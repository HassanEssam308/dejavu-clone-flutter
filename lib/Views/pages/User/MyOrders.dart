import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 5,
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/cart.jpg'),
            const SizedBox(height: 9),
            const Text("Your haven't placed any orders yet."),
            const SizedBox(height: 5),
            const Text(
              'All your purchased orders will be available here.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
