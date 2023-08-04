import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woocomerceadmin/model/order.dart';
import 'package:woocomerceadmin/services/order_service.dart';

import '../../data/app_response.dart';
import '../../model/shop.dart';
import '../../views/widgets/custom_toast.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Shop shop;
  OrderBloc(this.shop) : super(OrderInitial()) {
    final OrderService orderService = OrderService(shop: shop);

    on<FetchOrder>((event, emit) async {
      emit(OrderLoading());

      AppResponse<Order> response = await orderService.getOrders();

      if (response.success == true) {
        emit(OrderLoaded(response.data!));
      } else {
        AppToast.showCustomToast();
        emit(OrderError(response.message!));
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
          emit(OrderLoaded(response.data!));
        } else {
          AppToast.showCustomToast();
          emit(OrderError(response.message!));
        }
      } else {
        AppToast.showCustomToast();

        emit(OrderError(response.message!));
      }
    });
  }
}
