// ignore_for_file: overridden_fields

part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final List<Order>? data;
  final bool? stopPag;
  const OrderState({this.data, this.stopPag});
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderError extends OrderState {}

class OrderLoaded extends OrderState {
  @override
  final List<Order> data;
  @override
  final bool? stopPag;
  const OrderLoaded({required this.data, this.stopPag})
      : super(data: data, stopPag: stopPag);
  @override
  List<Object> get props => [data];
}

class OrderLoadingPag extends OrderState {
  @override
  final List<Order> data;
  @override
  final bool? stopPag;
  const OrderLoadingPag({required this.data, this.stopPag})
      : super(data: data, stopPag: stopPag);
  @override
  List<Object> get props => [data];
}

class OrderEmpty extends OrderState {}
