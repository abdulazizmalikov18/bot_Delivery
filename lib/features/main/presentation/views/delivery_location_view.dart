import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class DeliveryLocationView extends StatefulWidget {
  const DeliveryLocationView({super.key});

  @override
  State<DeliveryLocationView> createState() => _DeliveryLocationViewState();
}

class _DeliveryLocationViewState extends State<DeliveryLocationView> {
  List<String> location = ['Toshkent, Uchtepa, Nashriyot232'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yetkazish manzillari"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          WScaleAnimation(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yangi manzil qo\'shish',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Icon(Icons.add)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          ...List.generate(
            location.length,
            (index) => WScaleAnimation(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location[index],
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Icon(Icons.check_rounded)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
