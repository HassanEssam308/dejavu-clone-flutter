import 'package:dejavu_clone/Views/pages/User/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final emailControll = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future passwordReset(BuildContext ctx) async {
    try {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailControll.text);
      if (emailControll.text.isEmpty) {
        ScaffoldMessenger.of(ctx)
            .showSnackBar(const SnackBar(content: Text("Enter your email")));
      } else if (!emailValid) {
        ScaffoldMessenger.of(ctx)
            .showSnackBar(const SnackBar(content: Text("Enter vaild email")));
      } else {
        await auth.sendPasswordResetEmail(email: emailControll.text.trim());
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text("Please , Check your Email")));
        Get.to(() => Login());
      }
    } catch (e) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(const SnackBar(content: Text("Enter Correct Email")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 70),
        child: Column(
          children: [
            const Text(
              'dejavu',
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 255, 191, 0),
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(fontSize: 22),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailControll,
            ),
            const SizedBox(height: 20),
            InkWell(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black),
                child: const Center(
                  child: Text(
                    'RESET PASSWORD',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              onTap: () => passwordReset(context),
            ),
          ],
        ),
      ),
    );
  }
}
