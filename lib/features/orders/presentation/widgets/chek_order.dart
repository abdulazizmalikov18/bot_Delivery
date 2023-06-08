import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/core/utils/my_function.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';
import 'package:flutter/material.dart';

class ChekOrder extends StatelessWidget {
  const ChekOrder({
    super.key,
    required this.list,
  });

  final List<OrderEntity> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: contColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hisobot',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Divider(color: iconGrey, height: 1),
          ),
          ...List.generate(
            list.length,
            (index) => Container(
              decoration: BoxDecoration(
                border: list.length != index + 1
                    ? const Border(
                        bottom: BorderSide(color: iconGrey, width: 0.5),
                      )
                    : null,
              ),
              child: ListTile(
                leading: Image.asset(
                  list[index].image,
                  height: 46,
                  width: 46,
                ),
                title: Text(
                  list[index].name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                subtitle: Text(
                  'x ${list[index].itemCount}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                trailing: Text(
                  '${MyFunctions.getThousandsSeparatedPrice((list[index].itemCount * list[index].price).toString())} so‘m',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
