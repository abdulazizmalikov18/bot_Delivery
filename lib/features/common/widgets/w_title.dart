import 'package:flutter/material.dart';

class WTitle extends StatelessWidget {
  const WTitle({
    super.key,
    required this.title,
    required this.moretitle,
    required this.onPressed,
  });
  final String title;
  final String moretitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              moretitle,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
