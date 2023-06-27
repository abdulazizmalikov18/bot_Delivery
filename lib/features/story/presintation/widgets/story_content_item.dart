import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:bot_delivery/features/main/domain/entity/story.dart';
import 'package:bot_delivery/features/story/presintation/widgets/animated_bar.dart';
import 'package:flutter/material.dart';

class StoryContentItems extends StatefulWidget {
  const StoryContentItems({
    super.key,
    required this.story,
    required this.pageIndex,
    required this.isPaused,
    required this.storiesCount,
    required this.animate,
    required this.read,
    required this.didRead,
  });

  final Story story;
  final int pageIndex;
  final bool isPaused;
  final int storiesCount;
  final Function({required bool forward}) animate;
  final Function(int id) read;
  final bool didRead;

  @override
  State<StoryContentItems> createState() => _StoryContentItemsState();
}

class _StoryContentItemsState extends State<StoryContentItems>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController animationController;
  int itemIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    animationController = AnimationController(vsync: this);
    animationController.addStatusListener(_animationListener);
    _loadStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: _onLongPress,
      onLongPressEnd: (e) => _onLongPress(isStopped: false),
      onTapDown: _onTapDown,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                widget.story.list[itemIndex].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0.8),
                  ],
                  stops: [0, 0, 0, 0, 0.01, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: widget.story.list
                      .asMap()
                      .map(
                        (i, e) => MapEntry(
                          i,
                          AnimatedBar(
                            animationController: animationController,
                            currentIndex: itemIndex,
                            position: i,
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1.5,
                    vertical: 13.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WScaleAnimation(
                        onTap: () {
                          animationController.stop();
                          Navigator.of(context).pop(true);
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                          child: const Icon(Icons.close_rounded, color: white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0.8),
                  ],
                  stops: [0, 0, 0, 0, 0.01, 0.8593],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            right: 16,
            left: 16,
            child: SizedBox(
              height: size.height * 0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.story.list[itemIndex].title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.story.list[itemIndex].info,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Salom Jigar",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get canNavigate => widget.story.list[itemIndex].image.isNotEmpty;

  void _onTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final dx = details.globalPosition.dx;
    final dy = details.globalPosition.dy;
    if (dx < screenWidth / 3 && dy < screenHeight - (canNavigate ? 54 : 0)) {
      setState(prevStory);
    } else if (dx > 2 * screenWidth / 3 &&
        dy < screenHeight - (canNavigate ? 54 : 0)) {
      setState(nextStory);
    }
  }

  void _onLongPress({bool isStopped = true}) {
    if (isStopped) {
      animationController.stop();
    } else {
      animationController.forward();
    }
  }

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController
        ..stop()
        ..reset();
      setState(nextStory);
    }
  }

  void prevStory() {
    if (itemIndex == 0) {
      if (widget.pageIndex == 0) {
        Navigator.pop(context, true);
      } else {
        itemIndex = widget.story.list.length - 1;
        widget.animate(forward: false);
        _loadStory();
      }
    } else {
      itemIndex--;
      _loadStory();
    }
  }

  void nextStory() {
    if (itemIndex + 1 == widget.story.list.length) {
      if (widget.pageIndex + 1 == widget.storiesCount) {
        Navigator.pop(context, true);
      } else {
        itemIndex = 0;
        widget.animate(forward: true);
        _loadStory();
      }
    } else {
      itemIndex++;
      _loadStory();
    }
  }

  void _loadStory() {
    if (!widget.story.list[itemIndex].hasSeen) {
      widget.read(widget.story.list[itemIndex].id);
    }
    animationController
      ..stop()
      ..reset()
      ..duration = const Duration(seconds: 5)
      ..forward();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    animationController.dispose();
    super.dispose();
  }
}
