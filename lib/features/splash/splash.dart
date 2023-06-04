import 'dart:async';

import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SplashSc());

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    // final isOnboarded =
    // StorageRepository.getBool(AppConstants.ONBOARDING, defValue: false);
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const OnboardingView(),
        // ));
        // Navigator.of(context).pushReplacement(fade(page:isOnboarded ? const HomeScreen() : const Onboarding()));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: green,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: green,
        ),
        child: Scaffold(
          backgroundColor: green,
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(AppIcons.brewlogo),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
}
