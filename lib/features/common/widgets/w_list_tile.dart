import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WListTile extends StatelessWidget {
  const WListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin:const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:whiteGrey),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 1,
              color: const Color(0x0fffffff).withOpacity(.25),
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 16),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, color: greyText),
          ],
        ),
      ),
    );
  }
}
