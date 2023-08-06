import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/models/order.dart';
import 'package:woocomerceadmin/models/shop.dart';
import 'package:woocomerceadmin/views/screens/error_screen.dart';
import 'package:woocomerceadmin/views/screens/order/order_details_screen.dart';
import 'package:woocomerceadmin/views/screens/shop/shop_list_screen.dart';
import 'package:woocomerceadmin/views/screens/order/orders_screen.dart';
import 'package:woocomerceadmin/utils/routes/app_routes.dart';

import '../../views/screens/shop/add_shop_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.shopList,
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.shopList,
      name: AppRoutes.shopList,
      routes: [
        GoRoute(
          path: AppRoutes.addShop,
          name: AppRoutes.addShop,
          builder: (BuildContext context, GoRouterState state) {
            return AddShopScreen();
          },
        ),
      ],
      builder: (BuildContext context, GoRouterState state) {
        return const ShopListScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.orders,
      name: AppRoutes.orders,
      routes: [
        GoRoute(
          path: AppRoutes.ordersDetails,
          name: AppRoutes.ordersDetails,
          builder: (BuildContext context, GoRouterState state) {
            Order order = state.extra as Order;
            return OrederDetailsScreen(
              order: order,
            );
          },
        ),
      ],
      builder: (BuildContext context, GoRouterState state) {
        Shop shop = state.extra as Shop;
        return OrdersScreen(
          shop: shop,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.errorScreen,
      name: AppRoutes.errorScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ErrorScreen();
      },
    ),
  ],
);
