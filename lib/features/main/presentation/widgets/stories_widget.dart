import 'package:bot_delivery/features/common/navigator/navigator.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/main/domain/entity/story.dart';
import 'package:bot_delivery/features/main/presentation/views/story_page.dart';
import 'package:bot_delivery/features/main/presentation/widgets/story_item.dart';
import 'package:flutter/material.dart';

class StoriesWidget extends SliverPersistentHeaderDelegate {
  final List<Story> stories;
  StoriesWidget({required this.stories});
  @override
  double get minExtent => 128;

  @override
  double get maxExtent => 128;

  @override
  bool shouldRebuild(StoriesWidget oldDelegate) => false;

  @override
  Widget build(context, shrinkOffset, overlapsContent) => SizedBox(
        height: 128,
        width: MediaQuery.of(context).size.width,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.separated(
            itemCount: stories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WScaleAnimation(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    fade(
                      page: const StoryPage(videoCount: 8),
                    ),
                  );
                },
                child: StoryItem(story: stories[index]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      );
}
