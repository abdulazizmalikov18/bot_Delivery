import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';
import 'package:bot_delivery/features/orders/presentation/widgets/chek_order.dart';
import 'package:bot_delivery/features/orders/presentation/widgets/chek_price.dart';
import 'package:bot_delivery/features/orders/presentation/widgets/chek_status.dart';
import 'package:flutter/material.dart';

class CurrentOrderView extends StatefulWidget {
  const CurrentOrderView({super.key});

  @override
  State<CurrentOrderView> createState() => _CurrentOrderViewState();
}

class _CurrentOrderViewState extends State<CurrentOrderView> {
  List<OrderEntity> list = [
    OrderEntity(
      image: AppImages.burgerB,
      name: 'Burger',
      itemCount: 2,
      price: 28000,
      subName: 'Big Burger',
    ),
    OrderEntity(
      image: AppImages.chesBurger,
      name: 'Ches Burger',
      itemCount: 3,
      price: 32000,
      subName: 'Big Burger',
    ),
    OrderEntity(
      image: AppImages.cola,
      name: 'Coca Cola',
      itemCount: 2,
      price: 12000,
      subName: 'Shakarli Classic',
    ),
  ];
  int count = 0;
  @override
  void initState() {
    allPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#86008108'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 64),
        children: [
          const ChekStatus(isNew: true),
          ChekOrder(list: list),
          ChekPrice(orderPrice: count),
        ],
      ),
    );
  }

  allPrice() {
    int a = 0;
    for (var element in list) {
      a += element.price * element.itemCount;
    }
    count = a;
  }
}
