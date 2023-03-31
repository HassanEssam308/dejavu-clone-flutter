import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final emailControll = TextEditingController();
  final passwordControll = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        'First Name',
                        style: TextStyle(fontSize: 22),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    controller: emailControll,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Last Name'),
                      labelStyle: TextStyle(fontSize: 22),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    controller: emailControll,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(fontSize: 22),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailControll,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      label: const Text('Password must contains 6 letters'),
                      labelStyle: const TextStyle(fontSize: 18),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon((passwordVisible == false)
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    obscureText: !passwordVisible,
                    keyboardType: TextInputType.text,
                    controller: passwordControll,
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
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Having an account?',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      const SizedBox(width: 5),
                      InkWell(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Get.to(() => Login());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
