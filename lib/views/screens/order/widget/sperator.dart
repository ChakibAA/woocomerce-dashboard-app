import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
              height: 3,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(
              color: Colors.grey,
              height: 3,
            ),
          ),
        ],
      ),
    );
  }
}
