import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woocomerceadmin/cubits/shop_cubit/shop_cubit.dart';
import 'package:woocomerceadmin/data/app_response.dart';
import 'package:woocomerceadmin/services/order_service.dart';
import 'package:woocomerceadmin/utils/constant.dart';
import 'package:woocomerceadmin/views/screens/order/widget/sperator.dart';
import 'package:woocomerceadmin/views/widgets/custom_progress_indicator.dart';
import 'package:woocomerceadmin/views/widgets/custom_toast.dart';

import '../../../models/order.dart';
import 'widget/details_info.dart';
import 'widget/status_details_info.dart';

class OrederDetailsScreen extends StatefulWidget {
  const OrederDetailsScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  State<OrederDetailsScreen> createState() => _OrederDetailsScreenState();
}

class _OrederDetailsScreenState extends State<OrederDetailsScreen> {
  double productBoxHeight = 300;
  double productVariationBoxHeight = 0;

  List<SpeedDialChild> speedDials = [];

  late OrderService orderService;

  bool load = true;

  @override
  void initState() {
    super.initState();
    orderService = OrderService(shop: context.read<ShopCubit>().state!);
    if (widget.order.products != null) {
      productBoxHeight = productBoxHeight * widget.order.products!.length;
      for (var element in widget.order.products!) {
        if (element.variations != null) {
          element.variations!.forEach((key, value) {
            productVariationBoxHeight = productVariationBoxHeight + 100;
            productBoxHeight = productBoxHeight + 100;
          });
        }
      }
    }
  }

  setSpeedDial(BuildContext context) {
    speedDials.clear();

    for (var element in AppConstants().sortByOptions) {
      if (element.value == '') {
      } else if (element.value != widget.order.status) {
        speedDials.add(SpeedDialChild(
          onTap: () async {
            AppResponse response = await orderService.updateOrder(
                id: widget.order.id.toString(), status: element.value);
            if (response.success!) {
              setState(() {
                widget.order.status = element.value;
              });
            } else {
              AppToast.showCustomToast();
            }
          },
          label: element.text,
          child: const Icon(
            Icons.cancel,
          ),
        ));
      }
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    setSpeedDial(context);
    return load
        ? const CustomProgressIndicator()
        : Scaffold(
            floatingActionButton: SpeedDial(
              gradientBoxShape: BoxShape.circle,
              direction: SpeedDialDirection.up,
              spaceBetweenChildren: 2,
              overlayOpacity: 0.3,
              overlayColor: Colors.grey,
              children: speedDials,
              child: const Icon(CupertinoIcons.info),
            ),
            appBar: AppBar(
              title: Text(
                'Commande n° : ${widget.order.id}',
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const Separator(
                  title: 'Details de la commande',
                ),
                DetailsInfo(
                    label: 'Total' ' :',
                    value: ' ${widget.order.total}  ${widget.order.currency!}'),
                DetailsInfo(
                    label: 'Date de la commande' ' :',
                    value: widget.order.createdAt!),
                DetailsInfo(
                    label: 'Paiement par' ' :',
                    value: widget.order.paymentMethod!),
                DetailsInfo(
                    label: 'Méthode de livraison' ' :',
                    value: widget.order.shippingMethod!),
                StatusDetailsInfo(status: widget.order.status!),
                const SizedBox(
                  height: 12,
                ),
                const Separator(
                  title: 'Client',
                ),
                DetailsInfo(
                    label: 'Nom' ' :', value: widget.order.billing!.lastName!),
                DetailsInfo(
                    label: 'Prénom' ' :',
                    value: widget.order.billing!.firstName!),
                DetailsInfo(
                    label: 'Addresse' ' :',
                    value: widget.order.billing!.address1!),
                DetailsInfo(
                    label: 'Ville' ' :', value: widget.order.billing!.city!),
                DetailsInfo(
                    label: 'Code postal' ' :',
                    value: widget.order.billing!.postcode!),
                DetailsInfo(
                    label: 'email' ' :', value: widget.order.billing!.email!),
                widget.order.billing!.phone == null
                    ? Container()
                    : InkWell(
                        onTap: () async {
                          final Uri callLaunchUri = Uri(
                            scheme: 'tel',
                            path: widget.order.billing!.phone!,
                          );
                          launchUrl(callLaunchUri);
                        },
                        child: DetailsInfo(
                          label: 'Numero de telephone' ' :',
                          value: widget.order.billing!.phone!,
                          textColor: Colors.blueAccent,
                        ),
                      ),
                const Separator(
                  title: 'Produits',
                ),
                // ignore: prefer_is_empty
                widget.order.products?.length == 0
                    ? Container()
                    : SizedBox(
                        height: productBoxHeight,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.order.products?.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  DetailsInfo(
                                      label: 'Nom' ' :',
                                      value:
                                          widget.order.products![index].name!),
                                  DetailsInfo(
                                      label: 'Qte' ' :',
                                      value: widget
                                          .order.products![index].quantity
                                          .toString()),
                                  DetailsInfo(
                                      label: 'Prix U' ' :',
                                      value:
                                          widget.order.products![index].price!),
                                  widget.order.products![index].variations ==
                                          null
                                      ? Container()
                                      : SizedBox(
                                          height: productVariationBoxHeight,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: widget
                                                  .order
                                                  .products![index]
                                                  .variations
                                                  ?.length,
                                              itemBuilder: ((context, i) {
                                                return Column(
                                                  children: [
                                                    DetailsInfo(
                                                        label:
                                                            '${widget.order.products![index].variations!.keys.toList()[i]} :',
                                                        value: widget
                                                            .order
                                                            .products![index]
                                                            .variations!
                                                            .values
                                                            .toList()[i]),
                                                  ],
                                                );
                                              })))
                                ],
                              );
                            })),
                      ),
              ],
            ),
          );
  }
}
