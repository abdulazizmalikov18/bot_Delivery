import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/orders/presentation/views/current_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      AppImages.burgerB,
      AppImages.chesBurger,
      AppImages.cola,
    ];
    List<String> icons = [
      AppIcons.chek,
      AppIcons.menu,
      AppIcons.deliveriyCar,
      AppIcons.finish,
    ];
    return ListView.builder(
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => WScaleAnimation(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CurrentOrderView(),
          ));
        },
        child: Container(
          color: contColor,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Taqachi 3-uy'),
                  Text('86 500so‘m'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 16),
                child: Text(
                  '8-iyun 17:50',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('#86008108'),
                  SizedBox(
                    height: 28,
                    child: ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 28,
                        width: 28,
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(list[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(color: dark),
              ),
              Center(
                child: Container(
                  height: 36,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: index == 3 ? bGrey : orang,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        icons[index],
                        colorFilter: ColorFilter.mode(
                          index == 3 ? orang : white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      margin: const EdgeInsets.symmetric(vertical: 17),
                      color: index == 2 ? bGrey : orang,
                    ),
                    itemCount: icons.length,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tahminiy yetkazib berish vaqti: 30 daqiqa',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
