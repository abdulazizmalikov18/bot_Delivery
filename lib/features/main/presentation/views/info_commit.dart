import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/core/utils/my_function.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/common/widgets/w_textfield.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:bot_delivery/features/main/presentation/views/chek_view.dart';
import 'package:bot_delivery/features/main/presentation/widgets/custom_page_route_builder.dart';
import 'package:bot_delivery/features/main/presentation/widgets/info_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class InfoCommitView extends StatefulWidget {
  const InfoCommitView({super.key, required this.isDelivery});
  final bool isDelivery;

  @override
  State<InfoCommitView> createState() => _InfoCommitViewState();
}

class _InfoCommitViewState extends State<InfoCommitView> {
  int payTypeC = 0;
  List<String> payType = ['Naqd pul', 'Payme', 'Click'];
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Buyurtmani Rasmiylashtirish'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: contColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'YOUR ORDER',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          WScaleAnimation(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'EDIT',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: green),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        state.orderList.length,
                        (index) => ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage(state.orderList[index].image),
                              ),
                            ),
                          ),
                          title: Text(
                            state.orderList[index].name,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          subtitle: Text(
                            'x${state.orderList[index].itemCount}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  '${MyFunctions.getThousandsSeparatedPrice((state.orderList[index].itemCount * state.orderList[index].price).toString())} som',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.isDelivery)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yetkazish',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              Text(
                                '10 000 so\'m',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jami',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            widget.isDelivery
                                ? " ${MyFunctions.getThousandsSeparatedPrice((state.allPrice + 10000).toString())} so'm"
                                : " ${MyFunctions.getThousandsSeparatedPrice(state.allPrice.toString())} so'm",
                            style: Theme.of(context).textTheme.displayLarge,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: contColor,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Izoh'),
                      MTextField(hintText: 'Add commit...'),
                    ],
                  ),
                ),
                InfoUser(isDelivery: widget.isDelivery),
                Container(
                  color: contColor,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView.separated(
                    shrinkWrap: true,
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
                          color: bGrey,
                        ),
                      ),
                      trailing: index == payTypeC
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Icon(
                                Icons.radio_button_checked_rounded,
                                color: Colors.green,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Icon(
                                Icons.radio_button_off_rounded,
                              ),
                            ),
                    ),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemCount: payType.length,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () => Navigator.of(context).push(CustomPageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ChekView(),
              )),
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  widget.isDelivery
                      ? "Pay ${MyFunctions.getThousandsSeparatedPrice((state.allPrice + 10000).toString())} so'm"
                      : "Pay ${MyFunctions.getThousandsSeparatedPrice(state.allPrice.toString())} so'm",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
