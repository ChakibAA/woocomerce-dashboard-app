part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchOrders extends OrderEvent {
  final String? status;
  final int? page;
  final List<Order>? orders;
  FetchOrders({this.status, this.page, this.orders});
}

class UpdateOrder extends OrderEvent {
  final Order order;
  final String status;
  UpdateOrder(this.order, this.status);

  @override
  List<Object> get props => [order];
}
