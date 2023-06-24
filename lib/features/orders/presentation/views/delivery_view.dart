import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:bot_delivery/features/orders/presentation/views/history_view.dart';
import 'package:bot_delivery/features/orders/presentation/views/orders_view.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 56),
          child: Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: WTabBar(
              tabController: tabController,
              tabs: const [
                Text('Hozirgi buyurtmalar'),
                Text('Buyurtmalar tarixi'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          OrdersView(),
          HistoryView(),
        ],
      ),
    );
  }
}
