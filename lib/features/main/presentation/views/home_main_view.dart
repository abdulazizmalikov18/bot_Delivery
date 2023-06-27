import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/main/presentation/views/order_view.dart';
import 'package:bot_delivery/features/main/presentation/widgets/stories_widget.dart';
import 'package:bot_delivery/features/main/presentation/widgets/tab_select.dart';
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
    _tabController =
        TabController(vsync: this, length: AppData.catigory.length);
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
      drawer: Drawer(
        backgroundColor: white,
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: red,
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
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
                  onTap: () {},
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
            SliverToBoxAdapter(
              child: Column(
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
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: TabSelect(
                list: AppData.catigory,
                tabController: _tabController,
                onTap: (int a) {
                  soni = 0;
                  for (var i = 0; i < a; i++) {
                    soni += AppData.catigory[i].list.length;
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
              itemCount: AppData.catigory.length,
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Text(
                      AppData.catigory[index].name,
                      style: AppTheme.bodyMedium,
                    ),
                  ),
                  ...List.generate(
                    AppData.catigory[index].list.length,
                    (indexB) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                          ),
                          builder: (context) => DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            minChildSize: 0.2,
                            maxChildSize: 0.9,
                            expand: false,
                            builder: (context, scrollController) => SafeArea(
                              child: OrderView(
                                orderEntity: AppData.catigory[index].list[0],
                                controller: scrollController,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: whiteGrey),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset(
                              AppData.catigory[index].list[indexB].image[0],
                              height: double.infinity,
                              width: 112,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppData.catigory[index].list[indexB].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    AppData
                                        .catigory[index].list[indexB].subName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: dark.withOpacity(.9),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: red,
                                    ),
                                    child: Text(
                                      '${AppData.catigory[index].list[indexB].price} so\'m',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
