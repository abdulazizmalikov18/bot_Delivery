import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/themes/theme.dart';
import 'package:flutter/material.dart';

class WTextField extends StatelessWidget {
  const WTextField({
    super.key,
    required this.hintText,
    this.keyBoardType = TextInputType.text,
  });
  final String hintText;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: whiteGrey.withOpacity(.5),
      ),
      height: 44,
      child: TextField(
        cursorColor: Colors.white,
        style: AppTheme.displayLarge.copyWith(fontWeight: FontWeight.w400),
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          hintText: hintText,
          hintStyle: const TextStyle(color: dark),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
