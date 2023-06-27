class OrderEntity {
  final int id;
  final List<String> image;
  final String name;
  final String subName;
  final int price;
  int itemCount;
  bool isLiked;

  OrderEntity({
    this.id = 0,
    this.image = const [],
    this.name = '',
    this.subName = '',
    this.price = 0,
    this.itemCount = 1,
    this.isLiked = false,
  });
}
