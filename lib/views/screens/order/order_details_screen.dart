import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:woocomerceadmin/views/screens/order/widget/details_info.dart';

import '../../../models/order.dart';
import 'widget/sperator.dart';
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
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
              label: 'Paiement par' ' :', value: widget.order.paymentMethod!),
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
              label: 'Prénom' ' :', value: widget.order.billing!.firstName!),
          DetailsInfo(
              label: 'Addresse' ' :', value: widget.order.billing!.address1!),
          DetailsInfo(label: 'Ville' ' :', value: widget.order.billing!.city!),
          DetailsInfo(
              label: 'Code postal' ' :',
              value: widget.order.billing!.postcode!),
          DetailsInfo(label: 'email' ' :', value: widget.order.billing!.email!),
          InkWell(
            onTap: () async {},
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
                                value: widget.order.products![index].name!),
                            DetailsInfo(
                                label: 'Qte' ' :',
                                value: widget.order.products![index].quantity
                                    .toString()),
                            DetailsInfo(
                                label: 'Prix U' ' :',
                                value: widget.order.products![index].price!),
                            widget.order.products![index].variations == null
                                ? Container()
                                : SizedBox(
                                    height: productVariationBoxHeight,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: widget.order.products![index]
                                            .variations?.length,
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

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      gradientBoxShape: BoxShape.circle,
      direction: SpeedDialDirection.up,
      spaceBetweenChildren: 2,
      overlayOpacity: 0.3,
      overlayColor: Colors.grey,
      children: [
        SpeedDialChild(
          onTap: () {},
          label: 'Annuler',
          child: const Icon(
            CupertinoIcons.chat_bubble_2,
          ),
        ),
        SpeedDialChild(
          onTap: () {},
          label: 'Valider',
          child: const Icon(
            CupertinoIcons.chat_bubble_2,
          ),
        ),
      ],
      child: const Icon(CupertinoIcons.info),
    );
  }
}
