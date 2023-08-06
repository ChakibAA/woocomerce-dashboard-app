import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woocomerceadmin/models/order.dart';
import 'package:woocomerceadmin/services/order_service.dart';

import '../../data/app_response.dart';
import '../../models/shop.dart';
import '../../views/widgets/custom_toast.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Shop shop;
  OrderBloc(this.shop) : super(OrderInitial()) {
    final OrderService orderService = OrderService(shop: shop);

    on<FetchOrders>((event, emit) async {
      String? status = event.status;
      int page = event.page ?? 1;

      if (page == 1) {
        emit(OrderLoading());
      } else {
        emit(OrderLoadingPag(data: event.orders!));
      }

      AppResponse<Order> response =
          await orderService.getOrders(status: status, page: page);

      if (response.success == true) {
        if (response.data == null) {
          if (page == 1) {
            emit(OrderEmpty());
          } else {
            emit(OrderLoaded(data: event.orders!, stopPag: true));
          }
        } else if (response.data!.isEmpty) {
          if (page == 1) {
            emit(OrderEmpty());
          } else {
            emit(OrderLoaded(data: event.orders!, stopPag: true));
          }
        } else {
          List<Order>? data = event.orders;
          if (data != null && data.isNotEmpty) {
            data.addAll(response.data!);
            emit(OrderLoaded(data: data));
          } else {
            emit(OrderLoaded(data: response.data!));
          }
        }
      } else {
        AppToast.showCustomToast();
        emit(OrderError());
      }
    });

    on<UpdateOrder>((event, emit) async {
      emit(OrderLoading());

      Order order = event.order;
      String status = event.status;

      AppResponse<bool> response = await orderService.updateOrder(
          id: order.id.toString(), status: status);

      if (response.success == true) {
        AppResponse<Order> response = await orderService.getOrders();

        if (response.success == true) {
          emit(OrderLoaded(data: response.data!));
        } else {
          AppToast.showCustomToast();
          emit(OrderError());
        }
      } else {
        AppToast.showCustomToast();

        emit(OrderError());
      }
    });
  }
}
