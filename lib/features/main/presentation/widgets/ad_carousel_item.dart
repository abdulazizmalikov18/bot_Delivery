import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class AdCarouselItem extends StatelessWidget {
  const AdCarouselItem({
    Key? key,
    required this.addImageUrl,
    this.height,
    this.margin,
    this.borderRadius,
  }) : super(key: key);
  final Color addImageUrl;
  final double? height;
  final EdgeInsets? margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {},
      child: Container(
        width: double.maxFinite,
        height: height ?? 160,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: addImageUrl,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          // image: DecorationImage(
          //   image: AssetImage(addImageUrl),
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
