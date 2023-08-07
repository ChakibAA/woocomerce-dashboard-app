import 'package:bloc/bloc.dart';
import 'package:woocomerceadmin/models/shop.dart';

class ShopCubit extends Cubit<Shop?> {
  ShopCubit() : super(null);

  setShop(Shop shop) async {
    emit(shop);
  }
}
