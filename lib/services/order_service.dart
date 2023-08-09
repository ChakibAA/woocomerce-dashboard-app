import 'dart:io';

import 'package:dio/dio.dart';

import '../data/app_response.dart';
import '../models/order.dart';
import '../models/shop.dart';
import '../utils/constant.dart';

class OrderService {
  Shop shop;

  OrderService({required this.shop});

  Future<AppResponse<Order>> getOrders({String? status, int page = 1}) async {
    AppResponse<Order> result = AppResponse<Order>();
    try {
      String url =
          "http://10.0.2.2:10018${AppConstants.getOrdersUrl}?token=${shop.key}&page=${page.toString()}";

      if (status != null && status.isNotEmpty) {
        url = '$url&status=$status';
      }
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        result.data = (response.data as List)
            .map(
              (i) => Order.fromJson(i),
            )
            .toList();
        result.success = true;

        return result;
      }
      if (response.statusCode == 204) {
        result.success = true;
        return result;
      }
      result.success = false;
      return result;
    } catch (e) {
      result.success = false;
      return result;
    }
  }

  Future<Order?> getOrderID(String id) async {
    try {
      String url =
          "http://10.0.2.2:10018${AppConstants.getOrderIDUrl}?token=${shop.key}&query_id=$id";

      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        Order data = Order.fromJson(response.data);

        return data;
      }
      if (response.statusCode == 204) {
        return null;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<AppResponse<bool>> updateOrder(
      {required String id, required String status}) async {
    AppResponse<bool> result = AppResponse<bool>();

    try {
      String url =
          "http://10.0.2.2:10018${AppConstants.updateOrdersStatusUrl}?token=${shop.key}&order_id=$id&new_order_status=$status";

      var response = await Dio().put(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        result.success = true;
        return result;
      } else {
        result.success = false;

        return result;
      }
    } catch (e) {
      result.success = false;

      return result;
    }
  }
}
