import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChekStatus extends StatelessWidget {
  const ChekStatus({super.key, this.isNew = false});
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      AppIcons.chek,
      AppIcons.menu,
      AppIcons.deliveriyCar,
      AppIcons.finish,
    ];
    return Container(
      color: contColor,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#86008108'),
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
          Text(
            'Sizning manzilingiz',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Taqachi Uchtepa tumani'),
              const Spacer(),
              WScaleAnimation(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Open',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: iconGrey),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: iconGrey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isNew)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(color: dark),
            ),
          if (isNew)
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
          if (isNew)
            Center(
              child: Text(
                'Tahminiy yetkazib berish vaqti: 30 daqiqa',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
        ],
      ),
    );
  }
}
