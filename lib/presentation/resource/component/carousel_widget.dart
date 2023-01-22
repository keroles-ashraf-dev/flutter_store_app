import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../size_manager.dart';
import '../ui_constant.dart';

class CarouserWidget extends StatelessWidget {
  final List<String> images;
  final double height;
  final double width;

  const CarouserWidget({
    Key? key,
    required this.images,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutQuad,
          enableInfiniteScroll: true,
          disableCenter: true,
          viewportFraction: UIConstant.carouselViewport,
        ),
        items: images.map((i) => carouselCard(i)).toList(),
      ),
    );
  }

  Widget carouselCard(String i) {
    return CachedNetworkImage(
      height: AppSize.height3,
      width: AppSize.width,
      imageUrl: i,
      fit: BoxFit.contain,
    );
  }
}
