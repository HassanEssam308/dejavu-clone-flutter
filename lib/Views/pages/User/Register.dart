import 'package:dejavu_clone/Views/pages/User/Account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final firstNameControll = TextEditingController();
  final lastNameControll = TextEditingController();
  final emailControll = TextEditingController();
  final passwordControll = TextEditingController();
  bool passwordVisible = false;
  final box = GetStorage();
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
              Form(
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
                          'First Name',
                          style: TextStyle(fontSize: 22),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter your first name")));
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: firstNameControll,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Last Name'),
                        labelStyle: TextStyle(fontSize: 22),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter your last name")));
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: lastNameControll,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        labelStyle: TextStyle(fontSize: 22),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value == null || value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter your email")));
                        } else if (!emailValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter vaild email")));
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
                              const SnackBar(
                                  content: Text("Enter your password")));
                        } else if (value.length < 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter vaild password")));
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
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                      onTap: () async {
                        try {
                          if (formKey.currentState!.validate()) {
                            await auth.createUserWithEmailAndPassword(
                              email: emailControll.text,
                              password: passwordControll.text,
                            );
                            box.write(
                                'name',
                                // ignore: prefer_interpolation_to_compose_strings
                                firstNameControll.text +
                                    ' ' +
                                    lastNameControll.text);
                            box.write('email', emailControll.text.trim());
                            Get.to(() => Account());
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
