import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/main/presentation/views/order_view.dart';
import 'package:flutter/material.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            AppData.list[index].name,
            style: AppTheme.bodyMedium,
          ),
        ),
        ...List.generate(
          AppData.list[index].list.length,
          (indexB) => InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.6,
                  minChildSize: 0.2,
                  maxChildSize: 0.9,
                  expand: false,
                  builder: (context, scrollController) => SafeArea(
                    child: OrderView(
                      orderEntity: AppData.list[index].list[0],
                      controller: scrollController,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: whiteGrey),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppData.list[index].list[indexB].image,
                    height: double.infinity,
                    width: 112,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppData.list[index].list[indexB].name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppData.list[index].list[indexB].subName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: dark.withOpacity(.9),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: red,
                          ),
                          child: Text(
                            '${AppData.list[index].list[indexB].price} so\'m',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
