import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/cart/presentation/widgets/chek_order.dart';
import 'package:bot_delivery/features/cart/presentation/widgets/chek_price.dart';
import 'package:bot_delivery/features/cart/presentation/widgets/delivery_location.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';

import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/common/widgets/w_tab_bar.dart';
import 'package:flutter/material.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});

  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
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
  int type = 0;
  int payTypeC = 0;
  List<String> payType = ['Naqd pul', 'Payme', 'Click'];
  @override
  void initState() {
    allPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: white,
                boxShadow: wboxShadow,
              ),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buyurtma turi',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteGrey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: const WTabBar(
                      isScrollable: false,
                      padding: 4,
                      tabs: [
                        Text("Yetkazish"),
                        Text("Olib Ketish"),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12),
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        WButton(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                              ),
                              builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.6,
                                minChildSize: 0.2,
                                maxChildSize: 0.9,
                                expand: false,
                                builder: (context, scrollController) =>
                                    const SafeArea(
                                  child: WDeliveryLocation(),
                                ),
                              ),
                            );
                          },
                          text: "Taqachi, Taqachi 22",
                        ),
                        WButton(
                          onTap: () {},
                          text: "Toshkent, Street 1",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: white,
                boxShadow: wboxShadow,
              ),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  onTap: () => setState(() {
                    payTypeC = index;
                  }),
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    payType[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  minLeadingWidth: 0,
                  leading: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: greyText),
                        color: bGrey),
                  ),
                  trailing: index == payTypeC
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Icon(
                            Icons.radio_button_checked_rounded,
                            color: red,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Icon(
                            Icons.radio_button_off_rounded,
                          ),
                        ),
                ),
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemCount: payType.length,
              ),
            ),
            ChekOrder(list: list),
            ChekPrice(orderPrice: count),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          color: white,
          child: WButton(
            onTap: () {},
            text: 'Buyurtma qilish',
          ),
        ),
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
