import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class WDeliveryLocation extends StatefulWidget {
  const WDeliveryLocation({super.key});

  @override
  State<WDeliveryLocation> createState() => _WDeliveryLocationState();
}

class _WDeliveryLocationState extends State<WDeliveryLocation> {
  int _character = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: ListView(
          children: [
            const Text(
              "Yetkaizsh Manzilim",
              style: AppTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            ...List.generate(
              4,
              (index) => RadioListTile<int>(
                value: index,
                groupValue: _character,
                onChanged: (int? value) {
                  setState(() {
                    _character = value!;
                  });
                },
                title: const Text('Lettuce'),
                subtitle: const Text(
                  "Hullas Mullas",
                ),
                secondary: const Icon(Icons.close),
                isThreeLine: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "+ Yangi Manzil",
                color: green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: WButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "Saqlash",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
