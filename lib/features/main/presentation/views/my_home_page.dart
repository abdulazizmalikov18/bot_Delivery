import 'package:bot_delivery/features/common/data/data.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Taqachi Burger'),
            leading: const Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
              // crossAxisSpacing: 24,
              // mainAxisSpacing: 24,
              // mainAxisExtent: 172,
              crossAxisCount: 3,
              mainAxisExtent: 172,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: AppData.listOrder.length,
            itemBuilder: (context, index) => Column(
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
                                  AssetImage(AppData.listOrder[index].image))),
                    ),
                    if (AppData.listOrder[index].itemCount != 0)
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
                            '${AppData.listOrder[index].itemCount}',
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
                  AppData.listOrder[index].name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${AppData.listOrder[index].price} som',
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
                      if (AppData.listOrder[index].itemCount != 0)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                AppData.listOrder[index].itemCount =
                                    AppData.listOrder[index].itemCount - 1;
                              });
                              if (AppData.listOrder[index].itemCount == 0) {
                                context.read<OrdersBloc>().add(
                                    RemoveOrder(AppData.listOrder[index].id));
                              }
                            },
                            onLongPress: () {
                              setState(() {
                                AppData.listOrder[index].itemCount = 0;
                              });
                              context.read<OrdersBloc>().add(
                                  RemoveOrder(AppData.listOrder[index].id));
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
                              AppData.listOrder[index].itemCount =
                                  AppData.listOrder[index].itemCount + 1;
                            });
                            context
                                .read<OrdersBloc>()
                                .add(AddOrder(AppData.listOrder[index]));
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange,
                            ),
                            alignment: Alignment.center,
                            child: AppData.listOrder[index].itemCount == 0
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
            ),
          ),
          bottomNavigationBar: state.orderList.isNotEmpty
              ? GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/info'),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      "View Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
