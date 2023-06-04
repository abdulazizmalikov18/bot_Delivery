import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/main/presentation/controllers/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class InfoCommitView extends StatefulWidget {
  const InfoCommitView({super.key});

  @override
  State<InfoCommitView> createState() => _InfoCommitViewState();
}

class _InfoCommitViewState extends State<InfoCommitView> {
  @override
  void initState() {
    context.read<OrdersBloc>().add(PriceAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Taqachi Burger'),
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
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: contColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'YOUR ORDER',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          WScaleAnimation(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'EDIT',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: green),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        state.orderList.length,
                        (index) => ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage(state.orderList[index].image),
                              ),
                            ),
                          ),
                          title: Text(
                            state.orderList[index].name,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          subtitle: Text(
                            'x${state.orderList[index].itemCount}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  '${state.orderList[index].itemCount * state.orderList[index].price} som',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: contColor,
                  margin: const EdgeInsets.only(top: 16),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Izoh'),
                      TextField(
                        cursorColor: Colors.white,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.w400, color: white),
                        decoration: InputDecoration(
                          hintText: 'Add commit...',
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/chek'),
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.green,
                alignment: Alignment.center,
                child:  Text(
                  "Pay ${state.allPrice} som",
                  style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
