import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/core/utils/my_function.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  const OrderView(
      {super.key, required this.orderEntity, required this.controller});
  final OrderEntity orderEntity;
  final ScrollController controller;

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: white,
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            controller: widget.controller,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: bGrey,
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 40,
                      ),
                      child: Image.asset(
                        widget.orderEntity.image[0],
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 20,
                            color: blackGrey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: InkWell(
                        onTap: () {
                          // setState(() {
                          //   widget.orderEntity.isLiked =
                          //       !widget.orderEntity.isLiked;
                          // });
                          // if (widget.orderEntity.isLiked) {
                          //   context
                          //       .read<OrdersBloc>()
                          //       .add(AddFavorite(widget.orderEntity));
                          // } else {
                          //   context
                          //       .read<OrdersBloc>()
                          //       .add(RemoveFavorite(widget.orderEntity.id));
                          // }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.favorite_rounded,
                            size: 20,
                            color: widget.orderEntity.isLiked ? red : blackGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.orderEntity.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Text(
                  "Suvli tabiiy mol go'shti Patti, pishgan yangi pomidor va tuzlangan bodringning yumaloq bo'laklari, Aysberg salatasi, yumshoq dumaloq bulochkada qaymoqli pomidor sousi ostida qizil shirin piyoz halqalari ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: blackGrey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Tavsiya',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: blue),
                ),
              ),
              // Container(
              //   height: 260,
              //   margin: const EdgeInsets.only(bottom: 16),
              //   child: ListView.separated(
              //     itemCount: listOrderLite.length,
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     scrollDirection: Axis.horizontal,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (context, index) =>
              //         widget.orderEntity.id == listOrderLite[index].id
              //             ? const SizedBox()
              //             : FoodItem(orderEntity: listOrderLite[index]),
              //     separatorBuilder: (context, index) => const SizedBox(width: 16),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        child: Row(
          children: [
            if (widget.orderEntity.itemCount != 0)
              Row(
                children: [
                  WScaleAnimation(
                    onTap: () {
                      // setState(() {
                      //   widget.orderEntity.itemCount--;
                      //   if (widget.orderEntity.itemCount == 0) {
                      //     context
                      //         .read<OrdersBloc>()
                      //         .add(RemoveOrder(widget.orderEntity.id));
                      //   }
                      //   context.read<OrdersBloc>().add(PriceAll());
                      // });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(left: 16, bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: orang),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                    child: Text('${widget.orderEntity.itemCount}'),
                  ),
                  WScaleAnimation(
                    onTap: () {
                      // setState(() {
                      //   widget.orderEntity.itemCount++;
                      //   context.read<OrdersBloc>().add(PriceAll());
                      // });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: green),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: WButton(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                onTap: () {
                  if (widget.orderEntity.itemCount >= 1) {
                    Navigator.pop(context);
                  }
                  setState(() {
                    if (widget.orderEntity.itemCount == 0 ||
                        widget.orderEntity.itemCount < 1) {
                      widget.orderEntity.itemCount++;
                    }
                  });
                  // context.read<OrdersBloc>().add(AddOrder(widget.orderEntity));
                  // context.read<OrdersBloc>().add(PriceAll());
                },
                text: widget.orderEntity.itemCount != 0
                    ? 'Qo‘shish ${MyFunctions.getThousandsSeparatedPrice((widget.orderEntity.itemCount * widget.orderEntity.price).toString())} so‘m'
                    : 'Qo‘shish ${MyFunctions.getThousandsSeparatedPrice(widget.orderEntity.price.toString())} so‘m',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
