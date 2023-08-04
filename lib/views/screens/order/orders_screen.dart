import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/views/screens/order/widget/order_card.dart';
import 'package:woocomerceadmin/views/widgets/custom_progress_indicator.dart';

import '../../../blocs/order_bloc/order_bloc.dart';
import '../../../model/filter.dart';
import '../../../model/shop.dart';
import '../../../utils/routes/app_routes.dart';
import '../../widgets/custom_field.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key, required this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(shop),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(shop.name!),
        ),
        body: BlocConsumer<OrderBloc, OrderState>(
          bloc: OrderBloc(shop)..add(FetchOrder()),
          listener: (context, state) {
            if (state is OrderError) {
              context.goNamed(AppRoutes.errorScreen);
            }
          },
          builder: (context, state) {
            if (state is OrderLoading) {
              return const CustomProgressIndicator();
            } else if (state is OrderLoaded) {
              return Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      child: CustomField(
                        hintText: 'ID',
                        suffixIcon: popupButton(),
                      )),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 12),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return OrderCard(order: state.data[index]);
                          }))
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  PopupMenuButton<String> popupButton() {
    return PopupMenuButton(
        onSelected: (dynamic sortBy) async {},
        icon: const Icon(Icons.tune),
        itemBuilder: (BuildContext context) {
          return sortByOptions.map((item) {
            return PopupMenuItem(value: item.value, child: Text(item.text));
          }).toList();
        });
  }
}
