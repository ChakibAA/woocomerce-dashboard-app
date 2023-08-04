// Dart imports:

// Package imports:
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocomerceadmin/data/app_response.dart';
import 'package:woocomerceadmin/utils/constant.dart';

import '../model/shop.dart';

class ShopService {
  late SharedPreferences prefs;

  String shopToMap(Shop data) => json.encode(data.toJson());
  Shop shopFromMap(String str) => Shop.fromJson(json.decode(str));

  Future<AppResponse<bool>> addShop(Shop shop) async {
    AppResponse<bool> result = AppResponse<bool>();

    try {
      prefs = await SharedPreferences.getInstance();

      List<String>? shops;

      shops = prefs.getStringList(AppConstants.addShopLocalUrl);

      if (shops != null && await existShop(shop, shops)) {
        result.success = false;
        result.message = 'Ce site existe deja';
        return result;
      }

      String shop_ = shopToMap(shop);

      shops ??= [];

      shops.add(shop_);

      await prefs.setStringList(AppConstants.addShopLocalUrl, shops);

      result.success = true;

      return result;
    } catch (e) {
      result.success = false;
      result.message = 'erreur';
      return result;
    }
  }

  Future<AppResponse<bool>> deleteShop(Shop data) async {
    AppResponse<bool> result = AppResponse<bool>();
    try {
      prefs = await SharedPreferences.getInstance();

      List<String>? prevData;

      prevData = prefs.getStringList(AppConstants.addShopLocalUrl);

      if (prevData == null || !await existShop(data, prevData)) {
        result.success = false;
        result.message = "Ce site n'existe deja";
        return result;
      }
      prevData.remove(shopToMap(data));

      await prefs.setStringList(AppConstants.addShopLocalUrl, prevData);
      result.success = true;

      return result;
    } catch (e) {
      result.success = false;
      result.message = "erreur";
      return result;
    }
  }

  Future<AppResponse<Shop>> getShops() async {
    AppResponse<Shop> result = AppResponse<Shop>();
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = prefs.getStringList(AppConstants.addShopLocalUrl);
      if (jsonData == null) {
        result.success = true;
        result.data = [];
        return result;
      }

      List<Shop> data = [];

      for (var element in jsonData) {
        var tempElement = jsonDecode(element);
        data.add(Shop.fromJson(tempElement as Map<String, dynamic>));
      }
      result.success = true;
      result.data = data;
      return result;
    } catch (e) {
      result.success = false;
      result.message = "erreur";
      return result;
    }
  }

  Future<bool> existShop(Shop shop, List<String>? data) async {
    if (data != null) {
      for (var element in data) {
        if (shopFromMap(element).url == shop.url) {
          return true;
        }
      }
    }

    return false;
  }
}
