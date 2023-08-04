part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOrder extends OrderEvent {}

class UpdateOrder extends OrderEvent {
  final Order order;
  final String status;
  UpdateOrder(this.order, this.status);

  @override
  List<Object> get props => [order];
}
