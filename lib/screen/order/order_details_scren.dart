import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'widget/sperator.dart';

class SearchInfo extends StatefulWidget {
  const SearchInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchInfo> createState() => _SearchInfoState();
}

class _SearchInfoState extends State<SearchInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        title: const Text('N° : 1',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const Separator(
              title: 'Details de la recherche',
            ),
            const DetailsInfo(label: 'Date de la recherche' ' :', value: ''),
            const StatusDetailsInfo(status: 'Pending'),
            const SizedBox(
              height: 12,
            ),
            const Separator(
              title: 'Patient',
            ),
            const DetailsInfo(label: 'Cient' ' :', value: ''),
            InkWell(
              onTap: () async {
                // if (await canLaunch("tel:${patient!.phone}")) {
                //   await launch("tel:${patient!.phone}");
                // } else {
                //   throw 'Could not launch tel:${patient!.phone}"';
                // }
              },
              child: const DetailsInfo(
                label: 'Numero de telephone' ' :',
                value: '',
                textColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
          label: 'Message',
          child: const Icon(
            CupertinoIcons.chat_bubble_2,
          ),
        )
      ],
      child: const Icon(CupertinoIcons.info),
    );
  }
}

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    Key? key,
    required this.label,
    required this.value,
    this.textColor,
  }) : super(key: key);

  final String label;

  final String value;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusDetailsInfo extends StatelessWidget {
  const StatusDetailsInfo({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Statut' ' :',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
                Text(
                  status,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // color: statusColor[status],
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            LinearProgressIndicator(
              value: 50,
              color: Colors.red,
              backgroundColor: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }
}
