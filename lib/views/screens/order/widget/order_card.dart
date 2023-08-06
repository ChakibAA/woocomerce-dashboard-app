import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/utils/routes/app_routes.dart';

import '../../../../models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        children: [
          Card(
              child: ListTile(
            tileColor: Colors.grey[200],
            title: Text("N° : ${order.id}"),
            onTap: () {
              context.pushNamed(AppRoutes.ordersDetails, extra: order);
            },
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          )),
          InfoCard(
              label: 'Client :',
              value: '${order.billing!.firstName} ${order.billing!.lastName}'),
          InfoCard(
            label: 'Status',
            value: order.status!,
          ),
          InfoCard(
              label: 'Total : ', value: '${order.total!} ${order.currency}'),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor,
  }) : super(key: key);

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: valueColor),
          ),
        ],
      ),
    );
  }
}
