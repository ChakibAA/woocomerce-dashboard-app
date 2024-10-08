import 'package:flutter/material.dart';
import 'package:woocomerceadmin/utils/constant.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      this.suffixIcon,
      this.hintText,
      this.labelText,
      this.onSubmit,
      this.readOnly = false});

  final Widget? suffixIcon;
  final String? hintText;
  final bool readOnly;
  final String? labelText;
  final Function(String? value)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmit,
      readOnly: readOnly,
      decoration: InputDecoration(
          focusColor: AppConstants().secondaryColor,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants().primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants().secondaryColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants().primaryColor)),
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText),
    );
  }
}
