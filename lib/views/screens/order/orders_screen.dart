import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woocomerceadmin/services/order_service.dart';
import 'package:woocomerceadmin/views/screens/order/widget/order_card.dart';
import 'package:woocomerceadmin/views/widgets/custom_progress_indicator.dart';
import 'package:woocomerceadmin/views/widgets/custom_toast.dart';

import '../../../blocs/order_bloc/order_bloc.dart';
import '../../../models/order.dart';
import '../../../models/shop.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes/app_routes.dart';
import '../../widgets/custom_field.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key, required this.shop});

  final Shop shop;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late OrderBloc orderBloc;

  late ScrollController scrollController;

  String status = '';
  int page = 1;

  @override
  void initState() {
    super.initState();
    orderBloc = OrderBloc(widget.shop)..add(FetchOrders());
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    orderBloc.close();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => orderBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Boutique ${widget.shop.name!}'),
        ),
        body: BlocConsumer<OrderBloc, OrderState>(
          bloc: orderBloc,
          listener: (context, state) {
            if (state is OrderError) {
              context.goNamed(AppRoutes.errorScreen);
            }
          },
          builder: (context, state) {
            if (state is OrderLoading) {
              return const CustomProgressIndicator();
            } else if (state is OrderEmpty) {
              return Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  child: CustomField(
                    hintText: 'ID',
                    readOnly: true,
                    suffixIcon: PopupMenuButton(
                        onSelected: (String sortBy) async {
                          setState(() {
                            status = sortBy;
                            page = 1;
                          });
                          orderBloc.add(FetchOrders(status: sortBy));
                        },
                        icon: const Icon(Icons.tune),
                        itemBuilder: (BuildContext context) {
                          return AppConstants().sortByOptions.map((item) {
                            return PopupMenuItem(
                                value: item.value, child: Text(item.text));
                          }).toList();
                        }),
                  ));
            } else if (state is OrderLoaded || state is OrderLoadingPag) {
              return Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      child: CustomField(
                        hintText: 'ID',
                        onSubmit: (value) async {
                          if (value == null) {
                            AppToast.showCustomToast(
                                msg: "Veuillez indiquer l'id de la commande");
                            return;
                          }

                          if (value.isEmpty) {
                            AppToast.showCustomToast(
                                msg: "Veuillez indiquer l'id de la commande");
                            return;
                          }
                          OrderService orderService =
                              OrderService(shop: widget.shop);
                          Order? order = await orderService.getOrderID(value);

                          if (order == null) {
                            AppToast.showCustomToast(
                                msg: "Cette commande n'existe pas");
                            return;
                          }
                          // ignore: use_build_context_synchronously
                          context.pushNamed(AppRoutes.ordersDetails,
                              extra: order);
                        },
                        suffixIcon: PopupMenuButton(
                            onSelected: (String sortBy) async {
                              setState(() {
                                status = sortBy;
                                page = 1;
                              });
                              orderBloc.add(FetchOrders(status: sortBy));
                            },
                            icon: const Icon(Icons.tune),
                            itemBuilder: (BuildContext context) {
                              return AppConstants().sortByOptions.map((item) {
                                return PopupMenuItem(
                                    value: item.value, child: Text(item.text));
                              }).toList();
                            }),
                      )),
                  Expanded(
                      child: ListView.builder(
                          controller: scrollController
                            ..addListener(() {
                              if (scrollController.offset >=
                                      scrollController
                                          .position.maxScrollExtent &&
                                  !scrollController.position.outOfRange) {
                                if (state is OrderLoadingPag) return;
                                if (state.stopPag == true) return;

                                setState(() {
                                  page = page + 1;
                                });

                                orderBloc.add(FetchOrders(
                                    status: status,
                                    page: page,
                                    orders: state.data));
                              }
                            }),
                          padding: const EdgeInsets.only(bottom: 12),
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) {
                            return OrderCard(order: state.data![index]);
                          })),
                  state is OrderLoadingPag
                      ? const CustomProgressIndicator()
                      : Container()
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
}
