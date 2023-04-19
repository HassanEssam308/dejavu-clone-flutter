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
                 Text(
                  'dejavu'.tr,
                  style:const TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration:  InputDecoration(
                    label: Text(
                      'Email'.tr,
                      style:const TextStyle(fontSize: 22),
                    ),
                    border:const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("EnterYourEmail".tr)));
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailControll,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    label:  Text('PasswordMustContains6Letters'.tr),
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
                           SnackBar(content: Text("EnterYour Password".tr)));
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
                    child:  Center(
                      child: Text(
                        'Login'.tr,
                        style:const TextStyle(color: Colors.white, fontSize: 22),
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
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                          content: Text("EnterCorrectDetalis".tr)));
                    }
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('Havingtrouble'.tr,
                        style:const TextStyle(fontSize: 16, color: Colors.grey)),
                    const SizedBox(width: 5),
                    InkWell(
                      child:  Text(
                        'ResetYourPassword'.tr,
                        style:const TextStyle(fontSize: 18),
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
                       Text(
                        "Don'tHaveAnAccount".tr,
                        style:const TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        child:  Text(
                          'REGISTER'.tr,
                          style: const TextStyle(fontSize: 20),
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
