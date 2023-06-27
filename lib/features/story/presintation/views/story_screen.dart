import 'package:bot_delivery/features/main/domain/entity/story.dart';
import 'package:bot_delivery/features/story/presintation/widgets/story_content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({
    super.key,
    required this.story,
    required this.index,
  });
  final List<Story> story;
  final int index;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isOnPageTurning = false;
  bool didRead = false;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: true,
    );
    _pageController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_isOnPageTurning &&
        _pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        _currentPage = _pageController.page!.toInt();
        _isOnPageTurning = false;
      });
    } else if (!_isOnPageTurning &&
        _currentPage.toDouble() != _pageController.page) {
      if ((_currentPage.toDouble() - _pageController.page!).abs() > 0.7) {
        setState(() {
          _isOnPageTurning = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        //statusBarColor: black,
        //systemNavigationBarColor: black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, didRead);
          return false;
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.story.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryContentItems(
                    story: widget.story[index],
                    animate: _animateToPage,
                    didRead: false,
                    isPaused: _isOnPageTurning,
                    pageIndex: index,
                    read: _read,
                    storiesCount: widget.story.length,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _animateToPage({required bool forward}) {
    forward
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear)
        : _pageController.previousPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void _read(int id) {
    didRead = true;
  }
}
