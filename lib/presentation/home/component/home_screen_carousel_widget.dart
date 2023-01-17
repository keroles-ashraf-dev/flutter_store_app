import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/carousel_item.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class HomeScreenCarouselWidget extends StatelessWidget {
  final List<CarouselItem> carousel;

  const HomeScreenCarouselWidget({Key? key, required this.carousel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height3,
      width: AppSize.width,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutQuad,
          enableInfiniteScroll: true,
          disableCenter: true,
          viewportFraction: UIConstant.carouselViewport,
        ),
        items: carousel.map((i) => carouselCard(i)).toList(),
      ),
    );
  }

  Widget carouselCard(CarouselItem i) {
    return CachedNetworkImage(
      height: AppSize.height3,
      width: AppSize.width,
      imageUrl: i.image,
      fit: BoxFit.cover,
    );
  }
}
