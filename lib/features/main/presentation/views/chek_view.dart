import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChekView extends StatefulWidget {
  const ChekView({super.key});

  @override
  State<ChekView> createState() => _ChekViewState();
}

class _ChekViewState extends State<ChekView> {
  List<String> icons = [
    AppIcons.chek,
    AppIcons.menu,
    AppIcons.deliveriyCar,
    AppIcons.finish,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Container(
              color: contColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                          itemCount: state.orderList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            height: 28,
                            width: 28,
                            margin: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(state.orderList[index].image),
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
                            color: index == 0 ? Colors.green : bGrey,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            icons[index],
                            colorFilter: ColorFilter.mode(
                              index == 0 ? white : Colors.green,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          margin: const EdgeInsets.symmetric(vertical: 17),
                          color: bGrey,
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
      },
    );
  }
}
