import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:flutter/material.dart';

class NewOrders extends StatelessWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            "Yangi va Mashxurlari",
            style: AppTheme.bodyMedium,
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              width: 240,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: whiteGrey),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.burgerB,
                    width: 100,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Big Burger",
                        style: AppTheme.displayLarge,
                      ),
                      Container(
                        height: 36,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: red,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: const Text(
                          "32 000 so'm",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}
