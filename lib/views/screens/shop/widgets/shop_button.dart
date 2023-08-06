import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/shop.dart';
import '../../../../utils/routes/app_routes.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({
    Key? key,
    required this.shop,
    required this.index,
  }) : super(key: key);

  final Shop shop;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushNamed(AppRoutes.orders, extra: shop),
      style: ListTileStyle.list,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.blueGrey.shade700,
      textColor: Colors.white,
      iconColor: Colors.white,
      title: Text("Shop $index : ${shop.name}"),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
