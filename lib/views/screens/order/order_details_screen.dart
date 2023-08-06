import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:woocomerceadmin/views/screens/order/widget/details_info.dart';

import '../../../models/order.dart';
import 'widget/sperator.dart';
import 'widget/status_details_info.dart';

class OrederDetailsScreen extends StatelessWidget {
  const OrederDetailsScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        title: Text(
          'Commande n° : ${order.id}',
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
              value: ' ${order.total}  ${order.currency!}'),
          DetailsInfo(
              label: 'Date de la commande' ' :', value: order.createdAt!),
          DetailsInfo(label: 'Paiement par' ' :', value: order.paymentMethod!),
          DetailsInfo(
              label: 'Méthode de livraison' ' :', value: order.shippingMethod!),
          const StatusDetailsInfo(status: 'Pending'),
          const SizedBox(
            height: 12,
          ),
          const Separator(
            title: 'Client',
          ),
          DetailsInfo(label: 'Nom' ' :', value: order.billing!.firstName!),
          DetailsInfo(label: 'Prénom' ' :', value: order.billing!.firstName!),
          DetailsInfo(label: 'Addresse' ' :', value: order.billing!.address1!),
          DetailsInfo(label: 'Ville' ' :', value: order.billing!.city!),
          DetailsInfo(
              label: 'Code postal' ' :', value: order.billing!.postcode!),
          DetailsInfo(label: 'email' ' :', value: order.billing!.email!),
          InkWell(
            onTap: () async {},
            child: DetailsInfo(
              label: 'Numero de telephone' ' :',
              value: order.billing!.phone!,
              textColor: Colors.blueAccent,
            ),
          ),
          const Separator(
            title: 'Produits',
          ),
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: ((context, index) {
          //       return DetailsInfo(
          //           label: 'Nom' ' :', value: order.products![0].name!);
          //     })),

          const DetailsInfo(label: 'Couleur' ' :', value: 'Rouge'),
          const DetailsInfo(label: 'Taille' ' :', value: 'S'),
          const DetailsInfo(label: 'Qte' ' :', value: '1'),
          const DetailsInfo(label: 'Prix U' ' :', value: '500 DA'),
          // order.products == null
          //     ? Container()
          //     : Expanded(
          //         child: ListView.builder(
          //             itemCount: order.products!.length,
          //             itemBuilder: (context, index) {
          //               return Column(
          //                 children: [

          //                 ],
          //               );
          //             }),
          //       )
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
