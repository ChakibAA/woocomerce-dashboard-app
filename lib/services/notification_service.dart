import 'dart:io';

import 'package:dio/dio.dart';

import '../data/app_response.dart';

import '../models/shop.dart';
import '../utils/constant.dart';

class NotificationService {
  Shop shop;

  NotificationService({required this.shop});

  Future<AppResponse<bool>> sendToken({required String token}) async {
    AppResponse<bool> result = AppResponse<bool>();

    try {
      String url =
          "http://10.0.2.2:10018${AppConstants.sendTokenNotif}?token=${shop.key}&token_notif=$token&";

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
