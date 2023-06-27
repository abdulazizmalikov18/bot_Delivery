import 'package:bot_delivery/features/main/presentation/widgets/ad_carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsCarousel extends SliverPersistentHeaderDelegate {
  final List<Color> list;
  AdsCarousel({required this.list});
  @override
  double get minExtent => 176;

  @override
  double get maxExtent => 176;

  @override
  bool shouldRebuild(AdsCarousel oldDelegate) => false;

  @override
  Widget build(context, shrinkOffset, overlapsContent) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: .85,
            autoPlay: true,
            height: 160,
            autoPlayInterval: const Duration(seconds: 8),
          ),
          items: list.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return AdCarouselItem(
                  addImageUrl: i,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                );
              },
            );
          }).toList(),
        ),
      );
}
