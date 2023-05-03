import 'package:dejavu_clone/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  BaseAppBar({super.key});
  var count = 0;

  @override
  Widget build(BuildContext context) {
    MylocaleController controllerLang= Get.find();
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
     
     
      elevation: 0,
      title:const Center(
        child:  Image(image: NetworkImage
            ("https://cdn.shopify.com/s/files/1/0499/3079/7217/files/DejavuLogoHeader_400x.png?v=1614379445") ,width: 200,  height: 50, ), 
      ),
      actions: [
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(MylocaleController.currentlang),
                InkWell(
                 onTap: () { 
                  controllerLang.changeLanguage((MylocaleController.currentlang =='ar' )?'en':'ar');
                  },
                  
                  child:
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:Colors.black,
                    child: Text( (MylocaleController.currentlang =='ar' )?'en':'Ar',
                    style: const TextStyle(
                      color: Colors.white),),
                  ),
                
                ),
                // InkWell(
                //  onTap: () { 
                //   controllerLang.changeLanguage('en');
                //   },
                //   child:Text('en'),

                // ),
              ],
            ),
            
            
          ],
          ),
        
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
           
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 60, 59, 59),
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: Text(
                  '$count',
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
