part of 'orders_bloc.dart';

abstract class OrdersEvent {}

class AddOrder extends OrdersEvent {
  final OrderEntity orderEntity;

  AddOrder(this.orderEntity);
}

class RemoveOrder extends OrdersEvent {
  final int index;

  RemoveOrder(this.index);
}

class PriceAll extends OrdersEvent {}