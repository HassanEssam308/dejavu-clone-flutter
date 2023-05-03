
import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';

class Methods{

  static  Widget buildImage(String urlImage, int index) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Image.network(
        urlImage,
        fit: BoxFit.contain,
      ),
    );
  }

  static Widget details(data){
    
    return   Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    MylocaleController.currentlang == 'ar'
                        ? data['details_ar'].length
                        : data['details'].length, (index) {
                  return Row(
                    children: [
                      const Text(
                        "\u2022",
                        style: TextStyle(fontSize: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(MylocaleController.currentlang == 'ar'
                            ? data['details_ar'][index]
                            : data['details'][index]),
                      ),
                    ],
                  );
                }),
              ),
            );

  }
}