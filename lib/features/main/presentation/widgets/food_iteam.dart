import 'package:bot_delivery/core/utils/my_function.dart';
import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodIteam extends StatefulWidget {
  const FoodIteam({super.key, required this.index});
  final int index;

  @override
  State<FoodIteam> createState() => _FoodIteamState();
}

class _FoodIteamState extends State<FoodIteam> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 92,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey,
                  image: DecorationImage(
                      image:
                          AssetImage(AppData.listOrder[widget.index].image))),
            ),
            if (AppData.listOrder[widget.index].itemCount != 0)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.orange,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${AppData.listOrder[widget.index].itemCount}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
        const SizedBox(height: 4),
        Text(
          AppData.listOrder[widget.index].name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          '${MyFunctions.getThousandsSeparatedPrice(AppData.listOrder[widget.index].price.toString())} som',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: Row(
            children: [
              if (AppData.listOrder[widget.index].itemCount != 0)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        AppData.listOrder[widget.index].itemCount =
                            AppData.listOrder[widget.index].itemCount - 1;
                      });
                      if (AppData.listOrder[widget.index].itemCount == 0) {
                        context.read<OrdersBloc>().add(
                            RemoveOrder(AppData.listOrder[widget.index].id));
                      }
                      context.read<OrdersBloc>().add(PriceAll(
                            price: AppData.listOrder[widget.index].price,
                            remove: true,
                          ));
                    },
                    onLongPress: () {
                      context.read<OrdersBloc>().add(PriceAll(
                            price: AppData.listOrder[widget.index].price *
                                AppData.listOrder[widget.index].itemCount,
                            remove: true,
                          ));
                      setState(() {
                        AppData.listOrder[widget.index].itemCount = 0;
                      });
                      context
                          .read<OrdersBloc>()
                          .add(RemoveOrder(AppData.listOrder[widget.index].id));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      alignment: Alignment.center,
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      AppData.listOrder[widget.index].itemCount =
                          AppData.listOrder[widget.index].itemCount + 1;
                    });
                    context.read<OrdersBloc>().add(PriceAll(
                          price: AppData.listOrder[widget.index].price,
                          remove: false,
                        ));
                    context
                        .read<OrdersBloc>()
                        .add(AddOrder(AppData.listOrder[widget.index]));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange,
                    ),
                    alignment: Alignment.center,
                    child: AppData.listOrder[widget.index].itemCount == 0
                        ? const Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
