import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:bot_delivery/features/orders/presentation/views/history_view.dart';
import 'package:bot_delivery/features/orders/presentation/views/orders_view.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 56),
            child: Container(
              height: 48,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: const WTabBar(tabs: [
                Text('Hozirgi buyurtmalar'),
                Text('Buyurtmalar tarixi'),
              ]),
            ),
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            OrdersView(),
            HistoryView(),
          ],
        ),
      ),
    );
  }
}
