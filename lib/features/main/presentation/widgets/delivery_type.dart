import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:bot_delivery/features/main/presentation/views/delivery_location_view.dart';
import 'package:bot_delivery/features/main/presentation/views/filial_location_view.dart';
import 'package:bot_delivery/features/main/presentation/widgets/custom_page_route_builder.dart';
import 'package:flutter/material.dart';

class DeliveryType extends StatelessWidget {
  const DeliveryType({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: contColor,
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          WTabBar(
            tabController: tabController,
            tabs: const [
              Text('Yetkazib berish'),
              Text('Olib ketish / Shu yerda'),
            ],
          ),
          const Divider(),
          SizedBox(
            height: 30,
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CustomPageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const DeliveryLocationView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.delivery_dining),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Toshkent, Uchtepa, Nashriyot232',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CustomPageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const FilialLocationView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restaurant_rounded,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Toshkent, Olmazor, 24V',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
