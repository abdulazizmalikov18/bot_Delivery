import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/common/widgets/w_button.dart';
import 'package:bot_delivery/features/common/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key, required this.videoCount}) : super(key: key);
  final int videoCount;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool isLiked = false;
  int watchedVideos = 1;
  late PageController pageController = PageController();

  void pageTapDown(TapDownDetails tapDownDetails) {
    if (tapDownDetails.globalPosition.dx >
        MediaQuery.of(context).size.width / 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Iphones"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: white,
          image: DecorationImage(
            image: AssetImage(AppImages.splash1),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 88),
          width: double.maxFinite,
          child: Stack(
            children: [
              GestureDetector(
                onTapDown: pageTapDown,
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: PageView(
                    allowImplicitScrolling: true,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        watchedVideos = index + 1;
                      });
                    },
                    children: List.generate(
                      widget.videoCount,
                      (index) => ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          AppImages.splash1,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          widget.videoCount,
                          (index) => Container(
                            width: MediaQuery.of(context).size.width /
                                (widget.videoCount + 1.8),
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: index + 1 <= watchedVideos
                                  ? white
                                  : white.withOpacity(.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 8),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(AppImages.splash1),
                        ),
                        Text(
                          "Delivery",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WButton(
                          onTap: () {},
                          width: 300,
                          text: 'Ko\'rish',
                        ),
                        WScaleAnimation(
                          onTap: () => setState(() {
                            isLiked = !isLiked;
                          }),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0C161D).withOpacity(.14),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: white.withOpacity(.06),
                              ),
                            ),
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: 24,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
