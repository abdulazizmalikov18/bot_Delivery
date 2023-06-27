import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;

  const WTabBar({this.tabController, required this.tabs, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      indicator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: grey,
      ),
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: onTap,
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
      labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
      unselectedLabelColor: shuttleGrey,
      labelColor: shuttleGrey,
      tabs: tabs,
    );
  }
}
