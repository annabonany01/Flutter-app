import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  final List<Image> images;

  const CardSwiper({
    super.key, 
    required this.images
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      color: Colors.red,
      // child: Swiper(
      //   itemCount: images.length,
      //   layout: SwiperLayout.STACK,
      //   itemBuilder: (context, index) {
          
      //   },

      // ),
    );
  }
}