import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:woocomerceadmin/views/screens/order/widget/details_info.dart';

import 'widget/sperator.dart';
import 'widget/status_details_info.dart';

class OrederDetailsScreen extends StatefulWidget {
  const OrederDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrederDetailsScreen> createState() => _OrederDetailsScreenState();
}

class _OrederDetailsScreenState extends State<OrederDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        title: const Text(
          'Commande n° : 1',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const Separator(
              title: 'Details de la commande',
            ),
            const DetailsInfo(label: 'Total' ' :', value: '500 DA'),
            const DetailsInfo(label: 'Date de la commande' ' :', value: ''),
            const DetailsInfo(label: 'Paiement par' ' :', value: 'COD'),
            const DetailsInfo(
                label: 'Méthode de livraison' ' :', value: 'yalidin'),
            const StatusDetailsInfo(status: 'Pending'),
            const SizedBox(
              height: 12,
            ),
            const Separator(
              title: 'Client',
            ),
            const DetailsInfo(label: 'Nom' ' :', value: 'Chakib'),
            const DetailsInfo(label: 'Addresse' ' :', value: 'alger'),
            const DetailsInfo(label: 'email' ' :', value: 'chakib@gmail.com'),
            InkWell(
              onTap: () async {},
              child: const DetailsInfo(
                label: 'Numero de telephone' ' :',
                value: '05555555',
                textColor: Colors.blueAccent,
              ),
            ),
            const Separator(
              title: 'Produits',
            ),
            const DetailsInfo(label: 'Nom' ' :', value: 'Hoodie'),
            const DetailsInfo(label: 'Couleur' ' :', value: 'Rouge'),
            const DetailsInfo(label: 'Taille' ' :', value: 'S'),
            const DetailsInfo(label: 'Qte' ' :', value: '1'),
            const DetailsInfo(label: 'Prix U' ' :', value: '500 DA'),
          ],
        ),
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
