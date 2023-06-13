import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:bot_delivery/features/main/presentation/views/info_commit.dart';
import 'package:bot_delivery/features/main/presentation/widgets/custom_page_route_builder.dart';
import 'package:bot_delivery/features/main/presentation/widgets/delivery_type.dart';
import 'package:bot_delivery/features/main/presentation/widgets/food_iteam.dart';
import 'package:bot_delivery/features/orders/presentation/views/delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Delivery Burger"),
            actions: [
              WButton(
                margin: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () => Navigator.of(context).push(CustomPageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DeliveryView())),
                text: 'Buyurtmalar',
                color: contColor,
              )
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              DeliveryType(tabController: tabController),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 172,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: AppData.listOrder.length,
                itemBuilder: (context, index) => FoodIteam(index: index),
              ),
            ],
          ),
          bottomNavigationBar: state.orderList.isNotEmpty
              ? GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      CustomPageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  InfoCommitView(
                                      isDelivery: tabController.index == 0
                                          ? true
                                          : false))),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      "View Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
