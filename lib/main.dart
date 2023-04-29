
import 'package:dejavu_clone/locale/locale.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'Views/pages/MainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    Get.put(MylocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: MylocaleController.initialLang,
      translations: Mylocale(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: const MainScreen(),
    );
  }
}
