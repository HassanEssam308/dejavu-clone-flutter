import 'package:dejavu_clone/Views/pages/User/Account.dart';
import 'package:dejavu_clone/Views/widgets/BaseAppBar.dart';
import 'package:dejavu_clone/Views/widgets/Drawer/SharedDrawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'Register.dart';
import 'ResetPassword.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailControll = TextEditingController();
  final passwordControll = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 80),
          child: Form(
            key: formKey,
            child: Column(
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
                      'Email',
                      style: TextStyle(fontSize: 22),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter your email")));
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter your password")));
                    }
                    return null;
                  },
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
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  onTap: () async {
                    try {
                      if (formKey.currentState!.validate()) {
                        await auth.signInWithEmailAndPassword(
                            email: emailControll.text,
                            password: passwordControll.text);
                        Get.to(() => Account());
                      }
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Enter correct detalis")));
                    }
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Having trouble?',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(width: 5),
                    InkWell(
                      child: const Text(
                        'Reset your password',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Get.to(() => ResetPassword());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 200),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Get.to(() => const Register());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const SharedDrawer(),
    );
  }
}
