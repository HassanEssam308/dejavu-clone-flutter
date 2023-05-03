import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MylocaleController extends GetxController {
  final box = GetStorage();
  static Locale initialLang = (GetStorage().read('lang') == 'ar')
      ? const Locale('ar')
      : const Locale('en');
      
  static String currentlang = initialLang.languageCode;
  void changeLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    box.write('lang', codeLang);
    Get.updateLocale(locale);
    currentlang = codeLang;
   
  }
}
