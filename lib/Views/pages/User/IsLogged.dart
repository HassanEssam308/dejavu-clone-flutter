import 'package:dejavu_clone/Views/pages/User/Account.dart';
import 'package:dejavu_clone/Views/pages/User/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IsLogged extends StatelessWidget {
  const IsLogged({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final isLogged = auth.currentUser;
    return Scaffold(
      body: (isLogged != null) ? Account() : Login(),
    );
  }
}
