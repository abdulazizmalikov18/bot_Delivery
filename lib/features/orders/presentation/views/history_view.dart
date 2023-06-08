import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/orders/presentation/views/history_order_view.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical:16),
      itemBuilder: (context, index) => WScaleAnimation(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HistoryOrderView(),
          ));
        },
        child: Container(
          height: 112,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          color: contColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Oqtepa Uchtepa'),
                  Text('86 500 so‘m'),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '16-iyun 18:15',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Buyurtma holat:',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: grey),
                    child: Text(
                      'Yetkazilgan',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w600,color: contColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
