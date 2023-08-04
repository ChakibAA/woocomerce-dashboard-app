import 'package:flutter/material.dart';

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
