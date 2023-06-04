class OrderEntity {
  final int id;
  final String image;
  final String name;
  final String subName;
  final int price;
  int itemCount;
  bool isLiked;

  OrderEntity({
    this.id = 0,
    this.image = '',
    this.name = '',
    this.subName = '',
    this.price = 0,
    this.itemCount = 0,
    this.isLiked = false,
  });
}
