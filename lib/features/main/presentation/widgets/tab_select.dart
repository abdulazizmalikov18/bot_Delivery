import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/data/entity/catigory_entity.dart';
import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:flutter/material.dart';

class TabSelect extends SliverPersistentHeaderDelegate {
  final TabController? tabController;
  final Function(int) onTap;
  final List<CatigoryEntity> list;
  TabSelect({
    this.tabController,
    required this.onTap,
    required this.list,
  });

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  bool shouldRebuild(TabSelect oldDelegate) => false;

  @override
  Widget build(context, shrinkOffset, overlapsContent) => Container(
        height: 48,
        width: double.infinity,
        color: white,
        padding: const EdgeInsets.only(bottom: 8),
        child: WTabBar(
          tabController: tabController,
          onTap: (int a) {
            onTap(a);
          },
          tabs: List.generate(list.length, (index) => Text(list[index].name)),
        ),
      );
}
