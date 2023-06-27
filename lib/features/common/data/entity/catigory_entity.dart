import 'package:bot_delivery/features/common/data/entity/order_entity.dart';

class CatigoryEntity {
  final int id;
  final String name;
  final List<OrderEntity> list;

  CatigoryEntity({
    this.id = 0,
    this.name = '',
    this.list = const [],
  });
}

class CatigoryTypeEntity {
  final String name;
  final List<CatigoryEntity> list;

  CatigoryTypeEntity({
    this.name = '',
    this.list = const [],
  });
}
