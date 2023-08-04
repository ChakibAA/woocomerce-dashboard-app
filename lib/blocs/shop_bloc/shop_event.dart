part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchShop extends ShopEvent {}

class AddShop extends ShopEvent {
  final Shop shop;
  AddShop(this.shop);

  @override
  List<Object> get props => [shop];
}

class DeleteShop extends ShopEvent {
  final Shop shop;
  DeleteShop(this.shop);

  @override
  List<Object> get props => [shop];
}
