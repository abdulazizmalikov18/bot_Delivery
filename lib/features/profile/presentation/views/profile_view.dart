import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/common/widgets/w_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                CupertinoIcons.person_crop_circle,
                size: 120,
                color: whiteGrey.withOpacity(.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                "Ism-familiy",
                style: AppTheme.bodySmall.copyWith(color: greyText),
              ),
            ),
            const WTextField(hintText: 'Malikov Abdulaziz'),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                "Telefon raqam",
                style: AppTheme.bodySmall.copyWith(color: greyText),
              ),
            ),
            const WTextField(hintText: '+998901111889'),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                "Email",
                style: AppTheme.bodySmall.copyWith(color: greyText),
              ),
            ),
            const WTextField(hintText: 'abdulaziz@gmail.com'),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                "Parol",
                style: AppTheme.bodySmall.copyWith(color: greyText),
              ),
            ),
            const WTextField(hintText: '********'),
          ],
        ),
      ),
      bottomNavigationBar: WButton(
        margin: const EdgeInsets.all(16),
        onTap: () {},
        text: "Saqlash",
      ),
    );
  }
}
