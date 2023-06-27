import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/main/domain/entity/story.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key, required this.story}) : super(key: key);
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 128,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.5,
          color: red,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          story.image,
          fit: BoxFit.cover,
          width: 96,
          height: 124,
        ),
      ),
    );
  }
}
