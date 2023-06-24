import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('Delivery'),
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
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 56),
            child: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.greenAccent,
              ),
              unselectedLabelColor: dark,
              tabs: const [
                Tab(
                  height: 56,
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
                Tab(
                  text: 'Salom',
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
