import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/features/cart/presentation/views/cart_view.dart';
import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/common/navigator/navigator.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/main/presentation/widgets/new_orders.dart';
import 'package:bot_delivery/features/main/presentation/widgets/orders_item.dart';
import 'package:bot_delivery/features/main/presentation/widgets/stories_widget.dart';
import 'package:bot_delivery/features/main/presentation/widgets/tab_select.dart';
import 'package:bot_delivery/features/main/presentation/widgets/w_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  int soni = 0;
  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: AppData.list.length);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: white,
        child: WDrawer(),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: white,
                statusBarIconBrightness: Brightness.dark,
              ),
              pinned: true,
              elevation: 0,
              title: const Text("Delivery"),
              actions: [
                WScaleAnimation(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.search_rounded),
                  ),
                ),
                WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).push(fade(page: const Cartview()));
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(AppIcons.cart),
                  ),
                ),
              ],
            ),
            SliverPersistentHeader(
              delegate: StoriesWidget(stories: AppData.stories),
            ),
            const SliverToBoxAdapter(
              child: NewOrders(),
            ),
            SliverPersistentHeader(
              delegate: TabSelect(
                list: AppData.list,
                tabController: _tabController,
                onTap: (int a) {
                  soni = 0;
                  for (var i = 0; i < a; i++) {
                    soni += AppData.list[i].list.length;
                  }
                  switch (a) {
                    case 0:
                      _scrollController.animateTo(
                        312,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                      break;
                    default:
                      _scrollController.animateTo(
                        (soni * 144 + 32) + 312,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                  }
                },
              ),
              pinned: true,
            ),
            SliverList.builder(
              itemCount: AppData.list.length,
              itemBuilder: (context, index) => OrdersItem(index: index),
            ),
          ],
        ),
      ),
    );
  }
}
