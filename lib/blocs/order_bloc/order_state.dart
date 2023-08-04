part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
  @override
  List<Object> get props => [message];
}

class OrderLoaded extends OrderState {
  final List<Order> data;
  OrderLoaded(this.data);
  @override
  List<Object> get props => [data];
}
