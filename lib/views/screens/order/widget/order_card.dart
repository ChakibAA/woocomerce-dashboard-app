import 'package:flutter/material.dart';

import '../order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        children: [
          Card(
              child: ListTile(
            tileColor: Colors.grey[200],
            title: const Text("N° : 1"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrederDetailsScreen()));
            },
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          )),
          const InfoCard(label: 'Client :', value: 'Chakib'),
          const InfoCard(
            label: 'Status',
            value: 'Pending',
            valueColor: Colors.amber,
          ),
          const InfoCard(label: 'Total : ', value: '500 DA'),
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
