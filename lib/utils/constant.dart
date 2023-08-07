// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:ui';

import '../models/filter.dart';

class AppConstants {
  static const String getOrdersUrl = "/wp-json/dashboard/v1/orders";
  static const String getOrderIDUrl = "/wp-json/dashboard/v1/order";
  static const String updateOrdersStatusUrl =
      "/wp-json/dashboard/v1/orders/status";

  static const String addShopLocalUrl = "shops";

  static const String errorMsg =
      "Une erreur est survenue. Veuillez réessayer ultérieurement";

  final Color primaryColor = const Color(0xFF11333c);
  final Color secondaryColor = const Color(0xFF13b291);

  final sortByOptions = [
    Filter("Tout", '', "asc"),
    Filter("En attente de paimenet", "pending", "asc"),
    Filter("En traitement", "processing", "asc"),
    Filter("En attente", "on-hold", "asc"),
    Filter("Terminer", "completed", "asc"),
    Filter("Annuler", "cancelled", "asc"),
    Filter("Échoué", "failed", "asc"),
  ];

  final Map<String, String> tradStatus = {
    'pending': 'En attente de paimenet',
    'processing': 'En traitement',
    'on-hold': 'En attente',
    'completed': 'Terminer',
    'cancelled': 'Annuler',
    'failed': 'Échoué',
  };

  final Map<String, Color> statusColor = {
    'pending': const Color(0xFFFFD700),
    'processing': const Color(0xFF007BFF),
    'on-hold': const Color(0xFFFF4500),
    'completed': const Color(0xFF32CD32),
    'cancelled': const Color(0xFFFF0000),
    'failed': const Color(0xFFFF6347),
  };
  final Map<String, double> orderStatusValues = {
    'pending': 0.0,
    'processing': 0.4,
    'on-hold': 0.6,
    'completed': 1,
    'cancelled': 1,
    'failed': 1,
  };
}
