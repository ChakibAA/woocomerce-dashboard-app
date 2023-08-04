part of 'shop_bloc.dart';

@immutable
abstract class ShopState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopError extends ShopState {
  final String message;
  ShopError(this.message);
  @override
  List<Object> get props => [message];
}

class ShopLoaded extends ShopState {
  final List<Shop> data;
  ShopLoaded(this.data);
  @override
  List<Object> get props => [data];
}
