import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:flutter/material.dart';

class OrdersMainView extends StatelessWidget {
  const OrdersMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Buyurtmalar"),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: const WTabBar(
                isScrollable: false,
                padding: 4,
                tabs: [
                  Text("Yetkazish"),
                  Text("Olib Ketish"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.emptyBox),
                  const SizedBox(height: 24),
                  Text(
                    "Sizda hozirgi buyutmalar mavjud emas",
                    style: AppTheme.displaySmall.copyWith(color: contColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.emptyBox),
                  const SizedBox(height: 24),
                  Text(
                    "Sizda oldingi buyutmalar mavjud emas",
                    style: AppTheme.displaySmall.copyWith(color: contColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
