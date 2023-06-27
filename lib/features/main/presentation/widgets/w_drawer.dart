import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/navigator/navigator.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/favorite/presentation/views/favorite_view.dart';
import 'package:bot_delivery/features/filials/presentation/views/filials_view.dart';
import 'package:bot_delivery/features/orders/presentation/views/orders_main_view.dart';
import 'package:bot_delivery/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WDrawer extends StatelessWidget {
  const WDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: red,
            ),
          ),
          WButton(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              Navigator.of(context).push(fade(page: const ProfileView()));
            },
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.person_crop_circle,
                  color: white,
                ),
                SizedBox(width: 8),
                Text("Profil"),
              ],
            ),
          ),
          WButton(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              Navigator.of(context).push(fade(page: const FavoriteView()));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.favorite_border_rounded,
                  color: white,
                ),
                SizedBox(width: 8),
                Text("Saralanganlar"),
              ],
            ),
          ),
          WButton(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              Navigator.of(context).push(fade(page: const OrdersMainView()));
            },
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.square_list,
                  color: white,
                ),
                SizedBox(width: 8),
                Text("Buyurtmalar"),
              ],
            ),
          ),
          WButton(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              Navigator.of(context).push(fade(page: const FilialsView()));
            },
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  color: white,
                ),
                SizedBox(width: 8),
                Text("Filiallar"),
              ],
            ),
          ),
          const Spacer(),
          WButton(
            margin: const EdgeInsets.only(bottom: 16),
            onTap: () {},
            text: 'Help',
          ),
          const Text(
            'Program version: 0.0.5',
            style: TextStyle(color: greyText),
          ),
        ],
      ),
    );
  }
}
