import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Sliderr extends StatelessWidget {
  const Sliderr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            items: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu_Desktop_Banner_7cbbd2ce-d6c8-44d9-9b51-1d7ab03f8565_1512x.jpg?v=1677527333'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0499/3079/7217/files/Dejavu_NewArraivals_Desktop_Banner_7d4ad9a5-455c-491b-b302-c2941c963648_1512x.jpg?v=1679996079'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
