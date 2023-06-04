import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class ChangeInfoView extends StatefulWidget {
  const ChangeInfoView({super.key});

  @override
  State<ChangeInfoView> createState() => _ChangeInfoViewState();
}

class _ChangeInfoViewState extends State<ChangeInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yetkazish malumotlari'),
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              color: contColor,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yetkazib berish manzili',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.blue),
                  ),
                  const MTextField(hintText: 'Shahar'),
                  const MTextField(hintText: 'Tuman'),
                  const MTextField(hintText: 'Mahalla'),
                  const MTextField(hintText: 'Uy'),
                ],
              ),
            ),
            Container(
              color: contColor,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Qabul qiluvchi',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.blue),
                  ),
                  const MTextField(
                    hintText: 'Ismingiz',
                  ),
                  const MTextField(
                    hintText: 'Telefon Raqamingiz',
                    keyBoardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
