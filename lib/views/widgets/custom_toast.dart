import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/constant.dart';

class AppToast {
  AppToast._();

  static void showCustomToast({String msg = AppConstants.errorMsg}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20.0,
    );
  }
}
