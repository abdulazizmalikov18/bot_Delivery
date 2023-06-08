import 'package:bot_delivery/features/common/data/entity/order_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(const OrdersState()) {
    on<AddOrder>((event, emit) {
      List<OrderEntity> list = List.from(state.orderList);
      var a = list.indexWhere((element) => element.id == event.orderEntity.id);
      if (a == -1) {
        list.add(event.orderEntity);
      }
      emit(state.copyWith(orderList: list));
    });

    on<RemoveOrder>((event, emit) {
      List<OrderEntity> list = List.from(state.orderList);
      final index = list.indexWhere((element) => element.id == event.index);
      list.removeAt(index);
      emit(state.copyWith(orderList: list));
    });

    on<RemoveAllOrder>((event, emit) {
      emit(state.copyWith(orderList: []));
    });

    on<PriceAll>((event, emit) {
      int a = 0;
      if (event.remove) {
        a = state.allPrice - event.price;
      } else {
        a = state.allPrice + event.price;
      }
      emit(state.copyWith(allPrice: a));
    });
  }
}
