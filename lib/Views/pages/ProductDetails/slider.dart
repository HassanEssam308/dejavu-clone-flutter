import 'package:carousel_slider/carousel_slider.dart';
import 'package:dejavu_clone/Views/pages/Home.dart';
import 'package:dejavu_clone/Views/pages/ProductDetails/favorite_product.dart';
import 'package:dejavu_clone/Views/pages/ProductDetails/methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dejavu_clone/locale/locale_controller.dart';

class MySlider extends StatefulWidget {
  final snapshotOfData;

  const MySlider({
    super.key,
    required this.snapshotOfData,
  });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int value = 0;
  int activeIndex = 0;
  final controller = CarouselController();
  List<String> imgs = [];
  @override
  Widget build(BuildContext context) {
    final product = widget.snapshotOfData.data();
    //  print(product);

    String valueOfSize = [...product['size'].keys][0].toString();

    List<String> colors = (MylocaleController.currentlang == 'ar'
        ? [...product['colors_ar'].keys]
        : [...product['colors'].keys]);

    for (var i = 0; i < [...product['colors'].keys].length; i++) {
      for (var img in product['imgs']) {
        if (img
            .toUpperCase()
            .contains([...product['colors'].keys][i].toUpperCase())) {
          imgs.add(img);
        }
      }
    }

    Widget CustomRadioButtonOfSize(String size, int index) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            valueOfSize = size.toString();

            print(valueOfSize);
            print(size);
            setState(() {
              valueOfSize = size.toString();
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor:
                (valueOfSize == size.toString()) ? Colors.black : Colors.white,
          ),
          child: Text(
            (MylocaleController.currentlang == 'ar' && size == 'one size')
                ? 'قطعة واحدة'
                : size,
            style: TextStyle(
              color: (valueOfSize == size.toString()) ? Colors.white : Colors.grey[400],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        FavoriteProduct(
          snapshotOfData: widget.snapshotOfData,
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 5),
          child: CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
              viewportFraction: 1,
              initialPage: activeIndex,
              onPageChanged: (index, reason) => setState(() {
                activeIndex = index;
              }),
            ),
            itemCount: product['imgs'].length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final urlImage = imgs[index];
              return Methods.buildImage(urlImage, index);
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        buildIndicator(product['imgs'].length),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 15),
          child: Text(
            MylocaleController.currentlang == 'ar'
                ? product['name_ar']
                : product['name'],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          (MylocaleController.currentlang == 'ar')
              ? '${product['new_price']} ج.م '
              : 'EGP ${product['new_price']}',
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.all(8.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey[400],
                      child: const Icon(
                        Icons.grid_view_sharp,
                        size: 12,
                        color: Colors.white,
                      )),
                ),
                Text('Color'.tr),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(colors.length, (index) {
                  return CustomRadioButtonOfColors(colors[index], index);
                }),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey[400],
                      child: const Icon(
                        Icons.grid_view_sharp,
                        size: 12,
                        color: Colors.white,
                      )),
                ),
                Text('Size'.tr),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    List.generate([...product['size'].keys].length, (index) {
                  return
                   CustomRadioButtonOfSize( [...product['size'].keys][index], index);
                }),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "productDescription".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Methods.details(product),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        Row(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: BottomAppBar(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        Get.to(() => Home());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "ADDTOBAG".tr,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        )
      ],
    );
  }

  Widget buildIndicator(countOfDot) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: countOfDot,
      effect: const SlideEffect(dotHeight: 10, dotWidth: 10),
      onDotClicked: animatedToSlide,
    );
  }

  animatedToSlide(int index) {
    return controller.animateToPage(index);
  }

  Widget CustomRadioButtonOfColors(String color, int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlinedButton(
        onPressed: () {
          // imgs.findindex(text);
          setState(() {
            value = index;
            animatedToSlide(imgs.indexWhere((img) => img.toUpperCase().contains(
                [...widget.snapshotOfData.data()['colors'].keys][index]
                    .toUpperCase())));
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: (value == index) ? Colors.black : Colors.white,
        ),
        child: Text(
          color,
          style: TextStyle(
            color: (value == index) ? Colors.white : Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
