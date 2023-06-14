import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/main/presentation/views/change_info.dart';
import 'package:bot_delivery/features/main/presentation/widgets/custom_page_route_builder.dart';
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
        onTap: () => Navigator.of(context).push(CustomPageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChangeInfoView())),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(
                  Icons.location_on_sharp,
                  color: white,
                ),
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
              leading: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(
                  Icons.person_rounded,
                  color: white,
                ),
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
              leading: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Icon(
                  Icons.phone,
                  color: white,
                ),
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
