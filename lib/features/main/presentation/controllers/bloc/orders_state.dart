part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final List<OrderEntity> orderList;
  final int allPrice;
  const OrdersState({
    this.orderList = const [],
    this.allPrice = 0,
  });

  OrdersState copyWith({
    List<OrderEntity>? orderList,
    int? allPrice,
  }) =>
      OrdersState(
        orderList: orderList ?? this.orderList,
        allPrice: allPrice ?? this.allPrice,
      );

  @override
  List<Object> get props => [
        orderList,
        allPrice,
      ];
}
