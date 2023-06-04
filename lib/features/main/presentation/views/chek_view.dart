import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChekView extends StatefulWidget {
  const ChekView({super.key});

  @override
  State<ChekView> createState() => _ChekViewState();
}

class _ChekViewState extends State<ChekView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Buyurtma qilish'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                color: contColor,
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #400404',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'Tez Orada Yetkazildi',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Spacer(),
                        Text(
                          'Taqachi Burger',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: contColor,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    ...List.generate(
                      state.orderList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.orderList[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              '${state.orderList[index].itemCount * state.orderList[index].price} som',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yetkazish',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            '10 000 som',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
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
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '${state.allPrice + 10000}  som',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: contColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/change'),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Toshkent, Uchtepa, Nashriyot 232',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          'Yetkazib berish manzili',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.person_3_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Mahmud Gorsohta',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          'ism',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        title: Text(
                          '998900020469',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          'Telefon Raqami',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const ChekView(),
              // ));
            },
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "Buyurtma qilish",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
