// Flutter imports:
import 'package:flutter/material.dart';
import 'package:woocomerceadmin/utils/constant.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppConstants().primaryColor),
      indicatorColor: AppConstants().secondaryColor,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: AppConstants().primaryColor,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      listTileTheme: ListTileThemeData(
          tileColor: AppConstants().primaryColor.withOpacity(0.1),
          enableFeedback: true),
      tabBarTheme: const TabBarTheme(
          labelColor: Colors.black, unselectedLabelColor: Colors.grey),
      primaryColor: AppConstants().primaryColor);
}
