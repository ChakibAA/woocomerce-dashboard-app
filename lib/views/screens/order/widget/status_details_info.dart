import 'package:flutter/material.dart';

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
                  'Status' ' :',
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
