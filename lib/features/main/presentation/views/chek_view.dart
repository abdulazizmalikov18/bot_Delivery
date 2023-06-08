import 'dart:async';

import 'package:bot_delivery/features/main/presentation/views/my_home_page.dart';
import 'package:bot_delivery/features/main/presentation/widgets/custom_page_route_builder.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChekView extends StatefulWidget {
  const ChekView({super.key});

  @override
  State<ChekView> createState() => _ChekViewState();
}

class _ChekViewState extends State<ChekView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () =>Navigator.of(context).pushAndRemoveUntil(
        CustomPageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyHomePage()),
        (route) => false));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lotti/check.json', height: 120, width: 120),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  'Buyurtmangiz qabul qilindi tez orada yetkazib beramiz',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
