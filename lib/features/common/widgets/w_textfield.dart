import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class MTextField extends StatelessWidget {
  const MTextField({
    super.key,
    required this.hintText,
    this.keyBoardType = TextInputType.text,
  });
  final String hintText;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: dark,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(fontWeight: FontWeight.w400, color: dark),
      keyboardType: keyBoardType,
      decoration: InputDecoration(
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
    );
  }
}
