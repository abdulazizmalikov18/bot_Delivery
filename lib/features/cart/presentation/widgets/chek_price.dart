import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/core/utils/my_function.dart';
import 'package:flutter/material.dart';

class ChekPrice extends StatelessWidget {
  const ChekPrice({super.key, required this.orderPrice});
  final int orderPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
        boxShadow: wboxShadow,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yetkazish va mahsulot narxi',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Divider(color: iconGrey, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Maxsulotlar narxi'),
                Text(
                  '${MyFunctions.getThousandsSeparatedPrice(orderPrice.toString())} so‘m',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Divider(color: iconGrey, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Yetkazib berish'),
                Text(
                  '10 000so‘m',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Divider(color: iconGrey, height: 1),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jami'),
                Text(
                  '${MyFunctions.getThousandsSeparatedPrice((orderPrice + 10000).toString())}so‘m',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
