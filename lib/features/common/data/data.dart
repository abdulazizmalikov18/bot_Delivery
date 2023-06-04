import 'package:bot_delivery/assets/constants/images.dart';
import 'package:bot_delivery/features/common/data/entity/order_entity.dart';

class AppData {
  static List<OrderEntity> listOrder = [
    OrderEntity(
      id: 1,
      image: AppImages.burgerB,
      name: 'Burger',
      itemCount: 0,
      price: 28000,
      subName: 'Big Burger',
    ),
    OrderEntity(
      id: 2,
      image: AppImages.chesBurger,
      name: 'Ches Burger',
      itemCount: 0,
      price: 32000,
      subName: 'Big Burger',
    ),
    OrderEntity(
      id: 3,
      image: AppImages.klab,
      name: 'Clab Sendivish',
      itemCount: 0,
      price: 32000,
      subName: 'Shakarli Classic',
    ),
    OrderEntity(
      id: 4,
      image: AppImages.chiken,
      name: 'Chikin',
      itemCount: 0,
      price: 26000,
      subName: 'Shakarli Classic',
    ),
    OrderEntity(
      id: 5,
      image: AppImages.cola,
      name: 'Coca Cola',
      itemCount: 0,
      price: 12000,
      subName: 'Shakarli Classic',
    ),
  ];
}
