import 'package:flutter/material.dart';
import 'package:woocomerceadmin/screen/order/widget/order_card.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final _sortByOptions = ['1', '2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Woocomerce admin "),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: PopupMenuButton(
                        onSelected: (dynamic sortBy) async {},
                        icon: const Icon(Icons.tune),
                        itemBuilder: (BuildContext context) {
                          return _sortByOptions.map((item) {
                            return PopupMenuItem(
                                value: item, child: Text(item));
                          }).toList();
                        }),
                    hintText: 'ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              )),
          Expanded(child: ListView.builder(
              // itemCount: 5,
              itemBuilder: (context, index) {
            return const OrderCard();
          }))
        ],
      ),
    );
  }
}
