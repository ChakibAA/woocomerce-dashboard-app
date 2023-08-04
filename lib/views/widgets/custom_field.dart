import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key, this.suffixIcon, this.hintText, this.labelText});

  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: suffixIcon, hintText: hintText, labelText: labelText),
    );
  }
}
