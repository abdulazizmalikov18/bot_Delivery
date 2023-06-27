import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/common/data/entity/catigory_entity.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';
import 'package:bot_delivery/features/main/domain/entity/story.dart';

class AppData {
  static List<Story> stories = [
    Story(
      storyName: "Yangilik bor super",
      image: AppImages.cream_1,
      list: [
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.cream_1,
        ),
        StoryItem(
          id: 1,
          title: "Qaynoq Tovuq",
          info: "Bunday Yozning Issig'da ketadiyu munday narsalar",
          image: AppImages.splash1,
        ),
      ],
    ),
    Story(
      storyName: "Yangilik bor super",
      image: AppImages.splash1,
      list: [
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.cream_2,
        ),
        StoryItem(
          id: 1,
          title: "Qaynoq Tovuq",
          info: "Bunday Yozning Issig'da ketadiyu munday narsalar",
          image: AppImages.splash1,
        ),
        StoryItem(
          id: 1,
          title: "Qaynoq Tovuq",
          info: "Bunday Yozning Issig'da ketadiyu munday narsalar",
          image: AppImages.splash1,
        ),
      ],
    ),
    Story(
      storyName: "Yangilik bor super",
      image: AppImages.splash1,
      list: [
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.cream_3,
        ),
      ],
    ),
    Story(
      storyName: "Yangilik bor super",
      image: AppImages.splash1,
      list: [
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.splash1,
        ),
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.splash1,
        ),
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.splash1,
        ),
        StoryItem(
          id: 1,
          title: "Yozgi Issiq",
          info: "Bunday Yozning Issig'da ketadiyu munday muzqaymoq",
          image: AppImages.splash1,
        ),
      ],
    ),
  ];

  static List<CatigoryEntity> list = [
    CatigoryEntity(
      id: 1,
      name: 'Burger',
      list: [
        OrderEntity(
          id: 5,
          image: AppImages.burgerB,
          name: 'Burger',
          itemCount: 0,
          price: 28000,
          subName: 'Big Burger',
        ),
        OrderEntity(
          id: 6,
          image: AppImages.chesBurger,
          name: 'Ches Burger',
          itemCount: 0,
          price: 32000,
          subName: 'Big Burger',
        ),
      ],
    ),
    CatigoryEntity(
      id: 2,
      name: 'Issiq',
      list: [
        OrderEntity(
          id: 7,
          image: AppImages.chiken,
          name: 'Chikin',
          itemCount: 0,
          price: 12000,
          subName: 'Shakarli Classic',
        ),
      ],
    ),
    CatigoryEntity(
      id: 3,
      name: 'Pitsa',
      list: [
        OrderEntity(
          id: 8,
          image: AppImages.klab,
          name: 'Clab Sendivish',
          itemCount: 0,
          price: 12000,
          subName: 'Shakarli Classic',
        ),
      ],
    ),
    CatigoryEntity(
      id: 4,
      name: 'Ichimlik',
      list: [
        OrderEntity(
          id: 9,
          image: AppImages.cola,
          name: 'Coca Cola',
          itemCount: 0,
          price: 12000,
          subName: 'Shakarli Classic',
        ),
      ],
    ),
    CatigoryEntity(
      id: 10,
      name: 'Sovuslar',
      list: [
        OrderEntity(
          id: 11,
          image: AppImages.tomat,
          name: 'Tomat',
          itemCount: 0,
          price: 3000,
          subName: 'Big Burger',
        ),
        OrderEntity(
          id: 12,
          image: AppImages.sir,
          name: 'Sirli Moyenez',
          itemCount: 0,
          price: 2000,
          subName: 'Big Burger',
        ),
        OrderEntity(
          id: 13,
          image: AppImages.sezr,
          name: 'Sezer Moyanez',
          itemCount: 0,
          price: 3000,
          subName: 'Big Burger',
        ),
      ],
    ),
  ];
}
