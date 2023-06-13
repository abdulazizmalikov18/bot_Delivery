import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class FilialLocationView extends StatefulWidget {
  const FilialLocationView({super.key});

  @override
  State<FilialLocationView> createState() => _FilialLocationViewState();
}

class _FilialLocationViewState extends State<FilialLocationView> {
  List<String> location = ['Toshkent, Olmazor, 24V'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yetkazish manzillari"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical:16),
        itemCount: location.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(12),
          color: contColor,
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: greyText,
                ),
              ),
              Text(
                location[index],
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Bugun ochiq',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: whiteGrey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Olib ketish',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '09:00 - 00:00',
                    style: Theme.of(context).textTheme.titleLarge,
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
