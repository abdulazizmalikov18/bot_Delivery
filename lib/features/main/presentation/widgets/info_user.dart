import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({super.key, required this.isDelivery});
  final bool isDelivery;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: white,
              ),
              title: Text(
                'Toshkent, Uchtepa, Nashriyot 232',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                isDelivery ? 'Yetkazib berish manzili' : "Olib ketish manzili",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                Icons.person_rounded,
                color: white,
              ),
              title: Text(
                'Mahmud Karimberdiyev',
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
                color: white,
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
    );
  }
}
