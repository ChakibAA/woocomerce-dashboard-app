import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:woocomerceadmin/data/app_response.dart';
import 'package:woocomerceadmin/models/shop.dart';
import 'package:woocomerceadmin/services/shop_service.dart';

import '../../views/widgets/custom_toast.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    final ShopService shopService = ShopService();

    on<FetchShop>((event, emit) async {
      emit(ShopLoading());

      AppResponse<Shop> response = await shopService.getShops();

      if (response.success == true) {
        emit(ShopLoaded(response.data!));
      } else {
        AppToast.showCustomToast();
        emit(ShopError(response.message!));
      }
    });

    on<AddShop>((event, emit) async {
      emit(ShopLoading());

      Shop shop = event.shop;

      AppResponse<bool> response = await shopService.addShop(shop);

      if (response.success == true) {
        AppResponse<Shop> response = await shopService.getShops();

        if (response.success == true) {
          AppToast.showCustomToast(msg: "Le site a été ajouter avec succes");
          emit(ShopLoaded(response.data!));
        } else {
          AppToast.showCustomToast();

          emit(ShopError(response.message!));
        }
      } else {
        AppToast.showCustomToast();

        emit(ShopError(response.message!));
      }
    });
    on<DeleteShop>((event, emit) async {
      emit(ShopLoading());

      Shop shop = event.shop;

      AppResponse<bool> response = await shopService.deleteShop(shop);

      if (response.success == true) {
        AppResponse<Shop> response = await shopService.getShops();

        if (response.success == true) {
          AppToast.showCustomToast(msg: "Le site a été supprimer avec succes");

          emit(ShopLoaded(response.data!));
        } else {
          AppToast.showCustomToast();
          emit(ShopError(response.message!));
        }
      } else {
        AppToast.showCustomToast();

        emit(ShopError(response.message!));
      }
    });
  }
}
