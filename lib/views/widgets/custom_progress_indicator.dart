import 'package:flutter/material.dart';
import 'package:woocomerceadmin/utils/constant.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppConstants().secondaryColor,
      ),
    );
  }
}
